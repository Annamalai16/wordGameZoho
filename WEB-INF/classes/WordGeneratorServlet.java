package wordGameBackend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject; 

@WebServlet("/WordGeneratorServlet")
public class WordGeneratorServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public static Connection getConnection() {
		Connection conn = null;
        String host = "localhost";
        String port = "5432";
        String db_name = "wordGame";
        String username = "postgres";
        String password = "mehlaptop";

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://"+host+":"+port+"/"+db_name+"", ""+username+"", ""+password+"");
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
        return conn;
	}
	
	private String getWord(String level) throws IOException, ClassNotFoundException, SQLException{

        Connection conn = null;
        
		try {
            conn = getConnection(); 

            int id = (int)(Math.random() * 100)+1;
            
            String query = "SELECT * FROM "+ level +" WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
	    	statement.setInt(1, id);
	    	ResultSet rs = statement.executeQuery();

            rs.next();
            return rs.getString("word").trim();
        }
        finally{
            if(conn!=null){
                conn.close();
            }
        }
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		HttpSession session = request.getSession(false);
		Player playerObj = (Player) session.getAttribute("playerObj");
		
		if(playerObj==null) {
			
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		}
		else {
			
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        PrintWriter out = null;
			
			try {
				out = response.getWriter();

				String level = request.getParameter("level");
				
				WordHandler wordObj = new WordHandler(getWord(level),level);
				
				session.setAttribute("wordObj", wordObj);
				session.setAttribute("guess", new Guess());
				
				JSONArray array = new JSONArray();
		        array.put(new JSONObject(playerObj));
		        array.put(new JSONObject(wordObj));
		        out.println(array.toString());
				
				System.out.println(wordObj.getActualWord());
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				if(out!=null) {
					out.close();
				}
			}
		}
	}
}

package wordGameBackend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.JSONArray;

@WebServlet("/RecordsTable")
public class RecordsTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		response.getWriter().print(1);
		session.invalidate();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		HttpSession session = request.getSession(true);
	    Player playerObj = (Player) session.getAttribute("playerObj");
		
	    if(playerObj == null || playerObj.getUserID().equals("guest")) {	
        	
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		}
		else {
			
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
			
			Connection conn = null;
			
			PrintWriter out = null;
			
			try {
				
				int flag = 1;
				
				out = response.getWriter();
				
				conn = WordGeneratorServlet.getConnection(); 
				
		        int userID = playerObj.getUserKey();
		    	
		    	PreparedStatement statement = conn.prepareStatement("SELECT * FROM records WHERE userid = ?");
		    	statement.setInt(1, userID);
		    	ResultSet rs = statement.executeQuery();
		    	
		    	JSONArray array  = new JSONArray();
		    	while(rs.next()){
		    		
		    		TableRow row = new TableRow(rs.getString("level").trim(),rs.getString("word").trim(),rs.getInt("score"),rs.getInt("attempts"),rs.getInt("clues"));
					array.put(new JSONObject(row));	
		    	}
		    	out.println(array.toString());
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				try {
					out.close();
		        	conn.close();
				} catch (SQLException e) {
					
				}
			}
		}
	}
}
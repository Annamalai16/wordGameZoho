package wordGameBackend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SetPlayer")
public class SetPlayer extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	private ArrayList<Integer> getUsercred(String userID) {
		
		ArrayList<Integer> temp = new ArrayList<>(2);
		
		if(userID.equals("guest")) {
			temp.add(60);
			temp.add(0);
			return temp;
		}
			
		Connection conn = null;
        Statement stmt = null;
        
		try {
            conn = WordGeneratorServlet.getConnection(); 
            stmt = conn.createStatement();

            String query = "SELECT * FROM users WHERE user_name = '"+ userID + "';";
            ResultSet rs = stmt.executeQuery(query);
            
            if(rs.next()) {
            	temp.add(rs.getInt("coins"));
            	temp.add(rs.getInt("id"));
            	return temp;
            }
        }
		catch(Exception e) {
			e.printStackTrace();
		}
        finally{
        	try {
	            if(conn!=null){
	                conn.close();
	            }
	            if(stmt!=null){
	                stmt.close();
	            }
        	}
        	catch(Exception e) {
        		e.printStackTrace();
        	}
        }
		return temp;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getUserPrincipal() != null) {	
		
			String userName = request.getUserPrincipal().getName();
			
			ArrayList<Integer> cred = getUsercred(userName);
			Player playerObj = new Player(userName,cred.get(0),cred.get(1));
			
			HttpSession session = request.getSession(false);
			session.setAttribute("playerObj", playerObj);
			
			PrintWriter out = response.getWriter();
			out.println(userName);
		}
		else {
			
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		}
		
	}

}

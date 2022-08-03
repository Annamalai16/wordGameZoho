package wordGameBackend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPlayer")
public class AddPlayer extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
		
		Connection conn = null;
		Statement stmt1 = null;
		
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
			conn = WordGeneratorServlet.getConnection(); 
			
			String userID = request.getParameter("userID");
			String pswd  = request.getParameter("pswd");
	        
	        PreparedStatement statement = conn.prepareStatement("INSERT INTO users(user_name, user_pass, coins) VALUES (?, ?, ?)");
	    	statement.setString(1, userID);
	    	statement.setString(2, pswd);
	    	statement.setInt(3, 100);
	        
	        PreparedStatement statement2 = conn.prepareStatement("INSERT INTO user_roles(user_name, role_name) VALUES (?, ? )");
	    	statement2.setString(1, userID);
	    	statement2.setString(2, "player");
	        
	        try {
	        	statement.executeUpdate();
	        	statement2.executeUpdate();
	        	out.println("1");
	        }
	        catch(Exception e) {
	        	out.println("0");
	        }
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

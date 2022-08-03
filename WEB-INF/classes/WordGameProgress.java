package wordGameBackend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.JSONArray;

@WebServlet("/WordGameProgress")
public class WordGameProgress extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	private WordHandler wordObj;
	private Player playerObj;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		session = request.getSession(false);
		playerObj = (Player) session.getAttribute("playerObj");
		
		if(playerObj==null) {
			
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		}
		else {
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        PrintWriter out = null;
	        
	        try {
				wordObj = (WordHandler) session.getAttribute("wordObj");
				playerObj = (Player) session.getAttribute("playerObj");
				Guess guess = (Guess) session.getAttribute("guess");
				out = response.getWriter();
				
				wordObj.clue(guess);
				playerObj.reduceCoins();
				
				if(wordObj.getActualWord().equals(wordObj.getGuessedWord())) {
		        	addRecords();
		        }
		        
		        JSONArray array = new JSONArray();
		        array.put(new JSONObject(wordObj));
		        array.put(new JSONObject(guess));
		        out.println(array.toString());
		        
	        }
	        finally {
	        	out.close();
	        }
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		session = request.getSession(false);
		playerObj = (Player) session.getAttribute("playerObj");
		
		if(playerObj==null) {
			
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		}
		else {
		
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        PrintWriter out = null;
	        
	        try {
				wordObj = (WordHandler)session.getAttribute("wordObj");
				out = response.getWriter();
				
				String guessedWord = wordObj.getGuessedWord();
				HashMap<Integer,Character> letters = new HashMap<>();
				
				for(int ind=0;ind<guessedWord.length();ind++) {
					if(guessedWord.charAt(ind)=='_' && request.getParameter("ch"+ind).length()!=0) {
						letters.put(ind, request.getParameter("ch"+ind).charAt(0));
					}
				}
				
				Guess guess = (Guess)session.getAttribute("guess");
				guess.setLetters(letters);
				session.setAttribute("guess", guess);
				
		        wordObj.guessChecker(guess);
		        
		        if(wordObj.getActualWord().equals(wordObj.getGuessedWord())) {
		        	addRecords();
		        }
		        
		        JSONArray array = new JSONArray();
		        array.put(new JSONObject(wordObj));
		        array.put(new JSONObject(guess));
		        out.println(array.toString());
	        }
	        finally {
	        	if(out!=null) {
	        		out.flush();
	        	}
	        }
		}
	}
	
	private void addRecords() {
		
		if(!playerObj.getUserID().equals("guest")) {
			
			Connection conn = null;
			
			try {
				conn = WordGeneratorServlet.getConnection(); 
	        	
	        	PreparedStatement statement = conn.prepareStatement("INSERT INTO records (userid, level, word, score, attempts, clues) VALUES (?, ?, ?, ?, ?, ?);");
		    	statement.setInt(1, playerObj.getUserKey());
		    	statement.setString(2, wordObj.getLevel());
		    	statement.setString(3, wordObj.getActualWord());
		    	statement.setInt(4, wordObj.getScore());
		    	statement.setInt(5, wordObj.getAttempts());
		    	statement.setInt(6, wordObj.getClueCount());
		    	statement.executeUpdate();
	
	        	playerObj.setCoins(wordObj.getScore());
	        	
	        	PreparedStatement statement2 = conn.prepareStatement("UPDATE users SET coins = ? WHERE user_name = ? ;");
		    	statement2.setInt(1, playerObj.getCoins());
		    	statement2.setString(2, playerObj.getUserID());
		    	statement2.executeUpdate();
		    
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}

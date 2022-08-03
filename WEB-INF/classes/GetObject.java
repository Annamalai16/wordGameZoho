package wordGameBackend;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/GetObject")
public class GetObject extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
		HttpSession session = request.getSession(false);
		Player playerObj = (Player) session.getAttribute("playerObj");
		WordHandler wordObj = (WordHandler)session.getAttribute("wordObj");
		Guess guess = (Guess) session.getAttribute("guess");
		
		JSONArray array = new JSONArray();
		array.put(new JSONObject(playerObj));
        array.put(new JSONObject(wordObj));
        array.put(new JSONObject(guess));
        response.getWriter().println(array.toString());
	}

}

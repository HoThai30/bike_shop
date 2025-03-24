package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ketnoi.ketnoi;


/**
 * Servlet implementation class DangKiController
 */
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
    */
   public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
         
        response.setContentType("text/html; charset=UTF-8");
       request.setCharacterEncoding("UTF-8");
       PrintWriter out = response.getWriter();

        try {
       	ketnoi kn = new ketnoi();
   		kn.ketnoi();

            String query = "SELECT * FROM messages ORDER BY timestamp ASC";
            Statement stmt = kn.cn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String sender = rs.getString("sender");
                String message = rs.getString("message");
                out.println("<p><b>" + sender + ":</b> " + message + "</p>");
            }
           
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error loading messages.</p>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	  
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String sender = request.getParameter("sender");
        String message = request.getParameter("message");

        try {
        	ketnoi kn = new ketnoi();
    		kn.ketnoi();

            String query = "INSERT INTO messages (sender, receiver, message) VALUES (?, ?, ?)";
            PreparedStatement pstmt = kn.cn.prepareStatement(query);
            pstmt.setString(1, sender);
            pstmt.setString(2, sender.equals("user") ? "admin" : "user");
            pstmt.setString(3, message);
            pstmt.executeUpdate();
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
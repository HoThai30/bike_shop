package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohangModal.HangBo;

/**
 * Servlet implementation class GioHangController
 */
@WebServlet("/GioHangController")
public class GioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GioHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String anh=request.getParameter("anh");
		String maxe=request.getParameter("maxe");
	 	String tenxe=request.getParameter("tenxe");
	 	String gia=request.getParameter("gia");
	 	
	
	 	if(maxe!=null&&tenxe!=null&&gia!=null){
	 		HangBo hang= null;
	 		HttpSession session=request.getSession();
	 		if(session.getAttribute("hang")==null){
	 			hang= new HangBo();
	 			session.setAttribute("hang", hang);
	 		}
	 		hang=(HangBo)session.getAttribute("hang");
	 		hang.Them(anh,maxe, tenxe,Long.parseLong(gia), (long)1);
	 		session.setAttribute("hang", hang);
	 		response.sendRedirect("CTGioController");
	 		
	 	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

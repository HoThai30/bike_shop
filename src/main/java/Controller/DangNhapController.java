package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import khachhangModal.KhachHang;
import khachhangModal.KhachHangBo;
import nl.captcha.Captcha;


/**
 * Servlet implementation class DangNhapController
 */
@WebServlet("/DangNhapController")
public class DangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username = request.getParameter("username");
		    String password = request.getParameter("password");
		    String loi = null;
		    
		    HttpSession session=request.getSession();
	           
            Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
            request.setCharacterEncoding("UTF-8");
            String answer = request.getParameter("answer");
           
            if(session.getAttribute("dem")!=null){
                int dem=(int)session.getAttribute("dem");
                if(answer!=null)
                if(dem>=3 && !captcha.isCorrect(answer)) {
                       RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
                       rd.forward(request, response);                    
                }
            }
		    
		    
		    if (username != null && password != null) {
		    	KhachHangBo khbo = new KhachHangBo();
		    	KhachHang kh = khbo.KtDangNhap(username, password);
		        if (kh!= null) {	        	
		            session.setAttribute("dn", kh);
		            response.sendRedirect("TrangChuController");
		            return;
		        } else {
		        	if(session.getAttribute("dem")==null)
                        session.setAttribute("dem",(int)0);
                    int d=(int)session.getAttribute("dem"); d++;
                    session.setAttribute("dem",d);
		            loi = "Tên đăng nhập hoặc mật khẩu không đúng"; 
		            request.setAttribute("loi", loi);	        
		        }
		        
		    }
		    
		    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
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

package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import giohangModal.HangBo;
import loaiModal.LoaiBo;


/**
 * Servlet implementation class XoaSuaController
 */
@WebServlet("/XoaSuaController")
public class XoaSuaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaSuaController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoaiBo lbo = new LoaiBo();
		try {
			request.setAttribute("dsloai", lbo.getloai());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
        HangBo hang = (HangBo) session.getAttribute("hang");
        // Xử lý nếu người dùng muốn xóa các sách đã chọn
        String[] gtck = request.getParameterValues("ck");
        if (request.getParameter("xoachon") != null && gtck != null) {
            for (String maxe : gtck) {
                hang.xoa(maxe);
            }
        }
        if(request.getParameter("maxexoa")!=null) {
        	String maxe = request.getParameter("maxexoa");
        	hang.xoa(maxe);
        }

        // Xử lý nếu người dùng muốn cập nhật số lượng sách
        String maxesua = request.getParameter("butsuasl");
        if (maxesua != null ) {
        	String slsua = request.getParameter(maxesua);
            if(slsua != null) {
                long soLuongMoi = Long.parseLong(slsua);
                hang.Them("",maxesua,"",(long)0,soLuongMoi);
               }
            } 
        // Cập nhật lại giỏ hàng trong session
        session.setAttribute("hang", hang);
        // Chuyển hướng về trang hiển thị giỏ hàng
        response.sendRedirect("CTGioController");
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

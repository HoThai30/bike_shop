package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DonHangModal.DonHangDao;
import giohangModal.Hang;
import giohangModal.HangBo;
import khachhangModal.KhachHang;

/**
 * Servlet implementation class ThanhToanController
 */
@WebServlet("/ThanhToanController")
public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Kiểm tra người dùng đã đăng nhập chưa
            HttpSession session = request.getSession();
            KhachHang kh = (KhachHang) session.getAttribute("dn");
            if (kh == null) {
                // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Lấy giỏ hàng của người dùng
            HangBo hangBo = (HangBo) session.getAttribute("hang");
            if (hangBo == null || hangBo.getDs().isEmpty()) {
                // Nếu giỏ hàng rỗng, hiển thị thông báo
                request.setAttribute("message", "Giỏ hàng của bạn đang trống!");
                RequestDispatcher rd = request.getRequestDispatcher("ctgio.jsp");
                rd.forward(request, response);
                return;
            }
            
            // Tính tổng tiền của đơn hàng
            ArrayList<Hang> dsHang = hangBo.getDs();
            long tongTien = 0;
            for (Hang hang : dsHang) {
                tongTien += hang.getThanhtien();
            }

            // Lưu đơn hàng vào cơ sở dữ liệu
            DonHangDao donHangDao = new DonHangDao();
            String ngayMua = "2025-01-08"; // Thời gian hiện tại, có thể thay thế bằng thời gian thực tế
            int mahd = donHangDao.themDonHang(kh.getMakh(), ngayMua, tongTien);

            // Lưu chi tiết đơn hàng vào cơ sở dữ liệu
            donHangDao.themChiTietDonHang(mahd, dsHang);

            // Xóa giỏ hàng trong session sau khi thanh toán
            session.removeAttribute("hang");

            // Chuyển hướng tới trang thông báo thành công
            request.setAttribute("message", "Thanh toán thành công! Đơn hàng của bạn đã được xử lý.");
            RequestDispatcher rd = request.getRequestDispatcher("xacnhanthanhtoan.jsp");
            rd.forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Đã xảy ra lỗi khi thanh toán, vui lòng thử lại sau!");
            RequestDispatcher rd = request.getRequestDispatcher("ctgio.jsp");
            rd.forward(request, response);
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

package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import khachhangModal.KhachHang;
import khachhangModal.KhachHangDao;

/**
 * Servlet implementation class DangKiController
 */
@WebServlet("/DangKiController")
public class DangKiController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKiController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hiển thị form đăng ký
        request.getRequestDispatcher("dangki.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request (form đăng ký)
        String hoten = request.getParameter("hoten");
        String diachi = request.getParameter("diachi");
        String sodt = request.getParameter("sodt");
        String email = request.getParameter("email");
        String tendn = request.getParameter("tendn");
        String pass = request.getParameter("pass");
        String confirmPass = request.getParameter("confirmPass");

        try {
            // Kiểm tra nếu có thông tin đăng ký
            if (hoten != null && !hoten.isEmpty() && email != null && !email.isEmpty() &&
                tendn != null && !tendn.isEmpty() && pass != null && !pass.isEmpty() && confirmPass != null && !confirmPass.isEmpty()) {
                
                // Kiểm tra xem mật khẩu và xác nhận mật khẩu có khớp không
                if (!pass.equals(confirmPass)) {
                    request.setAttribute("message", "Mật khẩu và xác nhận mật khẩu không khớp.");
                    request.setAttribute("messageType", "danger");
                    request.getRequestDispatcher("dangki.jsp").forward(request, response);
                    return;
                }

                // Tạo đối tượng KhachHang
                KhachHang kh = new KhachHang(0, hoten, diachi, sodt, email, tendn, pass);

                // Tạo đối tượng DAO để thêm khách hàng
                KhachHangDao khachHangDao = new KhachHangDao();
                boolean result = khachHangDao.dangKyTaiKhoan(kh);

                // Xử lý kết quả
                if (result) {
                    // Đăng ký thành công
                    request.setAttribute("message", "Đăng ký thành công!");
                    request.setAttribute("messageType", "success");
                    request.getRequestDispatcher("dangki.jsp").forward(request, response);
                } else {
                    // Đăng ký thất bại (ví dụ: tên đăng nhập hoặc email trùng lặp)
                    request.setAttribute("message", "Đăng ký thất bại! Tên đăng nhập hoặc email đã tồn tại.");
                    request.setAttribute("messageType", "danger");
                    request.getRequestDispatcher("dangki.jsp").forward(request, response);
                }
            } else {
                // Thiếu thông tin
                request.setAttribute("message", "Vui lòng nhập đầy đủ thông tin.");
                request.setAttribute("messageType", "danger");
                request.getRequestDispatcher("dangki.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Có lỗi xảy ra: " + e.getMessage());
            request.setAttribute("messageType", "danger");
            request.getRequestDispatcher("dangki.jsp").forward(request, response);
        }
    }
}

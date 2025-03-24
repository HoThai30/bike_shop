package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SanPham.SanPham;
import SanPham.SanPhamDao;
import loaiModal.Loai;
import loaiModal.LoaiDao;

/**
 * Servlet implementation class SanPhamController
 */
@WebServlet("/SanPhamController")
public class SanPhamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SanPhamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            LoaiDao loaiDao = new LoaiDao();
            SanPhamDao sanPhamDao = new SanPhamDao();

            String maloai = request.getParameter("maloai");
            ArrayList<SanPham> dsXe = sanPhamDao.getSanPhamByLoai(maloai);
            ArrayList<Loai> dsLoai = loaiDao.getloai();

            request.setAttribute("dsXe", dsXe);
            request.setAttribute("dsLoai", dsLoai);

            request.getRequestDispatcher("sanpham.jsp").forward(request, response);
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

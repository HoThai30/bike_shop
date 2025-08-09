package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SuKienModal.SuKien;
import SuKienModal.SuKienDao;
import loaiModal.LoaiBo;
import xeModal.Xe;
import xeModal.XeBo;

/**
 * Servlet implementation class TrangChuController
 */
@WebServlet("/TrangChuController")
public class TrangChuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			LoaiBo lbo= new LoaiBo();
			request.setAttribute("dsloai", lbo.getloai());
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			//lay xe VE
			XeBo sbo = new XeBo();
			ArrayList<Xe> ds = sbo.getXe(); 
			ArrayList<Xe> top6Xe = new ArrayList<>();
			for (int i = 0; i < Math.min(6, ds.size()); i++) {
			    top6Xe.add(ds.get(i));
			}
			
			SuKienDao sk = new SuKienDao();
			ArrayList<SuKien> dssk = sk.getAllSuKien();
			request.setAttribute("sukien", dssk);

			//tim kiếm
			String ml = request.getParameter("ml");
			String key= request.getParameter("txttk");
			if(ml!= null) {
				ds = sbo.Timma(ml);
			}else
				if(key!= null) {
					ds = sbo.Tim(key);
				}
			request.setAttribute("dsXe", ds);
			RequestDispatcher rd = request.getRequestDispatcher("trangchu.jsp");
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

package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SuKienModal.SuKien;
import SuKienModal.SuKienDao;

/**
 * Servlet implementation class CTSuKien
 */
@WebServlet("/CTSuKien")
public class CTSuKien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CTSuKien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                SuKienDao dao = new SuKienDao();
                SuKien sk = dao.getSuKienByID(id);
                if (sk != null) {
                    request.setAttribute("sukien", sk);
                    request.getRequestDispatcher("chitietsukien.jsp").forward(request, response);
                } else {
                    response.sendRedirect("SuKienController"); 
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("SuKienController");
            }
        } else {
            response.sendRedirect("SuKienController");
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

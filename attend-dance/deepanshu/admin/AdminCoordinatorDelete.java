package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DCoordinator;
import dao.DStudent;
import pojo.Coordinator;
import pojo.Student;

/**
 * Servlet implementation class AdminCoordinatorDelete
 */
@WebServlet("/AdminCoordinatorDelete")
public class AdminCoordinatorDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCoordinatorDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

    DCoordinator dcoordinator = new DCoordinator();
    Coordinator coordinator = new Coordinator();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

		String section_id=request.getParameter("section_id");

		coordinator.setCoordinator_sectionId(section_id);
		
		String inserted=dcoordinator.delete(coordinator);
		
		if(inserted.equals("info deleted")) response.getWriter().write("0");
		else if(inserted.equals("can't delete")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
	}

}

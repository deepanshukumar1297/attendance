package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DCoordinator;
import pojo.Coordinator;

/**
 * Servlet implementation class AdminCoordinatorUpdate
 */
@WebServlet("/AdminCoordinatorUpdate")
public class AdminCoordinatorUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCoordinatorUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

    DCoordinator dcoordinator = new DCoordinator();
    Coordinator coordinator = new Coordinator();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		String coordinator_sectionId=request.getParameter("section_id");
		String coordinator_teacherId=request.getParameter("teacher_id");

		coordinator.setCoordinator_sectionId(coordinator_sectionId);
		coordinator.setCoordinator_teacherId(coordinator_teacherId);
		
		String inserted=dcoordinator.update(coordinator);
		
		if(inserted.equals("updated")) response.getWriter().write("0");
		else if(inserted.equals("not updated")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
		
	}

}

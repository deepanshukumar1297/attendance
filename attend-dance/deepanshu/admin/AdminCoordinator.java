package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DCoordinator;
import pojo.Coordinator;

@WebServlet("/AdminCoordinator")
public class AdminCoordinator extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public AdminCoordinator()
    {
        super();
    }
    
    Coordinator coordinator = new Coordinator();
    DCoordinator dcoordinator = new DCoordinator();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		RequestDispatcher rd=request.getRequestDispatcher("adminCoordinator.jsp");

		response.setContentType("text/html");
		
		String coordinator_teacherId=request.getParameter("teacher_id");
		String coordinator_sectionId=request.getParameter("section_id");
		
		coordinator.setCoordinator_teacherId(coordinator_teacherId);
		coordinator.setCoordinator_sectionId(coordinator_sectionId);

		String inserted=dcoordinator.insert(coordinator);
		
		if(inserted.equals("added")) response.getWriter().write("0");
		else if(inserted.equals("duplicate entry")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
		
		
	}

}

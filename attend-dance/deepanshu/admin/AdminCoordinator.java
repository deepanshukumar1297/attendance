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
		
		String teacher=request.getParameter("teacher");
		String section=request.getParameter("section");
		
		coordinator.setTeacher(teacher);
		coordinator.setSection(section);

		String inserted=dcoordinator.insert(coordinator);
		
		if(inserted.equals("added"))
		{
			out.print("COORDINATOR IS ADDED");
			rd.include(request, response);
		}
		else if(inserted.equals("duplicate entry"))
		{
			out.print("THIS TEACHER IS ALREADY A COORDINATOR");
			rd.include(request, response);
		}
		else if(inserted.equals("exception occcured"))
		{
			out.print("EXCEPTION OCCURED IN SQL");
			rd.include(request, response);
		}
	}

}

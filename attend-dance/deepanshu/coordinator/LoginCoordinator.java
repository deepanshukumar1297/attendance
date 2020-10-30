package coordinator;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DCoordinator;


@WebServlet("/LoginCoordinator")
public class LoginCoordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginCoordinator() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out= response.getWriter();
		DCoordinator dcoordinator = new DCoordinator();
		
		String coordinator_sectionId = request.getParameter("coordiantor_sectionId");									//section id
		String coordinator_teacherPassword = request.getParameter("coordiantor_teacherPassword");
		
		HttpSession session=request.getSession();  
        session.setAttribute("coordiantor_teacherPassword",coordinator_teacherPassword);									 //session to pass the password so the that first time user can change it
        session.setAttribute("coordiantor_sectionId",coordinator_sectionId);											 //session for section
                 
		if(coordinator_teacherPassword.equals("password"))                                                           //first time user
		{
	        String password=dcoordinator.getPasswordVerification(coordinator_sectionId);
	        if(password.equals("*"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("chngPassCoordinator.html");
				rd.forward(request, response);
			}
			else if(password.equals("password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("coordinator.jsp");
			 	rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("loginCoordinator.jsp");
			 	rd.include(request, response);
				out.println("incorrect password");
			}
		}
		else 															                                                                //regular user
		{
			String validation=dcoordinator.passValidation(coordinator_teacherPassword,coordinator_sectionId);
			if(validation.equals("correct password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("coordinator.jsp");
			 	rd.forward(request, response);
			}
			else if(validation.equals("incorrect password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("loginCoordinator.jsp");
			 	rd.include(request, response);
			 	out.println("incorrect password");
			}
			else if(validation.equals("exception occcured"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("loginCoordinator.jsp");
			 	rd.include(request, response);
				out.println("something wrong in database");
			}
		}
	}

}

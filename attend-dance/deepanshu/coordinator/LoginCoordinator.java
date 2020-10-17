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
		
		String coordiantor_sectionId = request.getParameter("coordiantor_sectionId");									//section id
		String coordiantor_teacherPassword = request.getParameter("coordiantor_teacherPassword");
		
		HttpSession session=request.getSession();  
        session.setAttribute("coordiantor_teacherPassword",coordiantor_teacherPassword);									 //session to pass the password so the that first time user can change it
        session.setAttribute("coordiantor_sectionId",coordiantor_sectionId);											 //session for section
        
        int countlogin=dcoordinator.countLogin(coordiantor_sectionId);
        
		if(coordiantor_teacherPassword.equalsIgnoreCase("password") && countlogin==1)                           //first time user
		{
			RequestDispatcher rd=request.getRequestDispatcher("chngPassCoordinator.html");
			rd.forward(request, response);
		}
		else									                                                                //regular user
		{
			String validation=dcoordinator.passValidation(coordiantor_teacherPassword,coordiantor_sectionId);
			if(validation.equals("correct password"))
			{
				request.setAttribute("coordiantor_sectionId", coordiantor_sectionId);
				RequestDispatcher rd = request.getRequestDispatcher("coordinator.jsp");
			 	rd.forward(request, response);
			}
			else if(validation.equals("incorrect password"))
			{
				out.println("incorrect password");
				RequestDispatcher rd = request.getRequestDispatcher("loginCoordinator.jsp");
			 	rd.include(request, response);
			}
			else if(validation.equals("exception occcured"))
			{
				out.println("something wrong in database");
				RequestDispatcher rd = request.getRequestDispatcher("loginCoordinator.jsp");
			 	rd.include(request, response);
			}
		}
	}

}

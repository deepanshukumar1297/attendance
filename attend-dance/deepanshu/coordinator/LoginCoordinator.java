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
		
		String section = request.getParameter("section");									//section id
		String password = request.getParameter("password");
		
		HttpSession session=request.getSession();  
        session.setAttribute("same_curr_pass",password);									 //session to pass the password so the that first time user can change it
        session.setAttribute("section",section);											 //session for section
        
        int countlogin=dcoordinator.countLogin(section);
        
		if(password.equalsIgnoreCase("password") && countlogin==1)                           //first time user
		{
			RequestDispatcher rd=request.getRequestDispatcher("chngPassCoordinator.html");
			rd.forward(request, response);
		}
		else									                                             //regular user
		{
			String validation=dcoordinator.passValidation(password,section);
			if(validation.equals("correct password"))
			{
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

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

/**
 * Servlet implementation class ChngPassCoordinator
 */
@WebServlet("/ChngPassCoordinator")
public class ChngPassCoordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChngPassCoordinator() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		
		String curr_pass = request.getParameter("curr_pass");
		String new_pass = request.getParameter("new_pass");
		String new_pass2 = request.getParameter("new_pass2");
		
		HttpSession session=request.getSession(false);  
        String coordiantor_teacherPassword =(String) session.getAttribute("coordiantor_teacherPassword");
        String coordiantor_sectionId =(String) session.getAttribute("coordiantor_sectionId");
        
        if(new_pass.length()>=6)			//length of current password must be 6 or more
        {
	        if(coordiantor_teacherPassword.equals(curr_pass))
	        {
	        	if(new_pass.equals(new_pass2))
	        	{
	        		DCoordinator dcoordinator = new DCoordinator();
	        		String status=dcoordinator.updatePassword(new_pass,coordiantor_sectionId);
	        		
	        		if(status.equals("password changed"))
	        		{
	        			RequestDispatcher rd1 = request.getRequestDispatcher("loginCoordinator.jsp");
	            		rd1.include(request, response);
	        			out.print("PASSWORD CHANGED SUCCESSFULLY");
	        		}
	        		else if(status.equals("exception occcured"))
	        		{
	        			RequestDispatcher rd = request.getRequestDispatcher("chngPassCoordinator.html");
	            		rd.include(request, response);
	        			out.print("SOMETHING WRONG IN SQL");
	        		}
	        	}
	        	else
	        	{
	        		RequestDispatcher rd = request.getRequestDispatcher("chngPassCoordinator.html");
	        		rd.include(request, response);
	        		out.println("YOUR NEW PASSSWORD DON'T MATCH");
	        	}
	        }
	        else
	        {
	    		RequestDispatcher rd = request.getRequestDispatcher("chngPassCoordinator.html");
	    		rd.include(request, response);
	        	out.println("YOUR CURRENT PASSWORD IS ENTERED WRONG");
	        }
        }
        else
        {
    		RequestDispatcher rd = request.getRequestDispatcher("chngPassCoordinator.html");
    		rd.include(request, response);
        	out.println("YOUR CURRENT PASSWORD MUST BE EQUAL OR GREATER THAN 6 CHARACTER");
        }
	}

}

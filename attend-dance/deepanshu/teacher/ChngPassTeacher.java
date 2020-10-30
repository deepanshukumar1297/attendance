package teacher;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DTeacher;

/**
 * Servlet implementation class ChngPassTeacher
 */
@WebServlet("/ChngPassTeacher")
public class ChngPassTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChngPassTeacher() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out= response.getWriter();
		DTeacher dteacher = new DTeacher();
		
		String curr_pass = request.getParameter("curr_pass");
		String new_pass  = request.getParameter("new_pass");
		String new_pass2 = request.getParameter("new_pass2");			

		HttpSession session = request.getSession(false);
		String teacher_password=(String) session.getAttribute("teacher_password");
		String teacher_id=(String) session.getAttribute("teacher_id");

		if(new_pass.length()>=6)			//length of current password must be 6 or more
        {
			if(teacher_password.equals(curr_pass))
	        {
	        	if(new_pass.equals(new_pass2))
	        	{
	        		String status=dteacher.updatePassword(new_pass,teacher_id);
	        		
	        		if(status.equals("password changed"))
	        		{
	        			RequestDispatcher rd = request.getRequestDispatcher("loginTeacher.jsp");
	            		rd.forward(request, response);
	        			out.print("PASSWORD CHANGED SUCCESSFULLY");
	        		}
	        		else if(status.equals("exception occcured"))
	        		{
	        			RequestDispatcher rd = request.getRequestDispatcher("chngPassTeacher.html");
	            		rd.include(request, response);
	        			out.print("SOMETHING WRONG IN SQL");
	        		}
	        	}
	        	else
	        	{
	        		RequestDispatcher rd = request.getRequestDispatcher("chngPassTeacher.html");
	        		rd.include(request, response);
	        		out.println("YOUR NEW PASSSWORD DON'T MATCH");
	        	}
	        }
	        else
	        {
	    		RequestDispatcher rd = request.getRequestDispatcher("chngPassTeacher.html");
	    		rd.include(request, response);
	        	out.println("YOUR CURRENT PASSWORD IS ENTERED WRONG");
	        }
        }
		else
        {
    		RequestDispatcher rd = request.getRequestDispatcher("chngPassTeacher.html");
    		rd.include(request, response);
        	out.println("YOUR CURRENT PASSWORD MUST BE EQUAL OR GREATER THAN 6 CHARACTER");
        }
	}

}

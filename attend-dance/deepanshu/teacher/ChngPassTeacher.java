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

		
		 if(teacher_password.equals(curr_pass))
	        {
	        	if(new_pass.equals(new_pass2))
	        	{
	        		String status=dteacher.updatePassword(teacher_password,teacher_id);
	        		
	        		if(status.equals("password changed"))
	        		{
	        			RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
	            		rd.forward(request, response);
	        		}
	        		else if(status.equals("exception occcured"))
	        		{
	        			out.print("SOMETHING WRONG IN SQL");
	        			RequestDispatcher rd = request.getRequestDispatcher("chngPassTeacher.html");
	            		rd.include(request, response);
	        		}
	        	}
	        	else
	        	{
	        		out.println("YOUR NEW PASSSWORD DON'T MATCH");
	        		RequestDispatcher rd = request.getRequestDispatcher("chngPassTeacher.html");
	        		rd.include(request, response);
	        	}
	        }
	        else
	        {
	        	out.println("YOUR CURRENT PASSWORD IS ENTERED WRONG");
	    		RequestDispatcher rd = request.getRequestDispatcher("chngPassTeacher.html");
	    		rd.include(request, response);
	        }
	}

}

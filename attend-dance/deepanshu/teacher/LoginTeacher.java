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

import dao.DCoordinator;
import dao.DTeacher;

/**
 * Servlet implementation class LoginTeacher
 */
@WebServlet("/LoginTeacher")
public class LoginTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out= response.getWriter();
		DTeacher dteacher = new DTeacher();
		
		String teacher_name = request.getParameter("teacher_name");
		String teacher_id = request.getParameter("teacher_id");
		String teacher_password = request.getParameter("teacher_password");
		
		HttpSession session=request.getSession();  
        session.setAttribute("teacher_name",teacher_name);									 //session to pass the password so the that first time user can change it
        session.setAttribute("teacher_id",teacher_id);											 //session for section
        
        int countlogin=dteacher.countLogin(teacher_id);
        
		if(teacher_password.equalsIgnoreCase("password") && countlogin==1)                           //first time user
		{
			RequestDispatcher rd=request.getRequestDispatcher("chngPassTeacher.html");
			rd.forward(request, response);
		}
		else									                                             //regular user
		{
			String validation=dteacher.passValidation(password,id);
			if(validation.equals("correct password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
			 	rd.forward(request, response);
			}
			else if(validation.equals("incorrect password"))
			{
				out.println("incorrect password");
				RequestDispatcher rd = request.getRequestDispatcher("loginTeacher.jsp");
			 	rd.include(request, response);
			}
			else if(validation.equals("exception occcured"))
			{
				out.println("something wrong in database");
				RequestDispatcher rd = request.getRequestDispatcher("loginTeacher.jsp");
			 	rd.include(request, response);
			}
		}
	}

}

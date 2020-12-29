package teacher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DTeacher dteacher = new DTeacher();

		String teacher_id = request.getParameter("teacher_id");
		String teacher_password = request.getParameter("password");

		HttpSession session = request.getSession();
		session.setAttribute("teacher_password", teacher_password);
		session.setAttribute("teacher_id", teacher_id);
		
		if(teacher_password.equals("password") )                   //first time user
		{
	        String password=dteacher.getPasswordVerification(teacher_id);
	        if(password.equals("*"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("chngPassTeacher.html");
				rd.forward(request, response);
			}
	        else if(password.equals("password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
			 	rd.forward(request, response);
			}
	        else response.getWriter().write("0");		//wrong password
	        
		}
		else									                                             //regular user
		{
			String validation=dteacher.passValidation(teacher_password,teacher_id);
			if(validation.equals("correct password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("teacher.jsp");
			 	rd.forward(request, response);
			}
			else if(validation.equals("incorrect password"))response.getWriter().write("0");
			
			else if(validation.equals("exception occcured"))response.getWriter().write("1");
			
		}

	}


}

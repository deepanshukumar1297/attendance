package common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DTeacher;
import pojo.Teacher;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	DTeacher dteacher = new DTeacher();
	Teacher teacher = new Teacher();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password=request.getParameter("password");
		String teacher_id=request.getParameter("email");
		String confirm_password=request.getParameter("confirm_password");
	
		System.out.println(password);
		System.out.println(teacher_id);
		System.out.println(confirm_password);
		
		teacher.setTeacher_id(teacher_id);
		teacher.setTeacher_password(password);
		
		if(password.equals("password")){
			String original_password=dteacher.getPasswordVerification(teacher_id);
	        if(original_password.equals("*"))
			{
	        	String update = dteacher.updatePassword(teacher,confirm_password);
				if(update.equals("updated")) response.getWriter().write("0");
				else if(update.equals("not updated"))response.getWriter().write("1");
				else if(update.equals("exception occcured"))response.getWriter().write("2");
			}
	        else if(password.equals("password"))
			{
	        	String update = dteacher.updatePassword(teacher,confirm_password);
				if(update.equals("updated")) response.getWriter().write("0");
				else if(update.equals("not updated"))response.getWriter().write("1");
				else if(update.equals("exception occcured"))response.getWriter().write("2");
			}
	        else response.getWriter().write("3");		//wrong password
		}
		else{		
			String validate = dteacher.passValidation(teacher);
			
			if(validate.equals("correct password")){
				String update = dteacher.updatePassword(teacher,confirm_password);
				if(update.equals("updated")) response.getWriter().write("0");
				else if(update.equals("not updated"))response.getWriter().write("1");
				else if(update.equals("exception occcured"))response.getWriter().write("2");
			}
			else if(validate.equals("incorrect password"))response.getWriter().write("3");
			else if(validate.equals("exception occcured"))response.getWriter().write("4");
		}
	}

}

package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DTeacher;
import pojo.Teacher;

@WebServlet("/AdminTeacher")
public class AdminTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminTeacher() {
        super();  
    }
    
    DTeacher dteacher = new DTeacher();
    Teacher teacher = new Teacher();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd=request.getRequestDispatcher("adminTeacher.jsp");
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
		
		String teacher_name=request.getParameter("teacher_name");
		String teacher_id=request.getParameter("teacher_id");
		String teacher_password = "password";
		int countlogin=0;
		
		teacher.setTeacher_name(teacher_name);
		teacher.setTeacher_id(teacher_id);
		teacher.setTeacher_password(teacher_password);
		teacher.setCountlogin(countlogin);
		
		if(teacher_name.equals("") || teacher_id.equals(""))
		{
			out.print("DON'T LEAVE THE FIELD EMPTY");
			rd.include(request, response);
		}
		else
		{			
			String inserted=dteacher.insert(teacher);

			if(inserted.equals("added"))
			{
				out.print("TEACHER IS ADDED");
				rd.include(request, response);
			}
			else if(inserted.equals("duplicate entry"))
			{
				out.print("THIS TEACHER ID ALREADY EXISTS");
				rd.include(request, response);
			}
			else if(inserted.equals("exception occcured"))
			{
				out.print("EXCEPTION OCCURED IN SQL");
				rd.include(request, response);
			}
		}
	}

}

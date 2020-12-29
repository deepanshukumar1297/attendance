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
		
		
		response.setContentType("text/html");
		
		String teacher_name=request.getParameter("teacher_name");
		String teacher_id=request.getParameter("teacher_id");
		String teacher_password = "*";
		
		teacher.setTeacher_name(teacher_name);
		teacher.setTeacher_id(teacher_id);
		teacher.setTeacher_password(teacher_password);
		
		String inserted=dteacher.insert(teacher);

		if(inserted.equals("added"))response.getWriter().write("0");
		else if(inserted.equals("duplicate entry"))response.getWriter().write("1");	
		else if(inserted.equals("exception occcured"))response.getWriter().write("2");
		
	}

}

package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DStudent;
import pojo.Student;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AdminStudent")
public class AdminStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AdminStudent()
	{
		super();
	}
	
	DStudent dstudent = new DStudent();
	Student student = new Student();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		String student_name=request.getParameter("student_name");
		String student_id=request.getParameter("student_id");
		String student_sectionId=request.getParameter("student_sectionId");

		student.setStudent_name(student_name);
		student.setStudent_id(student_id);
		student.setStudent_sectionId(student_sectionId);
		
		String inserted=dstudent.insert(student);
		
		if(inserted.equals("added")) response.getWriter().write("0");
		else if(inserted.equals("duplicate entry")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
		
	}

}



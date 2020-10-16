package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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

		PrintWriter out = response.getWriter();
		RequestDispatcher rd=request.getRequestDispatcher("adminStudent.jsp");
		
		response.setContentType("text/html");

		String student_name=request.getParameter("student_name");
		String student_id=request.getParameter("student_id");
		String student_sectionId=request.getParameter("student_sectionId");


		student.setStudent_name(student_name);
		student.setStudent_id(student_id);
		student.setStudent_sectionId(student_sectionId);
		
		if(student_name.equals("") || student_id.equals(""))
		{
			out.print("DON'T LEAVE THE FIELD EMPTY");
			rd.include(request, response);
		}
		else
		{
			String inserted=dstudent.insert(student);
			
			if(inserted.equals("added"))
			{
				out.print("STUDENT IS ADDED");
				rd.include(request, response);
			}
			else if(inserted.equals("duplicate entry"))
			{
				out.print("THIS STUDENT ID ALREADY EXISTS");
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



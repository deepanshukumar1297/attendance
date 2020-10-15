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

		String name=request.getParameter("student");
		String id=request.getParameter("id");
		String section=request.getParameter("section");


		student.setName(name);
		student.setId(id);
		student.setSection(section);
		
		if(name.equals("") || id.equals(""))
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



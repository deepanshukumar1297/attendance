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
 * Servlet implementation class AdminStudentUpdate
 */
@WebServlet("/AdminStudentUpdate")
public class AdminStudentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStudentUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

    DStudent dstudent = new DStudent();
	Student student = new Student();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		String student_name=request.getParameter("student_name");
		String student_id=request.getParameter("student_id");
		String new_student_id=request.getParameter("new_student_id");
		String student_sectionId=request.getParameter("student_sectionId");

		student.setStudent_name(student_name);
		student.setStudent_id(new_student_id);
		student.setStudent_sectionId(student_sectionId);
		
		String inserted=dstudent.update(student,student_id);
		
		if(inserted.equals("updated")) response.getWriter().write("0");
		else if(inserted.equals("not updated")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
		
	}

	

}

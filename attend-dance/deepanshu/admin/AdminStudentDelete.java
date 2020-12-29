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
 * Servlet implementation class AdminStudentDelete
 */
@WebServlet("/AdminStudentDelete")
public class AdminStudentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStudentDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

    DStudent dstudent = new DStudent();
	Student student = new Student();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

		String student_id=request.getParameter("student_id");

		student.setStudent_id(student_id);
		
		String inserted=dstudent.delete(student);
		
		if(inserted.equals("info deleted")) response.getWriter().write("0");
		else if(inserted.equals("can't delete")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
	}

	

}

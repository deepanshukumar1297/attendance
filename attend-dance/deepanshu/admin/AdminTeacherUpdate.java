package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DStudent;
import dao.DTeacher;
import pojo.Student;
import pojo.Teacher;

/**
 * Servlet implementation class AdminTeacherUpdate
 */
@WebServlet("/AdminTeacherUpdate")
public class AdminTeacherUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTeacherUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

    DTeacher dteacher = new DTeacher();
    Teacher teacher = new Teacher();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		String teacher_name=request.getParameter("teacher_name");
		String teacher_id=request.getParameter("teacher_id");
		String new_teacher_id=request.getParameter("new_teacher_id");

		teacher.setTeacher_name(teacher_name);
		teacher.setTeacher_id(new_teacher_id);
		
		String inserted=dteacher.update(teacher,teacher_id);
		
		if(inserted.equals("updated")) response.getWriter().write("0");
		else if(inserted.equals("not updated")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
		
	}


}

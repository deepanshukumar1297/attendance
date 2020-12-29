package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DTeacher;
import pojo.Teacher;

/**
 * Servlet implementation class AdminTeacherDelete
 */
@WebServlet("/AdminTeacherDelete")
public class AdminTeacherDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTeacherDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

    DTeacher dteacher = new DTeacher();
    Teacher teacher = new Teacher();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

		String teacher_id=request.getParameter("teacher_id");

		teacher.setTeacher_id(teacher_id);
		
		String inserted=dteacher.delete(teacher);
		
		if(inserted.equals("info deleted")) response.getWriter().write("0");
		else if(inserted.equals("can't delete")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
	}

}

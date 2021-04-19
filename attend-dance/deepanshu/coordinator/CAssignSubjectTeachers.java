package coordinator;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DSubjectTeacherSection;
import pojo.SubjectTeacherSection;

/**
 * Servlet implementation class CAssignSubjectTeachers
 */
@WebServlet("/CAssignSubjectTeachers")
public class CAssignSubjectTeachers extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CAssignSubjectTeachers() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
		SubjectTeacherSection subteachsec = new SubjectTeacherSection();
	    		
		response.setContentType("text/html");
		
		String teacher_id=request.getParameter("teacher_id");
		String section_id=request.getParameter("section_id");
		String subject_id=request.getParameter("subject_id");

		subteachsec.setTeacher_id(teacher_id);
		subteachsec.setSection_id(section_id);
		subteachsec.setSubject_id(subject_id);

		String inserted=dsubteachsec.insert(subteachsec);

		if(inserted.equals("added"))response.getWriter().write("0");
		else if(inserted.equals("duplicate entry"))response.getWriter().write("1");
		else if(inserted.equals("exception occcured"))response.getWriter().write("2");
		
	}

}

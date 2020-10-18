package coordinator;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	    
		PrintWriter out = response.getWriter();
		
		RequestDispatcher rd=request.getRequestDispatcher("coordinator.jsp");
		response.setContentType("text/html");
		
		String teacher_id=request.getParameter("teacher_id");
		String section_id=request.getParameter("section_id");
		String subject_id=request.getParameter("subject_id");

		
		subteachsec.setTeacher_id(teacher_id);
		subteachsec.setSection_id(section_id);
		subteachsec.setSubject_id(subject_id);
		
		HttpSession session=request.getSession(false);  
        String coordiantor_sectionId= (String) session.getAttribute("coordiantor_sectionId");

		if(coordiantor_sectionId.equals(section_id))
		{
			String inserted=dsubteachsec.insert(subteachsec);

			if(inserted.equals("added"))
			{
				out.print("ASSIGNED");
				rd.include(request, response);
			}
			else if(inserted.equals("duplicate entry"))
			{
				out.print("ALREADY EXISTS");
				rd.include(request, response);
			}
			else if(inserted.equals("exception occcured"))
			{
				out.print("EXCEPTION OCCURED IN SQL");
				rd.include(request, response);
			}
		}
		else
		{			
			out.println("YOU ARE RESPONSIBLE FOR YOUR SECTION ONLY");
			rd.include(request, response);
		}
	}

}

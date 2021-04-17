package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DSubject;
import pojo.Subject;

/**
 * Servlet implementation class AdminSubjectUpdate
 */
@WebServlet("/AdminSubjectUpdate")
public class AdminSubjectUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSubjectUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

    DSubject dsubject = new DSubject();
    Subject subject = new Subject();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		String subject_name=request.getParameter("subject_name");
		String subject_id=request.getParameter("subject_id");
		String new_subject_id=request.getParameter("new_subject_id");

		subject.setSubject_name(subject_name);
		subject.setSubject_id(new_subject_id);
		
		String inserted=dsubject.update(subject,subject_id);
		
		if(inserted.equals("updated")) response.getWriter().write("0");
		else if(inserted.equals("not updated")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
		
	}

}

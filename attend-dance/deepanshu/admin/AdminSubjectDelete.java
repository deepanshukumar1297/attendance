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
 * Servlet implementation class AdminSubjectDelete
 */
@WebServlet("/AdminSubjectDelete")
public class AdminSubjectDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSubjectDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

    DSubject dsubject = new DSubject();
    Subject subject = new Subject();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

		String subject_id=request.getParameter("subject_id");

		subject.setSubject_id(subject_id);;
		
		String inserted=dsubject.delete(subject);
		
		if(inserted.equals("info deleted")) response.getWriter().write("0");
		else if(inserted.equals("can't delete")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
	}

}

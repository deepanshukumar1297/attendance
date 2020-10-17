package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DSubject;
import pojo.Subject;

/**
 * Servlet implementation class AdminSubject
 */
@WebServlet("/AdminSubject")
public class AdminSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AdminSubject() {
        super();
        // TODO Auto-generated constructor stub
    }


    DSubject dsubject = new DSubject();
    Subject subject = new Subject();
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd=request.getRequestDispatcher("adminSubject.jsp");
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
		
		String subject_name=request.getParameter("subject_name");
		String subject_id=request.getParameter("subject_id");
		
		subject.setSubject_name(subject_name);
		subject.setSubject_id(subject_id);
		
		if(subject_name.equals("") || subject_id.equals(""))
		{
			out.print("DON'T LEAVE THE FIELD EMPTY");
			rd.include(request, response);
		}
		else
		{			
			String inserted=dsubject.insert(subject);

			if(inserted.equals("added"))
			{
				out.print("SUBJECT IS ADDED");
				rd.include(request, response);
			}
			else if(inserted.equals("duplicate entry"))
			{
				out.print("THIS SUBJECT ALREADY EXISTS");
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



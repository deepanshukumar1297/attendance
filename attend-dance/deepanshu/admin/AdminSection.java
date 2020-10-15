package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DSection;
import pojo.Section;


@WebServlet("/AdminSection")
public class AdminSection extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminSection() {
        super();
        // TODO Auto-generated constructor stub
    }

    Section section = new Section();
    DSection dsection = new DSection();
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		RequestDispatcher rd=request.getRequestDispatcher("adminSection.jsp");

		response.setContentType("text/html");
		
		String name=request.getParameter("section");
		String id=request.getParameter("id");
		
		section.setName(name);
		section.setId(id);
		
		if(name.equals("") || id.equals(""))
		{
			out.print("DON'T LEAVE THE FIELD EMPTY");
			rd.include(request, response);
		}
		
		else
		{
			String inserted=dsection.insert(section);
			
			if(inserted.equals("ADDED"))
			{
				out.print("SECTION ADDED");
				rd.include(request, response);
			}
			else if(inserted.equals("duplicate entry"))
			{
				out.print("THIS SECTION ID ALREADY EXISTS");
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

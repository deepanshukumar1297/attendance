package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DSection;
import pojo.Section;

/**
 * Servlet implementation class AdminSectionUpdate
 */
@WebServlet("/AdminSectionUpdate")
public class AdminSectionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSectionUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

    DSection dsection = new DSection();
    Section section = new Section();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		String section_name=request.getParameter("section_name");
		String section_id=request.getParameter("section_id");
		String new_section_id=request.getParameter("new_section_id");

		section.setSection_name(section_name);
		section.setSection_id(new_section_id);
		
		String inserted=dsection.update(section,section_id);
		
		if(inserted.equals("updated")) response.getWriter().write("0");
		else if(inserted.equals("not updated")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
		
	}

}

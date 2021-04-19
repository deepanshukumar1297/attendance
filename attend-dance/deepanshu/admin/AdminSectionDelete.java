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
 * Servlet implementation class AdminSectionDelete
 */
@WebServlet("/AdminSectionDelete")
public class AdminSectionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSectionDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

    DSection dsection = new DSection();
    Section section = new Section();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");

		String section_id=request.getParameter("section_id");

		section.setSection_id(section_id);;
		
		String inserted=dsection.delete(section);
		
		if(inserted.equals("info deleted")) response.getWriter().write("0");
		else if(inserted.equals("can't delete")) response.getWriter().write("1");
		else if(inserted.equals("exception occcured")) response.getWriter().write("2");
	}

}

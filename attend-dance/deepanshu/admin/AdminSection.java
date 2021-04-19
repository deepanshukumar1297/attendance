package admin;

import java.io.IOException;

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

		response.setContentType("text/html");
		
		String section_name=request.getParameter("section_name");
		String section_id=request.getParameter("section_id");
		
		section.setSection_name(section_name);
		section.setSection_id(section_id);
		
		String inserted=dsection.insert(section);

		if(inserted.equals("added"))response.getWriter().write("0");
		if(inserted.equals("duplicate entry"))response.getWriter().write("1");	
		if(inserted.equals("exception occcured"))response.getWriter().write("2");

	}
}
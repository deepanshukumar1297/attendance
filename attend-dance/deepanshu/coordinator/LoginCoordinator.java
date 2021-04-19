package coordinator;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DCoordinator;
import dao.DTeacher;
import pojo.Teacher;


@WebServlet("/LoginCoordinator")
public class LoginCoordinator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginCoordinator() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		DCoordinator dcoordinator = new DCoordinator();
		DTeacher dteacher = new DTeacher();
		Teacher teacher = new Teacher();
		
		String coordinator_sectionId = request.getParameter("coordiantor_sectionId");									//section id
		String teacher_password = request.getParameter("password");
		
		HttpSession session=request.getSession();  
        //session.setAttribute("coordiantor_teacherPassword",coordinator_teacherPassword);						//session to pass the password so the that first time user can change it
        session.setAttribute("coordiantor_sectionId",coordinator_sectionId);									//session for section
           
        String teacher_id=dcoordinator.getId(coordinator_sectionId);     //make sure these section id must have coordinators
        
        teacher.setTeacher_id(teacher_id);
        teacher.setTeacher_password(teacher_password);
        
		if(teacher_password.equals("password"))          //first time user
		{
	        String password=dteacher.getPasswordVerification(teacher_id);
	        if(password.equals("*"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("changePassword.jsp?teacher_id="+teacher_id);
				rd.forward(request, response);
			}
			else if(password.equals("password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("coordinator.jsp");
			 	rd.forward(request, response);
			}
			else response.getWriter().write("0");
			
		}
		else 															                                                                //regular user
		{
			String validation=dteacher.passValidation(teacher);
			if(validation.equals("correct password"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("coordinator.jsp");
			 	rd.forward(request, response);
			}
			else if(validation.equals("incorrect password"))response.getWriter().write("0");
			
			else if(validation.equals("exception occcured"))response.getWriter().write("1");
			
		}
	}

}

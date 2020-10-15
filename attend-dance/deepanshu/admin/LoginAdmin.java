package admin;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	
		if(email.equals("admin@gmail.com") && password.equals("1"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			rd.forward(request, response);
		}
		else{
			
			RequestDispatcher rd=request.getRequestDispatcher("loginAdmin.html");
			rd.include(request, response);
			out.println("wrong credentials");
		}		
	}

	
}

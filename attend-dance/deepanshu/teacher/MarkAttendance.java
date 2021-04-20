package teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DMark;
import pojo.Mark;

/**
 * Servlet implementation class MarkAttendance
 */
@WebServlet("/MarkAttendance")
public class MarkAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MarkAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=  response.getWriter();
		response.setContentType("text/html");
		
		int number_of_students = Integer.parseInt(request.getParameter("number_of_students"));
		
		Date[] date= new Date[number_of_students];
		
		String[] subject_id = new String[number_of_students];
		String[] section_id = new String[number_of_students];
		String[] teacher_id = new String[number_of_students];
		String[] attendance = new String[number_of_students];
		String[] student_id = new String[number_of_students];
		String[] date_of_attendance = new String[number_of_students];
		
		for(int i=0; i<number_of_students; i++) subject_id[i] = request.getParameter("subject_id");
		for(int i=0; i<number_of_students; i++) section_id[i] = request.getParameter("section_id");
		for(int i=0; i<number_of_students; i++) teacher_id[i] = request.getParameter("teacher_id");
		for(int i=0; i<number_of_students; i++) date_of_attendance[i] = request.getParameter("date_of_attendance");

		student_id = request.getParameterValues("student_id");
		attendance = request.getParameterValues("attendance");

		Mark mark =new Mark();
		DMark dmark =new DMark();
		
		for(int i=0; i<number_of_students; i++)
		{
			date[i]=Date.valueOf(date_of_attendance[i]);
		}
		
		mark.setSubject_id(subject_id);
		mark.setStudent_id(student_id);
		mark.setSection_id(section_id);
		mark.setTeacher_id(teacher_id);
		mark.setAttendance(attendance);
		mark.setDate_of_attendance(date);
		

		String inserted=dmark.insert(mark , number_of_students);

		if(inserted.equals("added"))
		{
			out.print("atttendance is marked");
		}
		else out.print("EXCEPTION OCCURED IN SQL");	
	}

}

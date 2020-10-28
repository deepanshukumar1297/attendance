package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import pojo.Mark;

public class DMark
{
	String url="jdbc:mysql://localhost:3306/attendance";
	String uname="root";
	String pass="root";
	
	public void getCon()  
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public String insert(Mark mark , int number_of_students)
	{
		getCon();
		String query= "insert into mark values(?,?,?,?,?,?)";	//teacher_id , section_id , subject_id , student_id , attendance , date_of_attendance
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			
			for(int i=0; i<number_of_students; i++)
			{
				pst.setString(1, mark.getTeacher_id()[i]);
				pst.setString(2, mark.getSection_id()[i]);
				pst.setString(3, mark.getSubject_id()[i]);
				pst.setString(4, mark.getStudent_id()[i]);
				pst.setString(5, mark.getAttendance()[i]);
				pst.setDate(6, mark.getDate_of_attendance()[i]);
				
				pst.addBatch();
			}
			
			pst.executeBatch();
			return "added";
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}

}

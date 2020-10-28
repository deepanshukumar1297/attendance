package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.GetMark;
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
	
	public ArrayList<GetMark> fetchSectionAttendance(String section_id, String subject_id, String teacher_id) 
	{
		ArrayList<GetMark> studentsecattend_list= new ArrayList<GetMark>();
		getCon();
		String query= String.format("select student_id, attendance, date_of_attendance from mark where section_id=('%s') and subject_id=('%s') and teacher_id=('%s')",section_id,subject_id,teacher_id);
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				GetMark getmark = new GetMark();
			
				String student_id = rs.getString("student_id");
				String attendance = rs.getString("attendance");
				Date date_of_attendance = rs.getDate("date_of_attendance");

				getmark.setStudent_id(student_id);                      
				getmark.setAttendance(attendance);
				getmark.setDate_of_attendance(date_of_attendance); 
				
				studentsecattend_list.add(getmark);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return studentsecattend_list;
	}
}

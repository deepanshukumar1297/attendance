package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.SubjectTeacherSection;

public class DSubjectTeacherSection
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
	
	public String insert(SubjectTeacherSection subteachsec)
	{
		getCon();
		String query= "insert into teacher_section_subject values(?,?,?)";     //teacher_id, section_id , subject_id
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, subteachsec.getTeacher_id());
			pst.setString(2, subteachsec.getSection_id());	
			pst.setString(3, subteachsec.getSubject_id());	
			pst.executeUpdate();
			return "added";
		}
		catch(SQLIntegrityConstraintViolationException e)
		{
			//e.printStackTrace();
			return "duplicate entry";
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}	
	}
	
	public ArrayList<SubjectTeacherSection> fetch(String coordiantor_sectionId) 
	{
		ArrayList<SubjectTeacherSection> subteachsec_list= new ArrayList<SubjectTeacherSection>();
		getCon();
		String query=String.format ("select subject_id, section_id from teacher_section_subject where teacher_id=('%s')",coordiantor_sectionId);
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				SubjectTeacherSection subteachsec = new SubjectTeacherSection();
				
				String subject_id = rs.getString("subject_id");
				String teacher_id = rs.getString("teacher_id");
				
				subteachsec.setSubject_id(subject_id);
				subteachsec.setTeacher_id(teacher_id);
				
				subteachsec_list.add(subteachsec);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return subteachsec_list;
	}
}

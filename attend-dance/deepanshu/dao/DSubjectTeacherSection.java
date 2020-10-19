package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.Student;
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
	
	public ArrayList<SubjectTeacherSection> fetchSubjectTeacher(String coordiantor_sectionId) 
	{
		ArrayList<SubjectTeacherSection> subteach_list= new ArrayList<SubjectTeacherSection>();
		getCon();
		String query=String.format ("select subject_id, teacher_id from teacher_section_subject where section_id=('%s')",coordiantor_sectionId);
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
				
				subteach_list.add(subteachsec);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return subteach_list;
	}
	
	public ArrayList<Student> fetchStudent(String coordiantor_sectionId) 
	{
		ArrayList<Student> secstudentlist= new ArrayList<Student>();
		getCon();
		String query=String.format ("select student_name, student_id from student where section_id=('%s')",coordiantor_sectionId);
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Student secstudent = new Student();
				
				String student_name = rs.getString("student_name");
				String student_id = rs.getString("student_id");
				
				secstudent.setStudent_name(student_name);
				secstudent.setStudent_id(student_id);
				
				secstudentlist.add(secstudent);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return secstudentlist;
	}
	
	public ArrayList<String> coordinatorInfo(String coordiantor_sectionId)
	{
		getCon();
		ArrayList<String> coordinatorinfo = new ArrayList<String>();    // teacher_id,teacher_name
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs=null;
			
			String query1= String.format("select teacher_id from coordinator where section_id=('%s')",coordiantor_sectionId); 	
			rs= st.executeQuery(query1);
			rs.next();
			String teacher_id=rs.getString("teacher_id");
			
			coordinatorinfo.add(teacher_id);
			
			String query2 = String.format("select teacher_name from teacher where teacher_id=('%s') ", teacher_id);
			rs= st.executeQuery(query2);
			rs.next();
			String teacher_name=rs.getString("teacher_name");
			
			coordinatorinfo.add(teacher_name);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		return coordinatorinfo;
	}
	
	public String teacherInfo(String teacher_id)
	{
		getCon();
		String teacher_name=null;
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs=null;
			
			String query1= String.format("select teacher_name from teacher where teacher_id=('%s')",teacher_id); 	
			rs= st.executeQuery(query1);
			rs.next();
			teacher_name=rs.getString("teacher_name");
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}	
		return teacher_name;
	}
	
	public ArrayList<SubjectTeacherSection> fetchSubjectSection(String teacher_id) 
	{
		ArrayList<SubjectTeacherSection> subsec_list= new ArrayList<SubjectTeacherSection>();
		getCon();
		String query=String.format ("select subject_id, section_id from teacher_section_subject where teacher_id=('%s')",teacher_id);
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				SubjectTeacherSection subteachsec = new SubjectTeacherSection();
				
				String subject_id = rs.getString("subject_id");
				String section_id = rs.getString("section_id");
				
				subteachsec.setSubject_id(subject_id);
				subteachsec.setSection_id(section_id);
				
				subsec_list.add(subteachsec);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return subsec_list;
	}
}

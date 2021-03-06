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

public class DStudent
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
	
	/**
	 * 
	 * @param student
	 * @return status of insertion of students and pass it to adminStudent.jsp
	 */
	public String insert(Student student) 
	{
		getCon();
		String query= "insert into student values(?,?,?)";    //student_name , student_id, student_section
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, student.getStudent_name());
			pst.setString(2, student.getStudent_id());
			pst.setString(3, student.getStudent_sectionId());
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
	
	/**
	 * 
	 * @return list of student as arrayList
	 */
	public ArrayList<Student> fetch() 
	{
		ArrayList<Student> studentslist= new ArrayList<Student>();
		getCon();
		String query= "select student_id ,student_name ,section_id from student ORDER BY student_name, student_id";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Student student = new Student();
				String student_id = rs.getString("student_id");
				String student_name=rs.getString("student_name");
				String student_sectionId=rs.getString("section_id");			//foreign key
				student.setStudent_id(student_id);
				student.setStudent_name(student_name);
				student.setStudent_sectionId(student_sectionId);
				studentslist.add(student);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return studentslist;
	}
	
	/**
	 * 
	 * @param section_id
	 * @return return list of students of given section
	 */
	public ArrayList<Student> fetch(String section_id) 
	{
		ArrayList<Student> studentslist= new ArrayList<Student>();
		getCon();
		String query= "select student_id ,student_name from student ORDER BY student_name, student_id where section_id="+section_id;
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Student student = new Student();
				String student_id = rs.getString("student_id");
				String student_name=rs.getString("student_name");
				student.setStudent_id(student_id);
				student.setStudent_name(student_name);
				studentslist.add(student);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return studentslist;
	}
	
	
	/**
	 * 
	 * @param student_id
	 * @return status of update of student info
	 */
	public String update(Student student, String student_id) 
	{
		getCon();
		String query= "update student set student_name=? , student_id=? , section_id=? where student_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, student.getStudent_name());
			pst.setString(2, student.getStudent_id());
			pst.setString(3, student.getStudent_sectionId());
			pst.setString(4, student_id);
						
			int i=pst.executeUpdate();
			if(i>0)return "updated";
			else return "not updated";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}

	/**
	 * 
	 * @param student
	 * @return status of deletion of student info
	 */
	public String delete(Student student) {
		getCon();
		String query= "delete from student where student_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, student.getStudent_id());
					
			int i=pst.executeUpdate();
			if(i>0)return "info deleted";
			else return "can't delete";
		}
		
		catch(SQLException e)
		{
			//e.printStackTrace();
			return "exception occcured";
		}
	}

}

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
	String pass="deep123";
	
	public void getCon()  
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public String insert(Student student) 
	{
		getCon();
		String query= "insert into student values(?,?,?)";    //name , id, section
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, student.getName());
			pst.setString(2, student.getId());
			pst.setString(3, student.getSection());
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
	
	
	public ArrayList<Student> fetch() 
	{
		ArrayList<Student> studentslist= new ArrayList<Student>();
		getCon();
		String query= "select id ,name ,section from student ORDER BY name,id";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Student student = new Student();
				String id = rs.getString("id");
				String name=rs.getString("name");
				String section=rs.getString("section");
				student.setId(id);
				student.setName(name);
				student.setSection(section);
				studentslist.add(student);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return studentslist;
	}

}

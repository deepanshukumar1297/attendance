package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.Subject;



public class DSubject
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
	 * @param teacher
	 * @return status of insertion of data in database to adminTeacher.jsp
	 */
	public String insert(Subject teacher)
	{
		getCon();
		String query= "insert into subject values(?,?)";     //subject_name, subject_id
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, teacher.getSubject_name());
			pst.setString(2, teacher.getSubject_id());	
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
	 * @return list of teachers as ArrayList
	 */
	public ArrayList<Subject> fetch() 
	{
		ArrayList<Subject> subjectslist= new ArrayList<Subject>();
		getCon();
		String query= "select subject_id, subject_name from subject";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Subject subject = new Subject();
				String subject_id = rs.getString("subject_id");
				String subject_name=rs.getString("subject_name");
				subject.setSubject_id(subject_id);
				subject.setSubject_name(subject_name);
				subjectslist.add(subject);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return subjectslist;
	}

	public String update(Subject subject, String subject_id) {
		getCon();
		String query= "update subject set subject_name=? , subject_id=? where subject_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, subject.getSubject_name());
			pst.setString(2, subject.getSubject_id());
			pst.setString(3, subject_id);
						
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

	public String delete(Subject subject) {
		getCon();
		String query= "delete from subject where subject_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, subject.getSubject_id());
							
			int i=pst.executeUpdate();
			if(i>0)return "info deleted";
			else return "can't delete";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}
}

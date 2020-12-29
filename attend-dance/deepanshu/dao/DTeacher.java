package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;


import pojo.Teacher;


public class DTeacher
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
	public String insert(Teacher teacher)
	{
		getCon();
		String query= "insert into teacher values(?,?,?)";     //teacher_name, teacher_id, teacher_password 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			
			pst.setString(1, teacher.getTeacher_name());
			pst.setString(2, teacher.getTeacher_id());			 //foreign key for coordinator
			pst.setString(3, teacher.getTeacher_password());
			
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
	public ArrayList<Teacher> fetch() 
	{
		ArrayList<Teacher> teacherslist= new ArrayList<Teacher>();
		getCon();
		String query= "select teacher_id , teacher_name , teacher_password from teacher";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Teacher teacher = new Teacher();
				
				String teacher_id = rs.getString("teacher_id");
				String teacher_name=rs.getString("teacher_name");
				String teacher_password=rs.getString("teacher_password");

				teacher.setTeacher_id(teacher_id);
				teacher.setTeacher_name(teacher_name);
				teacher.setTeacher_password(teacher_password);
				teacherslist.add(teacher);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return teacherslist;
	}

	/**
	 * if countlogin = 1 -> coordinator is first time user and he should change password
	 * 
	 * @param teacher_id
	 * @return -1 or number of times coordinator has logged in
	 */
	public String getPasswordVerification(String teacher_id)
	{
		getCon();	
		String password="";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= String.format("select teacher_password from teacher where teacher_id=('%s')",teacher_id ) ;    
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			password=rs.getString("teacher_password");
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return password;
	}
	
	/**
	 * 
	 * @param teacher_password
	 * @param teacher_id
	 * @return status of correct password entered
	 */
	public String passValidation(String teacher_password, String teacher_id)
	{
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= String.format("select teacher_password from teacher where teacher_id=('%s')",teacher_id ) ;    
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			String password= rs.getString("teacher_password");
			
			if(password.equals(teacher_password)) return "correct password";
			else return "incorrect password";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}

	/**
	 * 
	 * @param teacher_password
	 * @param teacher_id
	 * @return status of password changed
	 */
	public String updatePassword(String teacher_password, String teacher_id)
	{
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= String.format("update teacher set teacher_password=('%s') where teacher_id=('%s')", teacher_password, teacher_id) ;    
			st.executeUpdate(query1);
			
			return "password changed";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}

	/**
	 * 
	 * @param teacher
	 * @param teacher_id
	 * @return return status of update of teachers
	 */
	public String update(Teacher teacher, String teacher_id) {
		
		getCon();
		String query= "update teacher set teacher_name=? , teacher_id=? where teacher_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, teacher.getTeacher_name());
			pst.setString(2, teacher.getTeacher_id());
			pst.setString(3, teacher_id);
						
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
	 * @param teacher
	 * @return status of deletion of teacher info
	 */
	public String delete(Teacher teacher) {
		getCon();
		String query= "delete from teacher where teacher_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, teacher.getTeacher_id());
							
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



package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.Coordinator;

public class DCoordinator
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
	
	public String insert(Coordinator coordinator) 
	{
		getCon();
		String query= "insert into coordinator values(?,?)";		//teacher, section
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, coordinator.getTeacher());
			pst.setString(2, coordinator.getSection());
			pst.executeUpdate();
			return "added";
		}
		catch(SQLIntegrityConstraintViolationException e)
		{
			e.printStackTrace();
			return "duplicate entry";
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}
	
	public ArrayList<Coordinator> fetch() 
	{
		ArrayList<Coordinator> coordinatorslist= new ArrayList<Coordinator>();
		getCon();
		String query= "select section,teacher from coordinator";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Coordinator coordinator = new Coordinator();
				String section = rs.getString("section");
				String teacher=rs.getString("teacher");
				coordinator.setSection(section);
				coordinator.setTeacher(teacher);
				coordinatorslist.add(coordinator);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return coordinatorslist;
	}
	
	
	public String passValidation(String password,String sectionid)
	{
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= "select teacher from coordinator where section= "+sectionid;     //here section is the foreign key stored as section id in teacher table
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			String teacherid=rs.getString("teacher");
			
			String query2= "select password from teacher where id= "+teacherid;
			rs=st.executeQuery(query2);
			rs.next();
			String actual_password=rs.getString("password");                                 
			
			if(password.equals(actual_password)) return "correct password";
			else return "incorrect password";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}

	public int countLogin(String sectionid)
	{
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= "select teacher from coordinator where section= "+sectionid;     
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			String teacherid=rs.getString("teacher");
			
			String query2= "select countlogin from teacher where id= "+teacherid;     
			rs=st.executeQuery(query2);
			rs.next();
			int countlogin=rs.getInt("countlogin");
			countlogin++;
			
			String query3="update teacher set countlogin="+countlogin+" where id =\""+teacherid+"\" ";
			PreparedStatement pst=con.prepareStatement(query3);
			pst.executeUpdate();
			return countlogin;
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return -1;
		}
	}
}










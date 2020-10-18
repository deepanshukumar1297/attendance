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
	 * @param coordinator
	 * @return status of insertion of coordinator and pass it to adminCoordinator.jsp
	 */
	public String insert(Coordinator coordinator) 
	{
		getCon();
		String query= "insert into coordinator values(?,?)";		//teacher_id, section_id
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, coordinator.getCoordinator_teacherId());
			pst.setString(2, coordinator.getCoordinator_sectionId());
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
	
	/**
	 * 
	 * @return return list of coordinator as arrayList
	 */
	public ArrayList<Coordinator> fetch() 
	{
		ArrayList<Coordinator> coordinatorslist= new ArrayList<Coordinator>();
		getCon();
		String query= "select section_id , teacher_id from coordinator";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Coordinator coordinator = new Coordinator();
				String coordinator_sectionId = rs.getString("section_id");           //foreign key
				String coordinator_teacherId=rs.getString("teacher_id");			//foreign key		
				coordinator.setCoordinator_sectionId(coordinator_sectionId);
				coordinator.setCoordinator_teacherId(coordinator_teacherId);
				coordinatorslist.add(coordinator);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return coordinatorslist;
	}
	
	/**
	 * checking the password entered by coordinator is right or wrong 
	 * 
	 * @param coordiantor_teacherPassword
	 * @param coordiantor_sectionId
	 * @return status of password entered by coordinator is right or wrong
	 */
	public String passValidation(String coordiantor_teacherPassword , String coordiantor_sectionId)							
	{
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= String.format("select teacher_id from coordinator where section_id=('%s') ",coordiantor_sectionId ); 
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			String teacher_id=rs.getString("teacher_id");
			
			String query2= String.format("select teacher_password from teacher where teacher_id=('%s') ",teacher_id );     //here section is the foreign key stored as section id in teacher table
			rs=st.executeQuery(query2);
			rs.next();
			String actual_password=rs.getString("teacher_password");                                 
			
			if(coordiantor_teacherPassword.equals(actual_password)) return "correct password";
			else return "incorrect password";
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}
	}
	
	/**
	 * if countlogin = 1 -> coordinator is first time user and he should change password
	 * 
	 * @param coordiantor_sectionId
	 * @return -1 or number of times coordinator has logged in
	 */
	public int countLogin(String coordiantor_sectionId)
	{
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= String.format("select teacher_id from coordinator where section_id=('%s') ",coordiantor_sectionId );
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			String teacher_id=rs.getString("teacher_id");
			
			String query2= String.format("select countlogin from teacher where teacher_id=('%s') ",teacher_id );  
			rs=st.executeQuery(query2);
			rs.next();
			int countlogin=rs.getInt("countlogin");
			countlogin++;
			
			String query3=String.format("update teacher set countlogin=(%d) where teacher_id=('%s')", countlogin,teacher_id);
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
	
	/**
	 * updating the password of coordinator if coordinator is first time user
	 * 
	 * @param password
	 * @param section_id
	 * @return status of password changed
	 */
	public String updatePassword(String new_password, String coordiantor_sectionId)
	{
		getCon();
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs=null;
			
			String query1= String.format("select teacher_id from coordinator where section_id=('%s')",coordiantor_sectionId); 	
			rs= st.executeQuery(query1);
			rs.next();
			String teacher_id=rs.getString("teacher_id");
			
			String query2= String.format("update teacher set teacher_password=('%s')  where teacher_id=('%s')",new_password,teacher_id);  	
			st.executeUpdate(query2);
			
			return "password changed";
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}	
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
}










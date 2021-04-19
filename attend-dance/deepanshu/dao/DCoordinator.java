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
	 * 
	 * @param coordiantor_sectionId
	 * @return teacher_id of the coordinator
	 */
	public String getId(String coordinator_sectionId )
	{
		String teacher_id="";
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= String.format("select teacher_id from coordinator where section_id=('%s') ",coordinator_sectionId );
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			teacher_id=rs.getString("teacher_id");
 
		}
	
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return teacher_id;
	}
	
	
	/**
	 * 
	 * @param coordinator
	 * @return
	 */
	 
	public String delete(Coordinator coordinator) {
		getCon();
		String query= "delete from coordinator where section_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, coordinator.getCoordinator_sectionId());
					
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

	public String update(Coordinator coordinator)
	{
		getCon();
		String query= "update coordinator set teacher_id=? where section_id=?"; 
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, coordinator.getCoordinator_teacherId());
			pst.setString(2, coordinator.getCoordinator_sectionId());
						
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
}










package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;

import pojo.Section;

public class DSection
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
	
	public String insert(Section section) 
	{
		getCon();
		String query= "insert into section values(?,?)";	//name id
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, section.getName());
			pst.setString(2, section.getId());
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
	
	
	
	public ArrayList<Section> fetch() 
	{
		ArrayList<Section> sectionslist= new ArrayList<Section>();
		getCon();
		String query= "select id,name from section";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Section section = new Section();
				String id = rs.getString("id");			//foreign key for student as section
				String name=rs.getString("name");
				section.setId(id);                      
				section.setName(name);
				sectionslist.add(section);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return sectionslist;
	}
}

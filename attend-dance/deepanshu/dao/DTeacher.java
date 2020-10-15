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
	
	/**
	 * 
	 * @param teacher
	 * @return
	 */
	public String insert(Teacher teacher)
	{
		getCon();
		String query= "insert into teacher values(?,?,?)";     //name, id, password
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);
			pst.setString(1, teacher.getName());
			pst.setString(2, teacher.getId());			//foreign key for coordinator
			pst.setString(3, teacher.getPassword());
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
	 * @return list of teachers as Arraylist
	 */
	public ArrayList<Teacher> fetch() 
	{
		ArrayList<Teacher> teacherslist= new ArrayList<Teacher>();
		getCon();
		String query= "select id,name from teacher";
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				Teacher teacher = new Teacher();
				String id = rs.getString("id");
				String name=rs.getString("name");
				teacher.setId(id);
				teacher.setName(name);
				teacherslist.add(teacher);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return teacherslist;
	}

	
	
	public String updatePassword(String password,String section_id)
	{
		getCon();
		String query= "update teacher set password= \""+password+"\" where id=\""+section_id+"\"";     
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			PreparedStatement pst= con.prepareStatement(query);		
			pst.executeUpdate();
			return "password changed";
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			return "exception occcured";
		}	
	}

	public int countLogin(String teacherid)
	{
		getCon();		
		try
		{
			Connection con=DriverManager.getConnection(url, uname, pass);
			Statement st= con.createStatement();
			
			String query1= "select countlogin from teacher where id= "+teacherid;     
			ResultSet rs=st.executeQuery(query1);
			rs.next();
			int countlogin=rs.getInt("countlogin");
			countlogin++;
			
			String query2="update teacher set countlogin="+countlogin+" where id =\""+teacherid+"\" ";
			PreparedStatement pst=con.prepareStatement(query2);
			pst.executeUpdate();
			return countlogin;
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
			return -1;
		}
	}

	public String passValidation(String password, String id) {
		// TODO Auto-generated method stub
		return null;
	}
}



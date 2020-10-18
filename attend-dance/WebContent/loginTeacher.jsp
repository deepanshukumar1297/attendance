<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Teacher" %>
<%@page import="dao.DTeacher"%>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title> Transparent Login Form Design </title>  
</head>
    <body>
    			<%
					DTeacher dteacher = new DTeacher();
					ArrayList<Teacher> teacherslist= dteacher.fetch();
				%>
				
        <h1>TEACHER LOGIN</h1>
            <form action="LoginTeacher" method="post">
	            <div>
	            	TEACHER ID
	            	<select name="teacher_id">
		            	<% 
							for(Teacher t:teacherslist)
							{
						%>
	            		<option><%=t.getTeacher_id() %></option>
	            		<%
							}
						%>
	            	</select>
	            </div>
	            <br><br>
	            <div>
	            	Password
           			<input type="password" name="teacher_password" placeholder="Enter Password">
	            </div>
	            <br>
	            <input type="submit" value="Login">    
            </form>
        <br><br><br>
        
        
        	TEACHERS LIST
		<table border="solid">
			<tr>
				<th>teachers</th>
				<th>id</th>
			</tr>
				<% 
					for(Teacher s:teacherslist)
					{
				%>
			<tr>
				<td><%= s.getTeacher_name() %></td>
				<td><%= s.getTeacher_id() %></td>
			</tr>
				<%
					}
				%>
		</table>
    
    </body>
</html>
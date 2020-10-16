<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Section" %>
<%@page import="dao.DSection"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title> Transparent Login Form Design </title>  
</head>
    <body>
    			<%
					Section section = new Section();
					DSection dsection = new DSection();
					ArrayList<Section> sectionslist= dsection.fetch();
				%>
        <h1>COORDINATOR LOGIN</h1>
            <form action="LoginCoordinator" method="post">
	            <div>
	            	choose section
	            	<select name="coordiantor_sectionId">
		            	<% 
							for(Section s:sectionslist)
							{
						%>
	            		<option><%=s.getSection_id() %></option>
	            		<%
							}
						%>
	            	</select>
	            </div>
	            <br><br>
	            <div>
	            	Password
           			<input type="password" name="coordiantor_teacherPassword" placeholder="Enter Password">
	            </div>
	            <br>
	            <input type="submit" value="Login">    
            </form>
        <br><br><br>
        
        
        	section list
		<table border="solid">
			<tr>
				<th>section name</th>
				<th> section id</th>
			</tr>
				<% 
					for(Section s:sectionslist)
					{
				%>
			<tr>
				<td><%= s.getSection_name() %></td>
				<td><%= s.getSection_id() %></td>
			</tr>
				<%
					}
				%>
		</table>
    
    </body>
</html>
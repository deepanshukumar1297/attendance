<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>

<%@ page import="pojo.Coordinator" %>
<%@page import="dao.DCoordinator"%>

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
					DSection dsection = new DSection();
					ArrayList<Section> sectionslist= dsection.fetch();
					
					DCoordinator dcoordiantor = new DCoordinator();
					ArrayList<Coordinator> coordinatorslist= dcoordiantor.fetch();
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
		<table style="border: solid; border-color: red;">
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
    
    <br><br>
		coordinator list
		<table style="border: solid; border-color: red;">
			<tr>
				<th>teacher id</th>
				<th>section id</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Coordinator c:coordinatorslist)
					{
				%>
			<tr>
				<td><%= c.getCoordinator_teacherId() %></td>
				<td><%= c.getCoordinator_sectionId() %></td>
				<td><button>update</button></td>
				<td><button>delete</button></td>
			</tr>
				<%
					}
				%>
		</table>
		<br>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Section" %>
<%@page import="dao.DSection"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminSection</title>
</head>
<body>
				<%
					DSection dteacher = new DSection();
					ArrayList<Section> sectionslist= dteacher.fetch();
				%>
	<h2>welcome admin u can now update insert and delete teachers</h2>
	<form action="AdminSection">
		<h3>add section</h3>
		<div>
		section name
			<input type="text" name="section_name" required>
		</div>
		<div>
		section id
			<input type="text" name="section_id" required>
		</div>
		<div>
			<input type = "submit" value="ADD section">
		</div>
		<br>
	</form>
	<br>

	<!-- list of sections -->
	
	section list
		<table style="border: solid; border-color: red;">
			<tr>
				<th>section</th>
				<th>id</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Section s:sectionslist)
					{
				%>
			<tr>
				<td><%= s.getSection_name() %></td>
				<td><%= s.getSection_id() %></td>
				<td><button>update</button></td>
				<td><button>delete</button></td>
			</tr>
				<%
					}
				%>
		</table>
</body>
</html>
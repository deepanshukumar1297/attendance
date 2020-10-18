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
		<table border="solid">
			<tr>
				<th>teachers</th>
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
				<th><button>update</button></th>
				<th><button>delete</button></th>
			</tr>
				<%
					}
				%>
		</table>
</body>
</html>
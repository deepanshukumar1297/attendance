<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pojo.Section" %>
<%@page import="dao.DSection"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>student</title>
</head>
<body>
				<%
					DSection dteacher = new DSection();
					ArrayList<Section> sectionslist= dteacher.fetch();
				%>

	<p>CHOOSE YOUR SECTION :</p>
	
	<table style="border: solid; border-color: green;">
			<tr>
				<th>section</th>
				<th>id</th>
				<th>Details</th>
			</tr>
				<% 
					for(Section s:sectionslist)
					{
				%>
			<tr>
				<td><%= s.getSection_name() %></td>
				<td><%= s.getSection_id() %></td>
				<td><a href="studentSectionDetails.jsp?section_id=<%= s.getSection_id() %>"><button>view</button></a></td>
			</tr>
				<%
					}
				%>
		</table>
</body>
</html>
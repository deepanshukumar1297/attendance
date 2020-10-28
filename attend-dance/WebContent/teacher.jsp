<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.ArrayList" %>

<%@ page import="pojo.SubjectTeacherSection" %>
<%@ page import="pojo.Student"%>

<%@ page import="dao.DSubjectTeacherSection" %>
<%@ page import="dao.DTeacher" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
    	String teacher_id=(String)session.getAttribute("teacher_id");
	
		DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
		String teacher_name = dsubteachsec.teacherInfo(teacher_id);
		ArrayList<SubjectTeacherSection> subsec_list = dsubteachsec.fetchSubjectSection(teacher_id);  

	%>
	
	    <a href="chngPassTeacher.html"><button>change password</button></a>    
	
	    <pre>WELCOME  <%=teacher_name%>    ID = <%= teacher_id%></pre> <br>
		YOUR SUBJECTS AS A TEACHER(in following sections) ARE :-
		<br>
		<table border="solid">
				<tr>
					<th>subject id</th>
					<th>section id</th>
					<th>attendance</th>
				</tr>
					<% 
						for(SubjectTeacherSection sts:subsec_list)
						{
					%>
				<tr>
					<td><%= sts.getSubject_id() %></td>
					<td><%= sts.getSection_id() %></td>
					<td><a href="markAttendance.jsp?section_id=<%= sts.getSection_id()%>&subject_id=<%= sts.getSubject_id() %> "><button>mark</button></a> </td>
					<%
						}
					%>
				</tr>
			</table>
		<br><br>
</body>
</html>
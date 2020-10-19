<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "java.util.ArrayList" %>
<%@ page import="dao.DTeacher"%>
<%@ page import="dao.DSection"%>
<%@ page import="dao.DSubject"%>
<%@ page import="dao.DSubjectTeacherSection" %>

<%@ page import="pojo.Section" %>
<%@ page import="pojo.Teacher" %>
<%@ page import="pojo.Subject" %>
<%@ page import="pojo.Student" %>
<%@ page import="pojo.SubjectTeacherSection" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>coordinator</title>
</head>
<body>
		<% 
	        String coordiantor_sectionId=(String)session.getAttribute("coordiantor_sectionId");
			
			DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
			ArrayList<String> coordinatorinfo = dsubteachsec.coordinatorInfo(coordiantor_sectionId);     //teacher_id,teacher_name
			ArrayList<SubjectTeacherSection> subteach_list = dsubteachsec.fetchSubjectTeacher(coordiantor_sectionId);  
			ArrayList<Student> secstudentlist = dsubteachsec.fetchStudent(coordiantor_sectionId);     

			DTeacher dteacher = new DTeacher();
			ArrayList<Teacher> teacherslist= dteacher.fetch();
			
			DSection dsection = new DSection();
			ArrayList<Section> sectionslist= dsection.fetch();
			
			DSubject dsubject = new DSubject();
			ArrayList<Subject> subjectslist= dsubject.fetch();
        %>
        
    <pre>WELCOME  <%= coordinatorinfo.get(1) %>   ID=<%= coordinatorinfo.get(0) %> </pre> <br>
	YOU ARE COORDINATOR OF <%= coordiantor_sectionId %>
	<br><br>
	
	<form action="CAssignSubjectTeachers">
		Assign teacher for the subjects
		<div>
			teacher id
			<select name="teacher_id">
				<% 
					for(Teacher t:teacherslist)
					{
				%>
				<option><%= t.getTeacher_id() %></option>
				<%
					}
				%>
			</select>
			
		</div>
		
		<div>
			<input type="hidden" name="section_id" value="<%= coordiantor_sectionId %>">
		</div>
		<br>
		<div>
			subject id
			<select name="subject_id">
				<% 
					for(Subject s:subjectslist)
					{
				%>
				<option><%= s.getSubject_id() %></option>
				<%
					}
				%>
			</select>
			
		</div>
		<br>
		<div>
			<input type = "submit" value="ASSIGN" >
		</div>
	</form>
	<br><br><br>
	LIST OF TEACHERS AND THEIR SUBJECTS
	<br>
	<table border="solid">
			<tr>
				<th>subject id</th>
				<th>teacher id</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(SubjectTeacherSection sts:subteach_list)
					{
				%>
			<tr>
				<td><%= sts.getSubject_id() %></td>
				<td><%= sts.getTeacher_id() %></td>
				<th><button>update</button></th>
				<th><button>delete</button></th>
				<%
					}
				%>
			</tr>
		</table>
		<br><br>
		LIST OF STUDENTS IN YOUR CLASS
		<br>
		<table border="solid">
			<tr>
				<th>student id</th>
				<th>student name</th>
				<th>update</th>
				<th>delete</th>
			</tr>
				<% 
					for(Student s:secstudentlist)
					{
				%>
			<tr>
				<td><%= s.getStudent_id() %></td>
				<td><%= s.getStudent_name() %></td>
				<td><button>update</button></td>
				<td><button>delete</button></td>
				<%
					}
				%>
			</tr>
		</table>
</body>
</html>
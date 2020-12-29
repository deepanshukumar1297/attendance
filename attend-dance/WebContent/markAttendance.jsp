<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="pojo.SubjectTeacherSection"%>
<%@ page import="pojo.Student"%>
<%@ page import="dao.DSubjectTeacherSection"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.css"><title>mark attendance</title>
</head>
<body onload="getDate()">
	<%
		String teacher_id = (String) session.getAttribute("teacher_id");
		
		String section_id = request.getParameter("section_id");
		String subject_id = request.getParameter("subject_id");

		DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
		ArrayList<Student> secstudent_list = dsubteachsec.fetchStudent(section_id);  
	%>
	<form action="MarkAttendance" onsubmit="markAttendance()">

		<div>
			subject id--><input type="text" name="subject_id" value=<%=subject_id%> readonly>
		</div>
		<br>
		<div>
			section id--><input type="text" name="section_id" value=<%=section_id%> readonly>
		</div>
		<br>
		<div>
			teacher id--><input type="text" name="teacher_id" value=<%=teacher_id%> readonly>
		</div>
		<br>
		<div>
			Date--> <input type="date" name="date_of_attendance" id="date_of_attendance">
		</div>
		<div>
			<input type="hidden" name="number_of_students" id="number_of_students" >
		</div>
		<br>
		<br>

		<div>
			mark all as present <input type="checkbox" id="selectAll"
				onclick="markAll()">
		</div>
		<br>
		<hr />

		<table style="border: solid; border-color: brown;">
			<tr>
				<th>student name</th>
				<th>student id</th>
				<th>select present</th>
			</tr>
			<%
				for (Student s : secstudent_list) {
					int i = 1;
			%>
			<tr>
				<td><input type="text" value="<%=s.getStudent_name()%>" readonly></td>
				<td><input type="text" value="<%=s.getStudent_id()%>" name="student_id" readonly></td>
				<td><input type="checkbox" onclick="checkMarkAll()" name="attendance" ></td>
			</tr>
			<%
				}
			%>
		</table>
		<input type="submit" value="mark attendance">
	</form>
</body>
<script>
	
	function markAll() {
		var nodelist = document.getElementsByName("attendance"); // returns nodelist object
		var flag = document.getElementById("selectAll").checked;
		if (flag == true) {
			for (let index = 0; index < nodelist.length; index++) {
				nodelist[index].checked = true;
			}
		} else {
			for (let index = 0; index < nodelist.length; index++) {
				nodelist[index].checked = false;
			}
		}
	}
	function checkMarkAll() {
		var nodelist = document.getElementsByName("attendance");
		var count = 0;
		for (let index = 0; index < nodelist.length; index++) {
			var flag = nodelist[index].checked;
			if (flag == false)
				count++;
		}
		if (count == 0)
			document.getElementById("selectAll").checked = true;
		else
			document.getElementById("selectAll").checked = false;
	}
	
	function markAttendance() {
		var nodelist = document.getElementsByName("attendance");
		var number_of_students = nodelist.length;
		document.getElementById("number_of_students").value = number_of_students;

		for (let index = 0; index < nodelist.length; index++) {
			if (nodelist[index].checked == true)
				nodelist[index].value = "P";
			else {
				nodelist[index].checked = true;
				nodelist[index].value = "A";
			}
		}
	}
	
	function getDate(){
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = String(today.getFullYear());

		today = yyyy + '-' + mm + '-' + dd;
		document.getElementById("date_of_attendance").defaultValue= today;
	}
</script>
</html>
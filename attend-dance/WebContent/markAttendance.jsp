<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   
<%@ page import="pojo.SubjectTeacherSection"%>
<%@ page import="pojo.Student"%>
<%@ page import="dao.DSubjectTeacherSection"%>
<%@ page import="java.util.ArrayList"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">


<title>Mark Attendance</title>

</head>
<body class="row align-content-between" style="background-color: rgb(233, 235, 221); height:100vh; width: 100vw;" onload="getDate()">

   <%
      String teacher_id = (String) session.getAttribute("teacher_id");
      
      String section_id = request.getParameter("section_id");
      String subject_id = request.getParameter("subject_id");

      DSubjectTeacherSection dsubteachsec = new DSubjectTeacherSection();
      ArrayList<Student> secstudent_list = dsubteachsec.fetchStudent(section_id); 
         
      String teacher_name = dsubteachsec.teacherInfo(teacher_id);

   %>

   <!---------------    header     -------------->

   <div  class="container-fluid bg-info ">
      <div class="row align-content-around" style="height: 3rem;">
         <header class="col text-monospace lead font-weight-bold text-center text-light ">
            ATTENDANCE MANAGEMENT SYSTEM
         </header>
      </div>
   </div>

   <!---------------    navigation     -------------->

   <div class="container-fluid ">
      <div class="row">

         <div class="col-10 text-monospace ">
            <nav>
               <ol class="breadcrumb"
                  style="background-color: rgb(233, 235, 221);">
                  <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                  <li class="breadcrumb-item"><a href="loginTeacher.jsp">Teacher Login</a></li>
                  <li class="breadcrumb-item"><a href="teacher.jsp">Teacher</a></li>
                  <li class="breadcrumb-item active">Mark Attendance</li>
               </ol>
            </nav>
         </div>

         <div class="col-2">
            <a class="btn btn-primary" href="changePassword.jsp?teacher_id=<%= teacher_id %>" role="button">change password</a>
         </div>
      </div>
   </div>

    <!---------------    main     -------------->
   <form class="container-fluid mb-3"  action="MarkAttendance" onsubmit="markAttendance()" method="post">
      <div class="row text-center align-content-center " style="height: 2rem;">

         <div class="col-12">
            <h5 class="">
               <span class="border border-dark rounded bg-secondary text-light m-2"><%= teacher_name.toUpperCase() %>  (ID=<%= teacher_id.toUpperCase() %>)</span>
               <span class="border border-dark rounded bg-secondary text-light m-2">subject id= <%= subject_id.toUpperCase() %></span>
               <span class="border border-dark rounded bg-secondary text-light m-2">section id=<%= section_id.toUpperCase() %></span>
            </h5>
         </div>

      </div>

      <div class="row justify-content-center">
         <div class="col-7 border border-dark rounded bg-secondary overflow-auto" style="height: 70vh;">

            <div class="row bg-dark sticky-top">
               <div class="col text-monospace">
                  <header class="text-center text-light font-weight-bold my-3">
                     MARK ATTENDANCE
                  </header>
               </div>
            </div>
   
            <div class="form-group row form-inline justify-content-around">
               <div class="form-inline">
                  <label for="date_of_attendance" class="col-form-label text-light">Choose Date</label>
                  <input class="form-control" type="date" name="date_of_attendance" id="date_of_attendance">
               </div>
               <div class="form-check">
                  <input class="form-check-input " type="checkbox" id="selectAll" onclick="markAll()">
                  <label class="form-check-label text-light" for="selectAll">
                    Mark all as present
                  </label>
               </div>
               <div>
                  <input type="submit" value="mark attendance"
                  class="btn  btn-outline-light">
               </div>
            </div>

            <div class="row my-3">
               <div class="col table-responsive">
                  <table
                     class="table  table-sm table-dark table-bordered table-hover">
   
                     <thead>
                        <tr>
                           <th>student name</th>
                           <th>student id</th>
                           <th>tick for present</th>
                        </tr>
                     </thead>
   
                     <tbody>
                        <%
                        for (Student s : secstudent_list) {
                           int i = 1;
                        %>
                        <tr>
							<td><%=s.getStudent_name().toUpperCase() %></td>
							<td><input type="text" value="<%=s.getStudent_id()%>" name="student_id" readonly></td>
                           <td><input type="checkbox" onclick="checkMarkAll()" name="attendance"></td>
                        </tr>
                        <%
                           }
                        %>
                     </tbody>
   
                  </table>
               </div>
               <input type="hidden" id="number_of_students" name="number_of_students"  >
			   <input type="hidden" id="teacher_id" value="<%= teacher_id %>" name="teacher_id">
			   <input type="hidden" id="subject_id" value="<%= subject_id %>" name="subject_id">
			   <input type="hidden" id="section_id" value="<%= section_id %>" name="section_id">
            </div>

         </div>
      </div>

   </form>

   
    <!---------------    footer     -------------->
   <footer  class="container-fluid bg-info">
      <div class="row align-content-center justify-content-around text-monospace font-weight-bold text-dark" style="height: 3rem;">
          <div class="col-5">
              <a href="https://www.medicaps.ac.in"  class="text-reset">MEDICAPS-UNIVERSITY</a>
          </div>
          <div class="col-5">
              <span>
                  BY: 
              </span>
              <span>
                  <a href="https://www.instagram.com/darshika_sinvhal/" target="_blank" class="text-reset">Darshika</a> |
                  <a href="https://www.instagram.com/gurneetchabra/" target="_blank" class="text-reset">Gurneet</a> |
                  <a href="https://www.instagram.com/devramchandani/" target="_blank" class="text-reset">Dev</a> |
                  <a href="https://www.instagram.com/_deepanshu_15/" target="_blank" class="text-reset">Deepanshu</a> |
                  <a href="#" target="_blank" class="text-reset">Harhien</a>
              </span>
          </div>
      </div>
  </footer>

   
   
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
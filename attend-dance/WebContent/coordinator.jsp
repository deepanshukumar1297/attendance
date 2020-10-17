<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="dao.DCoordinator" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<% 
			String coordiantor_sectionId = (String)request.getAttribute("coordiantor_sectionId");
			
        %>
	YOU ARE COORDINATOR OF <%= coordiantor_sectionId %>
	WELCOME ___
</body>
</html>
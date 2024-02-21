
<%@page import="com.ecom.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "your are not logged-in !!! login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("admin")) {
		session.setAttribute("message", "your are a admin !!! do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<h1>Welcome User panel</h1>
	<%@include file="components/common_modal.jsp" %>
</body>
</html>
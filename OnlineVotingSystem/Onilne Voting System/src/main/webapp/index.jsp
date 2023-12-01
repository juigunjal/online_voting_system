<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Voting System</title>
<link rel = "stylesheet" type ="text/css" href = "css/style.css">
</head>
<%@ include file="navbar.jsp" %>
<body>
<div class = "form-constant form-container">
<form action="voterLogin" method="post">
	<h3>Enter Your Voter ID</h3>
	<label for = "voterNumber" class = "form-lable"><b>Voter ID</b></label>
	<br>
	<input id = "voterNumber" name = "voterNumber" style = "margin-bottom: 2%" class = "form-input" onfocus ="this.value=''" type ="text" value = "Enter Voter ID"/>
	<br>
	<%  String Error = (String)request.getAttribute("error");
			if(Error == null)Error = "";
		%>
	<span  style = "color:red;"><%= Error %></span>
	<% Error = ""; %>
	<br>
	<button type = "Submit" style = "margin-top: 2%" class = "form-constant-button form-index-button" >Login</button>
	<br>
	<div class="new" style = "margin-top: 5%">
	<a href="adminlogin.jsp" class ="constant-a index-a" >Admin User</a>
	</div>
</form>
</div>
</body>
</html>
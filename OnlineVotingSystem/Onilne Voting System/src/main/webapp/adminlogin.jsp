<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" type ="text/css" href = "css/style.css">
<title>Admin Login</title>
</head>
<%@ include file="navbar.jsp" %>
<body>
	<div class = "form-constant form-admin">
		<form class="form" action = "adminLogin" method="post">
		<label for= "name" class="form-elements" ><b>Name :</b></label>
		<input id="name"  name = "adminName" onfocus ="this.value=''" value="Enter Name" class="from-elements form-contact-input" type="text"/>
		<br>
		<label for= "Password" class="form-elements" ><b>Password :</b></label>
		<input id="Password" name ="password" style = "margin-bottom:2%;" class="from-elements form-contact-input" type="password"/>
		<br>
		<%  String Error = (String)request.getAttribute("error");
			if(Error == null)Error = "";
		%>
		<span  style = "color:red;"><%= Error %></span>
		<% Error = ""; %>
		<br>
		<button  class="form-constant-button form-contact-button" style="margin-top: 2%;" type="Submit">Login</button>
		<br>
		<%-- <div class="check-results" style="margin-top: 5%">
		<a href="">Check Results</a>
		</div> --%>
		</form>
	</div>

</body>
</html>
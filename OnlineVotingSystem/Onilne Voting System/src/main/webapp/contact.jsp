<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" type ="text/css" href = "css/style.css">
<title>Contact</title>
<%@ include file="navbar.jsp" %>
</head>
<body>
	<div class = "form-constant  form-contact">
		<form action="contact" method="post">
		<label for= "name" class="form-elements" ><b>Name :</b></label>
		<input id="name" name = "name" onfocus ="this.value=''" value="Enter Name" class="from-elements form-contact-input" type="text"/>
		<br>
		<label for= "number" class="form-elements" ><b>Contact Number :</b></label>
		<input id="number" name="number" onfocus ="this.value=''" value="0" class="from-elements form-contact-input" type="number"/>
		<br>
		<label for= "email" class="form-elements" ><b>Email :</b></label>
		<input id="email" name="email" onfocus ="this.value=''" value="Enter Email" class="from-elements form-contact-input" type="text"/>
		<br>
		<label for= "comment" class="form-elements" ><b>Comment :</b></label>
		<input id="comment" name="comment" onfocus ="this.value=''" value="Enter Comment" class="from-elements form-contact-input" type="text"/>
		<br>
		<%  String Error = (String)request.getAttribute("error");
			if(Error == null)Error = "";
		%>
		<span  style = "color:red;"><%= Error %></span>
		<% Error = ""; %>
		<button  class="form-constant-button form-contact-button" type="Submit">Submit</button>
		</form>
	</div>
</body>
</html>
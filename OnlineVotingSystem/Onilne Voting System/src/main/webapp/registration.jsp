<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register New</title>
<link rel = "stylesheet" type ="text/css" href = "css/style.css">
</head>
<!-- <%@ include file="navbar.jsp" %> -->
<body>
<nav class="nav-bar">
<a href="adminwelcome.jsp">Back</a>
</nav>
	<div class = "form-constant form-registration" style="width: 17%;padding-bottom: 380px;">
		<form action = "RegisterUser" method = "post">
		<label for= "name" class="form-elements" ><b>Name :</b></label>
		<br>
		<input id="name" name="name" onfocus ="this.value=''" value="Enter Name" class="from-elements form-registration-input" type="text"/>
		<br>
		<!-- <label for= "last-name" class="form-elements" ><b>Last Name :</b></label>
		<br>
		<input id="last-name" name="last-name" onfocus ="this.value=''" value="Enter Last Name" class="from-elements form-registration-input" type="text"/>
		<br> -->
		<label for= "number" class="form-elements" ><b>Voter Card Number :</b></label>
		<br>
		<input id="number" name="number" onfocus ="this.value=''" value="0" class="from-elements form-registration-input" type="number"/>
		<br>
		<label for= "address" class="form-elements" ><b>Address :</b></label>
		<br>
		<input id="address" name="address" onfocus ="this.value=''" value="Enter Address" class="from-elements form-registration-input" type="text"/>
		<br>
		<label for= "dob" class="form-elements" ><b>Date Of Birth :</b></label>
		<br>
		<input id="dob" name="dob" onfocus ="this.value=''" value="0" class="from-elements form-registration-input" type="date"/>
		<br>
		<label for= "voternumber" class="form-elements" ><b>Contact Number :</b></label>
		<br>
		<input id="voternumber" name="voternumber" onfocus ="this.value=''" value="0" class="from-elements form-registration-input" type="number"/>
		<br>
		<label for= "email" class="form-elements" ><b>Email :</b></label>
		<br>
		<input id="email" name="email" onfocus ="this.value=''" value="Enter Email"  style = "margin-bottom: 3%;"class="from-elements form-registration-input" type="email"/>
		<br>
		<%  String Error = (String)request.getAttribute("error");
			if(Error == null)Error = "";
		%>
		<span  style = "color:red;"><%= Error %></span>
		<% Error = ""; %>
		<br>
		<button  class="form-constant-button form-registration-button" style = "margin-left: 28%;" type="Submit">Submit</button>
		</form>
	</div>
</body>
</html>
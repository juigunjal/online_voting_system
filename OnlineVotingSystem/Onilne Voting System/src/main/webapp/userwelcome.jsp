<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" type ="text/css" href = "css/style.css">
<title>USER WELCOME !!</title>
</head>
<body>
<div style = "padding-bottom: 65px;width: 22%;margin-top: 10%;"class = "form-constant form-admin">
		<form action = "vote" method = "post">
		<label for= "voterid" class="form-elements" style="margin-left: 2%"><b>Voter Id</b></label>
		<input id="voterid" name = "voterid"  style ="margin-top: 1%;" value="<%= request.getAttribute("voterid") %>" 
		readonly class="from-elements form-contact-input" type="text"/>
		<br>
		<label class="form-elements" for="partie">Choose a Party:</label>
		  <select class="form-elements" name="partie" id="partie">
		    <option value="aap">Aam Aadmi Party</option>
		    <option value="bjp">Bharatiya Janata Party</option>
		    <option value="ncp">National Congress Party</option>
		    <option value="bsp">Bahujan Samaj Party</option>
		    <option value="cpi">Communist Party of India</option>
		 </select>
		<br>
		<button  style = "margin-top: 6%;margin-left: 28%"class="form-constant-button form-contact-button" type="Submit">Submit</button>
		</form>
	</div>
</body>
</html>

<!-- onfocus ="this.value=''" -->
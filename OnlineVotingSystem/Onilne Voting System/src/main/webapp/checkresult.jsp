<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" type ="text/css" href = "css/style.css">
<title>Results</title>
<%
	Map<String, String> map = new HashMap<>();
	Map<String, String> parties = new HashMap<>();
	parties.put("aap","Aam Aadmi Party");
	parties.put("bjp","Bharatiya Janata Party");
	parties.put("ncp","National Congress Party");
	parties.put("bsp","Bahujan Samaj Party");
	parties.put("cpi","Communist Party of India");
	String arr[] = new String[3]; 
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineVotingDB", "root", "");
    PreparedStatement preparedStatement = con.prepareStatement("select partie,count(partie) as c from vote group by partie order by c desc");
    ResultSet rs = preparedStatement.executeQuery();
    
    int i = 0;
    while(rs.next()){
    	if(i<3){
    		arr[i] = parties.get(rs.getString("partie"));
    		i++;
    	}
    	String partie = rs.getString("partie");
    	String count = rs.getString("c");
    	map.put(partie, count);
    }

    
} catch (Exception e) {
    e.getMessage();
}

%>
</head>
<!-- <%@ include file="adminnavbar.jsp" %> -->
<body>
<nav class="nav-bar">
<a href="adminwelcome.jsp">Back</a>
</nav>
<div class="result-table">
<div  class="winner">
<div class="winner-title"> WINNERS </div>
<table style="color:white;">
	<tr>
		<th>Sr. No</th>
		<th>Parties</th>
	</tr>
	<tr>
		<th>1</th>
		<th><%= arr[0] %></th>
	</tr>
	<tr>
		<th>2</th>
		<th><%= arr[1] %></th>
	</tr>
	<tr>
		<th>3</th>
		<th><%= arr[2] %></th>
	</tr>
	
</table>
</div>
	<table>
	  <tr>
	    <th>PARTIES</th>
	    <th>NAMES</th>
	    <th>VOTES</th>
	  </tr>
	  <tr>
	    <td><img class ="party-image" src="https://static.toiimg.com/thumb/msid-63571130,imgsize-33701,width-400,resizemode-4/63571130.jpg" alt="AAP"></td>
	    <td>Aam Aadmi Party</td>
	    <td><%= map.getOrDefault("aap","0") %></td>
	  </tr>
	  <tr>
	    <td><img class ="party-image" src="https://1.bp.blogspot.com/-ZAtg1X0c8Ko/TjKObOR0Y_I/AAAAAAAAAKU/0K2HFSkxSec/s1600/BJP_emblom.jpg" alt ="BJP"></td>
	    <td> Bharatiya Janata Party</td>
	    <td><%= map.getOrDefault("bjp","0") %></td>
  	  </tr>
  	   <tr>
	    <td><img class ="party-image" src="https://pixlok.com/wp-content/uploads/2021/04/Congress-Party-Icon.jpg" alt="NCP"></td>
	    <td>National Congress Party</td>
	    <td><%= map.getOrDefault("ncp","0") %></td>
	  </tr>
	  <tr>
	    <td><img class ="party-image" src="https://pixlok.com/wp-content/uploads/2021/04/BSP-Logo-PNG.jpg" alt ="BSP"></td>
	    <td> Bahujan Samaj Party</td>
	    <td><%= map.getOrDefault("bsp","0") %></td>
  	  </tr>
  	  <tr>
	    <td><img class ="party-image" src="https://www.kindpng.com/picc/m/128-1286831_cpi-logo-communist-party-of-india-hd-png.png" alt ="CPM"></td>
	    <td>Communist Party of India</td>
	    <td><%= map.getOrDefault("cpi","0") %></td>
  	  </tr>
	</table>
</div>
</body>
</html>
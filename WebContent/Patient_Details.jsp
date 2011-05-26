<%@page import="Database_Functions.DBFunctions"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patients Home</title>
<style type="text/css">

body {
	background-image: url(/DentAssist/backgrounds/background.jpeg);
	color: white;
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
}
.table_header {
	background-color:#736AFF;
	color: white;
	font-family: Georgia, serif;;
	font: bold;
	font-size: large;
}

.other_row{
	background-color: #4C7D7E;
	color: white;
	font-family: Arial, Helvetica, sans-serif;
	font-size:medium;
}

.table_prop{
	border-color: white;
	border-style: solid;
	border-collapse: collapse;
}

.link_font{
	color: lime;
	font-family: Arial, Helvetica, sans-serif;
}


</style>
</head>
<body>
<p>Patients Details</p>

<table border="1" class="table_prop">
<tr class="table_header">
	<td>Patient ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Gender</td>
	<td>Date Of Birth</td>
	<td>Home Phone</td>
	<td>Mobile Number</td>
	<td>Email</td>
</tr>
<% 
   Statement stmt = null;	
   stmt = DBFunctions.createConnection().createStatement();
   ResultSet rs = stmt.executeQuery("select patient_id, First_Name, Last_name, gender, date_of_birth, home_phone, mobile, email from MINE.PATIENTS_DETAILS");
   while(rs.next()){
%>
<tr class = "other_row">
<td><a class = 'link_font' href ='Patients.find?pid=<%= rs.getString(1) %>' ><%= rs.getString(1) %></a></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><%= rs.getString(7) %></td>
<td><%= rs.getString(8) %></td>

<% } %>

<% rs.close();
stmt.close();
DBFunctions.createConnection().close();

%>

</table>
<p></p>
<p></p>
<a href = "AddPatients.jsp" class="link_font" >Add New Patient</a>
</body>
</html>
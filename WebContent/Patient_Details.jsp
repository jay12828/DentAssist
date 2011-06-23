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
body{
font-size: x-large;
color: blue;
}
.table_header{
background-color: silver;
font-size: 18px;
color: black;
font-weight: bold;
}

.other_row{
	background-color:#EEDC82;
	font-size: 15px;
	color: black;
	
}

#psdg-header {
	margin:0;
	padding: 14px 0 0 24px;
	width: 1086px;
	height: 55px;
	color:#FFF;
	font-size:13px;
	background: #0c2c65 url(/DentAssist/backgrounds/head-bcg.jpg) no-repeat right top;	
}

.psdg-bold {
	font: bold 22px Arial, Helvetica, sans-serif;
	
}

</style>


</head>
<body>
  <table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="170" /></td>
    </tr>
  </table>
<p></p>

<div id="psdg-header">
<span class="psdg-bold">Patient Record</span><br />
List of all the patients
</div>

<table border="0" class="table_prop" cellspacing="0" cellpadding="18">
<tr class="table_header" >
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
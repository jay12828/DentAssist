<%@page import="Database_Functions.DBFunctions"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Other Appointments</title>
<style>
#psdg-header {
	margin:0;
	padding: 14px 0 0 24px;
	width: 500px;
	height: 55px;
	color:#FFF;
	font-size:13px;
	background: #0c2c65 url(/DentAssist/backgrounds/head-bcg.jpg) no-repeat right top;	
	
}
.psdg-bold {
	font: bold 22px Arial, Helvetica, sans-serif;
	
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
</style>
</head>
<body><center>
<% String app_date = request.getParameter("ad"); %>

<div id="psdg-header">
<span class="psdg-bold">Patients who have appointment on This date</span>
</div>
<table border="0" cellspacing="0" cellpadding="18">
<tr class="table_header" >
	<td>Name</td>
	<td>Appointment Date</td>
	<td>Appointment Time</td>
</tr>
<% 
   Statement stmt = null;	
   stmt = DBFunctions.createConnection().createStatement();
   ResultSet rs = stmt.executeQuery("select FIRST_NAME, LAST_NAME, APPOINTMENT_DATE, APPOINTMENT_TIME from MINE.APPOINTMENTS, MINE.PATIENTS_DETAILS where MINE.APPOINTMENTS.PATIENT_ID=MINE.PATIENTS_DETAILS.PATIENT_ID and APPOINTMENT_DATE='"+app_date+"'");
   while(rs.next()){
%>
<tr class = "other_row">
<td><%= rs.getString(1) %> <%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>

<% } %>

<% rs.close();
stmt.close();
DBFunctions.createConnection().close();

%>

</table>
</center>
</body>
</html>
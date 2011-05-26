<%@page import="Servlets.Patients.Patients"%>
<%@ page import="java.sql.*" %>
<%@page import="Database_Functions.DBFunctions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details</title>
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
	font-size: medium;
}


</style>
</head>
<body>
<% String patient_ID =  request.getParameter("q"); %>

<% 
   Statement stmt = null;	
   stmt = DBFunctions.createConnection().createStatement();
   ResultSet rs = stmt.executeQuery("select patient_id, First_Name, Last_name, gender, marital_status, date_of_birth, street_name, house_no, state, city, pin, home_phone, mobile, email from MINE.PATIENTS_DETAILS where patient_id='"+patient_ID+"'");
   while (rs.next()){	
%>
<form id="form1" name="form1" method="post" action="">
  <table width="80%" border="0" cellspacing="3" cellpadding="3">
    <tr>
    <td><%= rs.getString(2) %> <%= rs.getString(3) %></td>
    <td></td>
    <td></td>
    <td></td> 
    <td></td>
    
    </tr>
	<tr height="60"></tr>
  
    <tr>
      <td class="link_font">Personal Details</td>
    </tr>
    <tr>
      <td>First Name</td>
      <td><label for="street_name"></label>
      <input type="text" name="fname" id="fname" value="<%= rs.getString(2) %>" /></td>
      <td>Last Name</td>
      <td><label for="house_number"></label>
      <input type="text" name="lname" id="lname" value="<%= rs.getString(3) %>" /></td>
      <td>Gender</td>
      <td><label for="state"></label>
      <input type="text" name="gender" id="gender" value="<%= rs.getString(4) %>" /></td>
    </tr>
    <tr>
      <td>Marital Status</td>
      <td><label for="city"></label>
      <input type="text" name="m_status" id="m_status" value="<%= rs.getString(5) %>"/></td>
      <td>Date Of Birth</td>
      <td><label for="pin"></label>
      <input type="text" name="date_of_birth" id="date_of_birth" value="<%= rs.getString(6) %>" /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="80%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td class="link_font">Address</td>
    </tr>
    <tr>
      <td>Street Name</td>
      <td><label for="street_name"></label>
      <input type="text" name="street_name" id="street_name" value="<%= rs.getString(7) %>"/></td>
      <td>House Number</td>
      <td><label for="house_number"></label>
      <input type="text" name="house_number" id="house_number" value="<%= rs.getString(8) %>" /></td>
      <td>State</td>
      <td><label for="state"></label>
      <input type="text" name="state" id="state" value="<%= rs.getString(9) %>" /></td>
    </tr>
    <tr>
      <td>City</td>
      <td><label for="city"></label>
      <input type="text" name="city" id="city" value="<%= rs.getString(10) %>"/></td>
      <td>Pin</td>
      <td><label for="pin"></label>
      <input type="text" name="pin" id="pin" value="<%= rs.getString(11) %>" /></td>
 
    </tr>
  </table>
  
  <p>&nbsp;</p>
  <table width="80%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td class="link_font">Phone And Email</td>
    </tr>
    <tr>
      <td>Home Phone</td>
      <td><label for="street_name"></label>
      <input type="text" name="street_name" id="street_name" value="<%= rs.getString(12) %>" /></td>
      <td>Mobile</td>
      <td><label for="house_number"></label>
      <input type="text" name="house_number" id="house_number" value="<%= rs.getString(13) %>" /></td>
      <td>Email</td>
      <td><label for="state"></label>
      <input type="text" name="state" id="state" value="<%= rs.getString(14) %>" /></td>
    </tr>
    <tr height="60">
    <td>
     <input type="submit" name="update_patient" id="update_patient" value="Update Record" />
    </td>
    </tr>
  </table>
   
</form>
<form method="post" action="DeletePatient.do?pid=<%= patient_ID%>">
<input type="submit" name="delete_patient" id="delete_patient" value="Delete Patient" />
<a href ="Add_Appointment.jsp?pid=<%= patient_ID %>" class="link_font">Add Appointments</a>
</form>

<% } %>
<% rs.close();
stmt.close();
DBFunctions.createConnection().close();

%>

</body>
</html>
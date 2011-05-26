<%@page import="Servlets.Patients.Patients"%>
<%@ page import="java.sql.*" %>
<%@page import="Database_Functions.DBFunctions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Patient</title>
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

<form id="addPatient" name="form_addPatient" method="post" action="AddPatient.do" >
  <table width="80%" border="0" cellspacing="3" cellpadding="3">
    <tr>
    <td>Add New Patient</td>
    <td></td>
    <td></td>
    <td></td> 
    <td></td>    
    </tr>
    
    <tr>
      <td class="link_font">Personal Details</td>
    </tr>
    <tr>
      <td>First Name</td>
      <td><label for="street_name"></label>
      <input type="text" name="fname" id="fname" /></td>
      <td>Last Name</td>
      <td><label for="house_number"></label>
      <input type="text" name="lname" id="lname" /></td>
      <td>Gender</td>
      <td><label for="state"></label>
      <input type="text" name="gender" id="gender" /></td>
    </tr>
    <tr>
      <td>Marital Status</td>
      <td><label for="city"></label>
      <input type="text" name="m_status" id="m_status" /></td>
      <td>Date Of Birth</td>
      <td><label for="pin"></label>
      <input type="text" name="date_of_birth" id="date_of_birth" /></td>
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
      <input type="text" name="street_name" id="street_name" /></td>
      <td>House Number</td>
      <td><label for="house_number"></label>
      <input type="text" name="house_number" id="house_number" /></td>
      <td>State</td>
      <td><label for="state"></label>
      <input type="text" name="state" id="state" /></td>
    </tr>
    <tr>
      <td>City</td>
      <td><label for="city"></label>
      <input type="text" name="city" id="city" /></td>
      <td>Pin</td>
      <td><label for="pin"></label>
      <input type="text" name="pin" id="pin" /></td>
 
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
      <input type="text" name="home_phone" id="home_phone"/></td>
      <td>Mobile</td>
      <td><label for="house_number"></label>
      <input type="text" name="mobile" id="mobile" /></td>
      <td>Email</td>
      <td><label for="state"></label>
      <input type="text" name="email" id="email" /></td>

    </tr>
    
  </table>
   <p>
     <input type="submit" name="add_patient" id="add_patient" value="Add Patient" />
   </p>
</form>
</body>
</html>
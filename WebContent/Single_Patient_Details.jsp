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
.Patient_Name{
	font-size: x-large;
	font-weight: bold;
}
#psdg-header {
	margin:0;
	padding: 14px 0 0 24px;
	width: 1090px;
	height: 55px;
	color:#FFF;
	font-size:13px;
	background: #0c2c65 url(/DentAssist/backgrounds/head-bcg.jpg) no-repeat right top;	
}

.psdg-bold {
	font: bold 22px Arial, Helvetica, sans-serif;
	
}
#Header_font{
	font: bold 15px Arial, Helvetica, sans-serif;
	color: #0099CC;
}
.col_prop{
	background-color: #E6FFCC;
}
.col_prop2{
	background-color: #CADCFF;
}
.col_prop3{
	background-color: #F0E68C;
}
.link_font{
	padding-left: 50px;
	text-decoration: none;
	font-size: large;
	color: #0066FF;
}

#delete_patient{
	background-image: url(/DentAssist/backgrounds/delete.png);
	height: 130px;
	width: 130px;
}

</style>
</head>
<body>
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="170" /></td>
    </tr>
  </table>
<p></p>
<% String patient_ID =  request.getParameter("q"); %>

<% 
   Statement stmt = null;	
   stmt = DBFunctions.createConnection().createStatement();
   ResultSet rs = stmt.executeQuery("select patient_id, First_Name, Last_name, gender, marital_status, date_of_birth, street_name, house_no, state, city, pin, home_phone, mobile, email from MINE.PATIENTS_DETAILS where patient_id='"+patient_ID+"'");
   while (rs.next()){	
%>
<form id="form1" name="form1" method="post" action="">
<div id="psdg-header">
<span class="psdg-bold"><%= rs.getString(2) %> <%= rs.getString(3) %></span><br />
<%= rs.getString(4) %>, <%= rs.getString(10) %>
</div>
<p></p>
  <table width="1370px" border="0" cellspacing="0" cellpadding="3">
  <tr></tr>
    <tr>
      <td id="Header_font" class="col_prop">Personal Details</td>
      <td id="Header_font" class="col_prop"></td>
      <td id="Header_font" class="col_prop2">Address</td>
      <td id="Header_font" class="col_prop2"></td>
      <td id="Header_font" class="col_prop3">Phone And Email</td>
      <td id="Header_font" class="col_prop3"></td>
      <td><a href ="Add_Appointment.jsp?pid=<%= patient_ID %>" class="link_font">Add Appointments</a></td>
    </tr>
    <tr>
      <td class="col_prop">First Name</td>
      <td class="col_prop"><input type="text" name="fname" id="fname" value="<%= rs.getString(2) %>" /></td>
      <td class="col_prop2">Street Name</td>
      <td class="col_prop2"><label for="street_name"></label>
      <input type="text" name="street_name" id="street_name" value="<%= rs.getString(7) %>"/></td>
      <td class="col_prop3">Home Phone</td>
      <td class="col_prop3"><label for="street_name"></label>
      <input type="text" name="street_name" id="street_name" value="<%= rs.getString(12) %>" /></td>
      <td><a href ="Add_Appointment.jsp?pid=<%= patient_ID %>" class="link_font">Add Prescription</a></td>
      </tr>
      
      <tr><td class="col_prop">Last Name</td>
      <td class="col_prop"><label for="house_number"></label>
      <input type="text" name="lname" id="lname" value="<%= rs.getString(3) %>" /></td>
      <td class="col_prop2">House Number</td>
      <td class="col_prop2"><label for="house_number"></label>
      <input type="text" name="house_number" id="house_number" value="<%= rs.getString(8) %>" /></td>
      <td class="col_prop3">Mobile</td>
      <td class="col_prop3"><label for="house_number"></label>
      <input type="text" name="house_number" id="house_number" value="<%= rs.getString(13) %>" /></td>
      <td><a href ="Add_Appointment.jsp?pid=<%= patient_ID %>" class="link_font">Add Treatment</a></td></tr>
      <tr><td class="col_prop">Gender</td>
      <td class="col_prop"><label for="state"></label>
      <input type="text" name="gender" id="gender" value="<%= rs.getString(4) %>" /></td>
      <td class="col_prop2">State</td>
      <td class="col_prop2"><label for="state"></label>
      <input type="text" name="state" id="state" value="<%= rs.getString(9) %>" /></td>
      <td class="col_prop3">Email</td>
      <td class="col_prop3"><label for="state"></label>
      <input type="text" name="state" id="state" value="<%= rs.getString(14) %>" /></td>
      <td><a href ="Add_Appointment.jsp?pid=<%= patient_ID %>" class="link_font">Payment History</a></td>
      </tr>
    
    <tr>
      <td class="col_prop">Marital Status</td>
      <td class="col_prop"><label for="city"></label>
      <input type="text" name="m_status" id="m_status" value="<%= rs.getString(5) %>"/></td>
      <td class="col_prop2">City</td>
      <td class="col_prop2"><label for="city"></label>
      <input type="text" name="city" id="city" value="<%= rs.getString(10) %>"/></td>
      <td class="col_prop3"></td>
      <td class="col_prop3"></td></tr>
      <tr><td class="col_prop">Date Of Birth</td>
      <td class="col_prop"><label for="pin"></label>
      <input type="text" name="date_of_birth" id="date_of_birth" value="<%= rs.getString(6) %>" /></td>
      <td class="col_prop2">Pin</td>
      <td class="col_prop2"><label for="pin"></label>
      <input type="text" name="pin" id="pin" value="<%= rs.getString(11) %>" /></td>
      <td class="col_prop3"></td>
      <td class="col_prop3"></td>
    </tr>
  </table>
  <table>
  <tr>
  <td><p></p><input type="submit" name="update_patient" id="update_patient" value="Update Record" /> </td></tr>
  </table>
  <p>&nbsp;</p>
  
  <p>&nbsp;</p>
  
</form>
<table>
<tr>

</tr>
</table>
<form method="post" action="DeletePatient.do?pid=<%= patient_ID%>">
<input type="submit" name="delete_patient" id="delete_patient" value="" />
</form>


<% } %>
<% rs.close();
stmt.close();
DBFunctions.createConnection().close();

%>

</body>
</html>
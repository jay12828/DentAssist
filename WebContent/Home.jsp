<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.xml.ws.RequestWrapper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.header_link{


}
.link_text{
font-size: x-large;
color: blue;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body><% String ad  = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); %>
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="170" /></td>
    </tr>
  </table>
<table width="70%" border="0" cellspacing="3" cellpadding="12" align="center">
  <tr>
    <td align="justify"  class="header_link" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<a href="Patient_Details.jsp" class="link_text">Patients</a></td>
    <td align="justify"  class="header_link" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<a href="Appointments_Home.jsp?ad=<%= ad %>" class="link_text">Appointment Book</a></td>
    <td align="justify"  class="header_link" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="link_text">Finance</a></td>
    <td align="justify"  class="header_link" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<a href="add_procedure.jsp" class="link_text">Add Procedures</a></td>
    <td align="justify"  class="header_link" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="link_text">Logout</a></td>
  </tr>
</table>
<p>&nbsp;</p>

</body>
</html>
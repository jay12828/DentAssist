<%@page import="Database_Functions.DBFunctions"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Treatment Plans</title>
<style>
#psdg-header {
	margin:0;
	padding: 10px 0 0 10px;
	width: 219px;
	height: 45px;
	color:#FFF;
	font-size:13px;
	background: #0c2c65 url(/DentAssist/backgrounds/head-bcg.jpg) no-repeat right top;	
}

.psdg-bold {
	font: bold 22px Arial, Helvetica, sans-serif;
	
}

body{
font-size: 18px;
color: black;
}

.table_prop{
	padding-left: 15px;
	background-color: #EBF5FF;
}

.table_header{
background-color: silver;
font-size: 15px;
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
<body><% String pid = request.getParameter("q");  %>
  <table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="170" /></td>
    </tr>
  </table>
<p></p>
<center><div id="psdg-header">
<span class="psdg-bold">Treatment Plans</span><br />
</div></center>
<table border="0" cellspacing="0" cellpadding="10" align="center">
<tr class="table_header" >
	<td>Plan Name</td>
	<td>No. of Treatments</td>
</tr>
<% 
   Statement stmt = null;	
   stmt = DBFunctions.createConnection().createStatement();
   ResultSet rs = stmt.executeQuery("select plan_name, count(plan_name) from mine.TREATMENT_PLAN where patient_id='" + pid + "' group by plan_name ");
   while(rs.next()){
%>
<tr class = "other_row">
<td><a class = 'link_font' href ='Plan_details.jsp?pname=<%= rs.getString(1) %>&pid=<%= pid %>' ><%= rs.getString(1) %></a></td>
<td><%= rs.getString(2) %></td>

<% } %>

<% rs.close();
stmt.close();
DBFunctions.createConnection().close();

%>

</table>
</body>
</html>
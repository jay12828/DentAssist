<%@page import="Database_Functions.DBFunctions"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Plan Details</title>
<style type="text/css">
.Title{
	font-family: Georgia;
	font-size: xx-large;
}

.header{
	font-family: Georgia;
	font-size: medium;
	font-weight: bold;
	background-color: #A3C2FF;
}
body{
	font-size: 18px;
}
#other1{
	background-color: #E6FFB2;
	font-weight: bolder;
}
#other21{
	background-color: #CCCCFF;
}
#other31{
	background-color: #FFE0C2;
}
#other41{
	background-color: #99C2FF;
}
</style>
</head>
<body><% String plan_name = request.getParameter("pname"); 
		String pid = request.getParameter("pid");
%>
  <table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="170" /></td>
    </tr>
  </table>
  <hr />
  <table align="Center" class = "Title">
  <tr>
  <td>
  	Estimated Treatment Plan
  </td>
  </tr>
  </table>
  <p></p>
<table border="0" cellspacing="0" cellpadding="10" align="center">
<tr class="table_header" >
	<td class="header" id="other11">Tooth Number</td>
	<td class="header" id="other2">Procedure</td>
	<td class="header" id="other3">Surface</td>
	<td class="header" id="other4">Cost</td>
</tr>
<% 
   int tot_cost = 0;	
   Statement stmt = null;	
   stmt = DBFunctions.createConnection().createStatement();
   ResultSet rs = stmt.executeQuery("select plan_name, tooth_no, proc_name,surface, proc_cost  from mine.TREATMENT_PLAN where plan_name='" + plan_name + "' and patient_id='"+pid+"'");
   while(rs.next()){
%>
<tr class = "other_row">
<td id="other11"><%= rs.getString(2) %></td>
<td id="other2"><%= rs.getString(3) %></td>
<td id="other3"><%= rs.getString(4) %></td>
<td id="other4"><%= rs.getString(5) %></td>
<% tot_cost = tot_cost + Integer.parseInt(rs.getString(5)); %>
<% } %>
</tr>
<tr>
<td></td>
<td></td>
<td id="other1">Total:</td>
<td id="other1"><%= tot_cost %></td>
</tr>
<% rs.close();
stmt.close();
DBFunctions.createConnection().close();

%>

</table>
</body>
</html>
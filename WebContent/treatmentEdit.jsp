<%@page import="Database_Functions.DBFunctions"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chart</title>
<script type="text/javascript">
function changeBack(id){
	var tooth_num = document.getElementById(id).getAttribute("name");
	document.getElementById("tn").value = tooth_num;
}
</script>
<style type="text/css">
select{
	width: 145px;
}
</style>
</head>
<body>
<% String pid = request.getParameter("pid"); 
   String pname= request.getParameter("pname");
   String tno= request.getParameter("tno");
%>
<% String a = null; %>
  <table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="170" /></td>
    </tr>
  </table>
  <hr />
<form id="form1" name="form1" method="post" action="treatedit.plan?pid=<%= pid %>">
<table cellspacing="15" align="center" >
  <tr>
  <td><img src="/DentAssist/teeth/18.jpg" id="18" name="18" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />18</td>
  <td><img src="/DentAssist/teeth/17.jpg" id="17" name="17" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />17</td>
  <td><img src="/DentAssist/teeth/16.jpg" id="16" name="16" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />16</td>
  <td><img src="/DentAssist/teeth/15.jpg" id="15" name="15" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />15</td>
  <td><img src="/DentAssist/teeth/14.jpg" id="14" name="14" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />14</td>
  <td><img src="/DentAssist/teeth/13.jpg" id="13" name="13" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />13</td>
  <td><img src="/DentAssist/teeth/12.jpg" id="12" name="12" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />12</td>
  <td><img src="/DentAssist/teeth/11.jpg" id="11" name="11" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />11</td>
  
  <td><img src="/DentAssist/teeth/21.jpg" id="21" name="21" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />21</td>
  <td><img src="/DentAssist/teeth/22.jpg" id="22" name="22" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />22</td>
  <td><img src="/DentAssist/teeth/23.jpg" id="23" name="23" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />23</td>
  <td><img src="/DentAssist/teeth/24.jpg" id="24" name="24" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />24</td>
  <td><img src="/DentAssist/teeth/25.jpg" id="25" name="25" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />25</td>
  <td><img src="/DentAssist/teeth/26.jpg" id="26" name="26" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />26</td>
  <td><img src="/DentAssist/teeth/27.jpg" id="27" name="27" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />27</td>
  <td><img src="/DentAssist/teeth/28.jpg" id="28" name="28" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />28</td>
  </tr>
  
  <tr></tr>
  
  <tr>
  <td><img src="/DentAssist/teeth/38.jpg" id="38" name="38" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)" /><br />38</td>
  <td><img src="/DentAssist/teeth/37.jpg" id="37" name="37" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />37</td>
  <td><img src="/DentAssist/teeth/36.jpg" id="36" name="36" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />36</td>
  <td><img src="/DentAssist/teeth/35.jpg" id="35" name="35" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />35</td>
  <td><img src="/DentAssist/teeth/34.jpg" id="34" name="34" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />34</td>
  <td><img src="/DentAssist/teeth/33.jpg" id="33" name="33" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />33</td>
  <td><img src="/DentAssist/teeth/32.jpg" id="32" name="32" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />32</td>
  <td><img src="/DentAssist/teeth/31.jpg" id="31" name="31" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />31</td>
  
  <td><img src="/DentAssist/teeth/41.jpg" id="41" name="41" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />41</td>
  <td><img src="/DentAssist/teeth/42.jpg" id="42" name="42" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />42</td>
  <td><img src="/DentAssist/teeth/43.jpg" id="43" name="43" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)" ><br />43</td>
  <td><img src="/DentAssist/teeth/44.jpg" id="44" name="44" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />44</td>
  <td><img src="/DentAssist/teeth/45.jpg" id="45" name="45" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />45</td>
  <td><img src="/DentAssist/teeth/46.jpg" id="46" name="46" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />46</td>
  <td><img src="/DentAssist/teeth/47.jpg" id="47" name="47" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />47</td>
  <td><img src="/DentAssist/teeth/48.jpg" id="48" name="48" width="20" height="40" style="cursor:pointer;" onclick="changeBack(this.id)"><br />48</td>
  </tr>
  
</table>


<table align="center" cellspacing="10" bgcolor="#C2E0FF" >
<tr>
<td><b>Plan Name:</b>
</td>
<td><%= pname %>
</td>
</tr>
<tr>
<td><b>Tooth Selected:</b>
</td>
<td><%= tno %>
</td>
</tr>
</table>

<table align="center" cellspacing="10" bgcolor="#FFFF94" >
<tr>
<% 
   Statement stmt_alam = null;	
   stmt_alam = DBFunctions.createConnection().createStatement();
   ResultSet amal_set = stmt_alam.executeQuery("select proc_name from mine.TREATMENT_PLAN where proc_name like '%amalgam%' and patient_id='" + pid +"' and plan_name='" + pname + "'" ); 
%>
<td>Amal:
</td>
<td>
		<% String amal_val = null; 
			amal_val = "N/A";		
		%>
		<% while(amal_set.next()){
		   amal_val = amal_set.getString(1);
			%>
		<% } %> 
		<% amal_set.close();
		   stmt_alam.close();
		   DBFunctions.createConnection().close();
		%>
		<%= amal_val %>
</td>

<% 
   Statement stmt_surface = null;	
   stmt_surface = DBFunctions.createConnection().createStatement();
   ResultSet surface_set = stmt_surface.executeQuery("select proc_name from mine.TREATMENT_PLAN where proc_name like '%Surface%' and patient_id='" + pid +"' and plan_name='" + pname + "'");
  
%>
<td>Surface:
</td>
<td>
		<% String surface_val = null;
		surface_val = "N/A";
		%>
		<%  while(surface_set.next()){ 
			System.out.println("Hello");
			surface_val = surface_set.getString(1);
		%>
		<% } %> 
		<% surface_set.close();
		   stmt_surface.close();
		   DBFunctions.createConnection().close();
		%>
		<%= surface_val %>
</td>
</tr>
<tr>
<% 
   Statement stmt_crown = null;	
   stmt_crown = DBFunctions.createConnection().createStatement();
   ResultSet crown_set = stmt_crown.executeQuery("select proc_name from mine.TBLPROCEDURE where proc_name like '%Crown%'");
  
%>
<td>Crown:
</td>
<td>
		<select name="crown" id="crown" >
		<option value="None">None</option>
		<%  while(crown_set.next()){ %>
		<option value="<%= crown_set.getString(1) %>"><%= crown_set.getString(1) %></option>
		<% } %> 
		<% crown_set.close();
		   stmt_crown.close();
		   DBFunctions.createConnection().close();
		%>
      	</select>
</td>
<% 
   Statement stmt_prop = null;	
   stmt_prop = DBFunctions.createConnection().createStatement();
   ResultSet prop_set = stmt_prop.executeQuery("select proc_name from mine.TBLPROCEDURE where proc_name like '%Implant%'");
  
%>
<td>Prophylaxis:
</td>
<td>
		<select name="prop" id="prop" >
		<option value="None">Not Required</option>
		<%  while(prop_set.next()){ %>
		<option value="<%= prop_set.getString(1) %>"><%= prop_set.getString(1) %></option>
		<% } %> 
		<% prop_set.close();
		   stmt_prop.close();
		   DBFunctions.createConnection().close();
		%>
      	</select>
</td>

</tr>
<tr>

<% 
   Statement stmt_bridge = null;	
   stmt_bridge = DBFunctions.createConnection().createStatement();
   ResultSet bridge_set = stmt_bridge.executeQuery("select proc_name from mine.TBLPROCEDURE where proc_name like '%Bridge%'");
  
%>
<td>Bridge:
</td>
<td>
		<select name="bridge" id="bridge" >
		<option value="None">None</option>
		<%  while(bridge_set.next()){ %>
		<option value="<%= bridge_set.getString(1) %>"><%= bridge_set.getString(1) %></option>
		<% } %> 
		<% bridge_set.close();
		   stmt_bridge.close();
		   DBFunctions.createConnection().close();
		%>
      	</select>
</td>

<% 
   Statement stmt_xray = null;	
   stmt_xray = DBFunctions.createConnection().createStatement();
   ResultSet xray_set = stmt_xray.executeQuery("select proc_name from mine.TBLPROCEDURE where proc_name like '%Xray%'");
  
%>
<td>X-Ray:
</td>
<td>
		<select name="xray" id="xray" >
		<option value="None">Not Required</option>
		<%  while(xray_set.next()){ %>
		<option value="<%= xray_set.getString(1) %>"><%= xray_set.getString(1) %></option>
		<% } %> 
		<% xray_set.close();
		   stmt_xray.close();
		   DBFunctions.createConnection().close();
		%>
      	</select>
</td>

</tr>
<tr>
<% 
   Statement stmt_ext = null;	
   stmt_ext = DBFunctions.createConnection().createStatement();
   ResultSet ext_set = stmt_ext.executeQuery("select proc_name from mine.TBLPROCEDURE where proc_name like '%Extraction%'");
  
%>
<td>Extraction:
</td>
<td>
		<select name="ext" id="ext" class="select_tag" >
		<option value="None">Not Required</option>
		<%  while(ext_set.next()){ %>
		<option value="<%= ext_set.getString(1) %>"><%= ext_set.getString(1) %></option>
		<% } %> 
		<% ext_set.close();
		   stmt_ext.close();
		   DBFunctions.createConnection().close();
		%>
      	</select>
</td>

<% 
   Statement stmt_imp = null;	
   stmt_imp = DBFunctions.createConnection().createStatement();
   ResultSet imp_set = stmt_imp.executeQuery("select proc_name from mine.TBLPROCEDURE where proc_name like '%Implant%'");
  
%>
<td>Implant:
</td>
<td>
		<select name="imp" id="imp" >
		<option value="None">Not Required</option>
		<%  while(imp_set.next()){ %>
		<option value="<%= imp_set.getString(1) %>"><%= imp_set.getString(1) %></option>
		<% } %> 
		<% imp_set.close();
		   stmt_imp.close();
		   DBFunctions.createConnection().close();
		%>
      	</select>
</td>
</tr>
</table>
<table align="center" cellspacing="18" bgcolor="#E0E0EB" >
<tr>
<td>Status:
</td>
<td>
<select name="status" id="status">
<option value="Proposed">Proposed</option>
<option value="Accepted">Accepted</option>
<option value="Completed">Completed</option>
<option value="Rejected">Rejected</option>
</select>
</td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="plan" value="Update Plan" />
</td>
</tr>
 
</table>

</form>
</body>
</html>
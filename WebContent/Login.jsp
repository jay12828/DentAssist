<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font-size:medium;
	overflow: hidden;
}
.btnLogin {
	font-family: Verdana, Geneva, sans-serif;
	color: #FFF;
	background-color: #000000;
}
.login_table_inner {
	background-image: url(green.jpg);
}
.login_table_outer {
	background-color: #000;
}
.my_font{
	font-size:x-large;
	font-family:"Comic Sans MS", cursive;
	color:#900;
}
.list_itmes{
	font-family:"Comic Sans MS", cursive;
	color:#0000FF;	
}
.btn_prop{
	background-color:#FFF;
	backface-visibility:visible;
	background-color:transparent;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login - DentAssist</title>
</head>
<body>
<form id="login" name="login" method="post" action="login.do">
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td width="2%">&nbsp;</td>
      <td width="2%">&nbsp;</td>
      <td width="2%">&nbsp;</td>
      <td width="46%">&nbsp;</td>
      <td width="46%" valign="bottom"><table width="60%" border="0" cellpadding="3" cellspacing="3">
        <tr>
          <td width="16%">Username</td>
          <td width="19%"><input type="text" name="uname" id="uname" /></td>
          <td width="9%">Password</td>
          <td width="56%"><input type="password" name="pword" id="pword" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td><input class="btn_prop" type="submit" name="btnLogin" value="Login" /></td>
        </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="280" /></td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td valign="middle" align="center"><img src="/DentAssist/backgrounds/geg.jpg" width="60%" height="200" /></td>
      <td width="50%" valign="top" align="left"><p class="my_font">DentAssist assists you always!</p>
        <hr align="left" width="95%" />
      <p><ul class="list_itmes">
		<li>Easy Appointment Scheduling
		<li><p>View treatment history</p>
        	<p><ul>
            <li>View Perio Reports
            <li>View X-Rays
            </ul>
		<li><p>Enter prescription for patient</p>
        <li><p>Extensive Reports</p>
		</ul>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>

</form>
</body>
</html>
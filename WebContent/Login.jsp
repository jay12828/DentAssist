<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	background-image: url(/DentAssist/backgrounds/green.jpg);
	background-repeat: repeat;
	color: #FFFFFF;
	font-size:medium;
}
.btnLogin {
	font-family: Verdana, Geneva, sans-serif;
	color: #FFF;
	background-color: #000000;
}
.login_table_inner {

}
.login_table_outer {
	background-color: #000;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login - DentAssist</title>
</head>
<body>
<form id="login" name="login" method="post" action="login.do">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>

  <table width="348" border="0" class="login_table_inner" align="center">
  <tr>
    <td width="72" height="27"></td>
    <td width="84">&nbsp;</td>
    <td width="168">&nbsp;</td>
    <td width="72"></td>
  </tr>
  <tr>
    <td height="49">&nbsp;</td>
    <td>Username:</td>
    <td><input type="text" name="uname" id="uname" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="34">&nbsp;</td>
    <td>Password:</td>
    <td><input type="password" name="pword" id="pword" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input type="submit" name="btnLogin" class="btnLogin" value="Submit" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
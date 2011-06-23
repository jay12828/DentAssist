<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Procedure</title>
</head>
<body>
<form name="form1" method="post" action="proc.add">
<table>
<tr>
<td>Procedure:</td>
<td><input type="text" name="pname" /></td>
</tr>
<tr>
<td>Procedure cost:</td>
<td><input type="text" name="pcost" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="Add Procedure" /></td>
</tr>


</table>

</form>
</body>
</html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<form name="form1" method="post" action="">
  <table width="321" border="1">
    <tr>
      <th width="161" scope="row">Name</th>
      <td width="144"><input type="text" name="textfield" required pattern="[A-Z a-z]{3,25}"></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="select">
      </select></td>
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><input type="text" name="textfield2" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"></td>
    </tr>
    <tr>
      <th scope="row">Mobile</th>
      <td><input type="text" name="textfield3" required pattern="[789][0-9]{9}"></td>
    </tr>
    <tr>
      <th scope="row">IMEI</th>
      <td><input type="text" name="textfield4" required></td>
    </tr>
    <tr>
      <th colspan="2" scope="row"><input type="submit" name="Submit" value="Register"></th>
    </tr>
  </table>
</form>
</body>
</html>

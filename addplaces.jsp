<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("lid")==null)
      response.sendRedirect("login.jsp");

  %>
<%@page import="newpackage.dbcon"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<jsp:include page="adminheader.jsp"/>
<%
    if(request.getParameter("sub")!=null)
    {
      String name=request.getParameter("textfield");
      String dis=request.getParameter("select");
      String pin=request.getParameter("textfield2");
      String lat=request.getParameter("textfield3");
      String lon=request.getParameter("textfield4");
      dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
       st.executeUpdate("insert into places values(null,'"+name+"','"+dis+"','"+pin+"','"+lat+"','"+lon+"')");
    
  %>
       <script>
          alert("Added Successfully");
          window.location="places.jsp";
      </script>
      
      <%
    }
 %>
<body>
<form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="row">Name</th>
      <td><input type="text" name="textfield" required pattern="[A-Z a-z]{3,25}"></td>
    </tr>
    <tr>
      <th scope="row">District</th>
      <td><select name="select">
        <option>Kasaragod</option>
        <option>Kannur</option>
        <option>Wayanad</option>
        <option>Kozhikode</option>
        <option>Malappuram</option>
        <option>Palakkad</option>
        <option>Thrissur</option>
        <option>Ernakulam</option>
        <option>Idukki</option>
        <option>Kottayam</option>
        <option>Alappuzha</option>
        <option>Pathanamthitta</option>
        <option>Kollam</option>
        <option>Thiruvanathapuram</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Pin</th>
      <td><input type="text" name="textfield2" required pattern="[0-9]{6}"></td>
    </tr>
    <tr>
      <th scope="row">Lattitude</th>
      <td><input type="text" name="textfield3" required></td>
    </tr>
    <tr>
      <th scope="row">Longitude</th>
      <td><input type="text" name="textfield4" required></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="sub" value="ADD"></td>
    </tr>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

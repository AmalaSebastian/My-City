<%@page import="newpackage.dbcon"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<jsp:include page="adminheader.jsp"/>
<body>
    <form name="form1" method="post" action="addeducational.jsp">
  <table width="500" border="1">
    <tr>
      <th scope="col">Eid</th>
      <th scope="col">Name</th>
      <th scope="col">Type</th>
      <th scope="col">Place</th>
      <th scope="col">Contact_Number</th>
      <th scope="col">Contact_Person</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
     <%
      dbcon db= new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("select educational.*,places.place_name from educational,places where educational.place_id=places.place_id");
      while(rs.next())
      {
    %>
    <tr>
      <td><%= rs.getString(1)  %></td>
      <td><%= rs.getString("place_name")  %></td>
      <td><%= rs.getString(3)  %></td>
      <td><%= rs.getString(4)  %></td>
      <td><%= rs.getString(5)  %></td>
      <td><%= rs.getString(6)  %></td>
      <td><a href="editeducational.jsp?id=<%= rs.getString(1)  %>">Edit</a></td>
      <td><a href="deleteinst.jsp?id=<%= rs.getString(1) %>">Delete</a></td>
    </tr>
     <%
    
      }
    %>
  </table>
  <p>
    <input type="submit" name="Submit" value="ADD NEW">
  </p>
</form>
<p>&nbsp;</p>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

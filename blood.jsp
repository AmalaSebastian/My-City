<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("lid")==null)
      response.sendRedirect("login.jsp");

  %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="newpackage.dbcon"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<jsp:include page="adminheader.jsp"/>
<body>
    <form name="form1" method="post" action="addblood.jsp">
  <table width="500" border="1">
    <tr>
      <th scope="col">Bid</th>
      <th scope="col">Name</th>
      <th scope="col">Place</th>
      <th scope="col">Blood_Type</th>
      <th scope="col">Contact</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <%
      dbcon db= new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("select blood_donors.*,places.place_name from blood_donors,places where blood_donors.place_id=places.place_id");
      while(rs.next())
      {
    %>
    <tr>
      <td><%= rs.getString(1)  %></td>
      <td><%= rs.getString(3)  %></td>
      <td><%= rs.getString("place_name")  %></td>
      <td><%= rs.getString(4)  %></td>
      <td><%= rs.getString(5)  %></td>
      <td><a href="editblood.jsp?id=<%= rs.getString(1)%>">Edit</a></td>
      <td><a href="delblood.jsp?id=<%= rs.getString(1) %>">Delete</a></td>
    </tr> 
    <%
      }
    %>
          
  </table>
  <p>&nbsp;
     <input type="submit" name="Submit" value="Add New">
  </p>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

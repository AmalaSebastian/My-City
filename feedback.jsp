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
<form name="form1" method="post" action="">
  <div align="center">
    <table width="500" border="1">
      <tr>
        <th scope="col">Feedback_id</th>
        <th scope="col">UserName</th>
        <th scope="col">Feedback</th>
        <th scope="col">Date</th>
      </tr>
      <%
      dbcon db= new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("SELECT registration.user_name,feedback.* FROM registration,feedback WHERE feedback.reg_id=registration.reg_id");
       while(rs.next())
      {
    %>
      <tr>
        <td><%= rs.getString(2)  %></td>
        <td><%= rs.getString(1)  %></td>
        <td><%= rs.getString(4)  %></td>
        <td><%= rs.getString(5)  %></td>
      </tr>
      <%
    
      }
    %>
    </table>
  </div>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

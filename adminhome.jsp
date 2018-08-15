<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("lid")==null)
      response.sendRedirect("login.jsp");

  %>
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
    <table width="263" border="1">
      <tr>
        <td><a href="places.jsp">Add & Manage place details</a></td>
      </tr>
      <tr>
          <td width="253"><a href="news.jsp">Post Latest News</a></td>
      </tr>
      <tr>
          <td><a href="feedback.jsp">View Feedback</a></td>
      </tr>
      <tr>
          <td><a href="approveinfo.jsp">Approve User Info</a></td>
      </tr>
      <tr>
        <td><a href="infos.jsp">View Approved Informations</a></td>
      </tr>
      <tr>
          <td><a href="vacancies.jsp">Add & Manage Job Vacancies</a></td>
      </tr>
      <tr>
          <td><a href="contacts.jsp">Add & Manage important contacts</a></td>
      </tr>
      <tr>
          <td><a href="educational.jsp">Add & Manage educational Institutes</a></td>
      </tr>
      <tr>
          <td><a href="shops.jsp">Add & Manage Shops</a></td>
      </tr>
      <tr>
          <td><a href="hostel.jsp">Add & Manage Hostels</a></td>
      </tr>
      <tr>
          <td><a href="atm.jsp">Add & Manage ATMs</a></td>
      </tr>
      <tr>
          <td><a href="hospital.jsp">Add & Manage Hospital</a></td>
      </tr>
      <tr>
          <td><a href="blood.jsp">Add & Manage Blood_Donors</a></td>
      </tr>
      <tr>
          <td><a href="hotel.jsp">Add & Manage Hotels</a></td>
      </tr>
      <tr>
          <td><a href="vehicle.jsp">Add &Manage vehicle details</a></td>
      </tr>
    </table>
  </div>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

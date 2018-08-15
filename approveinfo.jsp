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
<body>
<form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="col">Info_id</th>
      <th scope="col">User_name</th>
      <th scope="col">Place</th>
      <th scope="col">Information</th>
      <th scope="col">Image</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <%
      dbcon db= new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("SELECT registration.user_name,info.info_id,info.place,info.information,info.image,info.latitde,info.longitude FROM registration,info WHERE info.reg_id=registration.reg_id and info.status='pending' ");
       while(rs.next())
      {
    %>
    <tr>
      <td><%= rs.getString("info_id")  %></td>
      <td><%= rs.getString("user_name")  %></td>
      <td><%= rs.getString("place")  %></td>
      <td><%= rs.getString("information")  %></td>
      <td><img name="" src="images/<%=rs.getString("image")%>" width="111" height="98" alt=""></td>
      <td><a href="http://maps.google.com/maps?q=<%=rs.getString(6)+","+rs.getString(7)%>" target="_blank">Track</a></td>
      <td><a href="?id=<%=rs.getString("info_id")%>">Approve</a></td>
      <td><a href="?sid=<%=rs.getString("info_id")%>">Reject</a></td>
    </tr>
     <%
    
      }
    %>
  </table>
  <p>&nbsp;  </p>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>
<%
if(request.getParameter("id")!=null)
{
    String id=request.getParameter("id");
    st.executeUpdate("update info set status='approved' where info_id='"+id+"' ");
    response.sendRedirect("approveinfo.jsp");
}
if(request.getParameter("sid")!=null)
{
    String id=request.getParameter("sid");
    st.executeUpdate("update info set status='rejected' where info_id='"+id+"' ");
    response.sendRedirect("approveinfo.jsp");
}
%>
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
 <%
    String id=request.getParameter("id");
    
      dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
    if(request.getParameter("sub")!=null)
    {
      String name=request.getParameter("textfield");
      String dis=request.getParameter("select");
      String pin=request.getParameter("textfield2");
      String lat=request.getParameter("textfield3");
      String lon=request.getParameter("textfield4");
      
       st.executeUpdate("update places set place_name='"+name+"',place_district='"+dis+"',pincode='"+pin+"',lattitude='"+lat+"',longitude='"+lon+"' where place_id='"+id+"'");
    response.sendRedirect("places.jsp");
    }
    ResultSet rs=st.executeQuery("select * from places where place_id='"+id+"'");
      if(rs.next())
        {
  %>
   
    <table width="500" border="1">
    <tr>
      <th scope="row">Name</th>
      <td><input type="text" name="textfield"  value="<%= rs.getString(2) %>"/></td>
    </tr>
    <tr>
      <th scope="row">District</th>
      <td><select name="select">
        <option><% if(rs.getString(3).equals("Kasargod")){ %>selected<%}%>Kasaragod</option>
        <option><% if(rs.getString(3).equals("Kannur")){ %>selected<%}%>Kannur</option>
        <option><% if(rs.getString(3).equals("Wayanad")){ %>selected<%}%>Wayanad</option>
        <option><% if(rs.getString(3).equals("Kozhikode")){ %>selected<%}%>Kozhikode</option>
        <option><% if(rs.getString(3).equals("Malappuram")){ %>selected<%}%>Malappuram</option>
        <option><% if(rs.getString(3).equals("Palakkad")){ %>selected<%}%>Palakkad</option>
        <option><% if(rs.getString(3).equals("Thrissur")){ %>selected<%}%>Thrissur</option>
        <option><% if(rs.getString(3).equals("Ernakulam")){ %>selected<%}%>Ernakulam</option>
        <option><% if(rs.getString(3).equals("Idukki")){ %>selected<%}%>Idukki</option>
        <option><% if(rs.getString(3).equals("Kottayam")){ %>selected<%}%>Kottayam</option>
        <option><% if(rs.getString(3).equals("Alappuzha")){ %>selected<%}%>Alappuzha</option>
        <option><% if(rs.getString(3).equals("Pathanamthitta")){ %>selected<%}%>Pathanamthitta</option>
        <option><% if(rs.getString(3).equals("Kollam")){ %>selected<%}%>Kollam</option>
        <option><% if(rs.getString(3).equals("Thiruvanathapuram")){ %>selected<%}%>Thiruvanathapuram</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Pin</th>
      <td><input type="text" name="textfield2" value="<%= rs.getString(4) %>" /></td>
    </tr>
    <tr>
      <th scope="row">Lattitude</th>
      <td><input type="text" name="textfield3" value="<%= rs.getString(5) %>" /></td>
    </tr>
    <tr>
      <th scope="row">Longitude</th>
      <td><input type="text" name="textfield4" value="<%= rs.getString(6) %>" /></td>
    </tr>
     <%
        }
    %>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="sub" value="Update"></td>
    </tr>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

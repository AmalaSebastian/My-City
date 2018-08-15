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
    dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
   if(request.getParameter("Sub")!=null)
    {
       
      String name=request.getParameter("textfield");
      String typ=request.getParameter("type");
      String plc=request.getParameter("select2");
      String num=request.getParameter("textfield3");
      String person=request.getParameter("textfield4");
      st.executeUpdate("insert into educational values(null,'"+plc+"','"+name+"','"+typ+"','"+num+"','"+person+"')");
   %> 
   <script>
          alert("Institution added")
          window.location="educational.jsp";
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
      <th scope="row">Type</th>
      <td><select name="type">
              <option value="">Select</option>
              <option value="">School</option>
              <option value="">College</option>
              <option value="">Certificate_courses</option>
              <option value="">plustwo</option>
              <option value="">pre-primary</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="select2">
              <%
              ResultSet rs=st.executeQuery("select * from places");
              while(rs.next())
              {
                  
              
              %>
              <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
              <% }%>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Contact_Number</th>
      <td><input type="text" name="textfield3" required pattern="[789][0-9]{9}"></td>
    </tr>
    <tr>
      <th scope="row">Contact_Person</th>
      <td><input type="text" name="textfield4" required pattern="[A-Z a-z]{3,25}"> </td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="Sub" value="ADD"></td>
    </tr>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

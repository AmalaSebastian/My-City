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
    String id=request.getParameter("id");
    dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
   if(request.getParameter("s")!=null)
    {
       
      String name=request.getParameter("textfield");
      String place=request.getParameter("sel");
      String typ=request.getParameter("textfield2");
      String pro=request.getParameter("textfield3");
      String cont=request.getParameter("textfield4");
      st.executeUpdate("insert into shop values(null,'"+name+"','"+place+"','"+typ+"','"+pro+"','"+cont+"')");
    response.sendRedirect("shops.jsp");
  
 }
    ResultSet rs=st.executeQuery("select * from shop where shop_id='"+id+"'");
      if(rs.next())
        {
%>
<body>
<form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="row">Name</th>
      <td><input type="text" name="textfield" value="<%= rs.getString(2) %>"></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="sel">
               <%
            Statement st1= con.createStatement();
              ResultSet rs1=st1.executeQuery("select * from places");
              while(rs1.next())
              {
                  
              
              %>
              <option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
              <% }%>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Type</th>
      <td><input type="text" name="textfield2" value="<%= rs.getString(4) %>"></td>
    </tr>
    <tr>
      <th scope="row">Products</th>
      <td><input type="text" name="textfield3" value="<%= rs.getString(5) %>"></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield4" value="<%= rs.getString(6) %>"></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="s" value="UPDATE"></td>
    </tr>
    <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

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
   if(request.getParameter("ab")!=null)
    {
       
      String name=request.getParameter("textfield");
      String place=request.getParameter("sele");
      String typ=request.getParameter("textfield3");
      String fac=request.getParameter("textfield4");
      String cont=request.getParameter("textfield5");
      
      st.executeUpdate("update hospitals set place_id='"+place+"',hospital_name='"+name+"',hospital_type='"+typ+"',facilities='"+fac+"',contact='"+cont+"' where hospital_id='"+id+"'");
   response.sendRedirect("hospital.jsp");
 }
   ResultSet rs=st.executeQuery("select * from hospitals where hospital_id='"+id+"'");
      if(rs.next())
        {
%>
<body>
<form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="row">Name</th>
      <td><input type="text" name="textfield" value="<%= rs.getString(3) %>"></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="sele">
              <%
            Statement st1=con.createStatement();
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
      <td><input type="text" name="textfield3" value="<%= rs.getString(4) %>" /></td>
    </tr>
    <tr>
      <th scope="row">Facilities</th>
      <td><input type="text" name="textfield4" value="<%= rs.getString(5) %>" /></td>
    </tr>
	<tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield5" value="<%= rs.getString(6) %>"/></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="ab" value="UPDATE"></td>
    </tr>
     <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

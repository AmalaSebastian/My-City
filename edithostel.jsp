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
   if(request.getParameter("suu")!=null)
    {
       
      String name=request.getParameter("textfield4");
      String place=request.getParameter("selec");
      String typ=request.getParameter("textfield3");
      String f=request.getParameter("textfield2");
      String cont=request.getParameter("textfield");
      st.executeUpdate("update hostel set hostel_name='"+name+"',place_id='"+place+"',hostel_type='"+typ+"',hostel_fee='"+f+"',contact='"+cont+"' where hostel_id='"+id+"' ");
      response.sendRedirect("hostel.jsp");
    }
   ResultSet rs=st.executeQuery("select * from hostel where hostel_id='"+id+"'");
      if(rs.next())
        {
%> 
<body>
<form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="row">Name</th>
      <td><input type="text" name="textfield4" value="<%= rs.getString(2) %>"/></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="selec">
            
               <%
              Statement st2=con.createStatement();
              ResultSet rs2=st2.executeQuery("select * from places");
              while(rs2.next())
              {
                  
              
              %>
              <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
              <% }%>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Type</th>
      <td><input type="text" name="textfield3" value="<%= rs.getString(4) %>"></td>
    </tr>
    <tr>
      <th scope="row">Fee</th>
      <td><input type="text" name="textfield2" value="<%= rs.getString(5) %>"></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield" value="<%= rs.getString(6) %>"></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="suu" value="ADD"></td>
    </tr>
    <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

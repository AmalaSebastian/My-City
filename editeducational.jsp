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
   if(request.getParameter("submit")!=null)
    {
       
      String name=request.getParameter("textfield");
      String typ=request.getParameter("type");
      String plc=request.getParameter("places");
      String num=request.getParameter("textfield3");
      String person=request.getParameter("textfield4");
      st.executeUpdate("update educational set place_id='"+plc+"',institution_name='"+name+"',institution_type='"+typ+"',Contact_number='"+num+"',Contact_person='"+person+"' where institution_id='"+id+"' ");
      response.sendRedirect("educational.jsp");
  
 }
    ResultSet rs=st.executeQuery("select * from educational where institution_id='"+id+"'");
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
      <th scope="row">Type</th>
      <td><select name="type">
        <option <% if(rs.getString(4).equals("Schools")){ %>selected<%}%>>Schools</option>
        <option <% if(rs.getString(4).equals("Colleges")){ %>selected<%}%>>Colleges</option>
        <option <% if(rs.getString(4).equals("Certificate_courses")){ %>selected<%}%>>Certificate_courses</option>
        <option <% if(rs.getString(4).equals("plustwo")){ %>selected<%}%>>plustwo</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="places">
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
      <th scope="row">Contact_Number</th>
      <td><input type="text" name="textfield3" value="<%= rs.getString(5) %>"></td>
    </tr>
    <tr>
      <th scope="row">Contact_Person</th>
      <td><input type="text" name="textfield4" value="<%= rs.getString(6) %>"></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="submit" value="UPDATE"></td>
    </tr>
     <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

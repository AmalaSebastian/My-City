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
   if(request.getParameter("Sub")!=null)
    {
       
      String nam=request.getParameter("textfield2");
      String plac=request.getParameter("sele");
      String typ=request.getParameter("sel");
      String cont=request.getParameter("textfield");
      st.executeUpdate("update blood_donors set place_id='"+plac+"',donor_name='"+nam+"',blood='"+typ+"',contact='"+cont+"' where donor_id='"+id+"'");
  response.sendRedirect("blood.jsp");
 }
   ResultSet rs=st.executeQuery("select * from blood_donors where donor_id='"+id+"'");
      if(rs.next())
        {
%>
<body>
<form name="form1" method="post" action="">
  <table width="385" border="1">
    <tr>
	
      <th width="165" scope="row">Name</th>
      <td width="204"><input type="text" name="textfield2" value="<%= rs.getString(3) %>"></td>
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
      <th scope="row">Blood_Type</th>
      <td><select name="sel">
        <option <% if(rs.getString(4).equals("O+")){ %>selected<%}%>>O+</option>
        <option <% if(rs.getString(4).equals("O-")){ %>selected<%}%> >O-</option>
        <option <% if(rs.getString(4).equals("AB+")){ %>selected<%}%> >AB+</option>
        <option <% if(rs.getString(4).equals("A+")){ %>selected<%}%> >A+</option>
        <option <% if(rs.getString(4).equals("A-")){ %>selected<%}%> >A-</option>
        <option <% if(rs.getString(4).equals("AB-")){ %>selected<%}%> >AB-</option>
        <option <% if(rs.getString(4).equals("B-")){ %>selected<%}%> >B-</option>
        <option <% if(rs.getString(4).equals("SB=")){ %>selected<%}%> >B+</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield" value="<%= rs.getString(5) %>"></td>
    </tr>
    <tr>
      <th colspan="2" scope="row"><input type="submit" name="Sub" value="UPDATE"></th>
    </tr>
      <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

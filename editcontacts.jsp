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
   if(request.getParameter("sub")!=null)
    {
       
      String pla=request.getParameter("plc");
      String det=request.getParameter("textfield");
      String cont=request.getParameter("textfield2");
      st.executeUpdate("update contacts set place_id='"+pla+"',details='"+det+"',contact='"+cont+"' where contact_id='"+id+"'");
      response.sendRedirect("contacts.jsp");
    }
   ResultSet rs=st.executeQuery("select * from contacts where contact_id='"+id+"'");
      if(rs.next())
        {
%> 
   
<body>
<form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="row">Place</th>
      <td><select name="plc">
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
      <th scope="row">Details</th>
      <td><input type="text" name="textfield" value="<%= rs.getString(3) %>"></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield2" value="<%= rs.getString(4) %>"></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="sub" value="UPDATE"></td>
    </tr>
  </table>
    <% }%>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

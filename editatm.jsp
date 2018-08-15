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
   if(request.getParameter("su")!=null)
    {
       
      String name=request.getParameter("textfield");
      String place=request.getParameter("selec");
      
      st.executeUpdate("update atm set atm_name='"+name+"',place_id='"+place+"' where atm_id='"+id+"' ");
    response.sendRedirect("atm.jsp");
    }
   ResultSet rs=st.executeQuery("select * from atm where atm_id='"+id+"'");
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
      <td><select name="selec">
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
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="su" value="ADD"></td>
    </tr>
    <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

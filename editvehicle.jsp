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
   if(request.getParameter("submit12")!=null)
    {
       
      String reg=request.getParameter("textfield2");
      String place=request.getParameter("sel");
      String typ=request.getParameter("textfield");
      String cont=request.getParameter("textfield3");
      st.executeUpdate("update vehicles set place_id='"+place+"',vehicle_type='"+typ+"',register_number='"+reg+"',contact='"+cont+"'");
    response.sendRedirect("vehicle.jsp");
 }
   ResultSet rs=st.executeQuery("select * from vehicles where vehicle_id='"+id+"' ");
      if(rs.next())
        {
%>
<body>
<form name="form1" method="post" action="">
  <table width="296" border="1">
    <tr>
      <th width="132" scope="row">Place</th>
      <td width="148"><select name="sel">
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
      <td><input type="text" name="textfield" value="<%= rs.getString(3) %>"></td>
    </tr>
    <tr>
      <th scope="row">Reg_No</th>
      <td><input type="text" name="textfield2" value="<%= rs.getString(4) %>"></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield3" value="<%= rs.getString(5) %>"></td>
    </tr>
    <tr>
      <th colspan="2" scope="row"><input type="submit" name="submit12" value="UPDATE"></th>
    </tr>
     <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

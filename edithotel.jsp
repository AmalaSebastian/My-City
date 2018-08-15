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
   if(request.getParameter("Submit2")!=null)
    {
       
      String nam=request.getParameter("textfield");
      String plac=request.getParameter("selec");
      String typ=request.getParameter("sel");
      String fud=request.getParameter("textfield4");
      String cont=request.getParameter("textfield3");
      st.executeUpdate("update hotels set place_id='"+plac+"',hotel_name='"+nam+"',hotel_type='"+typ+"',food_items='"+fud+"',contact='"+cont+"' where hotel_id='"+id+"' ");
    response.sendRedirect("hotel.jsp");
 }
   ResultSet rs=st.executeQuery("select * from hotels where hotel_id='"+id+"' ");
      if(rs.next())
        {
%>
<body>
<form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="row">Name</th>
      <td><input type="text" name="textfield"  value="<%= rs.getString(3) %>"/></td>
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
      <th scope="row">Type</th>
      <td><select name="sel">
        <option <% if(rs.getString(4).equals("Vegetarian")){ %>selected<%}%>>Vegetarian</option>
        <option <% if(rs.getString(4).equals("Non-Veg")){ %>selected<%}%>>Non-Veg</option>
        <option <% if(rs.getString(4).equals("5-Star")){ %>selected<%}%>>5-Star</option>
        <option <% if(rs.getString(4).equals("3-Star")){ %>selected<%}%>>3-Star</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Food_items</th>
      <td><input type="text" name="textfield4" value="<%= rs.getString(5) %>"></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield3" value="<%= rs.getString(6) %>"/></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="Submit2" value="ADD"></td>
    </tr>
     <% }%>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

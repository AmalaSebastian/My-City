<%@page import="newpackage.dbcon"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<jsp:include page="adminheader.jsp"/>
<body>
    <%
      dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
    if(request.getParameter("submit")!=null)
    {
      String date=request.getParameter("textfield");
      String place=request.getParameter("place");
      String nws=request.getParameter("textarea");
      st.executeUpdate("insert into news values(null,'"+date+"','"+place+"','"+nws+"')");
      %>
      <script>
          alert("news posted")
      </script>
      <%
    }
    %>
<form action="" method="post"  name="form1">
<table width="500" border="1">
    <tr>
      <th scope="col">DATE</th>
      <th scope="col">PLACE</th>
      <th scope="col">NEWS</th>
      <th scope="col">&nbsp;</th>
    </tr>
    <tr>
    <%
    ResultSet rs1=st.executeQuery("select news.*,places.place_name from news,places where news.place=places.place_id");
      while(rs1.next())
      {
    %>
      <td><%= rs1.getString(2)  %></td>
      <td><%= rs1.getString("place_name")  %></td>
      <td><%= rs1.getString(4)  %></td>
      <td><a href="deletenews.jsp?id=<%= rs1.getString(1)%>">DELETE</a></td>
    </tr>
    <%
    
      }
    %>
  </table>
  <p>
    <input type="submit" name="Submit2" value="ADD NEWS">
  </p>
  <%
  if(request.getParameter("Submit2")!=null)
  {
      
  
  %>
  <table width="273" height="194" border="1">
    <tr>
      <th scope="row">Date</th>
      <td><input type="date" name="textfield" required></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="place">
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
      <th scope="row">News</th>
      <td><textarea name="textarea" required></textarea></td>
    </tr>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="submit" value="POST"></td>
    </tr>
  </table>
  
  <p>&nbsp;</p>
</form>
  <% }%>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

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
       
      String post=request.getParameter("textfield");
      String vac=request.getParameter("textfield2");
      String place=request.getParameter("place");
      String det=request.getParameter("textfield3");
      String cont=request.getParameter("textfield4");
      st.executeUpdate("update vacancy set post='"+post+"',number_of_vacancy='"+vac+"',place_id='"+place+"',details='"+det+"',contact='"+cont+"'");
      response.sendRedirect("vacancies.jsp");
    }
   ResultSet rs=st.executeQuery("select * from vacancy where vacancy_id='"+id+"'");
      if(rs.next())
        {
%>
<body>
    <form name="form1" method="post" action="">
  <table width="500" border="1">
    <tr>
      <th scope="row"><p>Post</p>      </th>
      <td><input type="text" name="textfield" value="<%= rs.getString(2) %>" /></td>
    </tr>
    <tr>
      <th scope="row">No:of Vacancy</th>
      <td><input type="text" name="textfield2" value="<%= rs.getString(3) %>"/></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="place">
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
      <td><input type="text" name="textfield3" value="<%= rs.getString(5) %>"/></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield4" value="<%= rs.getString(6) %>" /></td>
    </tr>
    <%
        }
    %>
    <tr>
      <th scope="row">&nbsp;</th>
      <td><input type="submit" name="sub" value="UPDATE"></td>
    </tr>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

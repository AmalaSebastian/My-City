<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("lid")==null)
      response.sendRedirect("login.jsp");

  %>
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
    dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
   if(request.getParameter("Submi")!=null)
    {
       
      String nam=request.getParameter("textfield2");
      String plac=request.getParameter("selec");
      String typ=request.getParameter("select2");
      String cont=request.getParameter("textfield");
      st.executeUpdate("insert into blood_donors values(null,'"+plac+"','"+nam+"','"+typ+"','"+cont+"')");
   %> 
   <script>
          alert("Blood donor added")
          window.location="blood.jsp";
      </script>
 <%  
 }
%>
<body>
<form name="form1" method="post" action="">
  <table width="385" border="1">
    <tr>
      <th width="165" scope="row">Name</th>
      <td width="204"><input type="text" name="textfield2" required pattern="[A-Z a-z]{3,25}"></td>
    </tr>
    <tr>
      <th scope="row">Place</th>
      <td><select name="selec">
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
      <th scope="row">Blood_Type</th>
      <td><select name="select2">
              <option value="">Select</option>
              <option value="">O+</option>
              <option value="">O-</option>
              <option value="">AB+</option>
              <option value="">A+</option>
              <option value="">A-</option>
              <option value="">AB-</option>
              <option value="">B-</option>
              <option value="">B+</option>
      </select></td>
    </tr>
    <tr>
      <th scope="row">Contact</th>
      <td><input type="text" name="textfield" required pattern="[789][0-9]{9}" ></td>
    </tr>
    <tr>
      <th colspan="2" scope="row"><input type="submit" name="Submi" value="ADD"></th>
    </tr>
  </table>
</form>
</body>
<jsp:include page="adminfooter.jsp"/>
</html>

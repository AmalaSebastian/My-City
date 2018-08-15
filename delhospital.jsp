<%@page import="newpackage.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    
    String id=request.getParameter("id");
      dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
      st.executeUpdate("delete from hospitals where hospital_id='"+id+"'");
      response.sendRedirect("hospital.jsp");
    
    %>
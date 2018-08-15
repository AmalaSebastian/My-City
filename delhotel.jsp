<%@page import="newpackage.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    
    String id=request.getParameter("id");
      dbcon db=new dbcon();
      Connection con=db.getcon();
      Statement st=con.createStatement();
      st.executeUpdate("delete from hotels where hotel_id='"+id+"'");
      response.sendRedirect("hotel.jsp");
    
    %>
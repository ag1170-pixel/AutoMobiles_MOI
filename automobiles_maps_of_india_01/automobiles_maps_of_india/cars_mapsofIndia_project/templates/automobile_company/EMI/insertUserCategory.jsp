<%@ include file="ConnectDB.jsp" %>
<%@ page import="java.util.*,java.io.*,java.sql.*" %>

<%
  String cat="";

%>

<%

  
    try
   {
    cat=request.getParameter("category");
    
    Statement state = con.createStatement();
    String query="insert into bank(bankName)values('"+cat+"')";
    
    state.executeUpdate(query);  
    response.sendRedirect("bank.jsp");
    
    } catch(Exception e) {
  
    }    

  
    %>


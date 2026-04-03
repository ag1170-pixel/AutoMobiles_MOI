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
    String query="insert into category(Category_name)values('"+cat+"')";
    
    state.executeUpdate(query);  
    response.sendRedirect("User_Category.jsp");
    
    } catch(Exception e) {
  
    }    

  
    %>


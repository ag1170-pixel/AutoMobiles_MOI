<%@ page import="java.sql.*" %>
<%
Connection con=(Connection)session.getAttribute("Connection");

if(con!=null) {
    con.close();
    
    session.setAttribute("Connection",null);
    
}
if((Connection)session.getAttribute("Connection")==null) {
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://automobiles.mapsofindia.com/emicalc","emicalc","m4clc#aut");
       // con = DriverManager.getConnection("jdbc:mysql://localhost/EMICalculator","root","root");
        session.setAttribute("Connection",con);
    }
    
    catch(Exception e) {
        out.print("Site may have heavy load at that time. Sorry for the interruption");
    }
    
}		
%>

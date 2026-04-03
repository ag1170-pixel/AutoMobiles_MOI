<%@ page language="java" %>
<%@ page import ="java.sql.*" %>
<%@ include file="ConnectDB.jsp" %>  
<%

 try
{    
String whois="";
Statement stmt = con.createStatement();
 
String user_name = request.getParameter("uname");


String password = request.getParameter("pass");



//out.print("see here"+favourite);

String query="Select rec_id, email  ,password,company_name from recruiter_login where email= '"+user_name+"' and password= '"+password+"' ";

ResultSet rs = stmt.executeQuery(query);

if (rs.next())
{

String recid = rs.getString("rec_id");
String rec = rs.getString("company_name");
  
String rec_email=rs.getString("email");  
whois="rec";


session.setAttribute("rec_id", recid);
session.setAttribute("rec_name", rec); 

session.setAttribute("rec_email", rec_email); 
session.setAttribute("whois", whois);  

//out.print("query33"+query);

response.sendRedirect("KConvert.jsp"); 

}
//con.close();

else {  
 


response.sendRedirect("rec_login.jsp?i=0");   

}   
 }
 catch(Exception e)
 {
     out.print(e.getMessage());
 }
%>
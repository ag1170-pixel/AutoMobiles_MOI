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
//out.print(password);
String favourite=request.getParameter("favourite");

//out.print("see here"+favourite);

String query="Select User_id, User_name, Email_id  ,password from user_login where Email_id= '"+user_name+"' and password= '"+password+"' ";

ResultSet rs = stmt.executeQuery(query);

if (rs.next())
{

String userid = rs.getString("User_id");
String user = rs.getString("User_name");
String pass = rs.getString("password");  
String login_email=rs.getString("Email_id");  
whois="js";


session.setAttribute("User_id", userid);
session.setAttribute("User_Name", user); 
session.setAttribute("Password", pass);
session.setAttribute("login_email", login_email); 
session.setAttribute("whois", whois);  

//out.print("query33"+query);

response.sendRedirect("findProducts.jsp"); 

}
//con.close();

else {  
 


response.sendRedirect("findProducts.jsp");

}   
 }
 catch(Exception e)
 {
    // out.print(e.getMessage());
 }
%>
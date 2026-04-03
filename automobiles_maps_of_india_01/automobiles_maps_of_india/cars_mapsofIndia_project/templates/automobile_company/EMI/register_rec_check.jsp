<%@ page import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,java.sql.*,javax.servlet.http.HttpSession" %>

<%     

String user_name=null;
String password=null;
String email=null;
int age=1;
 try{        
            String captcha=(String)session.getAttribute("imagevalue");

            String vtext = request.getParameter("vtext");
            
       
 if(captcha.equals(vtext))
{
               //response.sendRedirect("register_user.jsp");
     
                  
try
{
    
  

password = request.getParameter("password");
String comp_name = request.getParameter("f_name");
user_name = comp_name;
String comp_desc = request.getParameter("comp_desc");
email = request.getParameter("emailID");

String city_name = request.getParameter("city_name");
String addres = request.getParameter("address");
String phone = request.getParameter("phone");



                    
   
                    session.setAttribute("comp_name", "");
                    session.setAttribute("password", "");
                  
                    session.setAttribute("email", "");                   
                    session.setAttribute("city_name", "");
                    session.setAttribute("address", "");
                    session.setAttribute("phone", "");
                    session.setAttribute("imgval","");

//out.print(date_of_birth);
String query="Insert into recruiter_login(Password,company_name,company_desc,email,company_location,address,contact_no,date) values('"+password+"','"+comp_name+"','"+comp_desc+"','"+email+"','"+city_name+"','"+addres+"','"+phone+"',now())";
%>
<%@ include file="ConnectDB.jsp" %> 

<%
Statement stmt = con.createStatement();
int j = stmt.executeUpdate(query); 
query="select rec_id from recruiter_login where email='"+email+"' and Password='"+password+"'";
ResultSet rs=stmt.executeQuery(query);

String rec_id=null;
if(rs.next())
    {
    rec_id=rs.getString("rec_id");
    }
if(j!=0)
{
      String url="confirmRegMailrec.jsp?x="+rec_id;
     
      response.sendRedirect(url);
  
}



}
 catch(Exception e)
 {
     out.print(e.getMessage());
 }
 }
            else
                {
                
                    password = request.getParameter("password");
                    String comp_name = request.getParameter("f_name");
                    user_name = comp_name;
                    String comp_desc = request.getParameter("comp_desc");
                    email = request.getParameter("emailID");
                    
                    String city_name = request.getParameter("city_name");
                    String addres = request.getParameter("address");
                    String phone = request.getParameter("phone");



                       String imgval="Enter Image value Correctly";
   
                    session.setAttribute("comp_name", comp_name);
             
                  
                    session.setAttribute("email",email);                   
                    session.setAttribute("city_name", city_name);
                    session.setAttribute("address", addres);
                    session.setAttribute("phone", phone);
                    session.setAttribute("comp_desc",comp_desc);
                    session.setAttribute("imgval",imgval);
             response.sendRedirect("register_rec.jsp");
              
            }
            
   }
   
   catch(Exception e)
   {
   password = request.getParameter("password");
   String comp_name = request.getParameter("f_name");
   user_name = comp_name;
   String comp_desc = request.getParameter("comp_desc");
   email = request.getParameter("emailID");

   String city_name = request.getParameter("city_name");
   String addres = request.getParameter("address");
   String phone = request.getParameter("phone");





   session.setAttribute("comp_name", comp_name);


   session.setAttribute("email",email);
   session.setAttribute("city_name", city_name);
   session.setAttribute("address", addres);
   session.setAttribute("phone", phone);
   session.setAttribute("comp_desc",comp_desc);
   
   response.sendRedirect("register_rec.jsp");
   }
            
%>

<%@ page import="java.util.*,java.io.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,java.sql.*,javax.servlet.http.HttpSession" %>

<%      
 try{        
            String captcha=(String)session.getAttribute("imagevalue");

            String vtext = request.getParameter("vtext");
            
       
 if(captcha.equals(vtext))
{
               //response.sendRedirect("register_user.jsp");
     String user_name=null;
     String password=null;
     String email=null;
     int age=1;
                  
try
{
    
  

password = request.getParameter("password");
String f_name = request.getParameter("f_name");
user_name = f_name;
String gender = request.getParameter("gender");
 email = request.getParameter("emailID");
String country = request.getParameter("contry"); 
String city_name = request.getParameter("city_name");
String addres = request.getParameter("address");
String phone = request.getParameter("phone");


String birthday=request.getParameter("birthday_day");
String birthmon=request.getParameter("birthday_mon");
String birthyr=request.getParameter("birthday_yr");
String date_of_birth=birthyr+"-"+birthmon+"-"+birthday;

                    
   
                    session.setAttribute("user_name", "");
                    session.setAttribute("password", "");
                    session.setAttribute("f_name", "");
                    session.setAttribute("email", "");                   
                    session.setAttribute("city_name", "");
                    session.setAttribute("address", "");
                    session.setAttribute("phone", "");
                    session.setAttribute("imgval","");

//out.print(date_of_birth);
String query="Insert into user_login(User_name,Password,First_name,Gender,Email_id,Country,City,Address,Phone,Date_of_birth,date) values('"+user_name+"','"+password+"','"+f_name+"','"+gender+"','"+email+"','"+country+"','"+city_name+"','"+addres+"','"+phone+"','"+date_of_birth+"',now())";
%>
<%@ include file="ConnectDB.jsp" %> 

<%
Statement stmt = con.createStatement();
int j = stmt.executeUpdate(query); 
query="select User_id from user_login where User_name='"+user_name+"' and Email_id='"+email+"'";
ResultSet rs=stmt.executeQuery(query);

String userId=null;
if(rs.next())
    {
    userId=rs.getString("User_id");
    }
if(j!=0)
{
      String url="confirmRegMail.jsp?x="+userId;
      out.print(url);
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
                
                String user_name = request.getParameter("user_name");
              //  String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String f_name = request.getParameter("f_name");
                String email = request.getParameter("emailID");
                String city_name = request.getParameter("city_name");
                String addres = request.getParameter("address");
                String phone = request.getParameter("phone");
                            
                
                String imgval="Enter Image value Correctly";
                    
                    session.setAttribute("user_name", user_name);
                    session.setAttribute("gender", gender);
                    session.setAttribute("f_name", f_name);
                    session.setAttribute("email", email);
                    session.setAttribute("city_name", city_name);
                    session.setAttribute("address", addres);
                    session.setAttribute("phone", phone);
                   // session.setAttribute("captcha",captcha);
                    session.setAttribute("imgval",imgval);
             response.sendRedirect("register_user.jsp");
              
            }
            
   }
   
   catch(Exception e)
   {
               String user_name = request.getParameter("user_name");
               // String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String f_name = request.getParameter("f_name");
                String email = request.getParameter("emailID");
                String city_name = request.getParameter("city_name");
                String addres = request.getParameter("address");
                String phone = request.getParameter("phone");
                String imgval="Enter Image value Correctly";
                    session.setAttribute("user_name", user_name);
                    session.setAttribute("gender", gender);
                    session.setAttribute("f_name", f_name);
                    session.setAttribute("email", email);
                    session.setAttribute("city_name", city_name);
                    session.setAttribute("address", addres);
                    session.setAttribute("phone", phone);
                    //session.setAttribute("captcha",captcha);
                    session.setAttribute("imgval",imgval);
             response.sendRedirect("register_user.jsp");
   }
            
%>

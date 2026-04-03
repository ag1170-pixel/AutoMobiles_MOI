<%@ page import="java.util.*,java.io.*,javax.mail.*,java.sql.*,javax.mail.internet.*,mailsend.*,javax.activation.*,javax.servlet.http.HttpSession" %>

<%      try
                    { 
                    
                    
         String userid=(String)session.getAttribute("User_id");



String recruiter_id1=(String)session.getAttribute("rec_id");
            String s="";
        //String username=request.getParameter("username");
        String email=request.getParameter("emailid");
       // String birthday=request.getParameter("birth_day");
       // String birthmon=request.getParameter("birth_month");
       // String birthyr=request.getParameter("birth_yr");
       // String dateofbirth=birthyr+"-"+birthmon+"-"+birthday;
        if( email==null )
				response.sendRedirect("user_login.jsp?fgfdgfdg=fdgfdgfdg");
               %>  
<%@ include file="ConnectDB.jsp" %>        
                <%
       Statement state= con.createStatement();
       //String s="select password from tb_registration where name='"+username+"' and email='"+email+"'";
       if(recruiter_id1==null&&userid!=null)
       {
        s="select Password, First_name from user_login where Email_id='"+email+"'";
          }
          else if(userid==null && recruiter_id1!=null )
              {
              
                s="select password, company_name from recruiter_login where email='"+email+"'";
              }
              
              else
                  {
                  
                  response.sendRedirect("user_login.jsp");
                  }
          ResultSet rs=state.executeQuery(s);   
          if(rs.next())
                {
                String name=rs.getString("First_name");
                String password=rs.getString("password");
                String loginpage="<a href='http://business.mapsofindia.com/'>http://business.mapsofindia.com/</a> ";
                String msgText = "Dear   " +name + ",<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Here is your Password information: <br><br><b>Username : </b>"+email+ "<br><b> Password : </b> "+password+"<br> <br>To login click  "+loginpage +" .<br> If the click does not work, please copy the link http://business.mapsofindia.com/ and paste it in the address bar of your browser window. <br><br> Regards, <br><br> business.mapsofindia.com Team   ";
                    
                String mailuser="videos@dilkholkebol.com";
                String mailpass="vid@23st";                
                String host="mail.dilkholkebol.com";
                String from="business@mapsofindia.com";
                String to=email;
                String msg=msgText;      
                
                
                Properties prop = System.getProperties();
                prop.put("mail.smtp.host", "mail.dilkholkebol.com");

                prop.put("mail.smtp.auth", "true");
                prop.put("mail.smtp.user", "videos@dilkholkebol.com");
                prop.put("mail.smtp.password", "vid@23st");

                Authenticator auth=new Authenticate(mailuser,mailpass);
                
                javax.mail.Session ses=javax.mail.Session.getInstance(prop,auth);
                ses.setDebug(true);
               
                    MimeMessage message=new MimeMessage(ses);
                    Address address=new InternetAddress(from);
                    message.setFrom(address);
                    Address addr=new InternetAddress(to);
                    message.addRecipient(Message.RecipientType.TO,addr);
                    message.setSubject("Forget Password");
                   // message.setText(msg);
                    message.setContent(msg,"text/html"); 
                    //out.print("send");
                    Transport.send(message);
                    //response.sendRedirect("user_login.jsp");
                    }
                    else
                        {
                        response.sendRedirect("forgotPass.jsp?fgfdgfdg=fdgfdgfdg");
                        }
                    }
                catch(Exception e)
                    {
        out.print(e.getMessage());
                    }	
    %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   
        
      <head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-6S2WJM8ZKC"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-6S2WJM8ZKC');
</script>
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        
        
        
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>
    
    <body>
        <%@ include file="header.jsp" %>
        <tr>
            
            <!-- center Panel starts -->
            <td width="777" valign="top">
                
                <table cellspacing="0" cellpadding="0" border="0" width="95%" align="center" height="220">
                    <br />
                    
                    
                    <tr>
                        <td  align="center" valign="middle">
                            <div class='thank2'><font color="#50B401"> Your password has been mailed to you.</font></div>
                            
                        </td>
                    </tr>
                    <tr>
                        <td  align="center" valign="top">
                            <h3><a href="user_login.jsp" ><font color="#BE2020">Click Here</font></a> to Login</h3>
                            
                        </td>
                    </tr>
                </table>
                
                <br><br>  
        </td></tr>
        <tr><td>
        <%@ include file="footer.jsp" %>    
        
           </td></tr>
        
    </body>
</html>

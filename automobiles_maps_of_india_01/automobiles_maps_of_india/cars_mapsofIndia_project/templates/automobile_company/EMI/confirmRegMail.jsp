
<%@ page import="java.util.*,java.io.*,javax.mail.*,java.sql.*,javax.mail.internet.*,mailsend.*,javax.activation.*,javax.servlet.http.HttpSession" %>
<%@ include file="ConnectDB.jsp" %>    

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
        <title>Registration Confirmation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="description" content="Registration Form - How to register new user free account, User registration form to register.">
        
        <meta name="keywords" content="Register, user login, registration, register new user, registration form, register to login, how to register, register to login">
        
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        
        <meta name="generator" content="editplus" />
        <meta name="author" content="" />
        
       
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        
        
        
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>
    
    <body>
      <%@include  file="header.jsp" %>

        <tr>
            
            
            <!-- center Panel starts -->
            <td width="677" valign="top">
                
                <table cellspacing="0" cellpadding="0" border="0" width="95%" align="center" height="400">
                    <br />
                    
                    
                    <tr>
                        <td  align="center">
                            <%    
                            String userId=request.getParameter("x");
                            Statement stmt = con.createStatement();
                            String query="select User_name,Password,Email_id from user_login where User_id='"+userId+"'";
                            //out.print(query);
                            ResultSet rs=stmt.executeQuery(query); 
                            String username=null;
                            String pass=null;
                            String emailID=null;
                            if(rs.next())
                            {
                            username=rs.getString("User_name");
                            pass=rs.getString("password");
                            emailID=rs.getString("Email_id");
                            }  
                            
                            session.setAttribute("User_Name",username);
                            session.setAttribute("Password",pass);
                            session.setAttribute("User_id",userId);
                            
                            out.print("<div class='thank'>  Thank You </div>");
                            out.print("<div class='thank2'> You have been successfully registered.</div>");
                            out.print("<div class='thank2'></div><br>");
                            out.print("<a href='findProducts.jsp'><img src='images/continue.gif' border='0'></a>");
                            
                            //out.print("<strong>Successfully registered.</strong><br><br>");
                            
                            // out.print("<strong>Confirmation mail is send to your Email Id....</strong><br><br>");
                            
                            // out.print("<a href='KConvert.jsp'>Click here to proceed </a>");
                            
                            //String pass=request.getParameter("password");
                            //String emailID=request.getParameter("email");
                            //out.print("----------------------------"+pass+"------"+emailID+"---------------");
                            
                            
                            /* String loginpage="<a href='http://jobzing.com/'>http://jobzing.com</a> ";
                            String msgText = "Dear "+username+ ", <BR><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Thanks for registering with us. " +
                            "Here is your registration information: <BR><br> <b>  Username: - </b>"  + username + "  <br> <b>Password: -</b> " + pass+ "  <BR> <br>    " +
                            " To login click  " +loginpage + " <BR><BR>  Regards,  <br><BR>jobzing.com Team";
                            
                            
                            
                            
                            String mailuser="videosmow";
                            String mailpass="videosmow@431#";                
                            String host="mail.mapsofworld.com";
                            String from="webmaster@jobzing.com";
                            String to=emailID;
                            String msg=msgText;      
                            
                            
                            Properties prop = System.getProperties();
                            prop.put("mail.smtp.host", "mail.mapsofworld.com");
                            
                            prop.put("mail.smtp.auth", "true");
                            prop.put("mail.smtp.user", "videosmow");
                            prop.put("mail.smtp.password", "videosmow@431#");
                            
                            Authenticator auth=new Authenticate(mailuser,mailpass);
                            
                            javax.mail.Session ses=javax.mail.Session.getInstance(prop,auth);
                            ses.setDebug(true);
                            
                            MimeMessage message=new MimeMessage(ses);
                            Address address=new InternetAddress(from);
                            message.setFrom(address);
                            Address addr=new InternetAddress(to);
                            message.addRecipient(Message.RecipientType.TO,addr);
                            message.setSubject("Registration Mail confirmation ");
                            // message.setText(msg);
                            message.setContent(msg,"text/html"); 
                            //out.print("send");
                            Transport.send(message);
                            
                            
                            
                            
                            /*  String loginpage="http://www.videos.mapsofworld.com/Convert/user_login.jsp?x="+userId;
                            String msgText = "Your username= "+username+" \n Password is: "+pass+"\n To login click on "+loginpage;
                            String mailuser="warofcricket";
                            String mailpass="war_cricket123";                
                            String host="mail.infobase.in";
                            String from="MapsofWorldVideos@infobase.in";
                            String to=emailID;
                            String msg=msgText;                
                            Properties prop=System.getProperties();
                            prop.put("mail.smtp.host",host);               
                            prop.put("mail.smtp.auth", "true");
                            //out.print(mailuser);
                            Authenticator auth=new Authenticate(mailuser,mailpass);
                            //out.print(auth+"-------++++++++++-----");
                            javax.mail.Session ses=javax.mail.Session.getDefaultInstance(prop,auth);
                            ses.setDebug(true);
                            try
                            {
                            MimeMessage message=new MimeMessage(ses);
                            Address address=new InternetAddress(from);
                            message.setFrom(address);
                            Address addr=new InternetAddress(to);
                            message.addRecipient(Message.RecipientType.TO,addr);
                            message.setSubject("check mail");
                            message.setText(msg);
                            // message.setContent("helloo","text/plain"); 
                            //out.print("send");
                            Transport.send(message);
                            }
                            catch(Exception e)
                            {
                            
                            }	
                            */
                            
                            %>
                            
                        </td>
                    </tr>
                </table>
                
            </td>
            
            
       
        
      </tr>
        
        <tr><td>
        
        <%@ include file="footer.jsp" %>       
        
                </td></tr>
        
    </body>
</html>

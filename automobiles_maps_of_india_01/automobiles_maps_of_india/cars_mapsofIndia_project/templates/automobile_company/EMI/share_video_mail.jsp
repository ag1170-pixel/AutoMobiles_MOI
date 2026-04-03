<%@ page import="java.util.*,java.io.*,javax.mail.*,java.sql.*,javax.mail.internet.*,mailsend.*,javax.activation.*,javax.servlet.http.HttpSession" %>
<%      
        String username=(String)session.getAttribute("User_Name");
        String email=request.getParameter("emailID");
        String link=request.getParameter("embed");
		int index=link.lastIndexOf("=");
		String browser=link.substring(index+1);

       //out.println(browser);
               
        try
      {
            
          %>  
<%@ include file="ConnectDB.jsp" %>        

    <%            
          
                //String password=rs.getString("Password");
               // String loginpage="http://www.videos.mapsofworld.com/user_login.jsp";
                String msgText = "Dear  Friend  ,<br>  <br>Find Various Car models and Loan details at <a href="+link+">" +  link +" </a> <br> <br>This site has been referred by  " +username + "<br> <br> Thanks, <br> automobiles.mapsofindia.com ";
                
               	              
                 String mailuser="videos@dilkholkebol.com";
                String mailpass="vid@23st";                
                String host="mail.dilkholkebol.com";
                String from="automobiles@mapsofindia.com";
               
                              
              
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
                    message.setSubject("Car and loans at automobiles.mapsofindia.com");
                   // message.setText(msg);
                    message.setContent(msg,"text/html"); 
                    //out.print("send");
                    Transport.send(message);
                    }
                 catch(Exception e)
                    {
                    out.print(e.getMessage());
                    }	
                    
                    response.sendRedirect("share.jsp?i=1&browser="+browser);
    %>
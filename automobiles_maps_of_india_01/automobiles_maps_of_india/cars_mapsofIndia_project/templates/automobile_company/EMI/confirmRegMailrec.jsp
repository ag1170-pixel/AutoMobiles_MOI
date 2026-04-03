
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
   <%@include  file="leftpanel.jsp" %>

<td width="4" class="vertical"></td>


		<!-- center Panel starts -->
<td width="677" valign="top">
        
        <table cellspacing="0" cellpadding="0" border="0" width="95%" align="center" height="400">
            <br />
           
            
            <tr>
                <td  align="center">
                    <%    
                    String recid=request.getParameter("x");
                    Statement stmt = con.createStatement();
                    String query="select company_name,password,email from recruiter_login where rec_id='"+recid+"'";
                 // out.print(query);
                    ResultSet rs=stmt.executeQuery(query); 
                    String comp_name=null;
                    String pass=null;
                    String rec_email=null;
                    if(rs.next())
                    {
                    comp_name=rs.getString("company_name");
                    pass=rs.getString("password");
                    rec_email=rs.getString("email");
                    }  
                    
                    
                    session.setAttribute("rec_id", recid);
                    session.setAttribute("rec_name", comp_name); 
                    
                    session.setAttribute("rec_email", rec_email); 
                    session.setAttribute("whois", "rec");  
                    
                     out.print("<div class='thank'>  Thank You </div>");
                    out.print("<div class='thank2'> You have been successfully registered.</div>");
                    out.print("<div class='thank2'></div><br>");
                    out.print("<a href='KConvert.jsp'><img src='images/continue.gif' border='0'></a>");
                    
                  
                    %>
                    
                </td>
            </tr>
        </table>
        
       </td>
                
                <td  valign="top"></td> 
            </tr>
            
            
            
        </table>
        
        <%@ include file="footer.jsp" %>       
        
    </body>
</html>

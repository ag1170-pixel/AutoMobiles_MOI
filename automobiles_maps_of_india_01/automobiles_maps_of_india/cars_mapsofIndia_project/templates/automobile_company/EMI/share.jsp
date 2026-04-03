<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include  file="ConnectDB.jsp" %>

<%
String username=(String)session.getAttribute("User_Name");
String userid=(String)session.getAttribute("User_id");


String rec_id=(String)session.getAttribute("rec_id");
if(username==null && rec_id==null) {
    response.sendRedirect("user_login.jsp");
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
        <title> Share </title>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="description" content="share products">

		<meta name="keywords" content="Share Products">

        <script  language="JavaScript" src="CheckScript.js"></script> 
         <script >
            function checkemail()
            {
            var x=0;
            if(document.register_user.emailID.value=="")
                    {
                    x=1;
                    alert("Please enter valid email address");
                    document.register_user.emailID.focus();
                    return false;
                    }
                    else
                    {
                    var email=document.register_user.emailID.value;                    
                    var emaillen=email.length;
                    //alert(email);
                    found=0;
                    dfound=0;
                    for(i=0;i<emaillen;i++)
                        {
                        var s=email.substring(i,i+1);
                        //alert(i+","+emaillen+s);
                       if(s==" " || s=="$" || s=="\\" ||  s=="%" || s=="&" || s=="*" || s=="(" || s==")" || s=="~" || s=="#" || s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||  s=="," || s=="?")
                        {
                        x=1;
                        alert("Please remove special characters from email address");
                       document.register_user.emailID.focus();
                        return false;
                        }
                        
                        if(s=="@")
                        {
                        found=1;
                        //alert(found);
                        }
                        else if(i==emaillen && found==0 )
                            {
                           alert("Email address is not valid");
                           x=1;
                            return false;
                            }
                       
                        if(s==".")
                        {
                        dfound=1;
                        }
                        else if(i==emaillen && dfound==0 )
                            {
                            x=1;
                           alert("Email address is not valid.");
                            return false;
                            }   
                            
                            if(i==emaillen-1) 
                            {
                               // alert(i+","+found+","+dfound);
                                if(found==1 && dfound==1 )
                              {
                            
                            }
                            else 
                            {
                            x=1;
                            alert("Please enter valid email address.");
                            document.getElementById("emailID").focus();
                            return false;
                            }
                            }
                        }
            }
            
            if(x==1)
            {
               return false;
            }
            else
            {
             document.register_user.action="share_video_mail.jsp";
             document.register_user.submit();
            }
            
            }
            
            
                          </script> 
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>  

<body>
 <%@include  file="header.jsp" %>            
 <tr>
 <!-- center Panel starts -->
 <td width="677" valign="top">
     
     
     <table cellspacing="0" cellpadding="0" border="0" width="98%">
     <tr>
         <td valign="top"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
         <td>                           
             <table cellspacing="0" cellpadding="0" border="0" width="100%" >
                 <tr> 
                     <td  class="inner-heading">     
                         
                         <%
                         String browser= (String)session.getAttribute("browser");
                         
                         %>
                         
                         <span class="featured"> </span> 
                     </td>
                 </tr>
                 
                 <tr>
                     <td class="upload-mid"> <br>
                         
                         
                         <form method="post" action="#" name="register_user">
                         
                         <table border="0" width="100%" >
                             <tr>
                                 <td valign="middle" align="center" height="60" >
                                     
                                     1. Send this link to your friends.
                                     
                                 </td>
                             </tr>
                             <tr>
                                 <td valign="middle" align="center" height="60" >
                                     <%
                                     ServletContext servletContext=getServletContext();
                                     StringBuffer UPLOAD_PATH=request.getRequestURL();
                                     int index=UPLOAD_PATH.lastIndexOf("/");
                                     String url=UPLOAD_PATH.substring(0,index);
                                     %>
                                     <input type="text" size="70" name="embed" value="<%=url%>/proddetail.jsp?cv=<%=browser%>"> 
                                 </td>
                             </tr>
                         </table>
                         
                         
                         <table border="0" width="100%">
                             <tr>
                                 <td valign="middle" align="center" height="30" >
                                     
                                     2. Enter your friend's email address.
                                     
                                 </td>
                             </tr>
                             <tr>
                                 <td valign="middle" align="center" height="80" >
                                     Email 
                                     <input type="text" name="emailID" value="" size="30">
                                     <script type="text/javascript">
                                                    <!--
                                                    document.write('<input type="button" value="Share Link" onclick="checkemail()">');
                                                    -->
                                     </script>
                                     <noscript> Please enable javascript </noscript> 
                                     
                                 </td>
                             </tr>
                             <tr>
                                 <td valign="middle" align="center" height="80" >
                                     <%
                                     if(request.getParameter("i")!=null)
                                     {
                                     %>
                                     <font size="2" color="red"><b> Email has been sent successfully.<b></font>
                                     <%}%>
                                 </td>
                             </tr>
                         </table>
                     </td>
                 </tr>
             </table>
             </form>  
             
             
             
             
         </td>
         
         
         <td  valign="top"><img src="images/inner-page-right-outline.gif" width="2" height="187" alt="" /></td>
     </tr>
     </table> 
 </td></tr>
 
 <tr><td>


	


<%@ include file="footer.jsp" %> 

 </td></tr>
</body>
</html>

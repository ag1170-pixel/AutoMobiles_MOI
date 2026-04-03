 <%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="ConnectDB.jsp" %>
<%

String recid=(String)session.getAttribute("rec_id");

if(recid==null) {
    response.sendRedirect("recruiter_login.jsp");
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
      <title>Change Password </title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    
    <meta name="generator" content="editplus" />
    <meta name="author" content="" />
    
    <link rel="shortcut-icon" href="http://www.mapsofworld.com/images/mapsofworld.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    
   <script  language="JavaScript" src="CheckScript.js"></script> 
        <script>     
        function checkpass()
        {
         var newpass=document.getElementById("new_pass").value;        
       
        var renewpass=document.getElementById("renew_pass").value;
        
        if(newpass=="")
        {
        alert("Please enter your new Password");
        return false;
        }
        
        var fname=newpass;

                    var fnamelen=fname.length;
                    if(fnamelen<6 )
                    {
                        alert("New Password should not be of less than 6 characters");
                        document.getElementById("new_pass").focus();
                        return false;
                    }
                    
                      for(j=0;j<fnamelen;j++)
                        {
                        var s=fname.substring(j,j+1);
                        if(s=="<"||s==">"||s==" " || s=="$" ||  s=="%" || s=="&" || s=="*" ||  s=="(" || s==")" || s=="~" || s=="#" || s=="." ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||  s=="," || s=="?")
                        {
                        alert("Please remove special characters from new password");
                        document.getElementById("new_pass").focus();
                        return false;
                        } 
                        }
        
       
         if(renewpass=="")
        {
        alert("Please enter your new password");
        return false;
        }
        
        
        
        //alert(old+oldpass);
        if(newpass!=renewpass)
        {
        alert("Reconfirm password does not match with new password.");
        return false;
        }
       
        if (newpass==renewpass)
        {    
        document.user_login.submit();
        return true;
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
           <br />   
           
           <table cellspacing="0" cellpadding="0" border="0" width="100%">
               <tr>
                   <td valign="top" align="right"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
                   <td>                           
                       <table cellspacing="0" cellpadding="0" border="0" width="100%" >
                           <tr> 
                               <td  class="inner-heading">     
                                   
                                   <span class="featured">Change Password </span> 
                               </td>
                           </tr>
                           
                           <tr>
                               <td> <br>
                                   
                                   <form name="user_login" action="PassChangeRec.jsp" method="post">
                                       
                                       <table  border="0" cellspacing="5" cellpadding="0" bgcolor="#F9F9F9" class="upload-mid"  align="center" width="98%">
                                           
                                           
                                           <tr>
                                               <td colspan="2" align="right">New password&nbsp;&nbsp;&nbsp;  </td>
                                               
                                               <td height="25" align="left"><input type="password" id="new_pass" size="20" name="new_pass"/></td>
                                           </tr>
                                           <tr>
                                               
                                               <td  colspan="2" align="right">Confirm new password &nbsp;&nbsp;&nbsp;</td>
                                               
                                               <td  height="30" align="left">
                                               <input type="password" id="renew_pass" name="renew_pass" size="20" /></td>
                                           </tr>
                                           <tr>
                                               
                                               
                                               <td align="center" colspan="3">
                                                   <br>
                                                   <script type="text/javascript">
                                                    <!--
                                                    document.write('<input type="button"  value="Change Password" onclick="return checkpass()"/> ');
                                                    -->
                                                   </script>
                                                   <noscript> Please enable javascript to change password. </noscript> 
                                                   
                                               </td>
                                           </tr>
                                           
                                       </table>
                                   </form>    
                                   
                                   
                               </td>
                               
                           </tr>
                       </table>
                       
                   </td>
                   
                   <td  valign="top"><img src="images/inner-page-right-outline.gif" width="2" height="187" alt="" /></td>
               </tr>
           </table> 
       </td>
   </tr>

    <tr><td>
            
            
            <%@ include file="footer.jsp" %> 
            
    </td></tr>
</body>
</html>


 



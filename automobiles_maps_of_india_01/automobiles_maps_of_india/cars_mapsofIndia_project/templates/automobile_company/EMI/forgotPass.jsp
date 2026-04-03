     <%@ include  file="ConnectDB.jsp" %>     
  
 
   
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

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
    <title> Forgot Password</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Forgot Password">
    
    <meta name="keywords" content="Forgot Password">
    
    <script  language="JavaScript" src="CheckScript.js"></script> 
    <script>
        
         function login2()
            { 
           var emailid=document.user_login.emailid.value;
           var len=emailid.length;
           if(len==0)
                        {
                       alert("Please Enter Email");
                       document.user_login.emailid.focus();
                       return false;
                        } 
                    var addspace=0; 
                    for(i=0;i<len;i++)
                        {
                        var s=emailid.substring(i,i+1);
                      
                        if( s=="," || s=="%" || s=="\\" || s=="(" || s==")" || s=="~" || s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" || s=="?"|| s=="<" || s==">")
                        {
                        alert("Special Characters not allowed !");
                        document.user_login.emailid.focus();
                        return false;
                        }  
                        if(s==" ")
                        {
                        addspace=addspace+1;
                        }
                        }
                        
                        if(addspace==len)
                    {
                       alert("Special Characters not allowed !");
                       document.user_login.emailid.focus();
                       return false;
                    }
                             
                        return true;
                        //document.user_login.action="login_check.jsp";
                       document.user_login.submit();
}
        
        
    </script>
     
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>  

<body>
<%@ include file="header.jsp" %>
<tr><td>
    
    
    <!-- center Panel starts -->
       
    <table cellspacing="5" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
    <tr>
        <td valign="top" width="1%">
            <%//@ include file="leftpanelcommon.jsp" %>
            
        </td>
        <td class="valign" width="75%">  
        <table cellspacing="0" cellpadding="0" border="0" width="98%">
            <tr>
            <td valign="top"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
            <td >               
                <table cellspacing="0" cellpadding="0" border="0" width="100%" >
                    <tr> 
                        <td  class="inner-heading">     
                            
                            <form name="user_login" action="forgotPassMail.jsp" method="post">
                            
                            <span class="featured">Forgot Password </span>
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="upload-mid"> <br>
                            
                            <%
                            if(request.getParameter("fgfdgfdg")!=null)
                            {
                            %>
                            <div class="text"> <font color="red"> Please fill all the information correctly. </font></div><br>
                            <%                         
                            }
                            
                            %>           
                            
                            <table border="0" width="100%" height="150" class="text4">
                                
                                <!--tr>
                                
                                <td  colspan="2" align="left">Username  </td>
                                
                                <td colspan="2" height="30" align="left">
                                <input type="text" name="username" /></td>
                            </tr-->
                                <tr>
                                    <td colspan="3" height="20"></td>
                                    
                                </tr>
                                <tr valign="top">
                                    
                                    <td align="left" width="45">Email :</td>
                                    
                                    <td align="left" width="50">
                                        <input type="text" name="emailid" id="emailid" />
                                    </td>
                                    <td align="left">
                                        <script type="text/javascript">
                                    <!--
                                            document.write('<input type="submit" name="submit" value="Get Password" onclick="return login2()" />');
                                    -->
                                        </script>
                                    </td>
                                    
                                </tr>
                                
                                
                                
                            </table>
                        </td>
                    </tr>
                </table>
                </form>  
                
                
                
                
            </td>
            
            
            <td  valign="top"></td>
        </tr>
    </table> 
</td>


<td valign="top" align="center">
    
    
    
</td>
</tr>
</table>	
</td></tr>
<tr><td>

<%@ include file="footer.jsp" %> 

</td></tr>
</body>
</html>


<%@ include  file="ConnectDB.jsp" %>



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
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="description" content="User Login to Dil Khol Ke Bol Videos - login to upload or download free videos and mobile clips .">

		<meta name="keywords" content="User login, login to Dil Khol Ke Bol Videos">
        <script  language="JavaScript" src="CheckScript.js"></script> 
        
        <script>
            
              function login2()
            {  
  
           var uname=document.user_login.uname.value;
           var len=uname.length;
           if(len==0)
                        {
                       alert("Please Enter Email");
                       document.user_login.uname.focus();
                       return false;
                        } 
                    var addspace=0; 
                    for(i=0;i<len;i++)
                        {
                        var s=uname.substring(i,i+1);
                      
                        if( s=="," || s=="%" || s=="\\" || s=="(" || s==")" || s=="~" || s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" || s=="?"|| s=="<" || s==">")
                        {
                        alert("Special Characters not allowed !");
                        document.user_login.uname.focus();
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
                       document.user_login.uname.focus();
                       return false;
                    }
                    
                    
                var pass=document.user_login.pass.value;
                    var len=pass.length;
                    if(len==0)
                        {
                         alert("Please Enter Password");
                         document.user_login.pass.focus();
                         return false;
                       }
                       var addspace=0;
                        for(i=0;i<len;i++)
                        {
                        var s=pass.substring(i,i+1);
                      
                        if( s=="," || s=="\\" || s=="(" || s==")" || s=="~" || s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" || s=="?"|| s=="<" || s==">")
                        {
                        alert("Special Characters not allowed !");
                        document.user_login.pass.focus();
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
                       document.user_login.pass.focus();
                       return false;
                    }
                        
                        return true;
                       
                       document.user_login.submit();
}
        </script>
        
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>  

<body>
    <%@include  file="header.jsp" %>
    <tr><td>
            <table cellspacing="5" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
                <tr>
                    <td valign="top" width="1%">
                        <%//@ include file="leftpanelcommon.jsp" %>
                        
                    </td>
                    <td class="valign" width="95%">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td valign="top" align="right"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
                                <td>                           
                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" >
                                        <tr> 
                                            <td  class="inner-heading">     
                                                
                                                <span class="featured">Admin Login </span> 
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td  align="center"> <form name="user_login"  method="post" action="rec_login_check.jsp">                    
                                                    <br><table border="0" cellspacing="0" cellpadding="10"    width="97%" class="upload-mid" >                        
                                                        
                                                        
                                                        <tr>    
                                                            <td align="center" width="35%" class="text4">Admin Email-Id</td>                            
                                                            
                                                            <td height="30" width="55%" align="left">                                
                                                            <input type="text" id="uname" name="uname" /></td>                            
                                                        </tr>                        
                                                        <tr>                            
                                                            <td align="center" class="text4">Password </td>                            
                                                            
                                                            <td height="25" align="left"><input type="password" id="pass" name="pass" /></td>                            
                                                        </tr>                        
                                                        <tr>                            
                                                            
                                                            <td>&nbsp;
                                                            </td>                            
                                                            <td align="left">
                                                                <script type="text/javascript">
                                            <!--
                                            document.write('<input type="submit" name="submit" value="Submit" onclick="return login2()"/>');
                                            -->
                                                                </script>
                                                            </td>                            
                                                        </tr>                        
                                                        <tr>                            
                                                            <td colspan="3" align="center">                                 
                                                                <% String s1  = request.getParameter("i");
                                                                if(s1!=null && s1.equals("0")) { %>                                
                                                                <span class="text4"><font color="#F00000">  <strong>Invalid admin username or password. Please try again.</strong></font></span>                               
                                                                <%                                
                                                                }                                
                                                                %>
                                                            </td>   
                                                        </tr>
                                                             
                                                    </table>
                                                </form>
                                                
                                                
                                                
                                                
                                            </td>
                                            
                                        </tr>
                                    </table>                                       
                                    <td  valign="top"></td>
                                    
                            </td></tr>
                        </table>
                    </td>
                    <td valign="top" width="1%" align="center">
                        
                        
                        
                    </td>
                </tr>
            </table>	
    </td></tr>
    
    <tr><td>
            
            
            
            <%@ include file="footer.jsp" %> 
    </td></tr>
</body>
</html>

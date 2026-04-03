
<%@ page import="java.sql.*" %>
<%@ include file="ConnectDB.jsp" %>
<%

String password = (String)session.getAttribute("password");
String comp_name =(String) session.getAttribute("comp_name");
String comp_desc =(String) session.getAttribute("comp_desc");
String email = (String)session.getAttribute("email");
String city_name =(String)session.getAttribute("city_name");
String address = (String)session.getAttribute("address");
String phone =(String) session.getAttribute("phone");
//String captcha=(String)session.getAttribute("captcha");
String imgval=(String) session.getAttribute("imgval");
if(comp_name==null)comp_name="";
if(password==null)password="";

if(email==null)email="";
if(imgval==null)imgval="";
if(city_name==null)city_name="";
if(address==null)address="";
if(phone==null)phone="";
if(comp_desc==null)comp_desc="";

//if(captcha==null)captcha="";
// if(user_name==null)user_name="";
// if(user_name==null)user_name="";

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
        <title>Register New User, How to Register for Free User Account and Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="description" content="Registration Form - How to register new user free account ">
        
        <meta name="keywords" content="Register, user login, registration, register new user, registration form, register to login, how to register, register to login">
        
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        
        <meta name="generator" content="editplus" />
        <meta name="author" content="" />
        
      
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        <!--<script  language="JavaScript" src="recchkscript.js"></script> -->
        <script>
            function checkRegister()
                {

                var username=document.getElementById("f_name").value;
            
                if(username=="")
                    {
                     alert("Please enter Company Name");
                     document.getElementById("f_name").focus();
                     return false;
                    }
                

                if(document.register_user.password.value=="")
                    {
                    alert("Please enter password");
                    document.register_user.password.focus();
                    return false;
                    }
                    var pass=document.register_user.password.value;
                    var passlen=pass.length;
                    if(passlen<6 )
                        {
                        alert("Password should be of more than 5 characters");
                        document.register_user.password.focus();
                        return false;
                        }

                    var j=0;

                       for(j=0;j<passlen;j++)
                        {
                        var s=pass.substring(j,j+1);
                        if(s==" "|| s=="/" )
                        {
                        alert("Please remove special characters from  password");
                        document.getElementById("password").focus();
                        return false;
                        }      
                           
                        }

                            
                    var repassword=document.register_user.repassword.value;
                    var passowrd=  document.register_user.password.value;   

                    if(passowrd!=repassword)
                    {
                    alert("Reconfirm password does not match with password.");
                        document.register_user.repassword.focus();
                        return false;
                    }

                  
                 
                                  

               
               
					
              if(document.register_user.emailID.value=="")
                    {
                    alert("Please enter a valid email address");
                    document.register_user.emailID.focus();
                    return false;
                    }
                    var email=document.register_user.emailID.value;
                    var index11=email.lastIndexOf(".");
                    var index12=email.lastIndexOf("@"); 
                    var emaillen=email.length;
                    if( (emaillen<8) ||  (index12<2) )
                        {
                            alert("Please enter a valid email address");
                            return false; 
                        }
                        
                   
                    //alert(email);
                    found=0;
                    dfound=0;
						var count=0;
                    for(i=0;i<emaillen;i++)
                        {
                        var s=email.substring(i,i+1);
                        //alert(i+","+emaillen+s);
                       if(s==" " || s=="$" || s=="\\" ||  s=="%" || s=="&" || s=="*" ||  s=="-" || s=="(" || s==")" || s=="~" || s=="#" || s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||  s=="," || s=="?")
                        {
                        alert("Plesae remove special characters from email address");
                        document.getElementById("emailID").focus();
                        return false;
                        }
                        
                        if(s=="@")
                        {
                        found=1;
						count=count+1;
                        //alert(found);
                        }
                        else if(i==emaillen && found==0 )
                            {
                           alert("Please enter a valid email address");
                            return false;
                            }
                       if(count > 1)
                            {
                           alert("Please enter a valid email address");
                            return false;
                            }
                        if(s==".")
                        {
                        dfound=1;
                        }
                        else if(i==emaillen && dfound==0 )
                            {
                           alert("Please enter a valid email address");
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
                            alert("Please enter a valid email address");
                            document.getElementById("emailID").focus();
                            return false;
                            }
                            }
                        } 
		
             
                        var y=document.register_user.vtext.value;
                        if(y=="")
                        {
			  alert("Please enter verification code");
			   document.register_user.vtext.focus();
                          return false;
                        }  
                    
                   
                        var x=document.getElementById("result").value;
                        

                        if(x=="Email Id already registered")
                        {
                          alert("Email Id already registered.");
                          return false;
                        }
   
                       
                }

                 
function usercheck()
          {
               //alert("adsfgs");
               var usn=document.getElementById("emailID").value;
               var len=usn.length;
                if(usn=="")
                  {
                   alert("Please enter email");
                   document.getElementById("emailID").focus();
                    return false;
                  }
                  else if(len <6 )
                  {
                   alert("Email should be of more than 5 characters");
                   document.getElementById("emailID").focus();
                   return false;

                  }
                  

                if(window.XMLHttpRequest)
                    {
                    var xmlhttp=new XMLHttpRequest();
                    }
                if(window.ActiveXObject)
                    {
                    var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }


                 var username=document.getElementById("emailID").value;
                 
                 
                

                 var url="reccheck.jsp?email="+username;
               
                 xmlhttp.open("GET",url,true);
                 xmlhttp.onreadystatechange=getresponse;
                 xmlhttp.send(null);
                 function getresponse()
                    {
                    if(xmlhttp.readyState==4)
                    {
                        if(xmlhttp.status==200)
                            {
                           
                        
                       document.getElementById("exist").innerHTML=xmlhttp.responseText;
                        var x=xmlhttp.responseText;
                         
                                if(x=="Email Id already registered.")
                                    {
                                     
                                    return false;
                                    }                        
                            }
                             else
                                {
                                //alert(xmlhttp.status);
                                }
                    }
                    }
                 
        }


        function offsub()
        {
        
        document.register_user.check1.checked=false;
        
        document.register_user.submit1.disabled=true;
        }
        
          function agree(){
if(document.register_user.check1.checked==true)
{
document.register_user.submit1.disabled=false;
}
else
{
document.register_user.submit1.disabled=true;
}

}
        
             function ismaxlength(obj){
var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
if (obj.getAttribute && obj.value.length>mlength)
obj.value=obj.value.substring(0,mlength)
}
        
        
        </script>
        
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>
    
    <body>
<%@include  file="header.jsp" %>
<%@include  file="leftpanel.jsp" %>

<td width="4" class="vertical"></td>


		<!-- center Panel starts -->
<td width="677" valign="top">
        
       
        <table cellspacing="0" cellpadding="0" border="0" width="95%" align="center">
            <br />
            <tr>
                <td valign="top">
                    <img src="images/inner-page-left-outline.gif"  alt="" align="right"/>
                </td>
                <TD  class="inner-heading">
                    
                    <span class="featured">Sign Up</span>
                    
                    
                    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                        
                        <tr>
                            <td width="99%" ><br><br>
                                <form name="register_user" action="register_rec_check.jsp" method="post"  onsubmit="return validate_form()">
                                <table cellspacing="4" cellpadding="3" border="0" width="95%" align="left" style="border: 1px solid #E8E8E8" bgcolor="#F9F9F9" class="text4">
                                  <!--  <tr>
                                        <td width="149" height="30" align="left" > <font color='red'>*</font>Username</td>
                                        <td width="2">&nbsp;</td>
                                        <td width="249" align="left">
                                           
                                        </td>
                                        
                                    </tr>-->
                                    
                                   <tr>
                                        <td height="30" align="left" class="form_text"><font color='red'>*</font>Company Email </td>
                                        <td>&nbsp;</td>
                                        <td align="left"><input type="text" id="emailID" name="emailID" maxlength="75" value="<%=email%>"  onblur="return usercheck()"  onchange="offsub()"/>
                                        <input type="hidden" name="user_name" value="<%=comp_name%>" id="user_name" maxlength="18"  />
                                        <div id="exist"></div>
                                    
                                    
                                    </td>
                                    </tr>
                                    <tr>
                                        
                                        
                                        <td width="149" height="30" align="left" class="form_text"> <font color='red'>*</font>Password
                                        </td>
                                        <td width="2">&nbsp;</td>
                                        <td width="249" align="left">
                                            <style type="text/css">
                                                <!--
div#strengthmeter { width: 300px; height: 10px; }
div#strengthmeter div { width: 200px; height: 10px; background: #e7e8e; float: left; }
div#strengthmeter div #strengthbar { width: 0px;  background: #000; }
                                                -->
                                            </style>
                                            
                                            
                                            <script type="text/javascript">
<!--
var minimum = 4;
var fair = 6;
var mid=10;
var strength_label = Array( '','Too short', 'Weak', 'Fair', 'Good', 'Strong', 'Very Strong' );
var strength_color = Array( '','#FF0000', '#FF9900', '#FFCC33', '#99CC99', '#00CC33', '#006600' );
var strength_width = Array( '0','10', '20', '30', '50', '75', '100' );
function updatestrength( pw )
{

var dw=document.getElementById('password').value.toString();
if(dw=="")
{
 
 strength=0;

}
else
{
var strength = 0;


if(!pw){ var pw = document.getElementById('password').value.toString(); }
if(!pw){ return false; }
if( pw.length >= minimum ) {
strength = 1;
if(pw.length >= fair){
strength++;
}
if(pw.length >= mid){
strength++;
}

if(/\d+/g.test(pw)){
strength++;
}
if(/\W+/g.test(pw)){
strength++;
}
if(/[a-z]+/g.test(pw) && /[A-Z]+/g.test(pw)){
strength++;
}


}

}
document.getElementById('strength').innerHTML = strength_label[ strength ] ;//+ ' ' + strength;
document.getElementById('strengthbar').style.backgroundColor = strength_color[ strength ];
document.getElementById('strengthbar').style.width = strength_width[ strength ]+'%';

}
//-->
                                            </script>
                                            <input type="password" name="password" id="password" value="" onkeyup="updatestrength();"    maxlength="20" />
                                            <div id="strengthmeter"><div><div id="strengthbar" ></div></div><p id="strength"></p></div> 
                                            
                                            
                                           
                            
                            
                            
                                        </td>
                                        <td colspan="2"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td width="149" height="30" align="left" class="form_text"> <font color='red'>*</font>Confirm Password
                                        </td>
                                        <td width="2">&nbsp;</td>
                                        <td width="249" align="left"><input type="password" value="" name="repassword" id="repassword" maxlength="50" /></td>
                                       
                                    </tr>
                                    
                                    
                                    
                                    <tr>
                                        <td width="149" height="30" align="left" class="form_text"> <font color='red'>*</font>Company Name</td>
                                        <td >&nbsp;</td>
                                        <td width="249" align="left"><input type="text" value="<%=comp_name%>" name="f_name" id="f_name" maxlength="25"  accept="text"/></td>
                                    </tr>
                                    
                                   
                                    <tr>
                                        <td height="30" align="left" class="form_text"><font color='red'>*</font>Location </td>
                                        <td>&nbsp;</td>
                                        <td align="left">  <input name="city_name"  value="<%=city_name%>" id="city_name" id="city_name" maxlength="25">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" align="left" class="form_text"><font color='red'>*</font>Address </td>
                                        <td>&nbsp;</td>
                                        <td align="left"> <textarea name="address" id="address"  maxlength="250" onkeyup="return ismaxlength(this)" ><%=address%></textarea> <br>Max. 250 characters.</td>
                                    </tr>
                                    <tr>
                                        <td height="30" align="left" class="form_text">Phone </td>
                                        <td>&nbsp;</td>
                                        <td align="left"><input type="text" name="phone"  value="<%=phone%>" id="phone" maxlength="15"/></td>
                                    </tr>
                                    
                                    <tr>
                                        <td height="30" align="left" class="form_text">About Company :  </td>
                                        <td>&nbsp;</td>
                                        <td align="left"><textarea cols="40" rows="10" name="comp_desc" id="comp_desc" maxlength="500" onkeyup="return ismaxlength(this)"><%=comp_desc%></textarea><br> Max. 500 characters.</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td align="left">&nbsp;&nbsp;&nbsp;<img src="ImageGenerator.jsp"><div id="imgex"><font color="red" size="2"><%=imgval%></font></div></td>
                                    </tr>                    
                                    <tr>
                                        <td height="30" align="left" class="form_text"><font color='red'>*</font>Verification </td>
                                        <td>&nbsp;</td>
                                        <td width="30" align="left"><input type ="text" id="vtext" name="vtext" size="10"></td>
                                    </tr>
                                    
                                    
                                    <tr>
                                        <td height="30" align="left" class="form_text" colspan='3'> <strong><input type="checkbox" name="check1" onclick="agree()">
                                                I agree to abide by business.mapsofworld.com <A HREF="terms.html" 
                                                                                            onClick="return popup(this, 'terms')">Terms of use</A>
                                        </strong></td>
                                    </tr>
                                    
                                   
                                    <tr>
                                        <td height="30">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td align="left">
                                            
                                            <script type="text/javascript">
<!--
document.write('<input type="submit" name="submit1" value="Submit" disabled="true" onmouseover="return usercheck()"   onclick="return checkRegister()"/>');
-->
                                            </script>
                                            <noscript> Please enable javascript for registration </noscript>&nbsp;&nbsp;&nbsp;
                                            <input type="reset" value="Reset">
                                            
                                        </td>
                                    </tr>     
                                </table>
                                
                            </td>
                           
                
                <td  valign="top"></td> 
            </tr>
            
            
            
        </table>
        
        </td>
                
                <td  valign="top"></td> 
            </tr>
            
            
            
        </table>
         
        
        
        <%@ include file="footer.jsp" %>       
        
    </body>
</html>

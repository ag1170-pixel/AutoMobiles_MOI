//--------------------------------upload.jsp submit-----------------------------
 
function checkEx()
            {  
		
            //alert("here");
            var filename=document.upform.uploadfile.value;
			if(filename=="")
				{
				alert("Please select a video");
				return false;
				}

            var category=document.upform.cats.selectedIndex;
            if(category==0)        
                {
                alert("Please select a category");
                return false;
                }
			//alert(filename.length);   
			
            var i=filename.lastIndexOf(".");

            var last=filename.length;
            var extention=filename.substring(i,last);
            //alert("Formatting extention="+extention);

            if(extention==".mpe" ||extention==".mov" || extention==".avi" || extention==".mpg" || extention==".mpeg" || extention==".wmv"|| extention==".vob"|| extention==".asf"|| extention==".asx"||  extention==".3gp"|| extention==".rm"|| extention==".mp3" || extention==".wav" ||extention==".flv" ||extention==".wma")
            {
            document.getElementById("images").style.display="block";
			document.upform.submit();
            return true;
            }
            else if(filename=="" && document.upform.action=="update.jsp")
                    {                    
                    return true;                   
                    } 
            else        
            {
            alert("Please select a video file only");
            return false;
               
            }
		}
//------------------------------------------------------------------------------------------------------
            function checkRegister()
                {

                var username=document.getElementById("f_name").value;
               // alert(username);
                if(username=="")
                    {
                     alert("Please enter name");
                     document.getElementById("f_name").focus();
                     return false;
                    }
                else
                    {
                    var len=username.length;

                     if(len<3)
                     {
                        alert("Name should be of more than 3 characters ");
                        document.getElementById("f_name").focus();
                        return false;
                     }
                    var namespace=0;
                    for(i=0;i<len;i++)
                        {
                        var s=username.substring(i,i+1);
                        //alert(s);
                        if(s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="_" || s=="\\" || s=="-" || s=="(" || s==")" || s=="~" || s=="#" || s=="." ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||  s=="," || s=="?")
                        {
                        alert("Please remove special characters from name");
                        document.getElementById("f_name").focus();
                        return false;
                        }  

                        if(s==" ")
                        {

                        namespace=namespace+1;
                        }
                        }

                        if(namespace==len)
                        {
                        alert("Please enter valid  name");
                        document.getElementById("f_name").focus();
                        return false;
                        }


                    
                    
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

                  
                 
                    var gender=0;
                    for (var p=0; p<document.register_user.gender.length; p++)
                    { 
                    if (document.register_user.gender[p].checked == true) 
                    { 
                       gender=1;
                     }


                     }
                   if(gender==0)
                   {
                    alert("Please select gender"); 
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
		if(document.register_user.emailID.value.length>40)
                    {
                    alert("Email address should not be of more than 40 characters");
                    document.register_user.emailID.focus();
                    return false;
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
                 
                 
                

                 var url="usercheck.jsp?username="+username;
               // alert(url);
                 xmlhttp.open("GET",url,true);
                 xmlhttp.onreadystatechange=getresponse;
                 xmlhttp.send(null);
                 function getresponse()
                    {
                    if(xmlhttp.readyState==4)
                    {
                        if(xmlhttp.status==200)
                            {
                            //alert("dasfgasfg");
                        
                       document.getElementById("exist").innerHTML=xmlhttp.responseText;
                        var x=document.getElementById("result").value;
                     
                                if(x=="Email Id already exists")
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
                   // }
        }


//-------------------------------ShowVideoImage.jsp back link and paging --------------------------------------------

    
    function Paging(ids)
    {
//alert(ids);

var user=document.getElementById("userid").value;
var admin=document.getElementById("admin").value;

//alert("user"+user);
//alert("upass"+upass);
//alert("admin"+admin);
   

            //alert("adsfgs");
                if(window.XMLHttpRequest)
                    {
                    var xmlhttp=new XMLHttpRequest();
                    }
                if(window.ActiveXObject)
                    {
                    var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }                 
                var button=ids;
                 if(button=="1")
                    {
                    button=1;   
                    }
                    else
                    {
                    button=ids;
                    //alert("button"+button);
                    }
//alert("button"+button);
                    if(user=="no")
                    {
                    var url="Admin_Video_paging.jsp?button="+button+"&Adminid="+admin;
                    }
                    else
                        {
                        var url="Video_paging.jsp?button="+button+"&username="+user;
                        }                        
              //alert(url);
                 xmlhttp.open("GET",url,true);
                 xmlhttp.onreadystatechange=getresponse;
                 xmlhttp.send(null);
                 function getresponse()
                    {
                    if(xmlhttp.readyState==4)
                        {
                        if(xmlhttp.status==200)
                            {
                            //alert("dasfgasfg");
                        
                       document.getElementById("videoPaging").innerHTML=xmlhttp.responseText;
                        
                            }
                            else
                                {
                                //alert(xmlhttp.status);
                                 }
                        }
               
                    }
    }
    
 function NewsPaging(ids)
    {
//alert(ids);

var user=document.getElementById("userid").value;
var admin=document.getElementById("admin").value;

//alert("user"+user);
//alert("upass"+upass);
//alert("admin"+admin);
   

            //alert("adsfgs");
                if(window.XMLHttpRequest)
                    {
                    var xmlhttp=new XMLHttpRequest();
                    }
                if(window.ActiveXObject)
                    {
                    var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }                 
                var button=ids;
                 if(button=="1")
                    {
                    button=1;   
                    }
                    else
                    {
                    button=ids;
                    //alert("button"+button);
                    }
//alert("button"+button);
                    if(user=="no")
                    {
                    var url="Admin_NewsVideo_paging.jsp?button="+button+"&Adminid="+admin;
                    }
                    else
                        {
                        var url="Video_paging.jsp?button="+button+"&username="+user;
                        }                        
              //alert(url);
                 xmlhttp.open("GET",url,true);
                 xmlhttp.onreadystatechange=getresponse;
                 xmlhttp.send(null);
                 function getresponse()
                    {
                    if(xmlhttp.readyState==4)
                        {
                        if(xmlhttp.status==200)
                            {
                            //alert("dasfgasfg");
                        
                       document.getElementById("videoPaging").innerHTML=xmlhttp.responseText;
                        
                            }
                            else
                                {
                                //alert(xmlhttp.status);
                                 }
                        }
               
                    }
    }

//-----------------------------------------------------------------

    function rating()
          {
              
                if(window.XMLHttpRequest)
                    {
                    var xmlhttp=new XMLHttpRequest();
                    }
                if(window.ActiveXObject)
                    {
                    var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
var userid=document.frm.user.value;
//alert(userid);
                if(userid=="null")
                    {
                     alert("Please login to rate this video");
                   // window.open("user_login.jsp?fav=1","_Parent","");
                   return false;
                    }
                else
                    {
                    //alert("here");
                    var urls="AddRate.jsp?rate="+a+"&userid="+userid+"&VideoID="+videoid;
                    xmlhttp.open('GET',urls,true);
                   //alert(urls);
                   
                   xmlhttp.onreadystatechange=getResp;
                   
                    xmlhttp.send(null);
                    return true;
                    }
                    function getResp()
                        {//
                        if(xmlhttp.readyState==4)
                            {
                            if(xmlhttp.status==200)
                                {
                                //alert(xmlhttp.readyState);
                         
                                document.getElementById("ratemessage").innerHTML=xmlhttp.responseText;
                        
                                }
                            else
                                {
                                //alert(xmlhttp.readyState);
                                }
                            }
                        }
               
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

function popup(mylink, windowname)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == 'string')
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname,'width=900,height=550,scrollbars=yes');
return false;
}


function givevalue()
{
  if(document.register_user.newsletter.checked=="true")
    {
        document.register_user.newsletter.value="yes";
    }
else
  {
   document.register_user.newsletter.value="no";

   }



}



function adminrating()
          {

              //alert("rating call");
                if(window.XMLHttpRequest)
                    {
                    var xmlhttp=new XMLHttpRequest();
                    }
                if(window.ActiveXObject)
                    {
                    var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                  var userid=document.frm.user.value;
                 //alert(userid);
                if(userid=="null")
                    {
                     alert("Please login to rate this video");
                  
                   return false;
                    }
                else
                    {
                    //alert("here");
                    var urls="rating.jsp?rate="+a+"&userid="+userid+"&VideoID="+videoid;
                    // alert(urls);
                    xmlhttp.open('GET',urls,true);
               
                   
                   xmlhttp.onreadystatechange=getResp;
                   
                    xmlhttp.send(null);
                    return true;
                    }
                    function getResp()
                        {//
                        if(xmlhttp.readyState==4)
                            {
                            if(xmlhttp.status==200)
                                {
                                //alert(xmlhttp.readyState);
                         
                                document.getElementById("ratemessage").innerHTML=xmlhttp.responseText;
                        
                                }
                            else
                                {
                                //alert(xmlhttp.readyState);
                                }
                            }
                        }
               
                    }
              


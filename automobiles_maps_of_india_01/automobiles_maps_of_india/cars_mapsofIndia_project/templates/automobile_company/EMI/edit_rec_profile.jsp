<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="ConnectDB.jsp" %>


<%
try
{

String recid=(String)session.getAttribute("rec_id");

Statement state=con.createStatement();
ResultSet rs=null;
String query="select * from recruiter_login where rec_id='"+recid+"'";

rs=state.executeQuery(query);

String password = "";
String comp_name ="";
String comp_desc ="";
String email = "";
String city_name ="";
String address = "";
String phone ="";
String website="";
while(rs.next()) 
    {
    comp_name=rs.getString("company_name"); if(comp_name==null)comp_name="";
    comp_desc=rs.getString("company_desc");if(comp_desc==null)comp_desc="";
    email=rs.getString("email");if(email==null)email="";
    city_name=rs.getString("company_location");if(city_name==null)city_name="";
    
    address=rs.getString("address");if(address==null)address="";
    phone=rs.getString("contact_no");if(phone==null)phone="";
    comp_desc=rs.getString("company_desc");if(comp_desc==null)comp_desc="";
    website=rs.getString("company_website");if(website==null)website="";
    } //out.print(country);
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
        <title>Edit profile</title>
        <script  language="JavaScript" src="CheckScript.js"></script> 
        <script>
           
            
            function checkRegister()
                {
                 
                  if(document.getElementById("fname").value=="")
                    {
                    alert("Please enter Company name");
                    document.frm.fname.focus();
                    return false;
                    }
                    var fname=document.getElementById("fname").value;

                    var fnamelen=fname.length;
                    
                    if(fnamelen<3)
                    {
                       alert("Name should be of more than 2 characters ");
                        document.getElementById("fname").focus();
                        return false;
                    
                    }
                      var namespace=0;
                      for(j=0;j<fnamelen;j++)
                        {
                        var s=fname.substring(j,j+1);
                        if(s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="_" || s=="-" || s=="(" || s==")" || s=="~" || s=="#" || s=="." ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||  s=="," || s=="?")
                        {
                        alert("Please remove special characters from your name");
                        document.getElementById("fname").focus();
                        return false;
                        }      
                       if(s=="1" || s=="2" || s=="3" || s=="4" || s=="5" || s=="6" || s=="7" || s=="8" || s=="9" || s=="0")
                        {
                        alert("Please remove numbers from your name");
                        document.getElementById("fname").focus();
                        return false;
                        }   
                        
                         if(s==" ")
                        {
                        namespace=namespace+1;
                        }
                        }
                        if(namespace==fnamelen)
                        {
                        alert("Please enter valid  name");
                        document.getElementById("f_name").focus();
                        return false;
                        }   			
                    if(document.frm.emailID.value=="")
                    {
                    alert("Please enter a valid email address");
                    document.frm.emailID.focus();
                    return false;
                    }
                    var email=document.frm.emailID.value;
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
                       if(s==" " || s=="$" || s=="\\" ||  s=="%" || s=="&" || s=="*" ||  s=="(" || s==")" || s=="~" || s=="#" || s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||  s=="," || s=="?")
                        {
                        alert("Please remove special characters from email address");
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
		  if(document.frm.emailID.value.length>40)
                    {
                    alert("Email address should not be of more than 40 characters");
                    document.frm.emailID.focus();
                    return false;
                    }			
	
               


                if(document.frm.city.value=="")
                    {
                    alert("Please enter city name");
                    document.frm.city.focus();
                    return false;
                    }

		    if(document.frm.city.value.length>40)
                    {
                    alert("City name should not be of more than 40 characters");
                    document.frm.city.focus();
                    return false;
                    }
                    
                    var city=document.getElementById("city").value;
                    var fnamelen=city.length;
                    var cityspace=0;
                      for(j=0;j<fnamelen;j++)
                        {
                        var s=city.substring(j,j+1);
                       if(s=="$" || s=="@" || s=="%" ||  s=="*" ||  s=="~" || s=="#" ||   s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" ||   s=="?" || s=="1" || s=="2"|| s=="3" || s=="4"|| s=="5" || s=="6"|| s=="7" || s=="8"|| s=="9" || s=="0" )
                        {
                        alert("Please remove special characters from city name");
                        document.getElementById("city").focus();
                        return false;
                        }    
                         if(s==" ")
                        {
                        cityspace=cityspace+1;
                        }
                                                  
                        }
                        
                    if(cityspace==fnamelen)
                    {
                        alert("Please enter valid city name");
                        document.getElementById("city").focus();
                        return false;
                    }
               
		 if(document.frm.address.value=="")
                    {
                    alert("Please enter valid address");
                    document.frm.address.focus();
                    return false;
                    }
                    
                    var addname=document.frm.address.value;
                   var fnamelen=addname.length;
                   var addspace=0;
                      for(j=0;j<fnamelen;j++)
                        {
                        var s=addname.substring(j,j+1);
                        if(s=="$" || s=="@" || s=="%" ||  s=="*" ||  s=="~" || s=="#" ||   s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" ||   s=="?" )
                        {
                        alert("Please remove special characters from address");
                        document.getElementById("address").focus();
                        return false;
                        }      
                          
                        if(s==" ")
                        {
                        addspace=addspace+1;
                        }
                        }
                    if(addspace==fnamelen)
                    {
                        alert("Please enter valid address");
                        document.getElementById("address").focus();
                        return false;
                    }
                    
                if(document.frm.phone.value!="")
		{
 			if(isNaN(document.frm.phone.value))
                    	{
                    		{
				alert("Please enter valid phone number");
                    		document.frm.phone.focus();
                    		return false;
                    		}
                   
                    	}  
			 else
			{
				var x=document.frm.phone.value;
				//alert((x.length)>15);
				if((x.length)>15)
				{
				alert("Please enter valid phone number");
                    		document.frm.phone.focus();
                    		return false;
				}							
			}                    
                    } 
             
				
                   var phonevalid=document.frm.phone.value;
                   var fnamelen=phonevalid.length;

                      for(j=0;j<fnamelen;j++)
                        {
                        var s=phonevalid.substring(j,j+1);
                        if(s=="-")
                        {
                        alert("Please enter  valid phone number");
                        document.getElementById("phone").focus();
                        return false;
                        }      
                          
                        }
                    
                   document.frm.submit();
                   return true;
                   
                }
        </script>
      
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>     

<body >
 <%@include  file="header.jsp" %>            
<%@include  file="leftpanel.jsp" %>

<td width="4" class="vertical"></td>


		<!-- center Panel starts -->
<td width="677" valign="top"> 
<table cellspacing="5" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
<tr>

<td class="valign" width="95%">
    <table cellspacing="0" cellpadding="0" border="0" width="98%">
    <tr>
        <td valign="top"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
        <td>                           
        <table cellspacing="0" cellpadding="0" border="0" width="100%" >
            <tr> 
                <td  class="inner-heading">     
                    
                    <span class="featured">Company Profile </span> 
                </td>
            </tr>
            
            <tr>
            <td> <br>
                <form action="editRecProfile.jsp" method="get" name="frm">
                <table  border="0" cellspacing="5" cellpadding="0"bgcolor="#F9F9F9" class="upload-mid"  align="left" width="98%">
                                                  <tr>
                                                 <td height="25"  colspan="2"   > Fields marked with (<font color='red'>*</font>) are mandatory. </td>
                                                 </tr>
                                                    <tr>
                                                        <td width="110" height="25"  class="table_td" align="left"><font color='red'>*</font>Company Name  </td>
                                                     
                                                        <td  class="table_td" align="left"> <input type="text" name="fname" id="fname" value="<%= comp_name %>"></td>
                                                    </tr>
                                                    
                                                   
                                                   
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left"><font color='red'>*</font>E-mail  </td>
                                                    
                                                        <td class="table_td" align="left"> <input type="text" name="emailID" id="emailID" value="<%= email %>" readonly size="50"></td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left"><font color='red'>*</font>Location:   </td>
                                                     
                                                        <td class="table_td" align="left"> <input type="text" name="city" id="city" value="<%= city_name %>"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left"><font color='red'>*</font>Address  </td>
                                                     
                                                        <td class="table_td" align="left"><textarea name="address"  value="<%=address%>"><%= address %></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left">Phone  </td>
                                                     
                                                        <td class="table_td" align="left"><input type="text" name="phone" id="phone" value="<%= phone %>" maxlength="15"></td>
                                                    </tr>
                                                    
                                                     <tr>
                                                        <td height="25"  class="table_td" align="left">Company Website  </td>
                                                     
                                                        <td class="table_td" align="left"><input type="text" name="website" id="website" value="<%= website %>" maxlength="15"></td>
                                                    </tr>
                                                    
                                                    
                                                    <tr>
                                                        <td height="30" align="left" class="form_text">About Company :  </td>
                                                        
                                                        <td align="left"><textarea cols="40" rows="10" name="comp_desc" id="comp_desc" maxlength="500" onkeyup="return ismaxlength(this)"><%=comp_desc%></textarea><br> Max. 500 characters.</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="table_td" height="50" valign="bottom" colspan="2" align="center"  >&nbsp; 
                                                            <script type="text/javascript">
                                                    <!--
                                                    document.write('  <input type="button" value="Update"  onclick="return checkRegister()" >');
                                                    -->
                                                            </script>
                                                            <noscript> Please enable javascript to update your profile. </noscript> 
                                                            
                                                            
                                                            
                                                      </td>
                                                    </tr>
                                        </td></tr></table>
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
</table>	


<%@ include file="footer.jsp" %> 
</body>
</html>

<%
}
catch(Exception e)
{
    out.print(e.getMessage());
}
%>

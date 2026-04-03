<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="ConnectDB.jsp" %>


<%
try
        {
String username=(String)session.getAttribute("User_Name");
String userid=(String)session.getAttribute("User_id");
String password=(String)session.getAttribute("Password");
//if(username==null || password==null) {
  //  response.sendRedirect("user_login.jsp");
//}
Statement state=con.createStatement();
ResultSet rs=null;
String query="select * from user_login where User_id='"+userid+"'";
rs=state.executeQuery(query);
String f_name=null;
String gender=null;
String email=null;
String country=null;
String city=null;
String address=null;
String phone=null;
String dateofbirth=null;
while(rs.next())
    {
 f_name=rs.getString("First_name");
 gender=rs.getString("Gender");
 email=rs.getString("Email_id");
 country=rs.getString("Country");
 city=rs.getString("City");
 address=rs.getString("Address");
 phone=rs.getString("Phone");
 dateofbirth=rs.getString("Date_of_birth");

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
            function getvalue()
            {
            var x=document.frm.contry.value;           
            var y=document.frm.country.options.length;
           for(i=0;i<y;i++)
           {
           var z=document.frm.country.options[i].value;
            if(x==z)
            {
            document.frm.country.options[i].selected=true;
            } 
            }
          // alert(z);
           dateofbirth();
           }
         function dateofbirth()
         {
           var a=document.frm.dob.value;
           // alert(a);
            var index=a.lastIndexOf("-");
            var day=a.substring(index+1);
            a=a.substring(0,index);
            index=a.lastIndexOf("-");
            var month=a.substring(index+1);    
            var year=a.substring(0,index);
         //alert(year+"-"+month+"-"+day);
         
            var yearlen=document.frm.birthday_yr.options.length;
           for(i=0;i<yearlen;i++)
           {
           z=document.frm.birthday_yr.options[i].value;
            if(year==z)
            {
            //alert("here");
            document.frm.birthday_yr.options[i].selected=true;
            } 
            }
            var monlen=document.frm.birthday_mon.options.length;
           for(i=0;i<monlen;i++)
           {
           z=document.frm.birthday_mon.options[i].value;
            if(month==z)
            {
            //alert("here");
            document.frm.birthday_mon.options[i].selected=true;
            } 
            }
            var daylen=document.frm.birthday_day.options.length;
           for(i=0;i<daylen;i++)
           {
           z=document.frm.birthday_day.options[i].value;
            if(day==z)
            {
            //alert("here");
            document.frm.birthday_day.options[i].selected=true;
            } 
            }
           //alert(z);
           
         
           
            }
            
            function checkRegister()
                {
                 
                  if(document.getElementById("fname").value=="")
                    {
                    alert("Please enter your name");
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
                        


                   if(document.frm.gender.selectedIndex=="0")
                    {
                    alert("Please enter your gender");
                    document.frm.gender.focus();
                    return false;
                    }

                    if(document.frm.birthday_mon.selectedIndex==0)
                    {
                    alert("Please enter your date of birth correctly");
                    document.frm.birthday_mon.focus();
                    return false;
                    }
                    if(document.frm.birthday_day.selectedIndex==0)
                    {
                    alert("Please enter your date of birth correctly");
                    document.frm.birthday_day.focus();
                    return false;
                    }
                    if(document.frm.birthday_yr.selectedIndex==0)
                    {
                    alert("Please enter your date of birth correctly");
                    document.frm.birthday_yr.focus();
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
	
                if(document.frm.country.selectedIndex==0)
                    {
                    alert("Please enter the country name");
                    document.frm.country.focus();
                    return false;
                    }
                else
                    {
                    var index=document.frm.country.selectedIndex;
                    var value=document.frm.country.options[index].text;
                    document.frm.contry.value=value;
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

<body onload="getvalue()">
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
                    
                    <span class="featured">My Profile </span> 
                </td>
            </tr>
            
            <tr>
            <td> <br>
                <form action="editProfile.jsp" method="get" name="frm">
                <table  border="0" cellspacing="5" cellpadding="0"bgcolor="#F9F9F9" class="upload-mid"  align="left" width="98%">
                                                  <tr>
                                                 <td height="25"  colspan="2"   > Fields marked with (<font color='red'>*</font>) are mandatory. </td>
                                                 </tr>
                                                    <tr>
                                                        <td width="110" height="25"  class="table_td" align="left"><font color='red'>*</font>Name  </td>
                                                     
                                                        <td  class="table_td" align="left"> <input type="text" name="fname" id="fname" value="<%= f_name %>"></td>
                                                    </tr>
                                                    <!-- <tr>
                                                        <td height="25"  class="table_td">Middle name: </td>
                                                        <td  height="25"  class="table_td">:</td>
                                                        <td class="table_td">&nbsp; <input type="text" name="mname" id="mname" value="<%//= m_name %>"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td">Last name  </td>  
                                                        <td  height="25"  class="table_td">:</td>
                                                        <td class="table_td">&nbsp; <input type="text" name="lname" id="lname" value="<%//= l_name %>"></td>
                                                    </tr> -->
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left" ><font color='red'>*</font>Gender  </td>  
                                                       
                                                        <td class="table_td" align="left"> <input type="radio" name="gender" value="<%= gender %>" checked><%= gender %>
                                                                                                                                                        <%
                                                                                                                                                        if(gender.equalsIgnoreCase("male")) {
                                                                                                                                                        %>
                                                                                                                                                        <input type="radio" name="gender" value="Female">Female
                                                            <%
                                                                                                                                                        } else if(gender.equalsIgnoreCase("female")) {
                                                            %>
                                                            <input type="radio" name="gender" value="Male">Male
                                                            <%
                                                                                                                                                        }
                                                            %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25" class="table_td" align="left">
                                                            <font color='red'>*</font>Date of Birth 
                                                        </td>
                                               
                                                        <td class="formFieldSmall" width="250" align="left">
                                                            
                                                            <select name="birthday_mon" >
                                                                
                                                                <option value="0">---</option>
                                                                <option value="1" >January</option>
                                                                <option value="2" >February</option>
                                                                <option value="3" >March</option>
                                                                <option value="4" >April</option>
                                                                <option value="5" >May</option>
                                                                <option value="6" >June</option>
                                                                <option value="7" >July</option>
                                                                <option value="8" >August</option>
                                                                <option value="9" >September</option>
                                                                <option value="10" >October</option>
                                                                <option value="11" >November</option>
                                                                <option value="12" >December</option>
                                                                
                                                            </select>
                                                            &nbsp;&nbsp;
                                                            
                                                            <select name="birthday_day"  >
                                                                
                                                                <option value="0">---</option>
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                                <option value="14">14</option>
                                                                <option value="15">15</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                                <option value="21">21</option>
                                                                <option value="22">22</option>
                                                                <option value="23">23</option>
                                                                <option value="24">24</option>
                                                                <option value="25">25</option>
                                                                <option value="26">26</option>
                                                                <option value="27">27</option>
                                                                <option value="28">28</option>
                                                                <option value="29">29</option>
                                                                <option value="30">30</option>
                                                                <option value="31">31</option>
                                                                
                                                            </select>
                                                            
                                                            &nbsp;&nbsp;
                                                            <select name="birthday_yr"   >
                                                                
                                                                <option value="0">---</option>
                                                                
                                                                <option value="2007">2007</option>
                                                                <option value="2006">2006</option>
                                                                <option value="2005">2005</option>
                                                                <option value="2004">2004</option>
                                                                <option value="2003">2003</option>
                                                                <option value="2002">2002</option>
                                                                <option value="2001">2001</option>
                                                                <option value="2000">2000</option>
                                                                <option value="1999">1999</option>
                                                                <option value="1998">1998</option>
                                                                <option value="1997">1997</option>
                                                                <option value="1996">1996</option>
                                                                <option value="1995">1995</option>
                                                                <option value="1994">1994</option>
                                                                <option value="1993">1993</option>
                                                                <option value="1992">1992</option>
                                                                <option value="1991">1991</option>
                                                                <option value="1990">1990</option>
                                                                <option value="1989">1989</option>
                                                                <option value="1988">1988</option>
                                                                <option value="1987">1987</option>
                                                                <option value="1986">1986</option>
                                                                <option value="1985">1985</option>
                                                                <option value="1984">1984</option>
                                                                <option value="1983">1983</option>
                                                                <option value="1982">1982</option>
                                                                <option value="1981">1981</option>
                                                                <option value="1980">1980</option>
                                                                <option value="1979">1979</option>
                                                                <option value="1978">1978</option>
                                                                <option value="1977">1977</option>
                                                                <option value="1976">1976</option>
                                                                <option value="1975">1975</option>
                                                                <option value="1974">1974</option>
                                                                <option value="1973">1973</option>
                                                                <option value="1972">1972</option>
                                                                <option value="1971">1971</option>
                                                                <option value="1970">1970</option>
                                                                <option value="1969">1969</option>
                                                                <option value="1968">1968</option>
                                                                <option value="1967">1967</option>
                                                                <option value="1966">1966</option>
                                                                <option value="1965">1965</option>
                                                                <option value="1964">1964</option>
                                                                <option value="1963">1963</option>
                                                                <option value="1962">1962</option>
                                                                <option value="1961">1961</option>
                                                                <option value="1960">1960</option>
                                                                <option value="1959">1959</option>
                                                                <option value="1958">1958</option>
                                                                <option value="1957">1957</option>
                                                                <option value="1956">1956</option>
                                                                <option value="1955">1955</option>
                                                                <option value="1954">1954</option>
                                                                <option value="1953">1953</option>
                                                                <option value="1952">1952</option>
                                                                <option value="1951">1951</option>
                                                                <option value="1950">1950</option>
                                                                
                                                                
                                                            </select>
                                                            <input type="hidden" name="dob" id="dob" value="<%=dateofbirth%>">
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left"><font color='red'>*</font>E-mail  </td>
                                                    
                                                        <td class="table_td" align="left"> <input type="text" name="emailID" id="emailID" value="<%= email %>" readonly size="50"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left"><font color='red'>*</font>Country  </td>
                                                     
                                                        <td class="table_td" align="left">
                                                            
                                                            <select name="country" id="country">
                                                                <option>---</option>
                                                                <option value="AF">Afghanistan</option>
                                                                <option value="AL">Albania</option>
                                                                <option value="DZ">Algeria</option>
                                                                <option value="AS">American Samoa</option>
                                                                <option value="AD">Andorra</option>
                                                                <option value="AO">Angola</option>
                                                                <option value="AI">Anguilla</option>
                                                                <option value="AG">Antigua and Barbuda</option>
                                                                <option value="AR">Argentina</option>
                                                                <option value="AM">Armenia</option>
                                                                <option value="AW">Aruba</option>
                                                                <option value="AU">Australia</option>
                                                                <option value="AT">Austria</option>
                                                                <option value="AZ">Azerbaijan</option>
                                                                <option value="BS">Bahamas</option>
                                                                <option value="BH">Bahrain</option>
                                                                <option value="BD">Bangladesh</option>
                                                                <option value="BB">Barbados</option>
                                                                <option value="BY">Belarus</option>
                                                                <option value="BE">Belgium</option>
                                                                <option value="BZ">Belize</option>
                                                                <option value="BJ">Benin</option>
                                                                <option value="BM">Bermuda</option>
                                                                <option value="BT">Bhutan</option>
                                                                <option value="BO">Bolivia</option>
                                                                <option value="BA">Bosnia and Herzegovina</option>
                                                                <option value="BW">Botswana</option>
                                                                <option value="BV">Bouvet Island</option>
                                                                <option value="BR">Brazil</option>
                                                                <option value="IO">British Indian Ocean Territory</option>
                                                                <option value="VG">British Virgin Islands</option>
                                                                <option value="BN">Brunei</option>
                                                                <option value="BG">Bulgaria</option>
                                                                <option value="BF">Burkina Faso</option>
                                                                <option value="BI">Burundi</option>
                                                                <option value="KH">Cambodia</option>
                                                                <option value="CM">Cameroon</option>
                                                                <option value="CA">Canada</option>
                                                                <option value="CV">Cape Verde</option>
                                                                <option value="KY">Cayman Islands</option>
                                                                <option value="CF">Central African Republic</option>
                                                                <option value="TD">Chad</option>
                                                                <option value="CL">Chile</option>
                                                                <option value="CN">China</option>
                                                                <option value="CX">Christmas Island</option>
                                                                <option value="CC">Cocos (Keeling) Islands</option>
                                                                <option value="CO">Colombia</option>
                                                                <option value="KM">Comoros</option>
                                                                <option value="CG">Congo</option>
                                                                <option value="CD">Congo - Democratic Republic of</option>
                                                                <option value="CK">Cook Islands</option>
                                                                <option value="CR">Costa Rica</option>
                                                                <option value="CI">Cote d'Ivoire</option>
                                                                <option value="HR">Croatia</option>
                                                                <option value="CU">Cuba</option>
                                                                <option value="CY">Cyprus</option>
                                                                <option value="CZ">Czech Republic</option>
                                                                <option value="DK">Denmark</option>
                                                                <option value="DJ">Djibouti</option>
                                                                <option value="DM">Dominica</option>
                                                                <option value="DO">Dominican Republic</option>
                                                                <option value="TP">East Timor</option>
                                                                <option value="EC">Ecuador</option>
                                                                <option value="EG">Egypt</option>
                                                                <option value="SV">El Salvador</option>
                                                                <option value="GQ">Equitorial Guinea</option>
                                                                <option value="ER">Eritrea</option>
                                                                <option value="EE">Estonia</option>
                                                                <option value="ET">Ethiopia</option>
                                                                <option value="FK">Falkland Islands (Islas Malvinas)</option>
                                                                <option value="FO">Faroe Islands</option>
                                                                <option value="FJ">Fiji</option>
                                                                <option value="FI">Finland</option>
                                                                <option value="FR">France</option>
                                                                <option value="GF">French Guyana</option>
                                                                <option value="PF">French Polynesia</option>
                                                                <option value="TF">French Southern and Antarctic Lands</option>
                                                                <option value="GA">Gabon</option>
                                                                <option value="GM">Gambia</option>
                                                                <option value="GZ">Gaza Strip</option>
                                                                <option value="GE">Georgia</option>
                                                                <option value="DE">Germany</option>
                                                                <option value="GH">Ghana</option>
                                                                <option value="GI">Gibraltar</option>
                                                                <option value="GR">Greece</option>
                                                                <option value="GL">Greenland</option>
                                                                <option value="GD">Grenada</option>
                                                                <option value="GP">Guadeloupe</option>
                                                                <option value="GU">Guam</option>
                                                                <option value="GT">Guatemala</option>
                                                                <option value="GN">Guinea</option>
                                                                <option value="GW">Guinea-Bissau</option>
                                                                <option value="GY">Guyana</option>
                                                                <option value="HT">Haiti</option>
                                                                <option value="HM">Heard Island and McDonald Islands</option>
                                                                <option value="VA">Holy See (Vatican City)</option>
                                                                <option value="HN">Honduras</option>
                                                                <option value="HK">Hong Kong</option>
                                                                <option value="HU">Hungary</option>
                                                                <option value="IS">Iceland</option>
                                                                <option value="IN">India</option>
                                                                <option value="ID">Indonesia</option>
                                                                <option value="IR">Iran</option>
                                                                <option value="IQ">Iraq</option>
                                                                <option value="IE">Ireland</option>
                                                                <option value="IL">Israel</option>
                                                                <option value="IT">Italy</option>
                                                                <option value="JM">Jamaica</option>
                                                                <option value="JP">Japan</option>
                                                                <option value="JO">Jordan</option>
                                                                <option value="KZ">Kazakhstan</option>
                                                                <option value="KE">Kenya</option>
                                                                <option value="KI">Kiribati</option>
                                                                <option value="KW">Kuwait</option>
                                                                <option value="KG">Kyrgyzstan</option>
                                                                <option value="LA">Laos</option>
                                                                <option value="LV">Latvia</option>
                                                                <option value="LB">Lebanon</option>
                                                                <option value="LS">Lesotho</option>
                                                                <option value="LR">Liberia</option>
                                                                <option value="LY">Libya</option>
                                                                <option value="LI">Liechtenstein</option>
                                                                <option value="LT">Lithuania</option>
                                                                <option value="LU">Luxembourg</option>
                                                                <option value="MO">Macau</option>
                                                                <option value="MK">Macedonia - The Former Yugoslav Republic of</option>
                                                                <option value="MG">Madagascar</option>
                                                                <option value="MW">Malawi</option>
                                                                <option value="MY">Malaysia</option>
                                                                <option value="MV">Maldives</option>
                                                                <option value="ML">Mali</option>
                                                                <option value="MT">Malta</option>
                                                                <option value="MH">Marshall Islands</option>
                                                                <option value="MQ">Martinique</option>
                                                                <option value="MR">Mauritania</option>
                                                                <option value="MU">Mauritius</option>
                                                                <option value="YT">Mayotte</option>
                                                                <option value="MX">Mexico</option>
                                                                <option value="FM">Micronesia - Federated States of</option>
                                                                <option value="MD">Moldova</option>
                                                                <option value="MC">Monaco</option>
                                                                <option value="MN">Mongolia</option>
                                                                <option value="MS">Montserrat</option>
                                                                <option value="MA">Morocco</option>
                                                                <option value="MZ">Mozambique</option>
                                                                <option value="MM">Myanmar</option>
                                                                <option value="NA">Namibia</option>
                                                                <option value="NR">Nauru</option>
                                                                <option value="NP">Nepal</option>
                                                                <option value="NL">Netherlands</option>
                                                                <option value="AN">Netherlands Antilles</option>
                                                                <option value="NC">New Caledonia</option>
                                                                <option value="NZ">New Zealand</option>
                                                                <option value="NI">Nicaragua</option>
                                                                <option value="NE">Niger</option>
                                                                <option value="NG">Nigeria</option>
                                                                <option value="NU">Niue</option>
                                                                <option value="NF">Norfolk Island</option>
                                                                <option value="MP">Northern Mariana Islands</option>
                                                                <option value="KP">North Korea</option>
                                                                <option value="NO">Norway</option>
                                                                <option value="OM">Oman</option>
                                                                <option value="PK">Pakistan</option>
                                                                <option value="PW">Palau</option>
                                                                <option value="PA">Panama</option>
                                                                <option value="PG">Papua New Guinea</option>
                                                                <option value="PY">Paraguay</option>
                                                                <option value="PE">Peru</option>
                                                                <option value="PH">Philippines</option>
                                                                <option value="PN">Pitcairn Islands</option>
                                                                <option value="PL">Poland</option>
                                                                <option value="PT">Portugal</option>
                                                                <option value="PR">Puerto Rico</option>
                                                                <option value="QA">Qatar</option>
                                                                <option value="RE">Reunion</option>
                                                                <option value="RO">Romania</option>
                                                                <option value="RU">Russia</option>
                                                                <option value="RW">Rwanda</option>
                                                                <option value="KN">Saint Kitts and Nevis</option>
                                                                <option value="LC">Saint Lucia</option>
                                                                <option value="VC">Saint Vincent and the Grenadines</option>
                                                                <option value="WS">Samoa</option>
                                                                <option value="SM">San Marino</option>
                                                                <option value="ST">Sao Tome and Principe</option>
                                                                <option value="SA">Saudi Arabia</option>
                                                                <option value="SN">Senegal</option>
                                                                <option value="CS">Serbia and Montenegro</option>
                                                                <option value="SC">Seychelles</option>
                                                                <option value="SL">Sierra Leone</option>
                                                                <option value="SG">Singapore</option>
                                                                <option value="SK">Slovakia</option>
                                                                <option value="SI">Slovenia</option>
                                                                <option value="SB">Solomon Islands</option>
                                                                <option value="SO">Somalia</option>
                                                                <option value="ZA">South Africa</option>
                                                                <option value="GS">South Georgia and the South Sandwich Islands</option>
                                                                <option value="KR">South Korea</option>
                                                                <option value="ES">Spain</option>
                                                                <option value="LK">Sri Lanka</option>
                                                                <option value="SH">St. Helena</option>
                                                                <option value="PM">St. Pierre and Miquelon</option>
                                                                <option value="SD">Sudan</option>
                                                                <option value="SR">Suriname</option>
                                                                <option value="SJ">Svalbard</option>
                                                                <option value="SZ">Swaziland</option>
                                                                <option value="SE">Sweden</option>
                                                                <option value="CH">Switzerland</option>
                                                                <option value="SY">Syria</option>
                                                                <option value="TW">Taiwan</option>
                                                                <option value="TJ">Tajikistan</option>
                                                                <option value="TZ">Tanzania</option>
                                                                <option value="TH">Thailand</option>
                                                                <option value="TG">Togo</option>
                                                                <option value="TK">Tokelau</option>
                                                                <option value="TO">Tonga</option>
                                                                <option value="TT">Trinidad and Tobago</option>
                                                                <option value="TN">Tunisia</option>
                                                                <option value="TR">Turkey</option>
                                                                <option value="TM">Turkmenistan</option>
                                                                <option value="TC">Turks and Caicos Islands</option>
                                                                <option value="TV">Tuvalu</option>
                                                                <option value="UG">Uganda</option>
                                                                <option value="UA">Ukraine</option>
                                                                <option value="AE">United Arab Emirates</option>
                                                                <option value="GB">United Kingdom</option>
                                                                <option value="US">United States</option>
                                                                <option value="VI">United States Virgin Islands</option>
                                                                <option value="UY">Uruguay</option>
                                                                <option value="UZ">Uzbekistan</option>
                                                                <option value="VU">Vanuatu</option>
                                                                <option value="VE">Venezuela</option>
                                                                <option value="VN">Vietnam</option>
                                                                <option value="WF">Wallis and Futuna</option>
                                                                <option value="PS">West Bank</option>
                                                                <option value="EH">Western Sahara</option>
                                                                <option value="YE">Yemen</option>
                                                                <option value="ZM">Zambia</option>
                                                                <option value="ZW">Zimbabwe</option>
                                                            </select><input type="hidden" name="contry" id="contry" value="<%=country%>" > 
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left"><font color='red'>*</font>City   </td>
                                                     
                                                        <td class="table_td" align="left"> <input type="text" name="city" id="city" value="<%= city %>"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left"><font color='red'>*</font>Address  </td>
                                                     
                                                        <td class="table_td" align="left"><textarea name="address"  value="<%=address%>"><%= address %></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25"  class="table_td" align="left">Phone  </td>
                                                     
                                                        <td class="table_td" align="left"><input type="text" name="phone" id="phone" value="<%= phone %>" maxlength="15"></td>
                                                    </tr>
                                                    <!-- <tr>
                                                        <td height="25"  class="table_td">Mobile  </td>
                                                        <td  height="25"  class="table_td">:</td>
                                                        <td class="table_td">&nbsp; <input type="mobile" name="mobile" id="mobile" value="<%//= mobile %>" ></td>
                                                    </tr> -->
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

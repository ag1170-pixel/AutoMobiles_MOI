
<%@ page import="java.sql.*" %>
<%@ include file="ConnectDB.jsp" %>
<%
String user_name = (String)session.getAttribute("user_name");
String password = (String)session.getAttribute("password");
String f_name =(String) session.getAttribute("f_name");
String gender =(String) session.getAttribute("gender");
String email = (String)session.getAttribute("email");
String city_name =(String)session.getAttribute("city_name");
String address = (String)session.getAttribute("address");
String phone =(String) session.getAttribute("phone");
//String captcha=(String)session.getAttribute("captcha");
String imgval=(String) session.getAttribute("imgval");
if(user_name==null)user_name="";
if(password==null)password="";
if(f_name==null)f_name="";
if(email==null)email="";
if(imgval==null)imgval="";
if(city_name==null)city_name="";
if(address==null)address="";
if(phone==null)phone="";
if(gender==null)gender="";

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
        <meta name="description" content=".">
        
        <meta name="keywords" content="">
        
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        
        <meta name="generator" content="editplus" />
        <meta name="author" content="" />
        
      
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        <script  language="JavaScript" src="CheckScript.js"></script> 
        <script>
        function offsub()
        {
      
        document.register_user.check1.checked=false;
        
        document.register_user.submit1.disabled=true;
        }
        
        
        
        
        </script>
        
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>
    
    <body>
<%@include  file="header.jsp" %>
<%@include  file="leftpanel.jsp" %>

        <tr>
            
            
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
                                    <td width="95%" ><br><br>
                                        <form name="register_user" action="register_check.jsp" method="post"  onsubmit="return validate_form()">
                                        <table cellspacing="4" cellpadding="3" border="0" width="95%" align="left" style="border: 1px solid #E8E8E8" bgcolor="#F9F9F9" class="text4">
                                            <!--  <tr>
                                        <td width="149" height="30" align="left" > <font color='red'>*</font>Username</td>
                                        <td width="2">&nbsp;</td>
                                        <td width="249" align="left">
                                           
                                        </td>
                                        
                                    </tr>-->
                                    
                                            <tr>
                                                <td height="30" align="left" class="form_text"><font color='red'>*</font>Email </td>
                                                <td>&nbsp;</td>
                                                <td align="left"><input type="text" id="emailID" name="emailID" maxlength="75" value="<%=email%>"  onblur="return usercheck()"  onchange="offsub()"/>
                                                    <input type="hidden" name="user_name" value="<%=f_name%>" id="user_name" maxlength="18"  />
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
                                                    
                                                    
                                                    <!--   <input type="password" value="<%//=password%>" name="password" id="password" maxlength="18" />-->
                            
                            
                            
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
                                                <td width="149" height="30" align="left" class="form_text"> <font color='red'>*</font>Name</td>
                                                <td >&nbsp;</td>
                                                <td width="249" align="left"><input type="text" value="<%=f_name%>" name="f_name" id="f_name" maxlength="25"  accept="text"/></td>
                                            </tr>
                                            
                                            <tr>
                                                <td height="30" align="left" class="form_text"><font color='red'>*</font>Gender</td>
                                                <td>&nbsp;</td>
                                                <td align="left"><%if(gender.equals("Male"))
                                                    {    %>
                                                    <input type="radio" name="gender" id="gender" value="Male"  checked="true"> Male 
                                                    <% }else { %>
                                                    <input type="radio" name="gender" id="gender" value="Male" > Male 
                                                    <%}if(gender.equals("Female")){%>
                                                    <input type="radio" name="gender" id="gender"  value="Female" checked="true"> Female
                                                    <% }else { %>
                                                    <input type="radio" name="gender" id="gender"  value="Female" > Female
                                                    <%}%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="30" align="left" class="form_text"><nobr> <font color='red'>*</font>Date of Birth</nobr></td>
                                                <td>&nbsp;</td>
                                                <td colspan="3" class="formFieldSmall" width="240" align="left">
                                                    
                                                    <select name="birthday_mon">
                                                        
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
                                                    <select name="birthday_yr" >
                                                        
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
                                                        <option value="1949">1949</option>
                                                        <option value="1948">1948</option>
                                                        <option value="1947">1947</option>
                                                        <option value="1946">1946</option>
                                                        <option value="1945">1945</option>
                                                        <option value="1944">1944</option>
                                                        <option value="1943">1943</option>
                                                        <option value="1942">1942</option>
                                                        <option value="1941">1941</option>
                                                        <option value="1940">1940</option>
                                                        <option value="1939">1939</option>
                                                        <option value="1938">1938</option>
                                                        <option value="1937">1937</option>
                                                        <option value="1936">1936</option>
                                                        <option value="1935">1935</option>
                                                        <option value="1934">1934</option>
                                                        <option value="1933">1933</option>
                                                        <option value="1932">1932</option>
                                                        <option value="1931">1931</option>
                                                        <option value="1930">1930</option>
                                                        <option value="1929">1929</option>
                                                        <option value="1928">1928</option>
                                                        <option value="1927">1927</option>
                                                        <option value="1926">1926</option>
                                                        <option value="1925">1925</option>
                                                        <option value="1924">1924</option>
                                                        <option value="1923">1923</option>
                                                        <option value="1922">1922</option>
                                                        <option value="1921">1921</option>
                                                        <option value="1920">1920</option>
                                                        <option value="1919">1919</option>
                                                        <option value="1918">1918</option>
                                                        <option value="1917">1917</option>
                                                        <option value="1916">1916</option>
                                                        <option value="1915">1915</option>
                                                        <option value="1914">1914</option>
                                                        <option value="1913">1913</option>
                                                        <option value="1912">1912</option>
                                                        <option value="1911">1911</option>
                                                        <option value="1910">1910</option>
                                                        <option value="1909">1909</option>
                                                        <option value="1908">1908</option>
                                                        <option value="1907">1907</option>
                                                        <option value="1906">1906</option>
                                                        <option value="1905">1905</option>
                                                        <option value="1904">1904</option>
                                                        <option value="1903">1903</option>
                                                        <option value="1902">1902</option>
                                                        <option value="1901">1901</option>
                                                        
                                                    </select>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td height="30" align="left" class="form_text"><font color='red'>*</font>Country </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    
                                                    <select name="contry" id="contry">
                                                        <option value="" selected>Select Country</option>
                                                        <option value="AF" >Afghanistan</option>
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
                                                    </select>
                                                    <input type="hidden" name="country">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="30" align="left" class="form_text"><font color='red'>*</font>City </td>
                                                <td>&nbsp;</td>
                                                <td align="left">  <input name="city_name"  value="<%=city_name%>" id="city_name" id="city_name" maxlength="25">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="30" align="left" class="form_text"><font color='red'>*</font>Address </td>
                                                <td>&nbsp;</td>
                                                <td align="left"> <textarea name="address" id="address"  ><%=address%></textarea></td>
                                            </tr>
                                            <tr>
                                                <td height="30" align="left" class="form_text">Phone </td>
                                                <td>&nbsp;</td>
                                                <td align="left"><input type="text" name="phone"  value="<%=phone%>" id="phone" maxlength="15"/></td>
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
                                                <td height="30" align="left" class="form_text" colspan='3'> <strong><input type="checkbox" name="check1" onclick='agree()'>
                                                        I agree to abide by business.mapsofindia.com <A HREF="terms.html" 
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
                
        </td></tr>
        <tr><td>
         
        
        
        <%@ include file="footer.jsp" %>     
        
         </td></tr>
        
    </body>
</html>

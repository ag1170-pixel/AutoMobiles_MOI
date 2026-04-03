<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="ConnectDB.jsp" %> 
<%@ page import="java.util.Date,java.util.Calendar" %>
<%@ page import="java.util.*,java.net.*,java.io.*,java.net.*,javax.servlet.*"%>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %> 
<%
String seek=request.getParameter("seek");
String key=request.getParameter("key");


if(seek==null) {
    seek=(String) session.getAttribute("seek");
    key=(String) session.getAttribute("key");
    
}


session.setAttribute("seek",seek);
session.setAttribute("key",key);


// out.print(age1 + " age2--"+age2+"region--->"+region + "selGender---> "+selGender) ;


int xdiv=1;

String userid=(String)session.getAttribute("User_id");
String recruiter_id1=(String)session.getAttribute("rec_id");
int DownloadCount=0;
int buttonno=0;


String xd=request.getParameter("xdiv");
if(xd==null) {
    xdiv=1;
} else {
    xdiv=Integer.parseInt(xd);
}
%>
<html>
<head>
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-6S2WJM8ZKC"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-6S2WJM8ZKC');
</script>
    
    
    <link rel="stylesheet" href="style/style1.css">
    <style>
        .black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 2600px;
        background-image: url(images/overlay.png);
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=60);
        }
        .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 25%;
        padding: 0px;
        border: 0px solid orange;
        background-color: white;
        z-index:1002;
        overflow: auto;
        } 
        /*
        #FFA500--yello;#333333--gray; Replace Black => #F5F5F5 ; 
        */
        
    </style>
    <TITLE>Find SEO products at seoproducts.com </TITLE>
    <META NAME="Description" CONTENT="">
    
    <META NAME="Keywords" CONTENT="">
    
    <meta name="generator" content="editplus" />
    <meta name="author" content="" />
    
    
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    
    <script>
           function getbutton(x)
                        {
                        document.frm.button.value=x;
			document.frm.submit();
                        }
                        
                        function refresh1()
                        {
                        document.frm.xdiv.value=1;
                        document.frm.action="viewFind.jsp";
                        document.frm.submit();
                        }
                        
                          function refresh2()
                        {
                        document.frm.xdiv.value=2;
                        document.frm.action="viewFind.jsp";
                        document.frm.submit();
                        }
                        
                       function check()
                       {
                        var userck=<%=userid%>;
                       
                        if(userck==null||userck=="")
                        {userck=<%=recruiter_id1%>;
                         
                         }
                       if(userck==null||userck=="")
                        {
                       
                        document.getElementById("light").style.display="block";
                        document.getElementById("fade").style.display="block";
                        
                        }
                      
                       
                       }
    </script>
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>     

<body onload="check()">



<div id="light" class="white_content">
    
    
    <table align="center" cellpadding="10" cellspacing="10" border="0">
        
        
        <TR>
            <TD WIDTH="400" HEIGHT="400" ALIGN="center">
                <form name="user_login"  method="post" action="login_check.jsp">                    
                    <br><table border="0" cellspacing="0" cellpadding="10"    width="97%" class="upload-mid" >                        
                        
                        <tr><td colspan="2">Sign In <br<br></td></tr>
                        <tr>    
                            <td align="center" width="35%" class="text4">Email Id</td>                            
                            
                            <td height="30" width="55%" align="left">                                
                            <input type="text" id="uname" name="uname" /></td>                            
                        </tr>                        
                        <tr>                            
                            <td align="center" class="text4">Password </td>                            
                            
                            <td height="25" align="left"><input type="password" id="pass" name="pass" /></td>                            
                        </tr>                        
                        <tr>                            
                            
                            <td align="center">
                                <script type="text/javascript">
                                            <!--
                                            document.write('<input type="submit" name="submit" value="Submit" onclick="return login2()"/>');
                                            -->
                                </script>
                            </td>                            
                        </tr>                        
                        
                        <tr>                            
                            <td height="30"  align="center" class="text1">New User? <a href="register_user.jsp">Sign Up </a></td>   
                            
                            <td height="30" align="center" class="text1"> <a  href="forgotPass.jsp" >Forgot Password</a></td>      
                        </tr>            
                    </table>
                </form>
                
                
                
                
            </TD>
        </TR>
        
    </TABLE>
</div>
<div id="fade" class="black_overlay"></div>



<%@ include file="header.jsp" %>
<%@include  file="leftpanel.jsp" %>

<td width="4" class="vertical"></td>


<!-- center Panel starts -->
<td width="800" valign="top">
    
    <br /> 
    
    
    
    <%
    try {
    
    %>
    <form action="viewFind.jsp" name="frm" method="post">
    <input type="hidden" name="seek" value="<%=seek%>">
    <input type="hidden" name="key" value="<%=key%>">
   
    
    <%                                
    String query="";
    if( key==null || key.equals("")) {
        query="select count(*) as counts from recruiter_login order by rec_id desc";
    } else {
        query="select count(*) as counts from recruiter_login where company_name like '%"+key+"%' order by rec_id desc";
    }
    
    
    Statement state=con.createStatement();
    ResultSet rs=state.executeQuery(query);
    int count=0;
    if(rs.next()) {
        count=rs.getInt("counts");
    }
    
    int totalbuttons=1;
    
    %>
    <table cellspacing="10" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
    <tr>
        <td valign="top" width="1%">
            <%//@ include file="leftpanelcommon.jsp" %>
            
        </td>
        <td class="valign" width="95%">
        
        <table cellspacing="10" cellpadding="10" border="0" class="category-mid">
            <tr>
                <td class="featured" colspan="2">SEO Products Providers </td>
                <!-- <td class="pad-right" colspan="3" align="right"><img src="images/icon1.gif" width="23" height="12" alt="List View"  title="List View" border="0" onclick="refresh1()"  />&nbsp;<img src="images/icon2.gif" width="23" height="12" alt="Grid View" title="Grid View"  border="0" onclick="refresh2()"/></td>-->
                    
                    
            </tr>
            
            <tr>
                <td colspan="5" align="center">
                    <!--table cellspacing="5" cellpadding="0" width="80%">
								<tr>
									<td align="center" class="black-button"><a class="black-button1">1</a></td>
									<td align="center" class="black-button"><a class="black-button1">2</a></td>
									<td align="center" class="black-button"><a class="black-button1">3</a></td>
									<td align="center" class="black-button"><a class="black-button1">4</a></td>
									<td align="center" class="black-button"><a class="black-button1">5</a></td>
									<td align="center" class="black-button"><a class="black-button1">..50</a></td>
									<td align="center" class="black-button"><a class="black-button1">Next &gt;</a></td>
									<td align="center" class="small-black"><b>Go To</b> <input type="text" size="3" /></td>
								</tr>
							</table>-->
                    <table cellspacing="5" cellpadding="0" width="80%">
                        <tr>
                            <td align="center" class="small-black">(<%=count%> Result(s))</td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <%     
            int countimg=3;
            String recId="0";
            String name="";
            String location="";
            String address="";
            String contact_no="";
            String email="";
            String company_desc="";
            String website="";
            
                        String button="";
            
            if(request.getParameter("button")==null) {
                buttonno=1;
            } else {
                button=request.getParameter("button");
                buttonno=Integer.parseInt(button);
            }
            
            int startfrom=(buttonno-1)*12;
            
            
            //out.print(count);
            rs=null;
            
            int counter=0;
            
            
            if( location==null || location.equals("") &&  key==null || key.equals("")) {
                query="SELECT * FROM recruiter_login order by rec_id desc  limit  "+startfrom+",12";
            } else {
                query="SELECT * FROM recruiter_login where  company_name like '%"+key+"%' order by rec_id desc  limit  "+startfrom+",12";
            }
            
           
            
            rs=state.executeQuery(query);
            
            
            
            if(count%2==0) {
                counter=count/2;
            } else {
                counter=(count/2)+1;
            }
            
            
            
            if(count%12==0) {
                totalbuttons=count/12;
            } else {
                totalbuttons=(count/12)+1;
            }
            if(count==0)
                totalbuttons=1;
            
            String videoimage10="";
            
            for(int i=0;i<counter;i++) {
            %>
            <%
            for(int j=0;j<4;j++) {
                if(rs.next()) {
                    
                    
                    recId=rs.getString("rec_id");
                    name=rs.getString("company_name");
                    
                    
                    email=rs.getString("email");if(email==null)email="";
                    
                    
                    location=rs.getString("company_location");if(location==null)location="";
                    
                    
                    address=rs.getString("address");if(address==null)address="";
                    company_desc=rs.getString("company_desc");if(company_desc==null)company_desc="";
                    contact_no=rs.getString("contact_no");if(contact_no==null)contact_no="";
                    
                    website=rs.getString("company_website");if(website==null)website="";
                  
            
            %>
            
            <%if(xdiv==1){%>         
            <tr> 
                
                <td width="50%" valign="top" align="left" >
                    
                    <table  border="0" cellspacing="5" align="left" width="100%">
                        
                        <tr>
                        <td class="verticaltext1" width="40%" >Company </td><td class="small-blue"> <b><%=name%></b></td>
                            
                        </tr>
                        <tr>
                            
                            <td class="verticaltext1">About Company :</td><td class="small-blue"> <%=company_desc%></td>
                        </tr>
                        
                         <tr>
                            <td class="verticaltext1" align="left">Website: </td><td class="small-blue"><%=website%> </td>									
                        </tr>
                        
                        <tr>
                            <td class="verticaltext1" align="left">Current address: </td><td class="small-blue"><%=address%> , <%=location%> </td>									
                        </tr>
                        
                        
                        
                       
                        
                    
                        
                    </table>
                    
                    
                    
                </td>
                <td valign="top" align="left">
                    <table border="0" cellspacing="5" cellpadding="2">
                        <tr>
                            <td class="verticaltext1" align="left">Email: </td><td class="small-blue"><%=email%> </td>									
                        </tr>
                        
                        <tr>
                            <td class="verticaltext1" align="left">Contact No.</td><td class="small-blue"><%=contact_no%> </td>									
                        </tr>
                        
                        <tr><td>
                                <div  class="small-red">
                                    <a href="view.jsp?rec=<%=recId%>"><img src="images/details.png"> </a> 
                                </div>
                    </td></tr></table>
                    
                    
                    
                </td>
                
                
                
                
                
            </tr>  
            <tr><td  colspan="3" style="border-bottom:1px dashed #525252"></td> </tr>
            
            <%} else {
            %>   
            
            
            <td align="center" class="valign"  >
                
                <table cellspacing="0" cellpadding="0" border="0" align="center">
                <tr>
                    
                <td class="verticaltext1"><b><font color="#E0273C"><%=name%></b></font></td>
                </tr>
                
                <tr>
                    
                    <td class="verticaltext1">Detail: <%=company_desc%></td>
                </tr>
                
            </table>
            
            
            <table cellspacing="0" cellpadding="0" border="0" align="center">
                
                <tr>
                    <td  width="100%" align="left"  valign="top" class="verticaltext1">  <div align="left" class="txtVideos"><span class="small-red"><%=address%> , <%=location%></span></div></td>
                </tr>
            </table>
            <table>
                
                <tr>
                    
                    <td width="100%" align="left" valign="top" class="verticaltext1"> <div class="small-blue">Email: <%=email%></div></td>
                    
                </tr> 
                
                <tr>
                    
                    <td width="100%" align="left" valign="top" class="verticaltext1">  <div class="small-blue">Contact: <%=contact_no%></div></td>
                    
                </tr> 
                
                 <tr>
                    
                    <td width="100%" align="left" valign="top" class="verticaltext1">  <div class="small-blue">Website: <%=website%></div></td>
                    
                </tr>
                
                
                
            </table>
            
        </td>
        <% } %>    <%  } %> 
        
        
    <%  }  %>    </tr>
    <%
            }
            int i=0;
    %>
    <tr>
        <td colspan="5" align="center"><br />
            <table cellspacing="5" cellpadding="0" width="80%">
                <tr>
                
                
                
                <%@ include file="Pagination.jsp" %> 
                
            </table>
        </td>
    </tr>
    <input type="hidden" value="<%=xdiv%>"  name="xdiv" id="xdiv">
    </form>
    <%
    
    } catch(Exception e) { out.print(e.getMessage()); }
    %>
    
    
    </table>
</td>
<td valign="top" width="1%" align="center" style="padding-top:20px">
    
    
    
</td>
</tr>
</table>	

<tr><td>
<%@ include file="footer.jsp" %> 
</body>
</html>





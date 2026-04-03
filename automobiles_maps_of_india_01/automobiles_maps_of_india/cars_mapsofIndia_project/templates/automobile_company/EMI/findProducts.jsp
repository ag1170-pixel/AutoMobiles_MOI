<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="ConnectDB.jsp" %> 
<%@ page import="java.util.Date,java.util.Calendar" %>
<%@ page import="java.util.*,java.net.*,java.io.*,java.net.*,javax.servlet.*"%>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %> 

<style>
    body {
        background-color: #FFFFFF;
    }
    
    .LeftParentCatName a {
        font-weight: bold;
        color: #0E4F96;
    }
    
    .pagination {
        font: normal 12px sans-serif;
        color: #0577D0;
        margin: 10px;
    }

    .pagination a {
        color: #022C4D;
        text-decoration: underline;
        padding: 5px; 
    }
</style>

<%

String userid = (String)session.getAttribute("User_id");
String recruiter_id1 = (String)session.getAttribute("rec_id");

String brandId = request.getParameter("seek");

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
    <title>Car models</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="description" content="Find here car models along with car prices and EMI calculator.">
    <meta name="keywords" content="Car models, car prices, car brand, car loan calculation">
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    <link href="https://automobiles.mapsofindia.com/$Common/Stylesheet/Default_Inner.css" rel="stylesheet" type="text/css">
    
    
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
    
    <script>
                        
        function refresh1()
        {
        document.frm.xdiv.value=1;
        document.frm.action="findProducts.jsp";
        document.frm.submit();
        }

        function refresh2()
        {
        document.frm.xdiv.value=2;
        document.frm.action="findProducts.jsp";
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

       // document.getElementById("light").style.display="block";
        //document.getElementById("fade").style.display="block";

        }
       }
       
       
       function getbutton(x)
        {
          
            document.frm2.button.value=x;
            document.frm2.submit();
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

<%@include file="header.jsp"%>            

<tr>
<!-- center Panel starts -->
<td valign="top">
<table cellspacing="5" cellpadding="0" border="0" width="100%" align="center" style="border:0px;">
    <tr>
        <!-- LeftPanel Starts--> 
        <td class="LeftNav" valign="top" style="border: 1px solid #004ead;" bgcolor="#DDDDDD" width="200px">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td valign="top" colspan="2" style="padding-left:10px;">
                        <script type="text/javascript"><!--
                        google_ad_client = "pub-0641096029648877";
                        /* Automobiles Link Unit */
                        google_ad_slot = "9911669976";
                        google_ad_width = 160;
                        google_ad_height = 90;
                        //-->
                        </script>
                        <script type="text/javascript"
                                src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                        </script>
                    </td>
                </tr>
                <tr><td style="height:10px;"></td></tr>
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td class="LeftParentCatName" width="92%"> <a href="https://automobiles.mapsofindia.com/automobile-history/index.html"> Automobile History </a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            
                            <tr><td class="ShortSpace"></td></tr>
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td width="94%"> <a href="https://automobiles.mapsofindia.com/automobile-history/the-birth-of-automobiles.html">Birth of Automobile</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/automobile-history/changing-faces-of-the-car.html">Changing faces of car</a></td></tr>
                        </table>			
                    </td>
                </tr>
                
                <tr><td class="MedSpace" colspan="2"></td></tr>
                <tr><td colspan="2"><p class="FirstRuler"></p> </td></tr>
            </table>	
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/automobile-companies-in-india/index.html">  Automobile Companies in India </a></td>
                </tr>
                
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td class="ShortSpace"></td></tr>
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td width="94%"> <a href="https://automobiles.mapsofindia.com/automobile-companies-in-india/car-manufacturers/index.html">Car Manufacturers</a> </td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/automobile-companies-in-india/two-wheelers-manufacturers/index.html">Two Wheelers Manufacturers</a> </td></tr>
                            
                        </table>			
                    </td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>	
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/automobile-components-and-spares/index.html">  Automobile Components & Spares </a></td>
                    
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td class="ShortSpace"></td></tr>
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td valign="top" width="94%"> <a href="https://automobiles.mapsofindia.com/automobile-components-and-spares/automobile-components.html">Automobile Components </a></td></tr>
                            
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/automobile-components-and-spares/auto-spares.html">Automobile Spares</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/automobile-components-and-spares/auto-accessories.html">Auto Accessories</a></td></tr>
                        </table>			
                    </td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>	
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/automobile-service-stations-in-india/index.html">  Automobile Service Stations in India </a></td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                <tr><td class="Ruler" colspan="2"></td></tr>
                
            </table>	
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/petrol-stations/index.html">  Petrol Stations </a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td class="ShortSpace"></td></tr>
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td valign="top" width="94%"> <a href="https://automobiles.mapsofindia.com/petrol-stations/petrol-stations-delhi.html">Petrol Stations in Delhi</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/petrol-stations/petrol-stations-pune.html">Petrol Stations in Mumbai & Pune</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/petrol-stations/petrol-stations-kolkata.html">Petrol Stations in Kolkata</a></td></tr>
                            
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/petrol-stations/petrol-stations-tamilnadu.html">Petrol Stations in Tamilnadu </a></td></tr>	
                        </table>			
                    </td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/lubricants/index.html"> Lubricants </a></td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>	
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/car-accessories/index.html">  Car Accessories </a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td class="ShortSpace"></td></tr>
                            
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td valign="top" width="94%"> <a href="https://automobiles.mapsofindia.com/car-accessories/car-air-conditioning.html">Car Airconditioning</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/car-accessories/auto-tyres-india.html">Tyres</a></td></tr>
                        </table>			
                    </td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/index.html">Second Hand Car Market in India</a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td class="ShortSpace"></td></tr>
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td valign="top" width="94%"> <a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/used-cars.html">Used Car</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/buying-used-cars.html">Buying Used Car</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/second-hand-car-dealers.html">Second Hand Car Dealers</a></td></tr>
                            
                        </table>			
                    </td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/index.html">Car Finance and Insurance</a></td>
                    
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td class="ShortSpace"></td></tr>
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td valign="top" width="94%"> <a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/car-finance-companies.html">Car Finance Companies</a></td></tr>
                            
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/car-insurance.html">Car Insurance</a></td></tr>
                        </table>			
                    </td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                
                <tr>
                    <td width="8%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavBullet.jpg" width="12px" height="12px" alt=""></td><td width="92%" class="LeftParentCatName"> <a href="https://automobiles.mapsofindia.com/useful-information/index.html">Useful Information</a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td class="ShortSpace"></td></tr>
                            
                            <tr><td width="6%"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td valign="top" width="94%"> <a href="https://automobiles.mapsofindia.com/useful-information/motor-policy.html">Motor Policy Know Your Car</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/useful-information/modern-suspension-system.html">Modren Suspension System</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/useful-information/development-in-transmission-system.html">Development in Transmission System</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/useful-information/the-electrical-system.html">The Electrical System</a></td></tr>
                            
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/useful-information/vehicle-maintenance.html">Maintenance</a></td></tr>
                            <tr><td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/LeftNavOptions.jpg" width="5px" height="6px" alt=""></td>	<td> <a href="https://automobiles.mapsofindia.com/useful-information/automobile-tips.html">Tips</a></td></tr>
                        </table>			
                    </td>
                </tr>
                <tr><td class="MedSpace" colspan="2"></td></tr>
                
                <tr><td class="Ruler" colspan="2"></td></tr>
            </table>
        </td>
        <!-- LeftPanel Ends-->

        <td valign="top">
        <table cellspacing="0" cellpadding="0" border="0" class="category-mid" width="800px">
        <tr>
            <td class="featured" colspan="2">Car Models</td>
        </tr>
        
        <%@include file = "pagination1.jsp" %>
        
        <%
            try {
                Statement state=con.createStatement();
                String cntquery = "";
                String pagination = "", url = "";
            
                if(brandId==null || brandId.equals("")) {
                    cntquery="select count(*) as counts   from jobs,category  where  jobs.category=category.Category_id";
                } else {
                    cntquery="select count(*) as counts   from jobs,category  where  jobs.category=category.Category_id and jobs.category='"+brandId+"'";
                }
            
                ResultSet rs = state.executeQuery(cntquery);
                int count = 0;
                
                if(rs.next()) {
                    count = rs.getInt("counts");
                }
            
                
                /************************************ Pagination Code *******************************/
                int current_page = 1;
                int offset = 0;
                int results_per_page = 3;
                String limit = "";

                if(request.getParameter("pno") != null && request.getParameter("pno") != ""){
                    current_page = Integer.parseInt(request.getParameter("pno"));
                }
                
                offset = (current_page * results_per_page) - results_per_page;
                limit = offset+","+results_per_page;
                /*************************************************************************************/
            
                
            
                if(count==0){ %>
                    <tr>
                        <td class="featured" colspan="5">Car Models has not been added by this Brand.</td>
                    </tr>
                <%
                }
                
                String company_name = "";
                String job_headline = "";
                String company_image = "";
                String userId = ""; 
                String price = "";
                String model = "";
                String mindownpay = "";
                String job_id = "";
                String category = "";
                String description = "";
                
                rs = null;
                int counter = 0;
                String query = "";
                
                if(brandId==null || brandId.equals("")) {
                    query="select jobs.* ,category.Category_name  from  jobs,category  where   jobs.category=category.Category_id  order by jobs.job_id desc limit "+limit+"";
                } else {
                    query="select jobs.* ,category.Category_name  from  jobs,category  where   jobs.category=category.Category_id and jobs.category='"+brandId+"'  order by jobs.job_id desc limit "+limit+"";
                }
                
                rs = state.executeQuery(query);
                
                
                while(rs.next()) {
                    userId = rs.getString("rec_id");
                    job_headline = rs.getString("job_headline");
                    description = rs.getString("job_description");if(description==null) description = "";
                    company_name = rs.getString("Category_name");
                    price = rs.getString("package"); if(price==null) price = "";
                    company_image = rs.getString("image"); if(company_image==null) company_image = "";
                    mindownpay = rs.getString("mindownpay"); if(mindownpay==null) mindownpay = "";
                    job_id = rs.getString("job_id"); if(job_id==null)job_id = "";
                
                    %> 
                    <div style="border:1px solid #E8E8E8;">
                    <tr> 
                        <td valign="top" align="left" width="250px">
                            <table  border="0" cellspacing="10" cellpadding="2">
                                <tr>
                                    <td class="verticaltext1">Company : </td><td class="small-blue" align="left"><font  size="2"  ><b><%=company_name%></b></font></td>
                                </tr>
                                <tr>
                                    <td class="verticaltext1">Brand : </td><td class="small-blue" align="left"><font  size="2"  ><b><%=job_headline%></b></font></td>
                                </tr>
                                <tr>
                                    <td  class="verticaltext1" align="left">Description: </td><td class="small-blue" align="left"><%=description.replace("\n","<br>")%></td>									
                                </tr>
                            </table>
                        </td>
                        <td valign="top"  style="padding-top:10px">
                            <table cellspacing="10" cellpadding="2">
                                <tr><td align="left" class="verticaltext1">Price</td></tr>
                                <tr><td align="left" class="small-blue">Rs. <%=price%></td></tr>
                                <tr><td align="left" class="verticaltext1">Minimum Down Payment</td></tr>
                                <tr><td align="left" class="small-blue">Rs.<%=mindownpay%></td></tr>
                                <tr><td align="left"><a href="proddetail.jsp?cv=<%=job_id%>"><img src="images/details.png"></a></td></tr>
                            </table>
                        </td>
                        <td>
                            <img src="brand-images/<%=company_image%>" width="150" height="150"  border="1">
                        </td>
                    </tr>
                    </div>
                    <tr><td colspan="3" style="border-bottom:1px dashed #525252"></td> </tr>
                <%
                }
                
                /***************************************************************************/
                url = "?";
                pagination = pagination(count,results_per_page,current_page,5,url);
                /***************************************************************************/
                
                if(count > 0) {
                %>
                <tr>
                    <td colspan="5" align="center"><br />
                        <div class="pagination" align="center"><%=pagination%></div>
                    </td>
                </tr>
                <%
                }
            } catch(Exception e) { out.print(e.getMessage()); }
        %>
        </table>
    </td>
</tr>
</table>	

</td></tr>
<tr><td>
<%@ include file="footer.jsp" %> 
</td></tr></table>
</body>
</html>
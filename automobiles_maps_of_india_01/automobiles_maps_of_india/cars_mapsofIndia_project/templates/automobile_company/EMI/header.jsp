
<%
String user_name1=null;
String userid1=null;
user_name1 =(String)session.getAttribute("User_Name");
userid1=(String)session.getAttribute("User_id");

String recruiter_id=(String)session.getAttribute("rec_id");
String recruiter_name=(String)session.getAttribute("rec_name");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
	<title>EMI Calculator</title>
	<meta name='description' content="Calculate car loan, Car Emi here and get the bank interest rates also. The Emi calculator is for calculating car loan Emi.">
        <meta name='keywords' content="Emi calculator, car loan calculator, car loan emi calculator, monthly car emi, car emi calculator">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<link href="https://automobiles.mapsofindia.com/$Common/Stylesheet/Default.css" rel="stylesheet" type="text/css">
	<script src="https://automobiles.mapsofindia.com/$Common/Javascript/Default.js" type="text/javascript" language="javascript"></script>
<link rel="stylesheet" href="dropdown.css" type="text/css" />
  <link rel="stylesheet" type="text/css" href="style/style.css" />
    <script type="text/javascript" src="dropdown.js"></script>
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>

<body>
<table cellspacing=0 cellpadding=0 border="0" align="center" id="Master" style="border:solid 1px #000000;" bgcolor="white" width="1024">
		<!-- Header Row Start-->
	        	<tr>
        		<td colspan="2">
				<table cellpadding="0" cellspacing="0" width="100%" border="0">
				<tr>
				<td valign="middle"><a href="https://automobiles.mapsofindia.com"><img src="https://automobiles.mapsofindia.com/images/logo_automobile.png" width="250" height="55" alt="" border="0"/></a></td>
				<td valign="top" align="right" style="padding-right:2px;"><script type="text/javascript"><!--
										google_ad_client = "pub-0641096029648877";
										google_ad_width = 728;
										google_ad_height = 90;
										google_ad_format = "728x90_as";
										google_ad_type = "image";
										google_ad_channel ="";
										google_color_border = "ffffff";
										google_color_bg = "FFffff";
										google_color_link = "FF0000";
										google_color_url = "364996";
										google_color_text = "000000";
										//--></script>
										<script type="text/javascript"
										src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
										</script></td>
				</tr>

				</table>
        		</td>
        	</tr>
			<!-- Header Center Part Ends-->
			<tr><td style="height:5px;"></td></tr>
         <tr>
         	<td colspan="2">
         		<table cellspacing="0" cellpadding="0" border="0" width="1003" id="NavList">
         			<tr>

         				<td width="3%" class="NavLeftArc" align="right" valign="top"></td>
         				<td width="100%" class="NavArcRepeat"> 
         						<table border="0" width="100%" align="left" class="LeftNavLinks">
         							<tr>
         								<td align="left"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/HeaderNavBullet.jpg" alt=""></td>
         								<td><a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/used-cars.html">Used Cars</a></td>
         								<td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/HeaderNavBullet.jpg" alt=""></td>
         								<td><a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/second-hand-car-dealers.html">Used Cars Dealers</a></td>

										<td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/HeaderNavBullet.jpg" alt=""></td>
         								<td><a href="https://automobiles.mapsofindia.com/automobile-companies-in-india/commercial-vehicles-manufacturers/trucks.html">Trucks</a></td>				
         								<td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/HeaderNavBullet.jpg" alt=""></td>
         								<td><a href="https://automobiles.mapsofindia.com/autoexpo">Autoexpo 2010</a></td>
										<td align="left"><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/HeaderNavBullet.jpg" alt=""></td>
         								<td><a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/car-finance-companies.html">Car Finance</a></td> <td><img src="https://automobiles.mapsofindia.com/$Common/Image/Generic/HeaderNavBullet.jpg" alt=""></td>
         								<td><a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/car-insurance.html">Car Insurance</a></td>

										
         							</tr>
         						</table>	
         						
         				 </td>
         				 <td width="3%" class="NavRightArc" align="left"></td>
         			</tr>
         		</table>
         </td></tr>
         <tr><td colspan="2">  <%if((user_name1!=null|| userid1!=null) && recruiter_id==null){%>
         
         
         <dl class="dropdown">
             <dt id="one-ddheader" onmouseover="ddMenu('one',1)" onmouseout="ddMenu('one',-1)"><img src="images/image.gif" border="0" height="12"  /> &nbsp;&nbsp;<font color="#FFFFFF">Hi, <%=user_name1%> &nbsp;&nbsp;<img src="images/pagenation-hover-base.gif" border="0" height="13"  /> <img src="images/arrow1.gif" border="0"  /></font></dt>
             <dd id="one-ddcontent" onmouseover="cancelHide('one')" onmouseout="ddMenu('one',-1)">
                 <ul>
                     
                                                                            
                   <li><a href="MyFavourite.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>My Favorites&nbsp;&nbsp;</a></li>
                                                
                   
                     
                     <li><a href="ChangePassword.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;Change Password</a></li>
                     
                     <!-- <li><a href="Feedback.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;Feedback</a></li>-->
                     <li><a href="logout.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;Sign Out</a></li>
                 </ul>
             </dd>
         </dl>
         
         
         <% }%>
         
         <%if((recruiter_name!=null|| recruiter_id!=null) && userid1==null){%>
         
         
         <dl class="dropdown">
             <dt id="one-ddheader" onmouseover="ddMenu('one',1)" onmouseout="ddMenu('one',-1)"><img src="images/image.gif" border="0" height="12"  /> &nbsp;&nbsp;<font color="#FFFFFF">Hi, <%=recruiter_name%> &nbsp;&nbsp;<img src="images/pagenation-hover-base.gif" border="0" height="13"  /> <img src="images/arrow1.gif" border="0"  /></font></dt>
             <dd id="one-ddcontent" onmouseover="cancelHide('one')" onmouseout="ddMenu('one',-1)">
                 <ul>
                     <li><a href="User_Category.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;  Add Brands</a></li> 
                     <li><a href="KConvert.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;  Add Models</a></li> 
                     
                     
                     
                     <li><a href="MyJob.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;  Brands List</a></li>
                     <li><a href="bank.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp; Add Bank</a></li> 
                     
                     <li><a href="KConvertB.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp; Add Loan Scheme</a></li> 
                     
                     
                     
                     <li><a href="viewLoan.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp; View Loan Scheme</a></li> 
                     
                     <li><a href="ChangePassword_rec.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;Change Password</a></li>
                     
                     <!-- <li><a href="Feedback.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;Feedback</a></li>-->
                     <li><a href="logout.jsp" class="underline">&nbsp;&nbsp;<img src="images/bullet1.gif" border="0"/>&nbsp;&nbsp;Sign Out</a></li>
                 </ul>
             </dd>
         </dl>
         
         
         <% }%> </td></tr>
     
     
     	
	<!-- Header Row Ends --> 

         <!-- Header end -->
        
         
       
         


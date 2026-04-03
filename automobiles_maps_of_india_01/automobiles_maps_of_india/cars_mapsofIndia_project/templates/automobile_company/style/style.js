var loc = self.location;
function callNow2(frm){
var isOk = false;
var loc=self.location;
var parameters="";
var usageValue, currencyWithValue, currencyWithoutValue
	for (var i=0;i<frm.usage.length;i++){
		if (frm.usage[i].checked){
		 isOk = true;
		  usageValue = frm.usage[i].value;
		 break;
		}else{
			isOk = false;
		}
	}
	if ( isOk == false){
			alert("Please select your <Usage type> i.e. for Internet Site or Presentation etc.");
			return false;
	}
	if (frm.format.value == "NS"){
			alert("Please select map image format.");
			return false;
	
	}
return true;

}

////////////////////////////////////////////////////////////////////////////////////////
/////////// function for maps payment with watermark and without watermark /////////////
/////////////////////////date 11-03-2004///////////////////////////////////
function topframeMap1(){
document.writeln('<table cellpadding="5" cellspacing="0" width="100%" border="0" bordercolor="blue">');
document.writeln('<tr>');
document.writeln('<td>');
Instructions();
document.writeln('</td></tr></table>');
}

//////////////////////////////////////////////////////////////////////////////////////////
/////////////////// end new array for header banners for moi internal pages /////////////////
//////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////functions for online map shopping cart////////////////////////
////////////////////////Implemented By lk on 2nd December 2003.///////////////////////
var x = 250;
var mapRates = new Array( new Array("project",(x),(x) * 2 ), new Array("presentation",(x*2),(x*2) * 2 ), new Array("brochure",(x*6),(x*6) * 2 ),  new Array("print",(x*12),(x*12) * 2 ), new Array("tv",(x*16),(x*16) * 2 ),  new Array("internet",(x*20),(x*20) * 2 ),  new Array("all",(x*24),(x*24) * 2 )); 

function callNow3(frm){
var pcode,pname;
var isOk = false;
var parameters="";
var usageValue, format, currency, rate;
rate=0;
var usdRate=43.5;
pcode="MOIMAP";
pname=self.location+"";
//pname=self.location;
i=pname.toLowerCase().indexOf("mapsofindia.com");
//alert(i);
if (i >-1){
	pname=pname.substring(i,pname.length);
}
	if (frm.usage.value == "NS"){
		alert("Please select your <Usage type> i.e. for Internet Site or Presentation etc.");
		return false;
	}else{
		usageValue = frm.usage.value;
	}
	if (frm.format.value == "NS"){
			alert("Please select map image format.");
			return false;
	}else{
		format = frm.format.value;
	}
	
	//alert(usageValue);
	//alert(format);
	rate=getMapRate(usageValue,format);
	currency=frm.currency.value;
	if (currency == "usd"){
		rate=Math.ceil(rate/usdRate);
	}

	/*if (format.toLowerCase() == "withwatermark"){
		pname = pname.toLowerCase() + "-FOR-USE-IN-"+usageValue.toUpperCase()+"-WITH-WATERMARK"; 
	}else{
		pname = pname.toLowerCase() + "-FOR-USE-IN-"+usageValue.toUpperCase()+"-WITHOUT-WATERMARK"; 
	}*/

	if (format.toLowerCase() == "withwatermark"){
		usage="FOR-USE-IN-"+usageValue.toUpperCase()+"-WITH-WATERMARK"; 
	}else{
		usage="FOR-USE-IN-"+usageValue.toUpperCase()+"-WITHOUT-WATERMARK"; 
	}

	//////////////////////////////////////
	pcode+=rate; //added on 16 Mar 2004.
	/////////////////////////////////////
	
	//local path
	//parameters = "../../cart/" + currency + "/viewCart.html?" + pcode + "//" + pname + "//"+usage+"=" + rate + "//1";

	//remote path
	parameters = "http://www.mapsofindia.com/cart/" + currency + "/viewCart.html?" + pcode + "//" + pname + "//"+usage+"=" + rate + "//1";

	//alert(parameters);
	window.location.href=parameters;

//return true;
return false;
}

function getMapRate(strUsageValue,strFormat){
	for (var i=0;i<mapRates.length;i++){
		//alert(mapRates[i][0]);
		if (strUsageValue.toLowerCase() == mapRates[i][0].toLowerCase()){
			if (strFormat.toLowerCase() == "withwatermark"){

				return mapRates[i][1];
			}else{
				return mapRates[i][2];
			}
		}
	}
}
function Instructions(){

document.writeln('<form onsubmit="return callNow3(this);">');

//Stop Server Message
//<tr><td valign="top" bgcolor=teal colspan=2 align="center"><font style="font-family:verdana;color:white;font-size:11px;font-weight:bold;">Payment Gateway will be down from 1:00 to 2:30 and  5:30 to 7:00 IST on 20.12.2004 </font></td></tr>	

document.writeln('<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor="#E0F0E0" align=center style="{font-family:verdana;font-size:10px;}"><tr><td colspan=2 bgcolor="#ff0000"><p align="justify"><font color="#ffffff" style="font-size:12px"><B>Use this map in your Presentations, Internet Sites, Magazines, Print Media, Circulations, Brochures or TV Channel. Mapsofindia.com reserves the right to act against any unauthorized use of its Intellectual Property. All our Financial transactions are through Verisign secure payment gateway.</B></font></p></td></tr><tr bgcolor="#E7F1E7" height="20">	<Td> <B>Choose usage:</B></td>	<td>		<select name="usage" style="{font-family:verdana;font-size:10px;font-weight:bold;}"><option value="NS" selected>Please select map image Usage</option>	<option value="project">Project Report</option>		<option value="presentation">Presentation / Circulation</option>	<option value="brochure">Brochure</option>		<option value="internet">Internet site</option>		<option value="tv">TV Channel</option>		<option value="print">Print Media (Books, Newspapers, Magazines, Publication)</option>		<option value="all">All Uses</option>		</select>	</td>	</tr>	<tr bgcolor="#E7F1E7">	<Td valign="top"><B>Choose File Type:</B></td>	<td> 		<select name="format" style="{font-family:verdana;font-size:10px;font-weight:bold;}"><option value="NS" selected>Please select map image format</option><option value="withwatermark">With Watermark (logo)</option><option value="withoutwatermark">Without Watermark</option></select>	<B>Currency:</B> <select name="currency" style="{font-family:verdana;font-size:10px;font-weight:bold;}"><option value="inr">INR</option><option value="usd">USD</option></select>&nbsp;<input type=submit value="Buy Now" style="{font-family:verdana;font-size:10px; font-weight:bold;}">&nbsp;&nbsp;&nbsp;[<a href="../emrm.html" style="{color:blue;text-decoration:underline; font-weight:bold;}" onclick="return openeRates();">View Rates</a>]</td>	</tr><tr><Td colspan=2>You can also order these map images in various sizes, styles, formats. We can also customize maps for you as per your requirements. For more details Please write to <a href="mailto:gurmeet@infobase.co.in" class="links"><font style="font-size:11px;">gurmeet@infobase.co.in</font></a> with your requirement or call Gurmeet Singh at +91 9871399025 between 08:00 - 20:00 IST.</td></tr></table>');

document.writeln('</form>');

}
function openeRates(){
var ratesWin=window.open("http://www.mapsofindia.com/emrm.html","ratesWindow","width=400, height=190, toolbars=0");
return false;
}

//////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

function header(path)

{if (path=="" ){path="./";}
document.write('<table cellpadding=0 cellspacing=0 border=0 width="100%" align=""><tr><td  bgcolor="#206898" colspan=4><table cellpadding=3 cellspacing=0 border=0 width="100%"  background="http://www.mapsofindia.com/images/homeimages/02.jpg" style="background-repeat:repeat-x;background-position:bottom;"><tr><td align="center" valign="middle" width="110" style="padding-bottom:6px;"><a href="http://www.mapsofindia.com/maps/india/india.html"><img src="http://www.mapsofindia.com/images/homeimages/logo-8.jpg" width="110" height="113" border="0" alt="MapsOfIndia.com"></a></td><td style="padding-bottom:10px;" align="center">');
headerbanners();
//<img src="'+path+'images/homeimages/tourpackages.jpg" width="600" height="100" border="0" alt="">
document.write('</td></tr></table></td></tr><tr><td colspan=4 bgcolor="#287CC0"><table cellpadding=0 cellspacing=0 border=0 width="100%"><tr><td valign="top" align="left" style="padding-left:20px;"><font color="white" style="font-size:35px;font-weight:bold;">India Directory - <font style="font-size:30px;"><B>Maps of India</B></font></font></td></tr></table></td></tr><tr><td bgcolor="#287CC0" style="padding-left:0px;padding-bottom:3px;" class="toplinks" valign="middle" align=center width="71%"><a href="http://www.mapsofindia.com/aboutus.html" class="toplinks"><font style="font-size:10px;color:white;">ABOUT US</a>&nbsp;|<a href="mailto:operations@mapsofindia.com" class="toplinks"><font style="font-size:10px;color:white;">CONTACT US</a>&nbsp;|<a href="http://www.mapsofindia.com/feedback.html" class="toplinks"><font style="font-size:10px;color:white;">FEEDBACK</a>&nbsp;|<!-- <a href="http://www.mapsofindia.com/forms/suggestamap.htm" class="toplinks"><font style="font-size:10px;color:white;">SUGGEST A MAP</a>&nbsp;| --><a href="http://www.mapsofindia.com/link/index.html" class="toplinks"><font style="font-size:10px;color:white;">LINK TO US</a>&nbsp;|<a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" class="toplinks"><font style="font-size:10px;color:white;">MAPS OF INDIA CD</font></a>&nbsp;|<a href="http://www.mapsofindia.com/faq.html" class="toplinks"><font style="font-size:10px;color:white;">MAP SOLUTIONS</font></a>&nbsp;|<a href="http://www.mapsofindia.com/high-resolution-maps.html" class="toplinks"><font style="font-size:10px;color:white;">PRINTABLE MAPS</font></a></td><!-- <td align=right colspan=2 width="210" bgcolor="#287CC0"><a href="http://www.hotelsinindia.com/" style="text-decoration:none;" target="_blank"><img src="http://www.mapsofindia.com/images/homeimages/hotels.gif" border=0 WIDTH="244" HEIGHT="34" alt="HotelsInIndia.com" align=right></a></td> --></tr></table>');
}
//<!-- &nbsp;&nbsp;&nbsp;<a href="http://www.tourpackagesforindia.com/" style="text-decoration:none;" target="_blank"><img src="http://www.mapsofindia.com/images/homeimages/tour-packages-for-india.jpg" border=0 align="absmiddle" alt="Tour Packages for India"></a>&nbsp; -->

///////////////////////////////////////////////////////////////////////////////////////////
function chkemail()
{
	if((document.subscribe.email.value=="email address") || (document.subscribe.email.value==""))
	{
		alert('please enter your email id');
		return false;
	}
	else
	{
		return true;
	}
}

function leftpanel(path)
{if (path=="" ){path="./";}
document.write('<table cellpadding=0 cellspacing=0 border=0 align="right" width="100%" style="{border-right: 0 solid navy;}" height="100%"><tr bgcolor="#e8f4fd"><td valign="top" bgcolor="#e8f4fd" style="padding-bottom:8px;"><b><font color="#000088"><center><a href="http://www.mapsofindia.com/customer-care-chat/customer-care-chat.html"><img src="http://www.mapsofindia.com/images/customer-care-chat-old.jpg" alt="customer care chat" border="0" width="200" height="52"></a></center>Newsletter Subscription</b></font></b> <form action="http://www.indiamapstore.com/cgi-bin/dada/mail.cgi" onsubmit="return chkemail();" name=subscribe style="margin-bottom:0px;margin-top:0px;" target="_blank">  <input type="hidden" name="flavor" value="subscribe">  <input type="hidden" name="list" value="moi">  <input type="text" name="email" value="email address" onfocus="this.value=\'\';return false;" size="12">&nbsp;&nbsp;<input type="submit" value="Submit" style="BACKGROUND-COLOR: navy; COLOR: white; FONT-FAMILY: Verdana; FONT-SIZE: 10px; FONT-WEIGHT: bold;margin-top:-22px;width:50px;"><BR><A href="http://www.mapsofindia.com/forms/whymember.htm"><font style="COLOR: #000088; FONT-FAMILY: Arial; FONT-SIZE: 10px" >Why to Register</font></A></form> </td></tr><tr><td bgcolor="navy" height="1"></td></tr><tr><td valign="top" class="leftpanellinks"style="padding-top:10px;"><a href="http://www.mapsofindia.com/index.html" class="leftpanellinks">Home</a></td></tr><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks" ><a href="http://www.mapsofindia.com/worldmap/index.html" class="leftpanellinks">World Maps</a></td></tr><!-- new tr --><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/india-information/index.html" class="leftpanellinks">India Information</a></td></tr><!-- new tr --><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/outsourcing-to-india/index.html" class="leftpanellinks">Job Outsourcing</a></td></tr><!-- new tr --><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/general/index.html" class="leftpanellinks">Overview Maps of India</a></td></tr><!-- new tr --><tr><td height=10></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/reference-maps/index.html" class="leftpanellinks">Reference Maps</a></td></tr><tr><td valign="top" class="leftpanellinks" style="padding-left:20px;"><a href="http://www.mapsofindia.com/geography/index.html" class="leftpanellinks1"><li>Geography</a><a href="http://www.mapsofindia.com/census/index.html" class="leftpanellinks1"><li>Demography</a><a href="http://www.mapsofindia.com/history/index.html" class="leftpanellinks1"><li>History</a><a href="http://www.mapsofindia.com/economy/index.html" class="leftpanellinks1"><li>Economics/Business</a><a href="http://www.mapsofindia.com/culture/index.html" class="leftpanellinks1"><li>Social/Cultural</a><a href="http://www.mapsofindia.com/election/index.html" class="leftpanellinks1"><li>Politics</a><a href="http://www.mapsofindia.com/science/index.html" class="leftpanellinks1"><li>Science</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/states/index.html" class="leftpanellinks">States of India</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/india-locations/index.html" class="leftpanellinks">City Resources</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/infrastructure/index.html" class="leftpanellinks">Transport Network Maps</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/tourism/index.html" class="leftpanellinks">Travel Maps</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/sports-maps/index.html" class="leftpanellinks">Sports Maps</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/entertainment-maps/index.html" class="leftpanellinks">Entertainment Maps</a></td></tr><!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/maps/mapinnews/index.html" class="leftpanellinks">Maps in the News</a></td></tr><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/high-resolution-maps.html" class="leftpanellinks">Order a Map</a></td></tr><!-- new tr --><tr><td height=10></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/utilities/index.html" class="leftpanellinks">Utilities</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><font class="leftpanellinks">Distance Calculator</font></td></tr><tr><td valign="top" style="padding-top:10px;">');

//document.write('<table cellpadding=0 cellspacing=0 border=0 align="right" width="100%" style="{border-right: 1 solid navy;}" height="100%"><tr bgcolor="#e8f4fd"><td valign="top" bgcolor="#e8f4fd" style="padding-bottom:8px;"><b><font color="#000088"><b style="FONT-FAMILY: verdana; FONT-SIZE: 10px" >Newsletter Subscription</b></font></b> <form action="http://www.indiamapstore.com/cgi-bin/dada/mail.cgi" onsubmit="return chkemail();" name=subscribe style="margin-bottom:0px;margin-top:0px;" target="_blank">  <input type="hidden" name="flavor" value="subscribe">  <input type="hidden" name="list" value="moi">  <input type="text" name="email" value="email address" onfocus="this.value=\'\';return false;" size="12">&nbsp;&nbsp;<input type="submit" value="Submit" style="BACKGROUND-COLOR: navy; COLOR: white; FONT-FAMILY: Verdana; FONT-SIZE: 10px; FONT-WEIGHT: bold;margin-top:-22px;width:50px;"><BR><A href="http://www.mapsofindia.com/forms/whymember.htm"><font style="COLOR: #000088; FONT-FAMILY: Arial; FONT-SIZE: 10px" >Why to Register</font></A></form> </td></tr><tr><td bgcolor="navy" height="1"></td></tr><tr><td valign="top" class="leftpanellinks"style="padding-top:10px;"><a href="'+path+'index.html" class="leftpanellinks">Home</a></td></tr><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks" ><a href="'+path+'worldmap/index.html" class="leftpanellinks">World Maps</a></td></tr><!-- new tr --><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'india-information/index.html" class="leftpanellinks">India Information</a></td></tr><!-- new tr --><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'outsourcing-to-india/index.html" class="leftpanellinks">Job Outsourcing</a></td></tr><!-- new tr --><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'general/index.html" class="leftpanellinks">Overview Maps of India</a></td></tr><!-- new tr --><tr><td height=10></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'reference-maps/index.html" class="leftpanellinks">Reference Maps</a></td></tr><tr><td valign="top" class="leftpanellinks" style="padding-left:20px;"><a href="'+path+'geography/index.html" class="leftpanellinks1"><li>Geography</a><a href="'+path+'census/index.html" class="leftpanellinks1"><li>Demography</a><a href="'+path+'history/index.html" class="leftpanellinks1"><li>History</a><a href="'+path+'economy/index.html" class="leftpanellinks1"><li>Economics/Business</a><a href="'+path+'culture/index.html" class="leftpanellinks1"><li>Social/Cultural</a><a href="'+path+'election/index.html" class="leftpanellinks1"><li>Politics</a><a href="'+path+'science/index.html" class="leftpanellinks1"><li>Science</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'states/index.html" class="leftpanellinks">States of India</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'india-locations/index.html" class="leftpanellinks">City Resources</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'infrastructure/index.html" class="leftpanellinks">Transport Network Maps</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'tourism/index.html" class="leftpanellinks">Travel Maps</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'sports-maps/index.html" class="leftpanellinks">Sports Maps</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'entertainment-maps/index.html" class="leftpanellinks">Entertainment Maps</a></td></tr><!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'maps/mapinnews/index.html" class="leftpanellinks">Maps in the News</a></td></tr><tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><a href="http://www.mapsofindia.com/high-resolution-maps.html" class="leftpanellinks">Order a Map</a></td></tr><!-- new tr --><tr><td height=10></td></tr><tr><td valign="top" class="leftpanellinks"><a href="'+path+'utilities/index.html" class="leftpanellinks">Utilities</a></td></tr>		<!-- new tr -->	<tr><td height="10"></td></tr><tr><td valign="top" class="leftpanellinks"><font class="leftpanellinks">Distance Calculator</font></td></tr><tr><td valign="top" style="padding-top:10px;">');
body1();
document.write('</td></tr><tr><td height="100%"><font style="font-size:14px;color:white;">..............................</font></td></tr></table>');
}

function mailme()
{
window.open('http://www.mapsofindia.com/newsletter-pop.html','np','menubar=0,location=no,status=no,directories=no,toolbar=no,scrollbars=no,height=103, width=300,resizable=no,top=400,left=400' );
}

function footer(path)
{if (path=="" ){path="./";}
//mailme();

document.write('<table cellpadding=0 cellspacing=0 border=0 width="100%" align="center"><tr><td bgcolor="navy" height=2></td></tr><tr><td colspan=2 align="center" class="footerlinks" style="padding-top:10px;"><a href="http://www.mapsofindia.com/joinus.html" class="footerlinks"><font color=red>Join Us</font></a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/sitemap.htm" class="footerlinks">Site Map</font></a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/disclaim.htm" class="footerlinks">Disclaimer</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/faq.html" class="footerlinks">FAQs</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/maps/india/office-location.html" class="footerlinks">Our Office Location</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/agree.htm" class="footerlinks">Surfing Agreement</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/cgi-bin/rmessage.pl" class="footerlinks">Bulletin Board</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/mapserv/recommend11" class="footerlinks">Recommend this Site</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/affiliatenetwork.htm" class="footerlinks">Our Affiliates</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/forms/suggestamap.htm" class="footerlinks">Suggest a Map</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/advertisewithus.htm" class="footerlinks">Advertise with Us</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/wallpapers/index.html" class="footerlinks">Wallpapers</a>&nbsp;|&nbsp;<a href="http://www.dgreetings.com/" class="footerlinks" target="_blank">Greeting Cards</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/screensavers/index.html" class="footerlinks">Screen Savers</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/productprofile.htm" class="footerlinks">Product Portfolio</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/copyright/index.html" class="footerlinks">Copyright &amp; Terms of Use</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/forms/affiliate.htm" class="footerlinks">Be Our Affiliate</a>&nbsp;|&nbsp;<a href="javascript:void[0]" class="footerlinks" onclick="mailme();">Join Mailing List</a><!-- &nbsp;|&nbsp;<a href="http://www.mapsofindia.com/resellers/search_index.php" class="footerlinks" style="text-decoration:none;"><font face="arial" color="#C80C38" style="font-size:12px;font-weight:bold;">Dealer Locator</font></a> -->&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/poweryoursearch.htm" class="footerlinks">Power Your Map Search</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/privacy-policy/index.html" class="footerlinks">Privacy Policy</a>&nbsp;|&nbsp;<a href="http://www.mapsofindia.com/become-our-sponsor.html" style="text-decoration:none;"><font face="arial" color="#C80C38" style="font-size:12px;font-weight:bold;">Become Our Sponsor</font></a><!-- &nbsp;|&nbsp;<a href="http://www.mapsofindia.com/moi-presentation.pps" style="text-decoration:none;"><font face="arial" color="#C80C38" style="font-size:12px;font-weight:bold;">Maps of India Presentation</font></a> --></td></tr><tr><td valign="top" colspan=2 height=5><hr size=1 color="black"></td></tr><tr><td valign="top" colspan=2><table cellpadding=5 cellspacing=0 border=0 width="100%" align="center"><tr><td valign="bottom" width="60%"><a href="http://www.infobase.co.in" target="_blank"><img src="https://www.mapsofindia.com/ci-moi-images/bengali/2022/10/moi-logo.png" width="74" height="87" border="0" alt="Mapping Digiworld Pvt Ltd" align="left"></a><a href="http://www.infobase.co.in" target="_blank" style="text-decoration:none;"><font face="verdana" color="#2074a0" style="FONT-SIZE: 11px"><b>Mapping Digiworld Pvt Ltd</b></a><font face="verdana" color="#2074a0" style="FONT-SIZE: 11px"><br>Mobile : +91-8929683196<br><A href="mailto:solutions@mapsofindia.com"><font face="verdana" color="#2074a0" style="FONT-SIZE: 11px"><b>solutions@mapsofindia.com</b></font></a></font></td><td width="40%" valign="bottom"><div align="center"><font face="verdana" color="#2074A0" style="font-size:11px;"><b>We accept online payments through : </b> </font><img src="http://www.mapsofindia.com/images/homeimages/mastercard.gif" width="62" height="39" alt="Master Card" border="0">&nbsp;&nbsp;&nbsp;<img src="http://www.mapsofindia.com/images/homeimages/icici.gif" width="94" height="73" alt="ICICI" border="0">&nbsp;&nbsp;&nbsp;<img src="http://www.mapsofindia.com/images/homeimages/visamanu.jpg" width="62" height="39" alt="Visa" border="0"><!-- <br><br><font face="verdana" color="#000000" style="font-size:10px;"><div align="center"><b>Statement of Confidence</b></div><div align="justify">We use the latest Secure Sockets Layer (SSL) technology to ensure that your credit card transaction through our payment gateway is safe and secure. </font> --></td></tr></table></td></tr></table>');
}


//,'<table cellpadding=0 cellspacing=0 border=0 width="700" align="center"><tr><td align="center"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><BR> classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="700" height="125">  <param name=movie value="http://www.mapsofindia.com/images/homeimages/moi-banner.swf">  <param name=quality value=high>  <embed src="http://www.mapsofindia.com/images/home-images/moi-banner.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="700" height="125">  </embed> </object> </td></tr></table>'

// 12--09--2005  caper travel banner on internal pagess removed.
//,'<table cellpadding=0 cellspacing=0 border=0 width="700" align="center"><tr><td align="center"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="700" height="125">  <param name=movie value="http://www.mapsofindia.com/images/popup/caper-travel.swf">  <param name=quality value=high>  <embed src="http://www.mapsofindia.com/images/popup/caper-travel.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="700" height="125">  </embed> </object> </td></tr></table>'
// end  12--09--2005  caper travel banner on internal pagess removed.

// date 0 17-09-2005  <table cellpadding=0 cellspacing=0 border=0 width="700" align="center"><tr><td align="center"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="700" height="125">  <param name=movie value="http://www.mapsofindia.com/images/popup/livenupurpresentation.swf">  <param name=quality value=high>  <embed src="http://www.mapsofindia.com/images/popup/livenupurpresentation.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="700" height="125">  </embed> </object> </td></tr></table>
// end date 0 17-09-2005  

function cdbanner()
{
window.location="http://www.mapsofindia.com/forms/moi3-newbuy1.html";
}


//'<a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><IMG SRC="http://www.mapsofindia.com/images/homeimages/moi-banner1.jpg" WIDTH="700" HEIGHT="125" BORDER="0" ALT="MapsofIndiaCD Ver. 4.0"></a>','<a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><IMG SRC="http://www.mapsofindia.com/images/homeimages/moi-banner2.jpg" WIDTH="700" HEIGHT="125" BORDER="0" ALT="MapsofIndiaCD Ver. 4.0"></a>',

banner = new Array('<a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><IMG SRC="http://www.mapsofindia.com/images/homeimages/moi-banner3.jpg" WIDTH="700" HEIGHT="125" BORDER="0" ALT="MapsofIndiaCD Ver. 4.0"></a>','<a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><IMG SRC="http://www.mapsofindia.com/images/homeimages/moi-banner4.jpg" WIDTH="700" HEIGHT="125" BORDER="0" ALT="MapsofIndiaCD Ver. 4.0"></a>','<a href="http://www.mapsofindia.com/forms/moi4-new-year-offer.html" style="text-decoration:none;"><IMG SRC="http://www.mapsofindia.com/images/homeimages/moi-banner5.jpg" WIDTH="700" HEIGHT="125" BORDER="0" ALT="MapsofIndiaCD Ver. 4.0"></a>');


//banner = new Array('<table cellpadding=0 cellspacing=0 border=0 width="700" align="center"><tr><td align="center"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;" target="_blank"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="700" height="125">  <param name=movie value="http://www.mapsofindia.com/images/homeimages/moi-banner.swf">  <param name=quality value=high>  <embed src="http://www.mapsofindia.com/images/home-images/moi-banner.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="700" height="125">  </embed> </object> </td></tr></table>');

function headerbanners()
{
dat = Math.round(Math.random() * (banner.length - 1))
document.write(banner[dat]);
}

///////////////////////////////////////////////////////////////////////////////////
////////////////// FUNCTION FOR HEADER BANNERS ON MAPS PAGES/////////////////////////
/////////////////////////// DATE 11-03-2004 //////////////////////////////////////////

////////////////function cd products showing the banner in index pages/////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
function moibanner()
{
//document.write('<hr size=2 color="navy" width="95%"><table cellpadding=5 cellspacing=1 border=0 bordercolor="" width="100%" align="center"><tr><td valign="top" align="center" colspan=3><img src="http://www.mapsofindia.com/forms/cd-product1.gif" border=0 width="264" height="29"><!-- <font face="verdana" style="font-size:14px;font-weight:bold;color:navy;"><h3>Maps Of India CD</font> --></td></tr><tr><td valign="top"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:underline"><font face="verdana" style="font-size:13px;font-weight:bold;color:navy;">Maps of India CD Ver 4.0</font></a></td><td valign="top"><a href="http://www.mapsofindia.com/forms/newbuy2.html" style="text-decoration:underline"><font face="verdana" style="font-size:13px;font-weight:bold;color:navy;">India School Atlas Cd Ver 1.0</font></a></td></tr><!-- new td --><tr><td valign="top" style="padding-left:15px;"><a href="http://www.mapsofindia.com/forms/moi3-buyindia.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:black;"><u>Delivery within India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:red;">INR 995&nbsp;&nbsp;USD 23</font><br><br><a href="http://www.mapsofindia.com/forms/moi3-buyoutside.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:black;"><u>Delivery outside India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:red;">USD 50</font></td><!-- new td --><td valign="top" style="padding-left:15px;"><a href="http://www.mapsofindia.com/forms/buyindia2.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:black;"><u>Delivery within India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:red;">INR 250&nbsp;&nbsp;USD 5.5</font><br><br><a href="http://www.mapsofindia.com/forms/buyoutside2.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:black;"><u>Delivery outside India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:red;">USD 36</font></td></tr></table>');

document.write('<hr size=2 color="navy" width="95%"><div align="center"><div style="padding-top:5px;padding-bottom:5px;"><table cellpadding=5 cellspacing=1 bordercolor="" width="90%" align="center" border=0 bordercolor=navy style="border-top:2px solid navy;border-bottom:2px solid navy;border-left:2px solid navy;border-right:2px solid navy;"><tr><td valign="top" colspan=2><div align="left"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;"><font face="verdana" style="font-size:22px;font-weight:bold;color:navy;text-decoration:none;">Maps of India CD   <font style="font-size:12px;text-decoration:none;">Ver 4.0</font></font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><font style="font-family:verdana;font-size:11px;"><br>Allwonders Maps of India CD Ver 4.0 is an encyclopedia of over 4,000 India centric maps. The CD includes maps on India, States, Districts, and Cities and also has section on world maps, an inbuilt search, print and utility tools to provide a comprehensive referral guide to India. For more details, please <a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html">click here...</a></td><td valign=middle rowspan=3 colspan=2 width="100"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;"><img src="http://www.mapsofindia.com/images/homeimages/moicd4.jpg" width="100" height="89" border="0" alt="MapsOfIndia Cd Ver. 4.0" hspace=5></a></div></td></tr><tr><td valign="top" align="center"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;"><font style="font-family:verdana;font-size:11px;font-weight:bold;">Delivery Within India <br>Rs.995</font></a></td><td valign="top" align="center"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;"><font style="font-family:verdana;font-size:11px;font-weight:bold;">Delivery Outside India <br>$50.00<br></font></a></td></tr><tr><td colspan=2 align=center><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:none;"><img src="http://www.mapsofindia.com/images/moicdv4/buy_now_new.gif" border=0></a></td></tr></table></div>');
}
//////end function cd products showing the banner in index pages//////////
/////////////////////////////////////////////////////////////////////////


///////////function cd products showing the banner in index pages///////////////
///////////////////////////////////////////////////////////////////////////////
function moibanner1()
{
document.write('<table width="170"  border=0><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr></table>');

//document.write('<table bgcolor="#287CC0" cellpadding=2 cellspacing=1 border=0 style="border-left:2px solid  navy;border-right:2px solid navy;border-bottom:2px solid navy;border-top:2px solid navy;" width="98%" align="left"><tr><td valign="top" align="center"><font face="verdana" style="font-size:14px;font-weight:bold;color:white;"><h3>CD Products</font></td></tr><tr><td valign="top"><a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html" style="text-decoration:underline"><font face="verdana" style="font-size:10px;font-weight:bold;color:white;">Maps of India CD Ver 3.0</font></a></td></tr><!-- new td --><tr><td valign="top" style="padding-left:5px;"><a href="http://www.mapsofindia.com/forms/moi3-buyindia.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:white;"><u>Delivery within India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:yellow;">INR 950&nbsp;&nbsp;USD 21</font><br><a href="http://www.mapsofindia.com/forms/moi3-buyoutside.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:white;"><u>Delivery outside India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:yellow;">USD 50</font></td></tr><tr><td valign="top"><br><a href="http://www.mapsofindia.com/forms/newbuy2.html" style="text-decoration:underline"><font face="verdana" style="font-size:10px;font-weight:bold;color:white;">India School Atlas Cd Ver 1.0</font></a></td></tr><tr><!-- new td --><td valign="top" style="padding-left:5px;"><a href="http://www.mapsofindia.com/forms/buyindia2.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:white;"><u>Delivery within India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:yellow;">INR 250&nbsp;&nbsp;USD 5.5</font><br><a href="http://www.mapsofindia.com/forms/buyoutside2.html" style="text-decoration:none"><font face="verdana" style="font-size:11px;font-weight:normal;color:white;"><u>Delivery outside India</u></a><br><font face="verdana" style="font-size:11px;font-weight:normal;color:yellow;">USD 36</font></td></tr></table>');
}
//////end function cd products showing the banner in index pages////////////
///////////////////////////////////////////////////////////////////////////

/////////////////////////////// DISTANCE CALCULATOR /////////////////////////////////////////
function body1(s,d)
{
	if(s==null){
	s="Agartala";
	}
	
	if(d==null){
	d="Agartala";
	}
	
document.write("<form name=distancefrm method=post action='http://www.mapsofindia.com/mapserv/SearchServlet1' target = '_blank'>");


document.write("<font face='arial' style=\"font-size:13px;font-weight:bold;\" color=navy>From :</font><BR>");

	document.write("<select name='from'>");
	
	document.write("<option selected value='"+s+"'>"+s+"</option>");
	document.write("<option value='Agra'> Agra</option>");
	document.write("<option value='Ahmedabad'> Ahmedabad</option>");
	document.write("<option value='Aizawl'> Aizawl </option>");
	document.write("<option value='Ajmer'> Ajmer</option>");
	document.write("<option value='Akola'> Akola</option>");
	document.write("<option value='Aligarh'> Aligarh</option>");
	document.write("<option value='Allahabad'> Allahabad</option>");
	document.write("<option value='Ambala'> Ambala</option>");
	document.write("<option value='Amritsar'> Amritsar</option>");
	document.write("<option value='Asansol'> Asansol</option>");
	document.write("<option value='Aurangabad'> Aurangabad</option>");
	document.write("<option value='Bakhtiyarpur'> Bakhtiyarpur</option>");
	document.write("<option value='Bangalore'> Bangalore</option>");
	document.write("<option value='Barauni'> Barauni</option>");
	document.write("<option value='Barddhaman'> Barddhaman</option>");
	document.write("<option value='Bareilly'> Bareilly</option>");
	document.write("<option value='Belgaum'> Belgaum</option>");
	document.write("<option value='Bellary'> Bellary</option>");
	document.write("<option value='Bhagalpur'> Bhagalpur</option>");
	document.write("<option value='Bhavnagar'> Bhavnagar</option>");
	document.write("<option value='Bhopal'> Bhopal</option>");
	document.write("<option value='Bhubaneshwar'> Bhubaneshwar</option>");
	document.write("<option value='Bikaner'> Bikaner</option>");
	document.write("<option value='Bilaspur'> Bilaspur</option>");
	document.write("<option value='Calcutta'> Calcutta</option>");
	document.write("<option value='Chandigarh'> Chandigarh</option>");
	document.write("<option value='Chennai'> Chennai</option>");
	document.write("<option value='Chitradurga'> Chitradurga</option>");
	document.write("<option value='Coimbatore'> Coimbatore</option>");
	document.write("<option value='Cuttack'> Cuttack</option>");
	document.write("<option value='Dehradun'> Dehradun</option>");
	document.write("<option value='Delhi'> Delhi</option>");
	document.write("<option value='Dhanbad'> Dhanbad</option>");
	document.write("<option value='Dhule'> Dhule</option>");
	document.write("<option value='Dibrugarh'> Dibrugarh</option>");
	document.write("<option value='Dimapur'> Dimapur</option>");
	document.write("<option value='Dindigul'> Dindigul</option>");
	document.write("<option value='Durgapur'> Durgapur</option>");
	document.write("<option value='Ganganagar'> Ganganagar</option>");
	document.write("<option value='Gangtok'> Gangtok</option>");
	document.write("<option value='Gaya'> Gaya</option>");
	document.write("<option value='Ghaziabad'> Ghaziabad</option>");
	document.write("<option value='Ghazipur'> Ghazipur</option>");
	document.write("<option value='Gorakhpur'> Gorakhpur</option>");
	document.write("<option value='Gulbarga'> Gulbarga</option>");
	document.write("<option value='Guntur'> Guntur</option>");
	document.write("<option value='Gurgaon'> Gurgaon</option>");
	document.write("<option value='Guwahati'> Guwahati</option>");
	document.write("<option value='Gwalior'> Gwalior</option>");
	document.write("<option value='Haldia'> Haldia</option>");
	document.write("<option value='Hassan'> Hassan</option>");
	document.write("<option value='Hissar'> Hissar</option>");
	document.write("<option value='Hubli'> Hubli</option>");
	document.write("<option value='Hyderabad'> Hyderabad</option>");
	document.write("<option value='Imphal'> Imphal</option>");
	document.write("<option value='Indore'> Indore</option>");
	document.write("<option value='Jabalpur'> Jabalpur</option>");
	document.write("<option value='Jaipur'> Jaipur</option>");
	document.write("<option value='Jaisalmer'> Jaisalmer</option>");
	document.write("<option value='Jalandhar'> Jalandhar</option>");
	document.write("<option value='Jammu'> Jammu</option>");
	document.write("<option value='Jamnagar'> Jamnagar</option>");
	document.write("<option value='Jamshedpur'> Jamshedpur</option>");
	document.write("<option value='Jhansi'> Jhansi</option>");
	document.write("<option value='Jodhpur'> Jodhpur</option>");
	document.write("<option value='Jorhat'> Jorhat</option>");
	document.write("<option value='Kakinada'> Kakinada</option>");
	document.write("<option value='Kandla'> Kandla</option>");
	document.write("<option value='Kanniyakumari'> Kanniyakumari</option>");
	document.write("<option value='Kanpur'> Kanpur</option>");
	document.write("<option value='Kochi'> Kochi</option>");
	document.write("<option value='Kohima'> Kohima</option>");
	document.write("<option value='Kolhapur'> Kolhapur</option>");
	document.write("<option value='Kota'> Kota</option>");
	document.write("<option value='Kozhikode'> Kozhikode</option>");
	document.write("<option value='Krishnagiri'> Krishnagiri</option>");
	document.write("<option value='Kurnool'> Kurnool</option>");
	document.write("<option value='Lucknow'> Lucknow</option>");
	document.write("<option value='Ludhiana'> Ludhiana</option>");
	document.write("<option value='Madurai'> Madurai</option>");
	document.write("<option value='Mangalore'> Mangalore</option>");
	document.write("<option value='Meerut'> Meerut</option>");
	document.write("<option value='Moradabad'> Moradabad</option>");
	document.write("<option value='Motihari'> Motihari</option>");
	document.write("<option value='Mumbanganagar</option>");
	document.write("<option value='Gangtok'> Gangtok</option>");
	document.write("<option value='Gaya'> Gaya</option>");
	document.write("<option value='Ghaziabad'> Ghaziabad</option>");
	document.write("<option value='Ghazipur'> Ghazipur</option>");
	document.write("<option value='Gorakhpur'> Gorakhpur</option>");
	document.write("<option value='Gulbarga'> Gulbarga</option>");
	document.write("<option value='Guntur'> Guntur</option>");
	document.write("<option value='Gurgaon'> Gurgaon</option>");
	document.write("<option value='Guwahati'> Guwahati</option>");
	document.write("<option value='Gwalior'> Gwalior</option>");
	document.write("<option value='Haldia'> Haldia</option>");
	document.write("<option value='Hassan'> Hassan</option>");
	document.write("<option value='Hissar'> Hissar</option>");
	document.write("<option value='Hubli'> Hubli</option>");
	document.write("<option value='Hyderabad'> Hyderabad</option>");
	document.write("<option value='Imphal'> Imphal</option>");
	document.write("<option value='Indore'> Indore</option>");
	document.write("<option value='Jabalpur'> Jabalpur</option>");
	document.write("<option value='Jaipur'> Jaipur</option>");
	document.write("<option value='Jaisalmer'> Jaisalmer</option>");
	document.write("<option value='Jalandhar'> Jalandhar</option>");
	document.write("<option value='Jammu'> Jammu</option>");
	document.write("<option value='Jamnagar'> Jamnagar</option>");
	document.write("<option value='Jamshedpur'> Jamshedpur</option>");
	document.write("<option value='Jhansi'> Jhansi</option>");
	document.write("<option value='Jodhpur'> Jodhpur</option>");
	document.write("<option value='Jorhat'> Jorhat</option>");
	document.write("<option value='Kakinada'> Kakinada</option>");
	document.write("<option value='Kandla'> Kandla</option>");
	document.write("<option value='Kanniyakumari'> Kanniyakumari</option>");
	document.write("<option value='Kanpur'> Kanpur</option>");
	document.write("<option value='Kochi'> Kochi</option>");
	document.write("<option value='Kohima'> Kohima</option>");
	document.write("<option value='Kolhapur'> Kolhapur</option>");
	document.write("<option value='Kota'> Kota</option>");
	document.write("<option value='Kozhikode'> Kozhikode</option>");
	document.write("<option value='Krishnagiri'> Krishnagiri</option>");
	document.write("<option value='Kurnool'> Kurnool</option>");
	document.write("<option value='Lucknow'> Lucknow</option>");
	document.write("<option value='Ludhiana'> Ludhiana</option>");
	document.write("<option value='Madurai'> Madurai</option>");
	document.write("<option value='Mangalore'> Mangalore</option>");
	document.write("<option value='Meerut'> Meerut</option>");
	document.write("<option value='Moradabad'> Moradabad</option>");
	document.write("<option value='Motihari'> Motihari</option>");
	document.write("<option value='Mumbai'> Mumbai</option>");
	document.write("<option value='Muzaffarnagar'> Muzaffarnagar</option>");
	document.write("<option value='Muzaffarpur'> Muzaffarpur</option>");
	document.write("<option value='Mysore'> Mysore</option>");
	document.write("<option value='Nagpur'> Nagpur</option>");
	document.write("<option value='Nanded'> Nanded</option>");
	document.write("<option value='Nashik'> Nashik</option>");
	document.write("<option value='Nellore'> Nellore</option>");
	document.write("<option value='Panaji'> Panaji</option>");
	document.write("<option value='Paradwip'> Paradwip</option>");
	document.write("<option value='Pathankot'> Pathankot</option>");
	document.write("<option value='Patna'> Patna</option>");
	document.write("<option value='Pondicherry'> Pondicherry</option>");
	document.write("<option value='Porbandar'> Porbandar</option>");
	document.write("<option value='Pune'> Pune</option>");
	document.write("<option value='Purulia'> Purulia</option>");
	document.write("<option value='Raipur'> Raipur</option>");
	document.write("<option value='Rajkot'> Rajkot</option>");
	document.write("<option value='Rameswaram'> Rameswaram</option>");
	document.write("<option value='Ranchi'> Ranchi</option>");
	document.write("<option value='Ranippettai'> Ranippettai</option>");
	document.write("<option value='Raurkela'> Raurkela</option>");
	document.write("<option value='Rohtak'> Rohtak</option>");
	document.write("<option value='Sagar'> Sagar</option>");
	document.write("<option value='Saharanpur'> Saharanpur</option>");
	document.write("<option value='Salem'> Salem</option>");
	document.write("<option value='Sambalpur'> Sambalpur</option>");
	document.write("<option value='Shahjahanpur'> Shahjahanpur</option>");
	document.write("<option value='Siliguri'> Siliguri</option>");
	document.write("<option value='Shillong'> Shillong</option>");
	document.write("<option value='Shimla'> Shimla</option>");
	document.write("<option value='Shivpuri'> Shivpuri</option>");
	document.write("<option value='Silchar'> Silchar</option>");
	document.write("<option value='Solapur'> Solapur</option>");
	document.write("<option value='Srinagar'> Srinagar</option>");
	document.write("<option value='Surat'> Surat</option>");
	document.write("<option value='Thane'> Thane</option>");
	document.write("<option value='Thanjavur'> Thanjavur</option>");
	document.write("<option value='Thiruvananthapuram'> Thiruvananthapuram</option>");
	document.write("<option value='Thrissur'> Thrissur</option>");
	document.write("<option value='Tiruchchirappalli'> Tiruchchirappalli</option>");
	document.write("<option value='Tirunelveli'> Tirunelveli</option>");
	document.write("<option value='Tirupati'> Tirupati</option>");
	document.write("<option value='Tuticorin'> Tuticorin</option>");
	document.write("<option value='Udaipur'> Udaipur</option>");
	document.write("<option value='Ujjain'> Ujjain</option>");
	document.write("<option value='Ulhasnagar'> Ulhasnagar</option>");
	document.write("<option value='Vadodara'> Vadodara</option>");
	document.write("<option value='Varanasi'> Varanasi</option>");
	document.write("<option value='Vijayawada'> Vijayawada</option>");
	document.write("<option value='Vishakhapatnam'> Vishakhapatnam</option>");
	document.write("<option value='Warangal'> Warangal</option>");
	document.write("<option value='Chennai'>Chennai</option>");
	document.write("</select><br>");
	
	document.write("<font face='arial' style=\"font-size:13px;font-weight:bold;\" color=navy>To :</font><BR>");
	document.write("<select name='to'>");
	
	document.write("<option selected value='"+d+"'>"+d+"</option>");
	document.write("<option value='Agra'> Agra</option>");
	document.write("<option value='Ahmedabad'> Ahmedabad</option>");
	document.write("<option value='Aizawl'> Aizawl </option>");
	document.write("<option value='Ajmer'> Ajmer</option>");
	document.write("<option value='Akola'> Akola</option>");
	document.write("<option value='Aligarh'> Aligarh</option>");
	document.write("<option value='Allahabad'> Allahabad</option>");
	document.write("<option value='Ambala'> Ambala</option>");
	document.write("<option value='Amritsar'> Amritsar</option>");
	document.write("<option value='Asansol'> Asansol</option>");
	document.write("<option value='Aurangabad'> Aurangabad</option>");
	document.write("<option value='Bakhtiyarpur'> Bakhtiyarpur</option>");
	document.write("<option value='Bangalore'> Bangalore</option>");
	document.write("<option value='Barauni'> Barauni</option>");
	document.write("<option value='Barddhaman'> Barddhaman</option>");
	document.write("<option value='Bareilly'> Bareilly</option>");
	document.write("<option value='Belgaum'> Belgaum</option>");
	document.write("<option value='Bellary'> Bellary</option>");
	document.write("<option value='Bhagalpur'> Bhagalpur</option>");
	document.write("<option value='Bhavnagar'> Bhavnagar</option>");
	document.write("<option value='Bhopal'> Bhopal</option>");
	document.write("<option value='Bhubaneshwar'> Bhubaneshwar</option>");
	document.write("<option value='Bikaner'> Bikaner</option>");
	document.write("<option value='Bilaspur'> Bilaspur</option>");
	document.write("<option value='Calcutta'> Calcutta</option>");
	document.write("<option value='Chandigarh'> Chandigarh</option>");
	document.write("<option value='Chennai'> Chennai</option>");
	document.write("<option value='Chitradurga'> Chitradurga</option>");
	document.write("<option value='Coimbatore'> Coimbatore</option>");
	document.write("<option value='Cuttack'> Cuttack</option>");
	document.write("<option value='Dehradun'> Dehradun</option>");
	document.write("<option value='Delhi'> Delhi</option>");
	document.write("<option value='Dhanbad'> Dhanbad</option>");
	document.write("<option value='Dhule'> Dhule</option>");
	document.write("<option value='Dibrugarh'> Dibrugarh</option>");
	document.write("<option value='Dimapur'> Dimapur</option>");
	document.write("<option value='Dindigul'> Dindigul</option>");
	document.write("<option value='Durgapur'> Durgapur</option>");
	document.write("<option value='Ganganagar'> Ganganagar</option>");
	document.write("<option value='Gangtok'> Gangtok</option>");
	document.write("<option value='Gaya'> Gaya</option>");
	document.write("<option value='Ghaziabad'> Ghaziabad</option>");
	document.write("<option value='Ghazipur'> Ghazipur</option>");
	document.write("<option value='Gorakhpur'> Gorakhpur</option>");
	document.write("<option value='Gulbarga'> Gulbarga</option>");
	document.write("<option value='Guntur'> Guntur</option>");
	document.write("<option value='Gurgaon'> Gurgaon</option>");
	document.write("<option value='Guwahati'> Guwahati</option>");
	document.write("<option value='Gwalior'> Gwalior</option>");
	document.write("<option value='Haldia'> Haldia</option>");
	document.write("<option value='Hassan'> Hassan</option>");
	document.write("<option value='Hissar'> Hissar</option>");
	document.write("<option value='Hubli'> Hubli</option>");
	document.write("<option value='Hyderabad'> Hyderabad</option>");
	document.write("<option value='Imphal'> Imphal</option>");
	document.write("<option value='Indore'> Indore</option>");
	document.write("<option value='Jabalpur'> Jabalpur</option>");
	document.write("<option value='Jaipur'> Jaipur</option>");
	document.write("<option value='Jaisalmer'> Jaisalmer</option>");
	document.write("<option value='Jalandhar'> Jalandhar</option>");
	document.write("<option value='Jammu'> Jammu</option>");
	document.write("<option value='Jamnagar'> Jamnagar</option>");
	document.write("<option value='Jamshedpur'> Jamshedpur</option>");
	document.write("<option value='Jhansi'> Jhansi</option>");
	document.write("<option value='Jodhpur'> Jodhpur</option>");
	document.write("<option value='Jorhat'> Jorhat</option>");
	document.write("<option value='Kakinada'> Kakinada</option>");
	document.write("<option value='Kandla'> Kandla</option>");
	document.write("<option value='Kanniyakumari'> Kanniyakumari</option>");
	document.write("<option value='Kanpur'> Kanpur</option>");
	document.write("<option value='Kochi'> Kochi</option>");
	document.write("<option value='Kohima'> Kohima</option>");
	document.write("<option value='Kolhapur'> Kolhapur</option>");
	document.write("<option value='Kota'> Kota</option>");
	document.write("<option value='Kozhikode'> Kozhikode</option>");
	document.write("<option value='Krishnagiri'> Krishnagiri</option>");
	document.write("<option value='Kurnool'> Kurnool</option>");
	document.write("<option value='Lucknow'> Lucknow</option>");
	document.write("<option value='Ludhiana'> Ludhiana</option>");
	document.write("<option value='Madurai'> Madurai</option>");
	document.write("<option value='Mangalore'> Mangalore</option>");
	document.write("<option value='Meerut'> Meerut</option>");
	document.write("<option value='Moradabad'> Moradabad</option>");
	document.write("<option value='Motihari'> Motihari</option>");
	document.write("<option value='Mumbai'> Mumbai</option>");
	document.write("<option value='Muzaffarnagar'> Muzaffarnagar</option>");
	document.write("<option value='Muzaffarpur'> Muzaffarpur</option>");
	document.write("<option value='Mysore'> Mysore</option>");
	document.write("<option value='Nagpur'> Nagpur</option>");
	document.write("<option value='Nanded'> Nanded</option>");
	document.write("<option value='Nashik'> Nashik</option>");
	document.write("<option value='Nellore'> Nellore</option>");
	document.write("<option value='Panaji'> Panaji</option>");
	document.write("<option value='Paradwip'> Paradwip</option>");
	document.write("<option value='Pathankot'> Pathankot</option>");
	document.write("<option value='Patna'> Patna</option>");
	document.write("<option value='Pondicherry'> Pondicherry</option>");
	document.write("<option value='Porbandar'> Porbandar</option>");
	document.write("<option value='Pune'> Pune</option>");
	document.write("<option value='Purulia'> Purulia</option>");
	document.write("<option value='Raipur'> Raipur</option>");
	document.write("<option value='Rajkot'> Rajkot</option>");
	document.write("<option value='Rameswaram'> Rameswaram</option>");
	document.write("<option value='Ranchi'> Ranchi</option>");
	document.write("<option value='Ranippettai'> Ranippettai</option>");
	document.write("<option value='Raurkela'> Raurkela</option>");
	document.write("<option value='Rohtak'> Rohtak</option>");
	document.write("<option value='Sagar'> Sagar</option>");
	document.write("<option value='Saharanpur'> Saharanpur</option>");
	document.write("<option value='Salem'> Salem</option>");
	document.write("<option value='Sambalpur'> Sambalpur</option>");
	document.write("<option value='Shahjahanpur'> Shahjahanpur</option>");
	document.write("<option value='Siliguri'> Siliguri</option>");
	document.write("<option value='Shillong'> Shillong</option>");
	document.write("<option value='Shimla'> Shimla</option>");
	document.write("<option value='Shivpuri'> Shivpuri</option>");
	document.write("<option value='Silchar'> Silchar</option>");
	document.write("<option value='Solapur'> Solapur</option>");
	document.write("<option value='Srinagar'> Srinagar</option>");
	document.write("<option value='Surat'> Surat</option>");
	document.write("<option value='Thane'> Thane</option>");
	document.write("<option value='Thanjavur'> Thanjavur</option>");
	document.write("<option value='Thiruvananthapuram'> Thiruvananthapuram</option>");
	document.write("<option value='Thrissur'> Thrissur</option>");
	document.write("<option value='Tiruchchirappalli'> Tiruchchirappalli</option>");
	document.write("<option value='Tirunelveli'> Tirunelveli</option>");
	document.write("<option value='Tirupati'> Tirupati</option>");
	document.write("<option value='Tuticorin'> Tuticorin</option>");
	document.write("<option value='Udaipur'> Udaipur</option>");
	document.write("<option value='Ujjain'> Ujjain</option>");
	document.write("<option value='Ulhasnagar'> Ulhasnagar</option>");
	document.write("<option value='Vadodara'> Vadodara</option>");
	document.write("<option value='Varanasi'> Varanasi</option>");
	document.write("<option value='Vijayawada'> Vijayawada</option>");
	document.write("<option value='Vishakhapatnam'> Vishakhapatnam</option>");
	document.write("<option value='Warangal'> Warangal</option>");
	document.write("<option value='Chennai'>Chennai</option>");
	document.write("</select>");
	document.write("<br><br>");
	document.write("<input type = 'submit' name='submit' value ='Find Distance'>");
	document.write("</form>");
//document.write('<div width="" align="left">&nbsp;&nbsp;&nbsp;<OBJECT  width="140" height=60 classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" ID=navratriMH1  align="bottom"><PARAM NAME="bgcolor" VALUE="#000000"><PARAM NAME=movie VALUE="http://www.mapsofindia.com/images/cdbanner.swf"><PARAM NAME=quality VALUE=high>  <EMBED  src="http://www.mapsofindia.com/images/cdbanner.swf" quality=high height=60  WIDTH=140  TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"></EMBED></OBJECT></div>');
//document.write('<br><a href="http://www.indiahotelsandpackages.com/" target="_blank"><img src="http://www.mapsofindia.com/images/banners/capertravelbanner.gif" border=0 hspace=6></a>');
//document.write('<br>&nbsp;<a href="http://www.tourisminbhutan.com" target="_blank"><IMG alt="" border=0 src="http://www.mapsofindia.com/images/banners/bhutanbanner.gif" hspace=6></a>'); 
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function link()
{

document.write('<a href="http://www.123indiatravel.com/" target="_blank" id="links"><u>Travel to India</u></a>','&nbsp;&nbsp;&nbsp;<a href="http://www.india-hotels-resorts.com" target="_blank" id="links">India Hotels Resorts</a>')
}

//This function put the Price information in all pages where map has been made small and that map is in MOI CD
function showPrice() {

document.write('<div align=justify style="padding-left:5px;padding-bottom:4px;"><font face="verdana" style="font-size:10px"><b>This map is also available in bigger size and is printable in A4 size paper with all the locations & points mentioned are legible. You can order a copy of this map image using the form below or request a customized map. You can also buy the <a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html">Maps of India CD</a> containing all the maps of States and districts of India along with the other useful information. To Order <a href="http://www.mapsofindia.com/forms/moi3-newbuy1.html">Click Here..</a></b></a></font></div>')
}
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

function pop()
{
window.open('http://www.mapsofindia.com/apollo-homepage.html','win1','menubar=0,location=no,status=no,directories=no,toolbar=no,scrollbars=no,height=400, width=400,resizable=no' );

//window.open('http://www.mapsofindia.com/apollo.html','win1','menubar=0,location=no,status=no,directories=no,toolbar=no,scrollbars=no,height=400, width=400,resizable=no' );
//window.open("http://www.mapsofindia.com/buyimages.html","win1","menubar=0,location=0,status=no,directories=no,toolbar=0,scrollbars=0,width=400,height=400,resizable=yes,alwaysRaised=yes,left=10,top=0"); 
}







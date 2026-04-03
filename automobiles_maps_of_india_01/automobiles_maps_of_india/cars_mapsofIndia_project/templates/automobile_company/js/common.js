/*function init() {
//specify page to pop-under
var popunder="http://education.mapsofindia.com/popunder.html"

//specify popunder window features
//set 1 to enable a particular feature, 0 to disable
var winfeatures="width=300,height=250,scrollbars=0,resizable=0,toolbar=0,location=0,menubar=0,status=0,directories=0"

//Pop-under only once per browser session? (0=no, 1=yes)
//Specifying 0 will cause popunder to load every time page is loaded
var once_per_session=0

///No editing beyond here required/////

function get_cookie(Name) {
var search = Name + "="
var returnvalue = "";
if (document.cookie.length > 0) {
offset = document.cookie.indexOf(search)
if (offset != -1) { // if cookie exists
offset += search.length
// set index of beginning of value
end = document.cookie.indexOf(";", offset);
// set index of end of cookie value
if (end == -1)
end = document.cookie.length;
returnvalue=unescape(document.cookie.substring(offset, end))
}
}
return returnvalue;
}

function loadornot(){
if (get_cookie('popunder')==''){
loadpopunder()
document.cookie="popunder=yes"
}
}

function loadpopunder(){
win2=window.open(popunder,"",winfeatures)
win2.blur()
window.focus()
}

if (once_per_session==0)
loadpopunder()
else
loadornot()
}
window.onload = init;
*/



$(function(){
 $('#fot_bot2').show();
 $('#show').toggle(function(){
 $('#fot_bot2').slideDown("slow");
 $(this).attr("src","https://automobiles.mapsofindia.com/images/hide-button.png" );
 },function(){
 $('#fot_bot2').slideUp("slow");
 $(this).attr("src", "https://automobiles.mapsofindia.com/images/show-button.png" );
 });
 });

function footer()
{
	document.write('<div style="width:100%;text-align:center;color:#107979;font-size:13px">We follow <a href="http://www.editorialcalls.org/" style="color:#107979;text-decoration:underline;" rel="nofollow" target="_blank">editorialcalls.org</a> for border and boundary demarcations.</div><div style="width:99%;padding: 0 10px;text-align:left;font-size:13px;margin-bottom:10px;"><b>EU GDPR Update:</b> <br>Automobiles.mapsofindia has updated its Terms  and Privacy Policy to give Users more transparency into the data this Website collects, how it is processed and the controls Users have on their personal data. Users are requested to review the revised Privacy Policy  before using the website services, as any further use of the website will be considered as User\'s consent to Automobiles.mapsofindia <a href="https://www.mapsofindia.com/privacy-policy/">Privacy Policy</a> and <a href="https://www.mapsofindia.com/copyright/">Terms</a>.</div><div id="footer-links"><ul><li><a href="http://www.mapsofindia.com/aboutus.html">About US</a></li><li>|</li><li><a href="mailto:operations@mapsofindia.com">Contact US</a></li><li>|</li><li><a href="https://automobiles.mapsofindia.com/feedback.html">Feedback</a></li><li>|</li><li><a href="https://automobiles.mapsofindia.com/rss.xml">RSS Feed</a></li><li>|</li><li><a href="https://automobiles.mapsofindia.com/links.html">Link To Us</a></li><li>|</li><li><a href="http://www.mapsofindia.com/disclaim.htm">Disclaimer</a></li><li>|</li><li><a href="https://automobiles.mapsofindia.com/sitemap.html">Site Map</a></li><li>|</li><li><a href="https://automobiles.mapsofindia.com/sitemap.xml">XML Sitemap</a></li><li>|</li><li><a href="http://www.mapsofindia.com/faq.html">FAQs</a></li></ul></div><div id="footer-logo"></div><div id="footer-text"><div class="footer-text1"><b>Mapping Digiworld Pvt Ltd</b><br/>C-62,Community Center,Janakpuri,New Delhi-58(India)<br/>Tel:+91-11-25542045,51588013,51588014<br/>Fax:+91-11-25547264 Mobile:+91(0)9871399025<br/>solutions@mapsofindia.com</div></div><div style="clear:both"></div>');
}


function topnev()
{
	document.write('<div id="topnav"><div id="topnav_inner"><div class="usecar"><div class="usecar_l"></div><div class="usecar_m"><div class="linkTxt"><a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/used-cars.html"class="linkTxt">Used Cars</a></div></div><div class="usecar_r"></div></div><div class="usecar"><div class="usecar_l"></div><div class="usecar_m"><div class="linkTxt"><a href="https://automobiles.mapsofindia.com/upcoming-cars/"class="linkTxt">Upcoming Cars</a></div></div><div class="usecar_r"></div></div><div class="usecar"><div class="usecar_l"></div><div class="usecar_m"><div class="linkTxt"><a href="https://automobiles.mapsofindia.com/automobile-companies-in-india/commercial-vehicles-manufacturers/trucks.html"class="linkTxt">Trucks</a></div></div><div class="usecar_r"></div></div><div class="usecar"><div class="usecar_l"></div><div class="usecar_m"><div class="linkTxt"><a href="https://automobiles.mapsofindia.com/autoexpo/" class="linkTxt">Auto Expo 2014</a></div></div><div class="usecar_r"></div></div><div class="usecar"><div class="usecar_l"></div><div class="usecar_m"><div class="linkTxt"><a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/car-finance-companies.html"class="linkTxt">Car Finance</a></div></div><div class="usecar_r"></div></div><div class="usecar"><div class="usecar_l"></div><div class="usecar_m"><div class="linkTxt"><a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/car-insurance.html"class="linkTxt">Car Insurance</a></div></div><div class="usecar_r"></div></div></div><div class="search"><div class="search-left"><form action="https://automobiles.mapsofindia.com/search-results.html" id="cse-search-box"><input type="hidden" name="cx" value="partner-pub-8993220319430392:6lekgpa2j2f" /><input type="hidden" name="cof" value="FORID:10" /><input type="hidden" name="ie" value="ISO-8859-1" /><input type="text" name="q" size="25" /></div><div class="search-right"><input type="image" name="sa" src="https://automobiles.mapsofindia.com/images/search_button.gif"  class="search-button"/></div></form><script type="text/javascript" src="//www.google.com/cse/brand?form=cse-search-box&amp;lang=en"></script></div></div>');
}

function leftpanel()
{
	document.write('<div class="arrowlistmenu"><div class="menuheader expandable"><a href="https://automobiles.mapsofindia.com/cars/">Cars</a></div><ul class="categoryitems"><li><a href="https://automobiles.mapsofindia.com/cars/audi/"><span>Audi</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/bmw/"><span>BMW</span></a></li>	<li><a href="https://automobiles.mapsofindia.com/cars/bentley-motors/"><span>Bentley Motors</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/chevrolet-india/"><span>Chevrolet India</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/cars-engines/"><span>Cars Engines</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/fiat/"><span>Fiat</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/hyundai/"><span>Hyundai</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/honda/"><span>Honda India</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/hybrid-cars/"><span>Hybrid Cars</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/jaguar/"><span>Jaguar</span></a></li>	<li><a href="https://automobiles.mapsofindia.com/cars/maruti/"><span>Maruti Suzuki</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/nissan/"><span>Nissan</span></a></li>	<li><a href="https://automobiles.mapsofindia.com/cars/skoda/"><span>Skoda</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/tata/"><span>Tata Motors</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/general-motor/"><span>General Motor</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/toyota/"><span>Toyota</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/volkswagen/"><span>Volkswagen</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/hindustan-motors/"><span>Hindustan Motors</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/land-rover/"><span>Land Rover</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/ford/"><span>Ford</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/porsche/"><span>Porsche</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/rolls-royce/"><span>Rolls Royce</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/volvo/"><span>Volvo</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/daimlerchrysler/"><span>Daimlerchrysler</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/mahindra/"><span>Mahindra</span></a></li><li><a href="https://automobiles.mapsofindia.com/cars/mitsubishi/"><span>Mitsubishi</span></a></li></ul><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/automobile-companies-in-india/">Automobile Companies</a></div><div class="menuheader" style="cursor: default"><a href="https://automobiles.mapsofindia.com/automobile-components-and-spares/">Components&amp;Spares</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/automobile-service-stations-in-india/">Service Stations</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/petrol-stations/">Petrol Stations Finder</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/lubricants/">Lubricants</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/car-accessories/">Car Accessories</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/second-hand-car-market-in-india/">Second Hand Car Market</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/car-finance-and-insurance/">Car Finance and Insurance</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/useful-information/">Useful Information</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/bikes/">Bikes in India</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/automobile-engineering-colleges/">Automobile Engineering Colleges</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/auto-shows/">Auto Shows</a></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/auto-shows/motorsports.html">Motorsports</a></li></ul></div><div class="menuheader"style="cursor: default"><a href="https://automobiles.mapsofindia.com/auto-shows/auto-events-in-india.html">Auto events in India</a></div></div>');
}

function accordian()
{
	ddaccordion.init({
	headerclass: "expandable", //Shared CSS class name of headers group that are expandable
	contentclass: "categoryitems", //Shared CSS class name of contents group
	revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
	defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
	onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", "openheader"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["prefix", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})
}

//** Accordion Content script: By Dynamic Drive, at http://www.dynamicdrive.com
//** Created: Jan 7th, 08'. Last updated: June 7th, 2010 to v1.9

//Version 1.9: June 7th, 2010':
//**1) Ajax content support added, so a given header's content can be dynamically fetched from an external file and on demand.
//**2) Optimized script performance by caching header and content container references


var ddaccordion={
	ajaxloadingmsg: '<img src="loading2.gif" /><br />Loading Content...', //customize HTML to output while Ajax content is being fetched (if applicable)

	headergroup: {}, //object to store corresponding header group based on headerclass value
	contentgroup: {}, //object to store corresponding content group based on headerclass value

	preloadimages:function($images){
		$images.each(function(){
			var preloadimage=new Image()
			preloadimage.src=this.src
		})
	},

	expandone:function(headerclass, selected){ //PUBLIC function to expand a particular header
		this.toggleone(headerclass, selected, "expand")
	},

	collapseone:function(headerclass, selected){ //PUBLIC function to collapse a particular header
		this.toggleone(headerclass, selected, "collapse")
	},

	expandall:function(headerclass){ //PUBLIC function to expand all headers based on their shared CSS classname
		var $headers=this.headergroup[headerclass]
		this.contentgroup[headerclass].filter(':hidden').each(function(){
			$headers.eq(parseInt($(this).attr('contentindex'))).trigger("evt_accordion")
		})
	},

	collapseall:function(headerclass){ //PUBLIC function to collapse all headers based on their shared CSS classname
		var $headers=this.headergroup[headerclass]
		this.contentgroup[headerclass].filter(':visible').each(function(){
			$headers.eq(parseInt($(this).attr('contentindex'))).trigger("evt_accordion")
		})
	},

	toggleone:function(headerclass, selected, optstate){ //PUBLIC function to expand/ collapse a particular header
		var $targetHeader=this.headergroup[headerclass].eq(selected)
		var $subcontent=this.contentgroup[headerclass].eq(selected)
		if (typeof optstate=="undefined" || optstate=="expand" && $subcontent.is(":hidden") || optstate=="collapse" && $subcontent.is(":visible"))
			$targetHeader.trigger("evt_accordion")
	},

	ajaxloadcontent:function($targetHeader, $targetContent, config, callback){
		var ajaxinfo=$targetHeader.data('ajaxinfo')

		function handlecontent(content){ //nested function
			if (content){ //if ajax content has loaded
				ajaxinfo.cacheddata=content //remember ajax content 
				ajaxinfo.status="cached" //set ajax status to cached
				if ($targetContent.queue("fx").length==0){ //if this content isn't currently expanding or collapsing
					$targetContent.hide().html(content) //hide loading message, then set sub content's HTML to ajax content
					ajaxinfo.status="complete" //set ajax status to complete
					callback() //execute callback function- expand this sub content
				}
			}
			if (ajaxinfo.status!="complete"){
				setTimeout(function(){handlecontent(ajaxinfo.cacheddata)}, 100) //call handlecontent() again until ajax content has loaded (ajaxinfo.cacheddata contains data)
			}
		} //end nested function

		if (ajaxinfo.status=="none"){ //ajax data hasn't been fetched yet
			$targetContent.html(this.ajaxloadingmsg)
			$targetContent.slideDown(config.animatespeed)
			ajaxinfo.status="loading" //set ajax status to "loading"
			$.ajax({
				url: ajaxinfo.url, //path to external menu file
				error:function(ajaxrequest){
					handlecontent('Error fetching content. Server Response: '+ajaxrequest.responseText)
				},
				success:function(content){
					content=(content=="")? " " : content //if returned content is empty, set it to "space" is content no longer returns false/empty (hasn't loaded yet)
					handlecontent(content)
				}
			})
		}
		else if (ajaxinfo.status=="loading")
			handlecontent(ajaxinfo.cacheddata)
	},

	expandit:function($targetHeader, $targetContent, config, useractivated, directclick, skipanimation){
		var ajaxinfo=$targetHeader.data('ajaxinfo')
		if (ajaxinfo){ //if this content should be fetched via Ajax
			if (ajaxinfo.status=="none" || ajaxinfo.status=="loading")
				this.ajaxloadcontent($targetHeader, $targetContent, config, function(){ddaccordion.expandit($targetHeader, $targetContent, config, useractivated, directclick)})
			else if (ajaxinfo.status=="cached"){
				$targetContent.html(ajaxinfo.cacheddata)
				ajaxinfo.cacheddata=null
				ajaxinfo.status="complete"
			}
		}
		this.transformHeader($targetHeader, config, "expand")
		$targetContent.slideDown(skipanimation? 0 : config.animatespeed, function(){
			config.onopenclose($targetHeader.get(0), parseInt($targetHeader.attr('headerindex')), $targetContent.css('display'), useractivated)
			if (config.postreveal=="gotourl" && directclick){ //if revealtype is "Go to Header URL upon click", and this is a direct click on the header
				var targetLink=($targetHeader.is("a"))? $targetHeader.get(0) : $targetHeader.find('a:eq(0)').get(0)
				if (targetLink) //if this header is a link
					setTimeout(function(){location=targetLink.href}, 200) //ignore link target, as window.open(targetLink, targetLink.target) doesn't work in FF if popup blocker enabled
			}
		})
	},

	collapseit:function($targetHeader, $targetContent, config, isuseractivated){
		this.transformHeader($targetHeader, config, "collapse")
		$targetContent.slideUp(config.animatespeed, function(){config.onopenclose($targetHeader.get(0), parseInt($targetHeader.attr('headerindex')), $targetContent.css('display'), isuseractivated)})
	},

	transformHeader:function($targetHeader, config, state){
		$targetHeader.addClass((state=="expand")? config.cssclass.expand : config.cssclass.collapse) //alternate btw "expand" and "collapse" CSS classes
		.removeClass((state=="expand")? config.cssclass.collapse : config.cssclass.expand)
		if (config.htmlsetting.location=='src'){ //Change header image (assuming header is an image)?
			$targetHeader=($targetHeader.is("img"))? $targetHeader : $targetHeader.find('img').eq(0) //Set target to either header itself, or first image within header
			$targetHeader.attr('src', (state=="expand")? config.htmlsetting.expand : config.htmlsetting.collapse) //change header image
		}
		else if (config.htmlsetting.location=="prefix") //if change "prefix" HTML, locate dynamically added ".accordprefix" span tag and change it
			$targetHeader.find('.accordprefix').html((state=="expand")? config.htmlsetting.expand : config.htmlsetting.collapse)
		else if (config.htmlsetting.location=="suffix")
			$targetHeader.find('.accordsuffix').html((state=="expand")? config.htmlsetting.expand : config.htmlsetting.collapse)
	},

	urlparamselect:function(headerclass){
		var result=window.location.search.match(new RegExp(headerclass+"=((\\d+)(,(\\d+))*)", "i")) //check for "?headerclass=2,3,4" in URL
		if (result!=null)
			result=RegExp.$1.split(',')
		return result //returns null, [index], or [index1,index2,etc], where index are the desired selected header indices
	},

	getCookie:function(Name){ 
		var re=new RegExp(Name+"=[^;]+", "i") //construct RE to search for target name/value pair
		if (document.cookie.match(re)) //if cookie found
			return document.cookie.match(re)[0].split("=")[1] //return its value
		return null
	},

	setCookie:function(name, value){
		document.cookie = name + "=" + value + "; path=/"
	},

	init:function(config){
	document.write('<style type="text/css">\n')
	document.write('.'+config.contentclass+'{display: none}\n') //generate CSS to hide contents
	document.write('a.hiddenajaxlink{display: none}\n') //CSS class to hide ajax link
	document.write('<\/style>')
	jQuery(document).ready(function($){
		ddaccordion.urlparamselect(config.headerclass)
		var persistedheaders=ddaccordion.getCookie(config.headerclass)
		ddaccordion.headergroup[config.headerclass]=$('.'+config.headerclass) //remember header group for this accordion
		ddaccordion.contentgroup[config.headerclass]=$('.'+config.contentclass) //remember content group for this accordion
		var $headers=ddaccordion.headergroup[config.headerclass]
		var $subcontents=ddaccordion.contentgroup[config.headerclass]
		config.cssclass={collapse: config.toggleclass[0], expand: config.toggleclass[1]} //store expand and contract CSS classes as object properties
		config.revealtype=config.revealtype || "click"
		config.revealtype=config.revealtype.replace(/mouseover/i, "mouseenter")
		if (config.revealtype=="clickgo"){
			config.postreveal="gotourl" //remember added action
			config.revealtype="click" //overwrite revealtype to "click" keyword
		}
		if (typeof config.togglehtml=="undefined")
			config.htmlsetting={location: "none"}
		else
			config.htmlsetting={location: config.togglehtml[0], collapse: config.togglehtml[1], expand: config.togglehtml[2]} //store HTML settings as object properties
		config.oninit=(typeof config.oninit=="undefined")? function(){} : config.oninit //attach custom "oninit" event handler
		config.onopenclose=(typeof config.onopenclose=="undefined")? function(){} : config.onopenclose //attach custom "onopenclose" event handler
		var lastexpanded={} //object to hold reference to last expanded header and content (jquery objects)
		var expandedindices=ddaccordion.urlparamselect(config.headerclass) || ((config.persiststate && persistedheaders!=null)? persistedheaders : config.defaultexpanded)
		if (typeof expandedindices=='string') //test for string value (exception is config.defaultexpanded, which is an array)
			expandedindices=expandedindices.replace(/c/ig, '').split(',') //transform string value to an array (ie: "c1,c2,c3" becomes [1,2,3]
		if (expandedindices.length==1 && expandedindices[0]=="-1") //check for expandedindices value of [-1], indicating persistence is on and no content expanded
			expandedindices=[]
		if (config["collapseprev"] && expandedindices.length>1) //only allow one content open?
			expandedindices=[expandedindices.pop()] //return last array element as an array (for sake of jQuery.inArray())
		if (config["onemustopen"] && expandedindices.length==0) //if at least one content should be open at all times and none are, open 1st header
			expandedindices=[0]
		$headers.each(function(index){ //loop through all headers
			var $header=$(this)
			if (/(prefix)|(suffix)/i.test(config.htmlsetting.location) && $header.html()!=""){ //add a SPAN element to header depending on user setting and if header is a container tag
				$('<span class="accordprefix"></span>').prependTo(this)
				$('<span class="accordsuffix"></span>').appendTo(this)
			}
			$header.attr('headerindex', index+'h') //store position of this header relative to its peers
			$subcontents.eq(index).attr('contentindex', index+'c') //store position of this content relative to its peers
			var $subcontent=$subcontents.eq(index)
			var $hiddenajaxlink=$subcontent.find('a.hiddenajaxlink:eq(0)') //see if this content should be loaded via ajax
			if ($hiddenajaxlink.length==1){
				$header.data('ajaxinfo', {url:$hiddenajaxlink.attr('href'), cacheddata:null, status:'none'}) //store info about this ajax content inside header
			}
			var needle=(typeof expandedindices[0]=="number")? index : index+'' //check for data type within expandedindices array- index should match that type
			if (jQuery.inArray(needle, expandedindices)!=-1){ //check for headers that should be expanded automatically (convert index to string first)
				ddaccordion.expandit($header, $subcontent, config, false, false, !config.animatedefault) //3rd last param sets 'isuseractivated' parameter, 2nd last sets isdirectclick, last sets skipanimation param
				lastexpanded={$header:$header, $content:$subcontent}
			}  //end check
			else{
				$subcontent.hide()
				config.onopenclose($header.get(0), parseInt($header.attr('headerindex')), $subcontent.css('display'), false) //Last Boolean value sets 'isuseractivated' parameter
				ddaccordion.transformHeader($header, config, "collapse")
			}
		})
		$headers.bind("evt_accordion", function(e, isdirectclick){ //assign CUSTOM event handler that expands/ contacts a header
				var $subcontent=$subcontents.eq(parseInt($(this).attr('headerindex'))) //get subcontent that should be expanded/collapsed
				if ($subcontent.css('display')=="none"){
					ddaccordion.expandit($(this), $subcontent, config, true, isdirectclick) //2nd last param sets 'isuseractivated' parameter
					if (config["collapseprev"] && lastexpanded.$header && $(this).get(0)!=lastexpanded.$header.get(0)){ //collapse previous content?
						ddaccordion.collapseit(lastexpanded.$header, lastexpanded.$content, config, true) //Last Boolean value sets 'isuseractivated' parameter
					}
					lastexpanded={$header:$(this), $content:$subcontent}
				}
				else if (!config["onemustopen"] || config["onemustopen"] && lastexpanded.$header && $(this).get(0)!=lastexpanded.$header.get(0)){
					ddaccordion.collapseit($(this), $subcontent, config, true) //Last Boolean value sets 'isuseractivated' parameter
				}
 		})
		$headers.bind(config.revealtype, function(){
			if (config.revealtype=="mouseenter"){
				clearTimeout(config.revealdelay)
				var headerindex=parseInt($(this).attr("headerindex"))
				config.revealdelay=setTimeout(function(){ddaccordion.expandone(config["headerclass"], headerindex)}, config.mouseoverdelay || 0)
			}
			else{
				$(this).trigger("evt_accordion", [true]) //last parameter indicates this is a direct click on the header
				return false //cancel default click behavior
			}
		})
		$headers.bind("mouseleave", function(){
			clearTimeout(config.revealdelay)
		})
		config.oninit($headers.get(), expandedindices)
		$(window).bind('unload', function(){ //clean up and persist on page unload
			$headers.unbind()
			var expandedindices=[]
			$subcontents.filter(':visible').each(function(index){ //get indices of expanded headers
				expandedindices.push($(this).attr('contentindex'))
			})
			if (config.persiststate==true && $headers.length>0){ //persist state?
				expandedindices=(expandedindices.length==0)? '-1c' : expandedindices //No contents expanded, indicate that with dummy '-1c' value?
				ddaccordion.setCookie(config.headerclass, expandedindices)
			}
		})
	})
	}
}

//preload any images defined inside ajaxloadingmsg variable
ddaccordion.preloadimages(jQuery(ddaccordion.ajaxloadingmsg).filter('img'))
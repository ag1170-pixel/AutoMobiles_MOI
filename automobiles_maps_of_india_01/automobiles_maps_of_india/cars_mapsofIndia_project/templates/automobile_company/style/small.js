

// No of pixels to the right/left of the cursor to show the popup
// Values between 3 and 12 are best
	if (typeof offsetx == 'undefined') { var offsetx = -80;}

// No of pixels  below the cursor to show the popup
// Values between 3 and 12 are best
	if (typeof offsety == 'undefined') { var offsety = 17;}
	
ns4 = (document.layers)? true:false
ie4 = (document.all)? true:false

if (ie4) {
	if (navigator.userAgent.indexOf('MSIE 5')>0) {
		ie5 = true;
	} else {
		ie5 = false; }
} else {
	ie5 = false;
}

/////////for version 6
if (ie4) {
	if (navigator.userAgent.indexOf('MSIE 6')>0) {
		ie6 = true;
	} else {
		ie6 = false; }
} else {
	ie6 = false;
}

var x = 0;
var y = 0;
var snow = 0;
var sw = 0;
var cnt = 0;
var dir = 1;
var tr = 1;
if ( (ns4) || (ie4) ) {
	if (ns4) over = document.overDiv
	if (ie4) over = overDiv.style
	document.onmousemove = mouseMove
	if (ns4) document.captureEvents(Event.MOUSEMOVE)
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Caption popup center
function dcc(text, title) {
	dtc(2,text,title);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Clears popups if appropriate
function nd() {
	if ( cnt >= 1 ) { sw = 0 };
	if ( (ns4) || (ie4) ) {
		if ( sw == 0 ) {
			snow = 0;
			hideObject(over);
		} else {
			cnt++;
		}
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function dtc(d,text, title) {
	txt = "<TABLE WIDTH='' BORDER=0 CELLPADDING='2' CELLSPACING=0 BGCOLOR='#4048B0'><TR><TD><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><SPAN ID=\"PTT\"><B><FONT FACE=\"Arial,Helvetica\" COLOR='white'><small>"+title+"</small></FONT></B></SPAN></TD></TR></TABLE><TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR='white'><TR><TD><FONT FACE=\"Arial,Helvetica\" COLOR='navy' style=\"font-size:11px;\">"+text+"</FONT></TD></TR></TABLE></TD></TR></TABLE>"
	layerWrite(txt);
	dir = d;
	disp();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function disp() {
	if ( (ns4) || (ie4) ) {
		if (snow == 0)  {
			if (dir == 2) { // Center
				moveTo(over,x+offsetx,y+offsety);
			}
			if (dir == 1) { // Right
				moveTo(over,x+offsetx,y+offsety);
			}
			if (dir == 0) { // Left
				moveTo(over,x-offsetx-width,y+offsety);
			}
			showObject(over);
			snow = 1;
		}
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function mouseMove(e) {
	if (ns4) {x=e.pageX; y=e.pageY;}
	if (ie4) {x=event.x; y=event.y;}
	if (ie5) {x=event.x+document.body.scrollLeft; y=event.y+document.body.scrollTop;}
	if (ie6) {x=event.x+document.body.scrollLeft; y=event.y+document.body.scrollTop;}
	if (snow) {
		if (dir == 2) { // Center
			moveTo(over,x+offsetx,y+offsety);
		}
		if (dir == 1) { // Right
			moveTo(over,x+offsetx,y+offsety);
		}
		if (dir == 0) { // Left
			moveTo(over,x-offsetx-width,y+offsety);
		}
	}
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function cClick() {
	hideObject(over);
	sw=0;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Writes to a layer
function layerWrite(txt) {
	if (ns4) {
		var lyr = document.overDiv.document
		lyr.write(txt)
		lyr.close()
	}
	else if (ie4) document.all["overDiv"].innerHTML = txt
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function showObject(obj) {
	if (ns4) obj.visibility = "show"
	else if (ie4) obj.visibility = "visible"
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function hideObject(obj) {
	if (ns4) obj.visibility = "hide"
	else if (ie4) obj.visibility = "hidden"
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function moveTo(obj,xL,yL) {
	obj.left = xL
	obj.top = yL
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 <script>
     
     function numbercheck()
         {
         var totalb=<%=totalbuttons%>;
         var buttonno=<%=buttonno%>;
        
           var x=document.getElementById("button").value;
           if(isNaN(document.getElementById("button").value))
           {
		alert("Please enter a valid page number");
                document.getElementById("button").value=buttonno;
                return false;
            }
           else if(x>totalb)
            {
            document.getElementById("button").value=buttonno;
            return false;
            }
            else
            {
              
            document.frm.submit();
           
            }
            
                        
         }
 </script>
<%
if(buttonno>totalbuttons)
{  buttonno=1;
%>
There are only <%=totalbuttons%> pages available for the selected option.<br><br><br>
<%}
int start=1;
int end=1;
 if(totalbuttons<4 && (buttonno==1 || buttonno==2 || buttonno==3) ){
start=1;
end=totalbuttons;
} else {
start=buttonno-1;
if(start<1) {
start=1;
} else {
start=buttonno-1;
}
end=buttonno+1;
}
//out.print(start+""+end+""+totalbuttons);
if(totalbuttons>3) {
if((end-1)==totalbuttons) {
    end=totalbuttons;
} else {
    end=start+2;
}
}
if(totalbuttons!=1)
{
for(i=start;i<end;i++) {
if(i==buttonno) {
%>
<td align="center" class="black-button"><a class="black-button1" id="submitbutton" href="javascript:getbutton(<%=(i)%>)" ><%=(i)%></a> </td>
<!--input type="submit" style="text-decoration:none;color:red;" id="submitbutton" value="<%=(i)%>" onclick="getbutton(this)"-->
<%
} else {
%>
<td align="center" class="black-button"><a class="black-button1" id="submitbutton" href="javascript:getbutton(<%=(i)%>)"><%=(i)%></a> </td>
<!--input type="submit" id="submitbutton" value="<%=(i)%>" onclick="getbutton(this)"-->

<%
}}

}
if(totalbuttons>3)
{    
%>

<td align="center" class="black-button"><a class="black-button1" id="submitbutton" href="javascript:getbutton(<%=(totalbuttons)%>)">.. <%=totalbuttons%></a> </td>
<%}

if(buttonno<totalbuttons)
    {
%>

<td align="center" class="black-button"><a  id="submitbutton" href="javascript:getbutton(<%=(buttonno+1)%>)" class="black-button1">Next &gt; </a></td>
<%}
if(totalbuttons>1){
%>

 <td align="center" class="small-black"><b>Go To</b>  <input type="text" name="button" id="button" value="<%=buttonno%>" size="3" onchange="javascript:numbercheck()"  ></td>
 <%}
 %>
 

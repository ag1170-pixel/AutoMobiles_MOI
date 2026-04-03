
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="ConnectDB.jsp" %> 
<%@ page import="java.util.Date,java.util.Calendar,java.sql.*" %>
<%
String userid=(String)session.getAttribute("User_id");

String comp_id="1";//request.getParameter("cr");
String job_id=request.getParameter("cv");

session.setAttribute("browser",job_id);

String company_name="";

String job_headline="";

String company_image="";

String userId="";
String pack="";
String model="";
String mindownpay="";
String postedon="";
String image="";
String noviews="";

String description="";
String keyword="";




Statement state=con.createStatement();


try{
  
    String updatequery="update jobs set noviews=noviews+1 where  job_id='"+job_id+"'";
    
    int update=state.executeUpdate(updatequery);
    
    
    String query="select * from jobs j left join category on  j.category=category.Category_id  where  j.job_id='"+job_id+"'";
    
  
    ResultSet rs=state.executeQuery(query);

    while(rs.next()) {
        comp_id=rs.getString("Category_id");
        job_headline=rs.getString("job_headline");
      
        company_name=rs.getString("Category_name");
       
        mindownpay=rs.getString("mindownpay");if(mindownpay==null)mindownpay="";
        pack=rs.getString("package");if(pack==null || pack.equals("0"))pack="Not defined";
       
        description=rs.getString("job_description");if(description==null)description="";        
       
        postedon=rs.getString("postedon");if(postedon==null)postedon="";
        
        model=rs.getString("model");if(model==null)model="";
        
        mindownpay=rs.getString("mindownpay");if(mindownpay==null)mindownpay="";
        
        keyword=rs.getString("keywords");if(keyword==null)keyword="";
             
        image=rs.getString("image");if(image==null)image="";
    }
    

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
</script><title> Cars</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="description" content="Find here car brands along with bank interest rates and car company details" >
        
        <meta name="keywords" content="Cars, car brand, car model, car loan payment, minimum down payment, Emi calculator" >
        <meta name="generator" content="editplus" />
        <meta name="author" content="" />
        
    
        
        
        <script>
 function ismaxlength(obj){
var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
if (obj.getAttribute && obj.value.length>mlength)
obj.value=obj.value.substring(0,mlength)
}
   
	function takeaction(x)
{
    
  if(x=="Delete Photo")
  {
      var where_to= confirm("Do you really want to Delete this Photo ?");
       if (where_to== true)
                         {
                             document.getElementById("delVideo").value=<%=job_id%>;
                             document.frmEdit.action="deleteFrmUsrList.jsp"; 
                         }
                         else
                         {
                         return false;
                         }
  }
   else
   {
  
   document.getElementById("delVideo").value=<%=job_id%>;
   document.getElementById("vO").value=<%=comp_id%>;
   
   document.frmEdit.action="videoEdit.jsp"; 
   }
   document.frmEdit.submit();
}




		function checkComment()
        {
		 var comment=document.getElementById("t1").value;
               
		if(comment.length<5)
			{
			alert("Please enter your comment");
			return false;
			}
                 
                    var len=comment.length;
                    var space=0;
                    for(i=0;i<len;i++)
                        {
                        var s=comment.substring(i,i+1);
                        //alert(s);
                        if(s=="$" || s=="@" || s=="%" || s=="*" || s=="_" || s=="\\" ||  s=="(" || s==")" || s=="~" || s=="#" ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||  s=="," || s=="?")
                        {
                        alert("Please remove special characters from comment");
                        document.getElementById("user_name").focus();
                        return false;
                        }
                        
                        if(s==" ")
                        {
                        space++;
                        }
                        
                        }
                        
                       
                        if(space==len)
                        {
                        alert("Please enter your comment ");
			return false;
                        }
                        document.frm.submit();  
                        return true;
                      
			
			
        }
        </script>
        <script type="text/JavaScript">
  
         var set=false;
         var v=0;
         var a;  
        var userid=<%=userid%>;
        var videoid=<%=job_id%>;
        var videoowner=<%=comp_id%>;
         function generate()
         {
         
        // document.getElementById("t1").style.visibility="hidden";
        // document.getElementById("b1").style.visibility="hidden";
            var rate=0;
            star1 = new Image();
            star1.src = "images/grey-star.gif";
            star2 = new Image();
            star2.src= "images/red-star.gif";
           
           
          if(rate!=0)
            { 
	     var j;
             for (j=1;j<=rate;j++)
             {
             document.getElementById(j).src=star2.src;
             }
                      
             document.getElementById('vote').innerHTML="Thank you for your vote! ";
             set = true;
            }
            
            hidediv();
           hidestats();
         }

    function highlight(x)
    {
   
       
        if (set==false)
        {
            y=x*1+1
            switch(x) 
            {
            case "1": 
		
	    document.getElementById(x).src= star2.src;
	    document.getElementById('vote').innerHTML="Poor";
            break;
            case "2":for (i=1;i<y;i++)
            {
            document.getElementById(i).src= star2.src;
            }
            document.getElementById('vote').innerHTML="Average";
            break;
            case "3":for (i=1;i<y;i++)
            {
            document.getElementById(i).src= star2.src;
            }
            document.getElementById('vote').innerHTML="Good";
            break;
            case "4":for (i=1;i<y;i++)
            {
            document.getElementById(i).src= star2.src;
            }
            document.getElementById('vote').innerHTML="Very Good";
            break;
            case "5":for (i=1;i<y;i++)
            {
            document.getElementById(i).src= star2.src;
            }
            document.getElementById('vote').innerHTML="Excellent";
            break;
            }
        
            }
     }
   
    function losehighlight(x)
    {
       var o;
        if (set==false)
      {
         
        for (o=1;o<=5;o++)
        {
        
        document.getElementById(o).src=star1.src;
       
        document.getElementById('vote').innerHTML="";
       
        }
      }
       
    }
   function setStar(x)
    {
        if(userid==null)
        {
        alert("Sign in to rate this product");
        return false;
        }
       
       else if(userid==videoowner)
       {
        
         document.getElementById("vote").innerHTML="<font><strong>Can't rate own.</strong></font>";
         return false;
       }
       else
       {
      // alert("sdgdg  rating");
        y=x*1+1 ;
        if (set==false)
        { 
            switch(x)
            {
            case "1": a="1";
            flash(a);
            break;
            case "2": a="2";
            flash(a);
            break;
            case "3": a="3";
            flash(a);
            break;
            case "4":a="4";
            flash(a);
            break;
            case "5":a="5";
            flash(a); 
            break;
            }
        set=true;
       
        document.getElementById('rate').value = a;
        //alert("rating");
        return rating();
        
        }
      }
        
        
  }
        
      
       
      
    function flash()
    {
        //var rate=document.getElementById("text").value;
       //var user=document.getElementById("uid").value;
        //alert(user);
        //
        
        y=a*1+1
        switch(v)
        {
        case 0:
        for (i=1;i<y;i++)
        {
        document.getElementById(i).src= star1.src;
        }
        v=1
        setTimeout(flash,200)
        break;
        case 1:
        for (i=1;i<y;i++)
        {
        document.getElementById(i).src= star2.src;
        }
        v=2
        setTimeout(flash,200)
        break;
        case 2:
        for (i=1;i<y;i++)
        {
        document.getElementById(i).src= star1.src;
        }
        v=3
        setTimeout(flash,200)
        break;
        case 3:
        for (i=1;i<y;i++)
        {
        document.getElementById(i).src= star2.src;
        }
        v=4
        setTimeout(flash,200)
        break;
        case 4:
        for (i=1;i<y;i++)
        {
        document.getElementById(i).src= star1.src;
        }
        v=5
        setTimeout(flash,200)
        break;
        case 5:
        for (i=1;i<y;i++)
        {
        document.getElementById(i).src= star2.src;
        }
        v=6
        setTimeout(flash,200)
        break;
        }
   }
     
    function hidediv() 
    {
    document.getElementById('hideshow').style.visibility = 'hidden';
    document.getElementById('hideshow').style.display = 'none';
    }



    function showdiv() 
    {
    document.getElementById('hideshow').style.visibility = 'visible';
    document.getElementById('hideshow').style.display = 'block';
    } 
    
    
     function hidestats() 
    {
    document.getElementById('statsshow').style.visibility = 'hidden';
    document.getElementById('statsshow').style.display = 'none';
    }



    function showstats() 
    {
    document.getElementById('statsshow').style.visibility = 'visible';
    document.getElementById('statsshow').style.display = 'block';
    }
    
    
  
 </script>
        
        <script type="text/javascript" src="swfobject.js"></script> 
        <script src="CheckScript.js" type="text/javascript"></script>
        
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>
    
    <body onLoad="generate();">
        <%@ include file="header.jsp" %>
<tr>


		<!-- center Panel starts -->
        <td width="980" valign="top">
       
        <table cellspacing="5" cellpadding="2" border="0" width="98%" align="center">
            <tr>
                <td class="valign" width="100%" valign="top" align="left">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                                    <td align="left"  > 
                                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                            <tr><td bgcolor="#FFFFFF" align="left" valign="top" width="593" height="470" >
                                                <table align="left"  width="95%">
                                                
                                                <tr><td colspan="2"><div class="watch" align="left">Brand : <%=job_headline%></div> <hr>  </td></tr>
                                                
                                                <tr><td colspan="2"><font size="2" > <%=description%> </font>  <br><br></td></tr>    
                                                
                                                         <tr>
                                                             <td width="340">
                                                                 <table width="100%">
                                                                    <tr><td><b> Model :</b> </td><td class="verticaltext1"> <%=model%>  </b></td></tr>  
                                                                      <tr><td><b> Package :</b> </td><td class="verticaltext1"> Rs. <%=pack%>  </b></td></tr>  

                                                                        <tr><td><b>Posted On :</b> </td><td class="verticaltext1"> <%=postedon%> </td></tr>    

                                                                        <tr><td><b>Brand Keywords :</b> </td><td class="verticaltext1"> <%=keyword%></td></tr>    




                                                                        <tr><td><b>MinDown Payment : </b></td><td class="verticaltext1">Rs. <%=mindownpay%></td></tr>  
                                                                 </table>
                                                             </td>
                                                             <td width="153">
                                                                 <img src="brand-images/<%=image%>" width="150" height="150" border="1">
                                                             </td>
                                                         </tr>
                                                
                                                
                                        </td></tr>
                                        
                                        <tr height="20px"><td></td></tr>
                                        
                                        <tr><td height="40" colspan="2"> <script type="text/javascript"><!--

google_ad_client = "pub-0641096029648877";

/* 468x60, created 4/2/10 */

google_ad_slot = "1143374668";

google_ad_width = 468;

google_ad_height = 60;

//-->

</script>

<script type="text/javascript"

src="http://pagead2.googlesyndication.com/pagead/show_ads.js">

</script>

  </td></tr>
                                        <tr ><td class="watch_nav" valign="bottom" colspan="2" >
                                                <table cellpadding="5" cellspacing="5" style="border:1px solid #000000" width="100%">
                                                    
                                                <tr><th> Bank </th> <th> Interest Type </th><th> Months </th><th> Rate (%)  </th><th>  </th></tr>
                                              <%
                                              try {
                                                  
                                                  String bName="";
                                                  String intType="";
                                                  String month="";
                                                  String rate="";
                                                  if(pack.equals(""))pack="0";
                                                  if(mindownpay.equals(""))mindownpay="0";
                                                  
                                              float amt=Float.parseFloat(pack)- Float.parseFloat(mindownpay);
                                              String BankQ="select l.*,bank.bankName from bank , loanscheme l where bank.bankId=l.bankId order by bank.bankName , months";
                                              Statement stBank=con.createStatement();
                                              ResultSet rsBank=stBank.executeQuery(BankQ);
                                              String pBank="";
                                              int cnt=0;
                                              int i=0;
                                              while(rsBank.next())
                                                  {
                                                   i++;
                                                 
                                                  
                                                   bName=rsBank.getString("bankName");
                                                   intType=rsBank.getString("interestType");
                                                   month=rsBank.getString("months");
                                                  
                                                   rate=rsBank.getString("rate");
                                                  
                                                   if(cnt==0)
                                                       {
                                                        pBank=bName;
                                                      
                                                       }
                                                       else if(!pBank.equalsIgnoreCase(bName))
                                                           {
                                                             pBank=bName;
                                                              cnt++;
                                                           }
                                                 
                                                  %>
                                                
                                                  <tr class="small-blue1">
                                                           <%if(i==1) {%> <td><%=bName%></td> <%} else if(cnt>0) { %> <td><%=bName%></td> <%} else { %> <td></td><%}%>
                                                           <td><%=intType%></td> <td><%=month%></td> <td><%=rate%></td> <td> <a href="#" onclick="window.open('calc.jsp?m=<%=month%>&r=<%=rate%>&amt=<%=amt%>','calculator','width=500,height=400')">Apply</a></td> 
                                                  
                                                  <%
                                                  }
                                              } catch(Exception e) {
                                                  out.print(e.getMessage());
                                              }
                                                  %>
                                            
                                                <table cellspacing="5" cellpadding="0" border="0" align="left" style="padding-right:18" class="text6">
                                                    <tr>
                                                        
                                                    </tr>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <tr><td height="40"></td></tr>
                                    <tr ><td class="watch_nav" valign="bottom" colspan="2" >
                                         <!-- <table cellspacing="5" cellpadding="0" border="0" align="left" style="padding-right:18"  >
                                                <tr>
                                                            <td valign="middle">&nbsp; </td>
                                                            <td valign="middle"><b>Rating:</b></td>
                                                            <td  valign="middle"> 
                                                                
                                                                <img src="images/grey-star.gif" onmouseover="highlight(this.id)" onclick="setStar(this.id);" onmouseout="losehighlight(this.id)" id="1" style="width:16; height:15; float:left;" />
                                                                <img src="images/grey-star.gif" onmouseover="highlight(this.id)" onclick="setStar(this.id);" onmouseout="losehighlight(this.id)" id="2" style="width:16; height:15; float:left;" />
                                                                <img src="images/grey-star.gif" onmouseover="highlight(this.id)" onclick="setStar(this.id);" onmouseout="losehighlight(this.id)" id="3" style="width:16; height:15; float:left;" />
                                                                <img src="images/grey-star.gif" onmouseover="highlight(this.id)" onclick="setStar(this.id);" onmouseout="losehighlight(this.id)" id="4" style="width:16; height:15; float:left;" />
                                                                <img src="images/grey-star.gif" onmouseover="highlight(this.id)" onclick="setStar(this.id);" onmouseout="losehighlight(this.id)" id="5" style="width:16; height:15; float:left;" />
                                                               
                                                            </td>   
                                                         
                                                         <td valign="middle" width="100"> <input type="hidden"  id="rate" name="rate"> <div id="vote"><b></div></td>
                                                </tr>
                                            </table>-->
                                            
                                            <table cellspacing="5" cellpadding="0" border="0" align="left" style="padding-right:18" class="text6">
                                                <tr>
                                                    <td valign="middle"></td>
                                                     <td valign="middle"><a href="share.jsp"><img src="images/share-icon.gif"  border="0" alt="Share" title="Share"/>Share</td>
                                                     <td valign="middle" class="text6">
                                                         <% try {
                                                         String command = "select * from favourite where User_id='"+userid+"' and job_id='"+job_id+"' and Favourite='1' ";
                                                         Statement stmt =con.createStatement();
                                                         
                                                         ResultSet rs3=stmt.executeQuery(command);
                                                         //int querytype=0;
                                                         if(rs3.next()) {
                                                             
                                                          %> 
                                                        <img src="images/favorites-icon.gif"  border="0" alt="Favourite" title="Favourite"/>Added to List.
                                                             <%
                                                             
                                                             } else {
                                                             %>
                                                        <a href="AddFavourite.jsp?&x6546df5b6g5gfbfgh=<%=job_id%>"><img src="images/favorites-icon.gif"  border="0" alt="Favourite" title="Favourite"/>Add to My List
                                                         <%
                                                         }
                                                         } catch(Exception e) {
                                                           
                                                         }
                                                         %>
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                            
                                        </td>
                                    </tr>
                                    <tr><td colspan="2"><div id="ratemessage" ></div> </td></tr>
                                    
                                        <!--<tr>
                                        <td colspan="2">
                                            <table width="100%"><tr>
                                                    <td align="left">
                                                        <%// if( userid!=null)
                                                        //{
                                                        //if//(userid.equals(comp_id))
                                                        //{ %>
                                                        <form action="" method="post" name="frmEdit">
                                                            <input type="button" name="" id="" value="Delete Job" onclick="takeaction(this.value)"> &nbsp;                                                    
                                                            <input type="button" name="" id="" value="Edit Job" onclick="takeaction(this.value)">
                                                            <input type="hidden" name="delVideo" id="delVideo" value="">
                                                            <input type="hidden" name="vO" id="vO" value="">
                                                        </form>
                                                        <% //}} %>
                                                    </td>
                                                    
                                                <td align="right">You can see the converted mobile clip in <b>Mobile Clips</b> section.</td></tr>
                                   </table>
                                        </td>
                                    </tr>-->
                                </table>
                        
                        </td>
                            
                            <%
                         
                            } catch(Exception e) {
                            out.println(e.getMessage());
                            }
                                                    
                            
                            %> 
                        </tr>
                    </table><!--<br />
                    <table cellspacing="5" cellpadding="0" border="0" align="center" class="embed-mid">
                        <tr>
                            <td align="left" class="small-blue"><b>Embed Code:</b>
							
                           
                        </tr>
                    </table>-->
                    <br>

                    <table cellspacing="0" cellpadding="0" border="0" align="center" class="embed-mid">
                        <%
                       
                        try
                        {
                        int countRow=0;
                        String command="select count(*) as countRows from favourite where job_id='"+job_id+"' and favourite.Comments is not null";
                    
                        String commentdate="";
                        ResultSet rs4=state.executeQuery(command);
                        if(rs4.next())
                            countRow=rs4.getInt("CountRows");
                        
                        command = "select user_login.User_name,favourite.Comments,favourite.Comment_date from favourite,user_login where user_login.User_id=favourite.User_id and favourite.job_id='"+job_id+"' and favourite.Comments is not null order by Comment_date desc ";
                       // out.print(command);
                        rs4=null;
                        rs4=state.executeQuery(command);
                        
                        
                        String comment="";
                        String usernme="";
                        %>
                        <tr>
                        <td class="nav_comments" width="28%"  valign="middle"><a href="javascript:hidestats()" class="text1" >Comments (<%=countRow%>)</td>
                            <td class="nav_comments" width="28%" ><a href="javascript:showstats()" class="text1" >Stats</a></td>
                        <td width="35%"><%if(userid==null){%><a href="user_login.jsp" class="small-blue1"><b>Sign In to post a Comment</b></a><%}else{%><a href="javascript:showdiv()" class="small-blue1"><b>Post a Comment</b></a><%}%> </a></td>
                        </tr>
                    </table>
                    <form action="Comment.jsp" name="frm" method="post">
                    <div id="hideshow">
                     <%
                        Calendar cal=Calendar.getInstance();
                        int day=cal.get(Calendar.DATE);
                        int month=cal.get(Calendar.MONTH);
                        int year=cal.get(Calendar.YEAR);
                        int hrs=cal.get(Calendar.HOUR);
                        int min=cal.get(Calendar.MINUTE);
                        String date=year+"-"+(month+1)+"-"+day+" "+hrs+":"+min+":00";
                        %>
                        <table cellspacing="0" cellpadding="0" border="0" align="center" class="comment-mid" >
                            <tr><td align="center">
                                     <br>
                                    
                                        <input type="hidden" value="<%=date%>" name="dtes"/>
                                        <input type="hidden" name="user" id="user" value="<%=userid%>">
                                        <input type="hidden" name="jid" id="jid" value="<%=job_id%>">
                                       
                                        
                                        <textarea name="t1" id="t1" rows="5" cols="40" maxlength="200" onkeyup="return ismaxlength(this)" ></textarea><br>
                                        <br>
                                        <script type="text/javascript">
                                                    <!--
                                                    document.write('  <input type="button"  value="Post Comment" onclick="return checkComment()" id="b1">');
                                                    -->
                                        </script>
                                        <noscript> Please enable javascript </noscript> 
                                        
                                        
                                    
                        </td></tr></table>
                    </div> </form>   
                    
                    <div id="statsshow">
                        <% try {
                            String nofavourite="";
                            command = "select count(*) as count from favourite where job_id='"+job_id+"' and Favourite='1' ";
                            Statement stmt =con.createStatement();
                            
                            ResultSet rs3=stmt.executeQuery(command);
                            //int querytype=0;
                            if(rs3.next()) {
                                nofavourite=rs3.getString("count");
                        
                        %>
                        <table cellspacing="5" cellpadding="5" border="0" align="center" class="comment-mid" >
                            <tr><td align="left" class="small-blue1"  width="20%">Added On </td><td align="left"> <%=postedon%> </td>
                            <td align="left"  width="20%" class="small-blue1"> Viewed </td><td align="left"> <%=noviews%></td></tr>                              
                          
                         <!--  <tr><td align="left" width="20%" class="small-blue1"> Rating </td><td align="left"> <%//=rating%> </td>-->
                          <tr>   <td align="left" class="small-blue1"> Responses </td><td align="left"> <%=countRow%> </td>
                           
                           <td align="left" width="20%" class="small-blue1"> Favourited</td><td align="left"> <%=nofavourite%> </td></tr> 
                                    
                      </table>
                      <%
                            }
                        } catch(Exception e) {
                            
                        }
                      %>
                      
                      
                      
                    </div>
                    
                    
                    <table cellspacing="5" cellpadding="0" border="0" align="center" width="99%">
                        <%
                        while(rs4.next()) {
                            usernme=rs4.getString("User_name");
                            comment=rs4.getString("Comments");
                            commentdate=rs4.getString("Comment_date");
                            if(comment!=null) {
                        %>
                        
                        <tr>
                            <td class="textblack" colspan="5"><span class="small-red"><%=usernme%></span> (<%=commentdate%>) </td>
                        </tr>
                        <tr>
                            <td class="textblack" width="82%" colspan="5"><%=comment%></td>
                            <!--<td><a href="" class="small-blue1">Reply</a></td>
									<td class="textblack">0</td>
									<td class="textblack"><img src="images/thumb-icon.gif" width="39" height="20" alt="" /></td>-->
                        </tr>
                        <tr><td colspan="5"><hr /></td></tr>
                        
                        <%
                            }
                            
                        }
                        
                        } catch(Exception e) {
                          out.println(e.getMessage());  
                        }
                        %>  
                        
                    </table>
                    
                    
                </td>
                <td class="valign">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" class="user_table1">
                        <tr>
                            <td class="valign"><img src="images/featured-base-left.gif" width="3" height="494" alt="" /></td>
                            <td class="valign">
                                   <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                             <script language="JavaScript">
function get_round(X) { return Math.round(X*100)/100 }
function showpay() {
 if ((document.calc.loan.value == null || document.calc.loan.value.length == 0) ||
     (document.calc.months.value == null || document.calc.months.value.length == 0)
||
     (document.calc.rate.value == null || document.calc.rate.value.length == 0))
 { document.calc.pay.value = "Please put the valid value";
document.calc.tot_amount.value = "Please put the valid amount";
document.calc.tot_interest.value = "Please put the valid value";
document.calc.yearly_interest.value = "Please put the valid value";
document.calc.interest_pa.value = "Please put the valid value";
document.calc.interest_pm.value = "Please put the valid value";
 }
 else
 {
 var princ = document.calc.loan.value;
 var term  = document.calc.months.value;
 var intr   = document.calc.rate.value / 1200;
 var yrs   = document.calc.months.value / 12;
 document.calc.pay.value = get_round(princ * intr / (1 - (Math.pow(1/(1 + intr), term))));
 document.calc.tot_amount.value = get_round(document.calc.pay.value * term);
 document.calc.tot_interest.value = get_round(document.calc.tot_amount.value - princ);
 document.calc.yearly_interest.value = get_round(document.calc.tot_interest.value / yrs);
 document.calc.interest_pa.value = get_round(document.calc.yearly_interest.value / princ * 100);
 document.calc.interest_pm.value = get_round((document.calc.yearly_interest.value / princ * 100)/12);
 }
}
                </script>
                
                <table width="400" border="0" align="center" style="border:1px solid #0777c4; ">
                    
                      <tr>
                        <td bgcolor="#001eb0" colspan="2" align="center" height="30" valign="middle">
                        
                                <font color="white" size="2">  EMI Calculator</font>
                            </td>
                    </tr>
                    <form method="post" name="calc" id="calc">
                    <tr>
                        <td class="bodyarial11" align="left">
                            Loan Amount<font color="#FF0000">*</font>
                        </td>
                        <td align="right" ><input
                                type="text" name="loan"
                            size="10" value="<%=pack%>" /></td>
                    </tr>
                    <tr>
                        <td class="bodyarial11" align="left">
                            Loan Tenure (Months)<font color="#FF0000" face="Verdana" size="2">*</font>
                        </td>
                        <td
                            align="right"><input type="text"
                                             name="months" size="10" /></td>
                        
                    </tr>
                    <tr>
                        <td class="bodyarial11" align="left">
                            Interest Rate (Reducing)<font color="#FF0000" face="Verdana" size="2">*</font>
                        </td>
                        <td align="right" ><input
                                type="text" name="rate"
                            size="10" /></td>
                    </tr>
                    <tr>
                        
                        <td class="bodyarial11" align="left"> 
                            Monthly Payment (EMI)
                        </td>
                        <td align="right"><p align="center">
                                <input name="button" type="button" class="bluebutton" onclick='showpay()'
                                       value="Calculate" />
                                &nbsp;<input name="reset" type="reset" class="bluebutton"
                                             value="Reset" />
                        </p></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" ><div align="center">
                            
                            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="80%" id="AutoNumber3">
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Calculated Monthly EMI</em> </td>
                                    <td
                                        align="right" ><input
                                        type="text" name="pay" size="12" /></td>
                                </tr>
                                
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" > Total Amount with Interest</td>
                                    <td
                                        align="right" ><input
                                        type="text" name="tot_amount" size="12" /></td>
                                </tr>
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Flat Interest Rate PA</em></td>
                                    <td
                                        align="right" width="109"><input
                                        type="text" name="interest_pa" size="12" /></td>
                                    
                                </tr>
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Flat Interest Rate PM</em></td>
                                    <td
                                        align="right" ><input
                                        type="text" name="interest_pm" size="12" /></td>
                                </tr>
                                <tr>
                                    <td
                                    align="right" class="bodyarial11" ><em style="font-style: normal">Total Interest Amount</em> </font> </td>
                                    
                                    <td
                                        align="right" width="109"><input
                                            type="text" name="tot_interest" size="12" />
                                    </font></td>
                                </tr>
                                <tr>
                                    <td
                                        align="right" class="bodyarial11" ><em style="font-style: normal">Yearly Interest Amount</em></td>
                                    <td
                                        align="right" ><input
                                        type="text" name="yearly_interest" size="12" /></td>
                                    
                                </tr>
                        </table> </td>
                    </tr>
                </table> <br><br>
                                <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                                    <tr><td colspan="3" class="featured">More Brands  By   <%=company_name%>
                                    
                                            <div class="featured_category" style="padding-top:8px"> 
                                                <table cellspacing="0" cellpadding="0" border="0"  align="center" >
                                                    
                                                    <%
                                                    
                                                    
                                                    try {
                                                        
                                                        String joblocation="";
                                                        String jobheadline="";
                                                        String price="";
                                                        String jmodel="";
                                                        String mindown="";
                                                        String job_desc="";
                                                        
                                                        String mJobId="";
                                                        
                                                       
                                                        ResultSet rsm=null;
                                                        int rowcount=0;
                                                        rsm=state.executeQuery("select * from jobs where category='"+comp_id+"' and job_id!='"+job_id+"' limit 0,5");
                                                        
                                                        while(rsm.next()) {
                                                        
                                                       mJobId=rsm.getString("job_id"); 
                                                        jobheadline=rsm.getString("job_headline"); 
                                                        
                                                        
                                                        job_desc=rsm.getString("job_description");if(job_desc==null)job_desc="";
                                                       
                                                         price=rsm.getString("package");if(price==null)price="";
                                                      
                                                        jmodel=rsm.getString("model");if(model==null)model="";
                                                        mindown=rsm.getString("mindownpay");if(mindown==null)mindown="";
                                                        rowcount++;
                                                        
                                                        %>
                                                        
                                                          <tr style="border:1px" >
                                                             
                                                       
                                                        <td style="padding-left:10px" valign="top">
                                                            <table cellspacing="2" cellpadding="2" border="0" width="350" >
                                                                <tr>
                                                                    <td  colspan="2" class="verticaltext1">
                                                                      Brand : <%=jobheadline%> 
                                                                    </td>
                                                                            
                                                                </tr>
                                                                <tr>
                                                                    <td class="small-blue" colspan="2"><%=job_desc%></td>
                                                                </tr>
                                                               
                                                               
                                                                <tr>
                                                                   <td class="verticaltext1" width="30%" align="left">Model </td>
                                                                    <td class="profiletext" align="left"> <%=model%></td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                   <td class="verticaltext1" width="30%" align="left">Price </td>
                                                                    <td class="profiletext" align="left"> <%=price%></td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                   <td class="verticaltext1" width="30%" align="left">Minimum Down Payment </td>
                                                                    <td class="profiletext" align="left"> <%=mindown%></td>
                                                                </tr>
                                                               
                                                                <tr>
                                                                    <td colspan="2" class="verticaltext1" width="30%" align="left"> <a href="proddetail.jsp?cv=<%=mJobId%>">  <img src="images/details.png"></a> </td>
                                                                    
                                                                </tr>
                                                                
                                                                
                                                            </table>
                                                            <hr>
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                    <%}
                                                    if(rowcount==0)
                                                        {%>
                                                    <tr><td colspan="3"> <div class="text4">
                                                            NO more Products by <%=company_name%>
                                                    </div></td>
                                                    <%    }
                                                    } catch(Exception e) {
                                                        out.print(e.getMessage());
                                                    }
                                                    %>
                                                    
                                                    
                                                    
                                                    
                                        </table></div></td>
                                        <td class="valign"><img src="images/featured-base-right.gif" width="3" height="294" alt="" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table><br />
                    
                   <br />
                   
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        
        <%@ include file="footer.jsp" %>
    </body>
</html>

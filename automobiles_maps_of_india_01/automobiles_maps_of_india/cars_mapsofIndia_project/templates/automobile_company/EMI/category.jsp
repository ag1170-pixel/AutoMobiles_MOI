<%@ include file="ConnectDB.jsp" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>

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
	<title>Dil Khol Ke Bol - Categorized Videos  </title>
          <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	  <meta name="description" content="Find free online best videos and download most popular videos related to Travel, entertainment, comedy, Autos vehicles, geographical, and other fun filled videos of the world.">
          <meta name="keywords" content="Online Video,  Online Entertainment Video,  Online Travel Video,  Online Comedy Video,  Geographical Video,  Online Autos and vehicles Video">

	<meta name="generator" content="editplus" />
	<meta name="author" content="" />
	
	<link rel="shortcut-icon" href="http://www.mapsofworld.com/images/mapsofworld.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="style/style.css" />
        
        
         <script type="text/JavaScript">
            function submiForm(x)
            {
        
            if(x>=1 && x<=5)
            {
            document.frm.bowswv_p.value=x;
            }
            else if(x>=6 && x<=9)
            {
            document.frm.timev_p.value=x;
            }
            else if(x>=10)
            {
            document.frm.categoyrv_p.value=x-10;
            }
            
            document.frm.submit();
            }
            
           function getbutton(x)
           {
          
            document.frm2.button.value=x;
            document.frm2.submit();
           }
           
          
        </script>
        
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>

 <body>
  <%@ include file="header.jsp" %>
  <div id="" class="main">
  <br />
        <form name="frm" action="category.jsp" method="get">
            <%
            int categoyrv_p=0;int timev_p=0;int bowswv_p=0;
            
            if(request.getParameter("bowswv_p")!=null) {
                categoyrv_p=Integer.parseInt(request.getParameter("categoyrv_p"));
                timev_p=Integer.parseInt(request.getParameter("timev_p"));
                bowswv_p=Integer.parseInt(request.getParameter("bowswv_p"));
            %>
            <input type="hidden" name="categoyrv_p" value="<%=request.getParameter("categoyrv_p")%>">
            <input type="hidden" name="timev_p" value="<%=request.getParameter("timev_p")%>">
            <input type="hidden" name="bowswv_p" value="<%=request.getParameter("bowswv_p")%>">      
           
            <%
            } else {
                categoyrv_p=0;
                timev_p=9;
                bowswv_p=2;
            %>
            <input type="hidden" name="categoyrv_p" value="0">
           
            <input type="hidden" name="timev_p" value="9">
            <input type="hidden" name="bowswv_p" value="2">
           
            <%                                                   
            }
            %>
            
            
        </form>
        
        <%
        ResultSet rsmvd_user=null;
        try {
            int i=0;
            int buttonno=0;
            
            String browse="";
            String time="";
            String category="";
            String mr="Most Recent";
            String mv="Most Viewed";
            String tr="Top Rated";
            String md="Most Discussed";
            String tf="Top Favorites";
            String t="Today";
            String w="This Week";
            String m="This Month";
            String a="All Time";
            String All="All";
        
            
            int id=0;
            if(bowswv_p==1)
                browse=mr;
            else if(bowswv_p==2)
                browse=mv;
            else if(bowswv_p==3)
                browse=tr;
            else if(bowswv_p==4)
                browse=md;
            else if(bowswv_p==5)
                browse=tf;
            if(timev_p==6)
                time=t;
            else if(timev_p==7)
                time=w;
            else if(timev_p==8)
                time=m;
            else if(timev_p==9)
                time=a;
            if(categoyrv_p==0)
                category=All;
            else{ id=categoyrv_p;}
           
            String button="1";
            int startfrom;
            int startbutton;
            int totalbuttons=1;
            
            String username =(String)session.getAttribute("user_name");
            String password =(String)session.getAttribute("password");
            
            Statement state=con.createStatement();
            
            
            String countimg="select count(*) as image from videopath";
         
            ResultSet rs=null;
            rs=state.executeQuery(countimg);
            int countimage=0;
            if(rs.next()) 
                {
                countimage=rs.getInt("image");
              
                }
            String query1=null;
           
            if("All".equals(category)) {
                if("Most Recent".equals(browse)) {
                    if("Today".equals(time)) {
                        
                        query1="select * from videopath,tb_registration as u where videopath.User_id=u.User_id and  date(upload_date)=date(now()) and Purpose='general' and  status=1 order by upload_date desc, Video_Id desc";
                    } else  if("This Week".equals(time)) {
                        
                        query1="select * from videopath,tb_registration as u where videopath.User_id=u.User_id and  date(upload_date) between date(adddate(now(),-7)) and date(now()) and Purpose='general' and  status=1 order by upload_date desc, Video_Id desc";
                    } else  if("This Month".equals(time)) {
                        
                        query1="select * from videopath,tb_registration as u where videopath.User_id=u.User_id and  date(upload_date) between date(adddate(now(),-30)) and date(now()) and Purpose='general' and status='1' order by upload_date desc, Video_Id desc";
                    } else  if("All Time".equals(time)) {
                        
                        query1="select * from videopath,tb_registration as u where videopath.User_id=u.User_id and  status=1 order by upload_date desc, Video_Id desc";
                    }
                } else if("Most Viewed".equals(browse)) {
                    if("Today".equals(time)) {
                        
                        query1="select * from videopath,tb_registration as u where videopath.User_id=u.User_id and  date(Video_date)=date(now()) and Purpose='general' and status='1' order by noviews desc";
                    } else  if("This Week".equals(time)) {
                        
                        query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  date(Video_date) between date(adddate(now(),-7)) and date(now())  and Purpose='general' and status='1' order by noviews desc";
                    } else  if("This Month".equals(time)) {
                        
                        query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  date(Video_date) between date(adddate(now(),-30)) and date(now())  and Purpose='general' and status='1' order by noviews desc";
                    } else  if("All Time".equals(time)) {
                        
                        query1="select * from videopath,tb_registration as u where videopath.User_id=u.User_id and  Status=1 order by noviews desc";
                    }
                    
                    
                } else if("Top Rated".equals(browse)) {
                    if("Today".equals(time)) {
                        
                        query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id and  date(Video_date)=date(now())    and Purpose='general' and status='1' order by Video_rating desc,noviews desc";
                    } else  if("This Week".equals(time)) {
                        
                        query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id   and date(Video_date) between date(adddate(now(),-7)) and date(now())  and Purpose='general' and status='1' order by Video_rating desc,noviews desc";
                    } else  if("This Month".equals(time)) {
                        
                        query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id and date(Video_date) between date(adddate(now(),-30)) and date(now())  and Purpose='general' and status='1' order by Video_rating desc,noviews desc";
                    } else  if("All Time".equals(time)) {
                        
                        query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id and date(Video_date)<=date(now())   and Purpose='general' and status='1' order by Video_rating  desc,noviews desc";
                    }
                    
                } else if("Most Discussed".equals(browse)) {
                    if("Today".equals(time)) {
                        
                        query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and date(Video_date)=date(now()) and v.Video_Id=f.Video_id and Comments is not null  and Purpose='general' and status='1' group by v.Video_Id order by com desc";
                    } else  if("This Week".equals(time)) {
                        
                        query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and date(Video_date) between date(adddate(now(),-7)) and date(now()) and v.Video_Id=f.Video_id and Comments is not null and Purpose='general' and status='1' group by v.Video_Id order by com desc";
                    } else  if("This Month".equals(time)) {
                        
                        query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and date(Video_date) between date(adddate(now(),-30)) and date(now()) and v.Video_Id=f.Video_id and Comments is not null and Purpose='general' and status='1' group by v.Video_Id order by com desc";
                    } else  if("All Time".equals(time)) {
                        
                        query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and date(Video_date)<=date(now()) and v.Video_Id=f.Video_id and Comments is not null and Purpose='general' and status='1' group by v.Video_Id order by com desc";
                    }
                    
                } else if("Top Favorites".equals(browse)) {
                    if("Today".equals(time)) {
                        
                        query1="select * from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and v.Video_id=f.Video_id and date(Video_date)=date(now())";
                    } else  if("This Week".equals(time)) {
                        
                        query1="select * from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and v.Video_id=f.Video_id and date(Video_date) between date(adddate(now(),-7)) and date(now())  and Purpose='general' and status='1'";
                    } else  if("This Month".equals(time)) {
                        
                        query1="select * from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and v.Video_id=f.Video_id and date(Video_date) between date(adddate(now(),-30)) and date(now())  and Purpose='general' and status='1'";
                    } else  if("All Time".equals(time)) {
                        
                        query1="select * from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and  v.Video_id=f.Video_id and date(Video_date)<=date(now()) and Purpose='general' and status='1'";
                    }
                    
                }
            } 
                else if("Most Recent".equals(browse)) {
                if("Today".equals(time)) {
                    
                    query1="select * from videopath,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+" and date(upload_date)=date(now()) and Purpose='general' and status='1' order by upload_date desc,Video_Id desc";
                } else  if("This Week".equals(time)) {
                    
                    query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+" and date(upload_date) between date(adddate(now(),-7)) and date(now()) and Purpose='general' and status='1' order by upload_date desc,Video_Id desc";
                } else  if("This Month".equals(time)) {
                    
                    query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+" and date(upload_date) between date(adddate(now(),-30)) and date(now()) and Purpose='general' and status='1' order by upload_date desc,Video_Id desc";
                } else  if("All Time".equals(time)) {
                    
                    query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+"  and Purpose='general' and status='1' order by upload_date desc,Video_Id desc ";
                }
            } else if("Most Viewed".equals(browse)) {
                if("Today".equals(time)) {
                    
                    query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+" and date(Video_date)=date(now())  and Purpose='general' and status='1'  order by noviews desc";
                } else  if("This Week".equals(time)) {
                    
                    query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+"  and date(Video_date) between date(adddate(now(),-7)) and date(now())  and Purpose='general' and status='1' order by noviews desc";
                } else  if("This Month".equals(time)) {
                    
                    query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+" and date(Video_date) between date(adddate(now(),-30)) and date(now())  and Purpose='general' and status='1' order by noviews desc";
                } else  if("All Time".equals(time)) {
                    
                    query1="select * from videopath ,tb_registration as u where videopath.User_id=u.User_id and  category_id="+id+"  and Purpose='general' and status='1'  order by noviews desc ";
                }
            } else if("Top Rated".equals(browse)) {
                if("Today".equals(time)) {
                    
                    query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id and category_id="+id+"  and date(Video_date)=date(now())  and Purpose='general' and status='1' order by Video_rating desc,noviews desc";
                } else  if("This Week".equals(time)) {
                    
                    query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id and category_id="+id+"  and date(Video_date) between date(adddate(now(),-7)) and date(now())  and Purpose='general' and status='1' order by Video_rating desc,noviews  desc";
                } else  if("This Month".equals(time)) {
                    
                    query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id and category_id="+id+"  and date(Video_date) between date(adddate(now(),-30)) and date(now())  and Purpose='general' and status='1' order by Video_rating desc,noviews  desc";
                } else  if("All Time".equals(time)) {
                    
                    query1="select * from videopath as v,tb_registration as u where v.User_id=u.User_id and category_id="+id+"  and Purpose='general' and status='1' order by Video_rating desc,noviews  desc";
                }
            } else if("Most Discussed".equals(browse)) {
                if("Today".equals(time)) {
                    
                    query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and category_id="+id+" and v.Video_id=f.Video_id and date(Video_date)=date(now()) and Comments is not null and Purpose='general' and status='1' group by v.Video_Id order by com desc";
                } else  if("This Week".equals(time)) {
                    
                    query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and category_id="+id+" and v.Video_id=f.Video_id and date(Video_date) between date(adddate(now(),-7)) and date(now()) and Comments is not null and Purpose='general' and status='1' group by v.Video_Id order by com desc";
                } else  if("This Month".equals(time)) {
                    
                    query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and category_id="+id+" and v.Video_id=f.Video_id and date(Video_date) between date(adddate(now(),-30)) and date(now())and Comments is not null  and Purpose='general' and status='1' group by v.Video_Id order by com desc";
                } else  if("All Time".equals(time)) {
                    
                    query1="select *,count(f.Comments) as com  from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and category_id="+id+" and v.Video_id=f.Video_id  and Purpose='general' and status='1' and Comments is not null group by v.Video_Id order by com desc";
                }
            } else if("Top Favorites".equals(browse)) {
                if("Today".equals(time)) {
                    
                    query1="select * from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and v.Video_id=f.Video_id and category_id="+id+" and date(Video_date)=date(now())  and Purpose='general' and status='1'";
                } else  if("This Week".equals(time)) {
                    
                    query1="select * from videopath as v,favourite as f ,tb_registration as u where v.User_id=u.User_id and v.Video_id=f.Video_id and category_id="+id+" and date(Video_date) between date(adddate(now(),-7)) and date(now())  and Purpose='general' and status='1'";
                } else  if("This Month".equals(time)) {
                    
                    query1="select * from videopath as v,favourite as f,tb_registration as u where v.User_id=u.User_id and v.Video_id=f.Video_id and category_id="+id+" and date(Video_date) between date(adddate(now(),-30)) and date(now())  and Purpose='general' and status='1'";
                } else  if("All Time".equals(time)) {
                    
                    query1="select * from videopath as v,favourite as f,tb_registration as u where v.User_id=u.User_id and  v.Video_id=f.Video_id and category_id="+id+"  and Purpose='general' and status='1' ";
                }
            }
            Statement stm=con.createStatement();
            
            int index=query1.lastIndexOf("*");
            int index11=query1.length();
            //out.print("------"+index11);
            
            
            String select=query1.substring(0,index);
            String from=null;
           
            String last=query1.substring(index11-4);
            //	out.print(last+"+++");
            // if(last.equals("desc")) {
            // from=query1.substring(index+1,index11-4);
            // query1=query1.substring(0,index11-4);
            //  } else {
            from=query1.substring(index+1);
            
          
            
            String query=select+"count(*) as count "+from;
         
            ResultSet rsmvd=null;
            rsmvd=stm.executeQuery(query);
            
            //out.print("Query----------->"+query);
            int count=0;
            if(rsmvd.next())
            {
                count=rsmvd.getInt("count");
            }
         
            button=request.getParameter("button");
            
            if(button==null) {
                startfrom=0;
                buttonno=1;
            } else if(button.equals("1")) {
                startfrom=0;
                buttonno=1;
            } else {
                startfrom=((Integer.parseInt(button))-1)*16;
                buttonno=Integer.parseInt(button);
            }
            
            if(count%16==0) {
                totalbuttons=(count/16);
            } else {
                totalbuttons=(count/16)+1;
            }
            if(count==0)
                totalbuttons=1;
          
            
            query1=query1+" limit "+startfrom+",16";
         
            rsmvd=null;
            rsmvd=stm.executeQuery(query1);
            
           // out.print(query1);
            String videopath1=null;
            String  videoimage3=null;
            String headline1="";
            int rating=0;
          
        %>     
	<table cellspacing="5" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
		<tr>
			<td valign="top" width="23%">
							<%@ include file="leftpanel.jsp" %>
			
			</td>
			<td class="valign" width="55%">
			
					<table cellspacing="0" cellpadding="0" border="0" class="category-mid">
					<tr>
						<td class="featured" colspan="2">Explore Videos</td>
                                                <td class="pad-right" colspan="3" align="right"><!--<a href="" onclick=""><img src="images/icon1.gif" width="23" height="12" alt="List View"  title="List View" border="0"  /></a>&nbsp;<a href="" onclick=""><img src="images/icon2.gif" width="23" height="12" alt="Grid View" title="Grid View"  border="0" /></a>--></td>
                                                
                                              
					</tr>
					<tr>
						<td colspan="5">
							<table cellspacing="5" cellpadding="0" width="100%" bgcolor="#F0F0F0">
								<tr> 
                                                                        <td align="center" class="small-black"><a href="javascript:submiForm(2)" id="2" class="small-black"><% if(bowswv_p==2 || bowswv_p==0){ %><b><%}%>Most Watched</a><br/>
                                                                        <% if(bowswv_p==2 || bowswv_p==0){ %></b><img src="images/arrow.gif" width="17" height="8" alt="" /> <%}%></td>
                                                                        <td class="small-black"><a  class="small-black1" href="javascript:submiForm(3)" id="3"> <% if(bowswv_p==3){ %><b><%}%>Highest Rated</b></a><br/>
                                                                          <% if(bowswv_p==3){ %><img src="images/arrow.gif" width="17" height="8" alt="" /> <%}%>
                                                                        </td>
                                                                        <td class="small-black"><a  class="small-black1" href="javascript:submiForm(4)" id="4"><% if(bowswv_p==4){ %><b><%}%>Most Responses</b></a><br/>
                                                                        <% if(bowswv_p==4){ %><img src="images/arrow.gif" width="17" height="8" alt="" /> <%}%>
                                                                        </td>
                                                                        <td class="small-black"><a  class="small-black1" href="javascript:submiForm(1)" id="1"><% if(bowswv_p==1){ %><b><%}%>Most Recent</b></a><br/>
                                                                        <% if(bowswv_p==1){ %><img src="images/arrow.gif" width="17" height="8" alt="" /> <%}%>
                                                                        </td>
									<td align="right">
                                                                         <select onchange="javascript:submiForm(this.value)">
                                                                          
                                                                          <option id="6" value="6" <%= (timev_p==6) ? "Selected":""%>>Today</a></option>
                                                                          <option id="7" value="7" <%= (timev_p==7) ? "Selected":""%>>This Week</a></option>
                                                                          <option id="8" value="8" <%= (timev_p==8) ? "Selected":""%>>This Month</a></option>
                                                                          <option id="9" value="9" <%= (timev_p==9) ? "Selected":""%>>All Time</a></option>
                                                                         </select></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="5" align="center"><br />
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
									<td align="center" class="small-black">(<%=count%> Results)</td>
								</tr>
							</table>
						</td>
					</tr>
					
                                            <%
                                            String videoname="";
                                            int noviewsvd=0;
                                            String userid="";
                                            String byusername="";
                                            for(int j=0;j<countimage;j++) 
                                                { %>
                                                <tr>
                                                <%for( i=0;i<4;i++) 
                                                    {
                                                    if(rsmvd.next()) 
                                                        {
                                                        headline1=rsmvd.getString("video_headline");
                                                        videopath1=rsmvd.getString("VideoFlashPath");
                                                        videoimage3=rsmvd.getString("VideoImage");
                                                        String videoid=rsmvd.getString("Video_Id");
                                                        noviewsvd=rsmvd.getInt("noviews");
                                                        byusername=rsmvd.getString("name");
                                                        rating=rsmvd.getInt("Video_rating");
                                                        
                                                        videoname=headline1;
                                                        if(videoname.length()>18)
                                                         {
                                                            String videoimage2=videoname.substring(0,14);
                                                            videoname=videoimage2+"...";
                                                         }
                                                %>
                                              
						<td align="center" class="valign" >
							<div  class="video_sample" style="background: url(Flv/<%=videoimage3%>) no-repeat center;" >
								<a href="NoViews.jsp?kl54grewv5f54gvfu=<%=videoid%>" alt="<%=headline1%>" title="<%=headline1%>"><img src="images/play-icon.png" width="74" height="75" border="0" alt="Play" /></a>
							</div>
							<table cellspacing="0" cellpadding="0" border="0" align="center">
								<tr>
									<td class="text2"><%
                                                                                    if(rating==0) {
                                                                                    %>
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <%                                     
                                                                                    }
                                                                                    if(rating==1) {
                                                                                    %>
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <%                                     
                                                                                    }
                                                                                    if(rating==2) {
                                                                                    %>
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <%                                     
                                                                                    }
                                                                                    if(rating==3) {
                                                                                    %>
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <%                                     
                                                                                    }
                                                                                    if(rating==4) {
                                                                                    %>
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star0.jpg" width="10" height="10" border="0">
                                                                                    <%                                     
                                                                                    }
                                                                                    if(rating==5) {
                                                                                    %>
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <img src="images/show/star1.jpg" width="10" height="10" border="0">
                                                                                    <%                                     
                                                                                    }
                                                                                %></td>
									<td class="text2"> <%=noviewsvd%> Views
                                                                        </td>
								</tr>
								
							</table>
                                                        
                                                        
                                                        
                                                        <table cellspacing="0" cellpadding="0" border="0" align="center">
                                                                            
                                                                            <tr>
                                                                                <td  width="100%" align="left"  valign="top">  <div align="left" class="txtVideos"><a href="NoViews.jsp?kl54grewv5f54gvfu=<%=videoid%>"  alt="<%=headline1%>" title="<%=headline1%>" class="small-red"><%=videoname%></a></div></td>
                                                                            </tr>
                                                                        </table>
                                                                        <table>
                                                                            <tr>
                                                                               
                                                                                <td width="100%" align="left" valign="top"> <div class="small-blue">by <%=byusername%></div></td>
                                                                               
                                                                            </tr>  
                                                                            
                                                                            
                                                                   </table>
							
						</td>
						
                                                <%
                                                 }
                                                }
                                               %>
                                             </tr>
                                               <%
                                               }     
                                               %>
					       <tr>
						<td colspan="5" align="center"><br />
							<table cellspacing="5" cellpadding="0" width="80%">
								<tr>
                                                                    
                                                            <form name="frm2" action="category.jsp" method="get">
                                                            <%
                                                            if(request.getParameter("timev_p")==null) {
                                                            %>
                                                            <input type="hidden" name="categoyrv_p" value="0">
                                                            <input type="hidden" name="timev_p" value="9">
                                                            <input type="hidden" name="bowswv_p" value="2">
                                                            <%
                                                            } else {
                                                            %>
                                                            <input type="hidden" name="categoyrv_p" value="<%=request.getParameter("categoyrv_p")%>">
                                                            <input type="hidden" name="timev_p" value="<%=request.getParameter("timev_p")%>">
                                                            <input type="hidden" name="bowswv_p" value="<%=request.getParameter("bowswv_p")%>">
                                                            <%                                                   
                                                            }
                                                            %>
                                                             <%@ include file="Pagination.jsp" %> 
                                                              
                                                            
                                                                   
                                                                   
									<!--<td align="center" class="black-button">1</td>
									<td align="center" class="black-button">2</td>
									<td align="center" class="black-button">3</td>
									<td align="center" class="black-button">4</td>
									<td align="center" class="black-button">5</td>
									<td align="center" class="black-button">..50</td>-->
									
                                                                        </form>
								</tr>
							</table>
						</td>
                                            </tr>
                                            
                                             <%
                                                } catch(Exception e) { }
                                            %>
						
						
				</table>
			</td>
			<td valign="top" width="25%" align="center">
			
				<%@ include file="rightpanel.jsp" %>
			
			</td>
		</tr>
	</table>	
					
  <tr><td>
<%@ include file="footer.jsp" %> 
 </body>
</html>

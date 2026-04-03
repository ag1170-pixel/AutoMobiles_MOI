
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
int xdiv=1;
String rec_id=(String)session.getAttribute("rec_id");


if(rec_id==null) {
    response.sendRedirect("rec_login.jsp");
} else {
    int buttonno=1;
    
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
     <title>Added Brands and Models</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="description" content="">
        
        <meta name="keywords" content="">
        
    
    <meta name="generator" content="editplus" />
    <meta name="author" content="" />
    
   
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    
    <script>
           function getbutton(x)
                        {
                      
                        alert(x);
                        if(x=="Delete")
                        {
                       
                        document.frm.action="DeleteJob.jsp";
                         document.frm.delbutton.value=x;
                        }
                        else
                        {
                        document.frm.action="EditJob.jsp";
                        document.frm.button.value=x;
                        }
                        //alert(document.frm.action)
                        
			document.frm.submit();
                        }
                        
                          function refresh1()
                        {
                        document.frm.xdiv.value=1;
                        document.frm.action="MyJob.jsp";
                        document.frm.submit();
                        }
                        
                          function refresh2()
                        {
                        document.frm.xdiv.value=2;
                        document.frm.action="MyJob.jsp";
                        document.frm.submit();
                        }
                        
                       
               
    </script>
    
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>     

<body>
  <%@include  file="header.jsp" %>            
        <tr>
        
        <!-- center Panel starts -->
        <td width="677" valign="top">
        
        
        
        <table cellspacing="5" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
            <tr>
                <td valign="top" width="1%">
                    <%//@ include file="leftpanelcommon.jsp" %>
                    
                </td>
                <td class="valign" width="95%">
                
                <table cellspacing="0" cellpadding="0" border="0" class="category-mid">
                <tr>
                    <td class="featured" colspan="2">Added Brands</td>
                    <!--    <td class="pad-right" colspan="3" align="right"><img src="images/icon1.gif" width="23" height="12" alt="List View"  title="List View" border="0" id="1" onclick="refresh1()" />&nbsp;<img src="images/icon2.gif" width="23" height="12" alt="Grid View" title="Grid View" id="2" border="0"  onclick="refresh2()"/></td>-->
            
            
                </tr>
                <%     try{
                Statement state=con.createStatement();
                
                
                String cntquery="";
                
                cntquery="select count(*) as counts  from recruiter_login, jobs  where  recruiter_login.rec_id= jobs.rec_id and jobs.rec_id='"+rec_id+"' ";
                
                ResultSet rs=state.executeQuery(cntquery);
                int count=0;
                if(rs.next()) {
                count=rs.getInt("counts");
                }
                // out.print(query);
                int totalbuttons=1;
                
                
                int countimg=3;
                
                String company_name="";
                
                String job_headline="";
                
                String company_image="";
                
                String userId="";
                String price="";
                String model="";
                String mindownpay="";
                String job_id="";
                String category="";
                String description="";
                String button="";
                
                if(request.getParameter("button")==null) {
                buttonno=1;
                } else {
                button=request.getParameter("button");
                buttonno=Integer.parseInt(button);
                }
                
                int startfrom=(buttonno-1)*12;
                
                
                
                rs=null;
                
                int counter=0;
                String query="select jobs.* ,recruiter_login.rec_id,category.Category_name  from recruiter_login, jobs,category  where  recruiter_login.rec_id= jobs.rec_id and jobs.category=category.Category_id and jobs.rec_id='"+rec_id+"'  order by jobs.rec_id desc limit  "+startfrom+" , 12";
                
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
                
                
                for(int i=0;i<counter;i++) {
                %>
                <%
                for(int j=0;j<4;j++) {
                if(rs.next()) {
                userId=rs.getString("rec_id");
                job_headline=rs.getString("job_headline"); 
                description=rs.getString("job_description");if(description==null)description="";
                
                //job_location=rs.getString("location"); 
                company_name=rs.getString("Category_name"); 
                
                price=rs.getString("package");if(price==null)price="";
                company_image=rs.getString("image");if(company_image==null)company_image="";
                
                mindownpay=rs.getString("mindownpay");if(mindownpay==null)mindownpay="";
                job_id=rs.getString("job_id");if(job_id==null)job_id="";
                
                
                
                if(xdiv==1){%> 
                <div style="border:1px solid #E8E8E8;">
                    <tr> 
                        
                        <td width="50%" valign="top" align="left" >
                            
                            <table  border="0" cellspacing="10" cellpadding="2">
                                
                                <tr>
                                    <td class="verticaltext1">Company : </td><td class="small-blue" align="left"><font  size="2"  ><b><%=company_name%></b></font></td>
                                </tr>
                                
                                
                                <tr>
                                    <td class="verticaltext1">Brand : </td><td class="small-blue" align="left"><font  size="2"  ><b><%=job_headline%></b></font></td>
                                </tr>
                                
                                
                                
                                <tr>
                                    <td  class="verticaltext1" align="left">Description: </td><td class="small-blue" align="left"><%if(description.length()>100){%> <%=description.substring(0,100)%> <%}else{%> <%=description%> <%}%> </td>									
                                </tr>
                                
                                
                                
                                
                            </table>
                            
                            
                            
                            
                        </td>
                        <td valign="top"  style="padding-top:10px">
                            <table cellspacing="10" cellpadding="2">
                                <tr><td  align="left">        <div  class="verticaltext1">  Price  </div>   </td></tr>
                                <tr><td align="left" class="small-blue"><%=price%> </td></tr>
                                <tr><td  align="left">         <div  class="verticaltext1">    Minimum Down Payment  </div>   </td></tr>
                                <tr><td align="left" class="small-blue"><%=mindownpay%> </td></tr>
                                
                                
                                
                                <tr> <td align="left"><a href="proddetail.jsp?cv=<%=job_id%>"><img src="images/details.png"> </a> </td></tr>
                                <tr> <td align="left"  colspan="3" ><div  class="small-red"><a href="DeleteJob.jsp?cv=<%=job_id%>">  <font size="2">Delete Brand </font> </a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <a href="EditJob.jsp?cv=<%=job_id%>"><font size="2">Edit Brand </font> </a></div>  </td></tr>
                            </table>
                            
                        </td>
                        
                        <td>
                            
                            <img src="images/<%=company_image%>" width="100" height="100" alt="image" border="1">
                            
                        </td>
                        
                </tr> </div>
                
                <tr><td  style="border-bottom:1px dashed #525252"></td> </tr>
                <%} else {
                %>   
                
                
                <td align="left" width="200"  valign="top" >
                    
                    
                    <div style="border:1px solid #000000;">
                        <table cellspacing="5" cellpadding="0" border="0" >
                            
                            <tr>
                                
                                <td class="verticaltext1"><b>Company: </b> </td><td class="small-blue"> <font  size="3"><b><%=company_name%></b></font></td>
                                
                            </tr>
                            <tr>
                                
                                <td class="verticaltext1"><b>Brand: </b> </td><td class="small-blue"> <font  size="3"><b><%=job_headline%></b></font></td>
                                
                            </tr>
                            
                            <tr>
                                <td class="verticaltext1" valign="top"><b>Description:</b> </td>
                                <td class="small-blue"> <%if(description.length()>20){%> <%=description.substring(0,20)+"..."%> <%}else{%> <%=description%> <%}%> </td>
                            </tr>
                            
                            
                            <tr>
                                <td class="verticaltext1"> <b> Price:</b>  </td>
                                <td  class="small-blue" align="left"><%=price%> </td>
                            </tr>
                            
                            
                            
                            <tr> <td align="left"><a href="proddetail.jsp?cv=<%=job_id%>"><img src="images/details.png" border="0"> </a></td></tr>
                        </table>   
                        
                    </div>
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
            
                } catch(Exception e) {   out.print(e.getMessage());}
            }
            %>
            
            
        </table>
        </td>
        <td valign="top" width="1%" align="center" style="padding-top:20px">
            
            
            
        </td>
        </tr>
        </table>	
        
        </td></tr>
        <tr><td>
        <%@ include file="footer.jsp" %> 
        </td></tr></table>
    </body>
</html>
           


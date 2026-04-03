<%@ page import="java.util.*,java.net.*,java.io.*,java.sql.*,java.util.Date,java.util.Calendar"%>

<%@ include file="ConnectDB.jsp"%>

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
    <title></title>
    <meta name="description" content=" ">
      <meta name="keywords" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    
    <meta name="generator" content="editplus" />
    <meta name="author" content="" />
    
    
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    
    <style TYPE="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana;
}
-->
</style>


<script>
     function ismaxlength(obj){
var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
if (obj.getAttribute && obj.value.length>mlength)
obj.value=obj.value.substring(0,mlength)
}
</script>

    
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>     

<body>
  
<%
    if(request!=null && request.getParameter("cats")!=null)     
        {
        try {
              
                String bank=request.getParameter("cats");
                String intType=request.getParameter("loanType");
                
                String months=request.getParameter("months");                
                String rate=request.getParameter("rate");  
                
              
                                
                Statement state=con.createStatement();
                String query=null;
                ResultSet result=null;
                String s=null;  
                
                
                s="insert into loanscheme (bankId,interestType,months,rate) " +
                "values ('"+bank+"','"+intType+"','"+months+"','"+rate+"') ";
            
                out.print(s);
                state.executeUpdate(s);
                
                
                
                response.sendRedirect("successB.jsp");
                }
                
                catch(Exception e) {
                
                System.out.println("Error -------"+e.getMessage());
                response.sendRedirect("KConvertB.jsp?j=0");
                
                }
                
              }  
    

              %>
    
<%@ include file="header.jsp" %>
<tr><td>
      
        
        
        <table cellspacing="5" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
            <tr>
                <td valign="top" width="1%">
                    <%//@ include file="leftpanelcommon.jsp" %>
                    
                </td>
                <td class="valign" width="100%">
                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                        <tr>
                            <td valign="top"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
                            <td>                           
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" >
                                    <tr> 
                                        <td  class="inner-heading">     
                                            
                                            <span class="featured">Add Loan Scheme </span> 
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td> <br>
                                            <form name="upform" method="post" action="KConvertB.jsp">             
                                                
                                                <table  border="0" align="center" cellspacing="4" cellpadding="4" border="0"  bgcolor="#F9F9F9" class="upload-mid">
                                                    
                                                     <tr>
                                                     <td width="70" align="left" height="40"  class="text4"  >
                                                       Bank
                                                     </td>
                                                     <td height="40"  width="200"  align="left">
                                                         <select id="cats" name="cats">
                                                             
                                                             <option value="0" > ------Select----- </option>                                                                 <br>
                                                             <%try
                                                             {
                                                             String cat_id="";
                                                             String cat_name="";
                                                            
                                                             Statement st=con.createStatement();
                                                             ResultSet rs=st.executeQuery("select * from bank order by bankName");
                                                             while(rs.next())
                                                             {
                                                             cat_id=rs.getString("bankId");
                                                             cat_name=rs.getString("bankName");
                                                           
                                                             %>     
                                                             
                                                             <option value="<%=cat_id%>" > <%=cat_name%> </option>                                                                 <br>
                                                             
                                                             
                                                             <%        }
                                                             
                                                             }
                                                             catch(Exception e)
                                                             {
                                                             
                                                             }
                                                             %>
                                                         </select>
                                                     </td>
                                                 </tr>
                                                  
                                                    <tr>
                                                        <td width="70" align="left" height="40"  class="text4"  >
                                                            Loan Type<font color="red">*</font>
                                                        </td>
                                                        <td height="40"  width="200" align="left" >
                                                            
                                                            <select name="loanType">
                                                                <option> Fixed </option>
                                                                
                                                                <option> Floating</option>
                                                                
                                                                
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr><td colspan="2" class="text4" align="left"><b> Interest Rates</b> </td></tr>
                                                    <tr>
                                                        <td width="70" align="left" height="40" class="text4"  >
                                                        Months  <input type="Text" name="months" id="months" size="3">
                                                        </td>
                                                        
                                                        
                                                        <td height="40"  width="200" class="text2" align="left" >
                                                          Rate   <input type="text" name="rate" id="rate" size="3">
                                                        </td>
                                                    </tr>
                                                  
                                                   
                                                    
                                                    <input type="hidden" name="purpose" id="purpose" value="general">
                                                    <tr>
                                                        <td height="40"  align="center" colspan="2">
                                                            
                                                            <input type="hidden" name="todo" value="upload">  
                                                            
                                                            <script type="text/javascript">
                                                   
                                                     <!--
                                                    document.write(' <input src="images/upload.gif" border="0" type="image"  >  ');
                                                    -->
                                                            </script>
                                                            <noscript> Please Enable Java Script to submit  succesfully. </noscript> 
                                                            
                                                            <!--  //<input type="button" name="Submit"  value="Upload"   onclick= "return checkEx()" >-->
                                                            <!-- <input src="images/upload.gif" border="0" type="image" onClick="return checkEx()" >-->
                                               
                                                            <!--input type="reset" name="Reset" value="Cancel"--> 
                                                         
                                                        </td>
                                                    </tr>
                                                   
                                                    
                                              
                                                </table>
                                                
                                            </form>
                                            
                                        </td>
                                        
                                    </tr>
                                </table>
                                
                            </td>
                            
                            <td  valign="top"><img src="images/inner-page-right-outline.gif" width="2" height="187" alt="" /></td>
                        </tr>
                    </table> 
                </td>
                
                
                <td valign="top" width="1" align="center">
                    
                    
                    
                </td>
            </tr>
        </table>	
</td></tr>
    <tr><td>
            
            <%@ include file="footer.jsp" %> 
    </td></tr>
</body>
</html>






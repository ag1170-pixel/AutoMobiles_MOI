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
              int result=0;
              String bank="";
              ResultSet rst=null;
             
              if(request!=null && request.getParameter("cats")!=null) {
                  try {
                      
                      bank=request.getParameter("cats");
                      
                      Statement state=con.createStatement();
                      String query=null;
                    
                      String s=null;
                      
                      
                      s="select * from loanscheme where bankId='"+bank+"'";
                      
                    
                    
                      rst= state.executeQuery(s);
                      
                      result=1;
                      
                      
                  }
                  
                  catch(Exception e) {
                      
                      System.out.println("Error -------"+e.getMessage());
                      response.sendRedirect("viewLoan.jsp?j=0");
                      
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
                                            
                                            <span class="featured">View Loan Scheme </span> 
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td> <br>
                                            <form name="upform" method="post" action="viewLoan.jsp">             
                                                
                                                <table  border="0" align="center" cellspacing="4" cellpadding="4" border="0"  bgcolor="#F9F9F9" class="upload-mid">
                                                    
                                                     <tr>
                                                     <td width="70" align="left" height="40"  class="text4"  >
                                                       Bank 
                                                     </td>
                                                     <td height="40"  width="200"  align="left">
                                                         <select id="cats" name="cats">
                                                             
                                                             <option value="0" > ------Select----- </option>                                                                 <br>
                                                             <%
                                                             String cat_id="";
                                                             try
                                                             {
                                                             
                                                             String cat_name="";
                                                            
                                                             Statement st=con.createStatement();
                                                             ResultSet rs=st.executeQuery("select * from bank order by bankName");
                                                             while(rs.next())
                                                             {
                                                             cat_id=rs.getString("bankId");
                                                             cat_name=rs.getString("bankName");
                                                           
                                                             %>     
                                                             
                                                             <option value="<%=cat_id%>" <%=bank.equalsIgnoreCase(cat_id)?"Selected":""%> > <%=cat_name%> </option>                                                                 <br>
                                                             
                                                             
                                                             <%        }
                                                             
                                                             }
                                                             catch(Exception e)
                                                             {
                                                             
                                                             }
                                                             %>
                                                         </select>
                                                         
                                                          <script type="text/javascript">
                                                   
                                                     <!--
                                                    document.write(' <input type="submit" value="GO" >  ');
                                                    -->
                                                            </script>
                                                            <noscript> Please Enable Java Script to submit  succesfully. </noscript> 
                                                            
                                                     </td>
                                                 </tr>
                                                 
                                                    </form>
                                                   <tr><td colspan="2">
                                                           <form name="updateLoan" > 
                                                              <script> 
                                                               function updateLoanB(x)
                                                               {
                                                               
                                                             
                                                               
                                                                  
                                                               document.getElementById("change").value=x;
                                                               
                                                                     
                                                               document.getElementById("catid").value=document.getElementById("cats").value;
                                                               
                                                                    document.updateLoan.action="KConvertU.jsp";
                                                               
                                                               document.updateLoan.submit();
                                                               
                                                            
                                                               }
                                                               
                                                               </script>
                                                           <table cellpadding="5" cellspacing="5" style="border:1px solid #000000" width="400">
                                                               <tr><td><b>Interest Type</b> </td>
                                                                   <td><b>Months</b> </td>
                                                                   
                                                                   <td><b>Interest Rate(%)</b> </td>
                                                                   
                                                               </tr>
                                                               
                                                               <% 
                                                               String intType="";
                                                               String month="";
                                                               String rate="";
                                                               String loanId="";
                                                               int i=0;
                                                               if(result==1) {
                                                               while(rst.next()) {
                                                                   i++;
                                                               loanId=rst.getString("loanId");
                                                               intType=rst.getString("interestType");
                                                               month=rst.getString("months");
                                                               rate=rst.getString("rate");
                                                               
                                                               %>
                                                               <tr><td><input type="text" name="itype<%=i%>" value="<%=intType%>"> </td>
                                                                   <td><input type="text" name="month<%=i%>" value="<%=month%>"></td>
                                                                   
                                                                   <td><input type="text" name="rate<%=i%>" value="<%=rate%>"></td>
                                                                   
                                                                   <td><input type="Submit" value="Update" id="<%=loanId%>" onclick="updateLoanB(this.id)" ></td>
                                                                   
                                                               </tr>
                                                               <%}
                                                               }
                                                               %>
                                                                <input type="hidden" name="catid" id="catid" value="">
                                                                 <input type="hidden" name="change" id="change" value="">
                                                           </table>
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






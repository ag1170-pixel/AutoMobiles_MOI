<%@ page import="java.sql.*" %>
<%@ include file="ConnectDB.jsp" %>
<%
String username=(String)session.getAttribute("User_Name");
String userid=(String)session.getAttribute("rec_id");

if(userid==null) {
   response.sendRedirect("rec_login.jsp");
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
</script>
    <title></title>
    <meta name="description" content="Add your own categories, categories , more categories.">

		<meta name="keywords" content="Add your own categories, categories , more categories">
    <script  language="JavaScript" src="CheckScript.js"></script> 
    <script>
    
    function checkEx()
            {  
		
          var bool=0;
           var category=document.frm2.category.value;
           var len=category.length;
            if(len==0)
                        {
                        alert("Please enter new Bank");
                        document.getElementById("category").focus();
                        return false;
                         bool=1;
                        } 
           
                    var space=0;
                    for(i=0;i<len;i++)
                        {
                        var s=category.substring(i,i+1);
                      
                        if(s=="$" || s=="@" || s=="%" ||  s=="*" || s=="\\"  || s=="(" || s==")" || s=="~" || s=="#" ||   s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" ||  s=="?"|| s=="<" || s==">")
                        {
                        alert("Please remove special characters from Bank Name");
                        document.getElementById("category").focus();
                        bool=1;
                        return false;
                        }  
                        
                         if(s==" ")
                        {
                        space++;
                        }
                        
                    }
                    
                     if(space==len)
                        {
                        alert("Please enter Bank name");
			return false;
                        }
                    
                    
               if(bool==0)
               {
                document.frm2.submit();
                return true;
               }
                    
                    
            }

                 </script> 
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>  

<body>
    <%@ include file="header.jsp" %>
   
    
    <tr><td>
        
        <table cellspacing="0" cellpadding="0" border="0" width="68%" align="center">
            <tr>
                <td valign="top"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
                <td>                           
                    <table cellspacing="0" cellpadding="0" border="0" width="100%" >
                    <tr> 
                        <td  class="inner-heading">     
                            
                            <span class="featured">Add Bank </span> 
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="upload-mid" align="left"> 
                            
                            <%
                            if(request.getParameter("i")!=null) {
                            %>
                            
                            
                            <%
                            }
                            %>
                            
                            <form action="delCategory.jsp" method="post" name="frm1">
                                <span class="create-category">&nbsp;&nbsp;Banks </span>
                                <span class="text4">
                                <ul class="bullet" style="align:left">
                                    <%
                                    try {
                                    Statement state = con.createStatement();
                                    String query="select * from bank";
                                    //out.print(query);
                                    int cnt=0;
                                    ResultSet rs=state.executeQuery(query);
                                    //out.print("dsfds");
                                    while(rs.next()) {
                                    String id=rs.getString("bankId");
                                    String bankName=rs.getString("bankName");
                                    cnt++;
                                    
                                    %>
                                    <li><%=bankName%>
                                    <%
                                    }
                                    
                                    
                                    
                                    %>
                                </ul>
                                <%
                                    } catch(Exception e) {
                                out.print(e.getMessage());
                                }
                                %>
                                
                                
                            </form>
                            
                            
                            
                            <div style="padding-left:60" align="left"> 
                                <span class="create-category"> Add new...  </span> 
                                
                                
                                
                                <form action="insertUserCategory.jsp" method="post" name="frm2">
                                    
                                    <br>Enter New Bank :&nbsp;&nbsp;&nbsp; 
                                    <input type="text" name="category" id="category"><br><br>
                                    
                                    <script type="text/javascript">
                                                    <!--
                                                    document.write(' <input type="button" value="Add Bank" name="in" id="in"  onclick= "return checkEx()" >');
                                                    -->
                                    </script>
                                    <noscript> Please enable javascript to update your profile. </noscript> 
                                    
                                </form>            
                                
                                
                            </div> 
                            
                        </td>
                    </tr>
        </td></tr></table>
        <td  valign="top"><img src="images/inner-page-right-outline.gif" width="2" height="187" alt="" /></td>
    </tr>
    </table> 
    </td></tr>
    <tr><td>
            
            
            <%@ include file="footer.jsp" %> 
            
    </td></tr>
</body>
</html>

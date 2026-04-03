<%@ include file="ConnectDB.jsp" %>

<%
try
{
String job_id=request.getParameter("cv");

Statement st=con.createStatement();

int x=st.executeUpdate("delete from jobs where job_id='"+job_id+"'");
if(x>0)
    {
%>

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
        <title> Confirmation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <meta name="description" content="Password, Change Password, Password for videos account">
        
        <meta name="keywords" content="Password, Change Password, Password for videos account">
        
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        
        <meta name="generator" content="editplus" />
        <meta name="author" content="" />
        
        <link rel="shortcut-icon" href="http://www.mapsofworld.com/images/mapsofworld.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        
        
        
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>
    
    <body>
         <%@include  file="header.jsp" %>
              <tr>
                  
                  <!-- center Panel starts -->
                  <td width="677" valign="top">
                      
                      <table cellspacing="0" cellpadding="0" border="0" width="95%" align="center" height="400">
                          <br />
                          
                          
                          <tr>
                              <td  align="center">
                                  
                              <div class='thank2'> Product has been deleted successfully.</div></td>        
                          </tr>
                          
                      </table>
              </td></tr>
              
              <tr><td>
              
              <%@ include file="footer.jsp" %>
              
              </td></tr>
              
              </table>
          
    </body>
</HTML>

<%}

else
    {
      response.sendRedirect("MyJob.jsp");
    }
}
catch(Exception e)
{
    
    }
    %>
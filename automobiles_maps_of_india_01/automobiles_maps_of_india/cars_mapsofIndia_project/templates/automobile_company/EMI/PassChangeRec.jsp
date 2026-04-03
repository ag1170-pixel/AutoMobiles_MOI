<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="ConnectDB.jsp" %>
<%

String recid=(String)session.getAttribute("rec_id");

if(recid==null) {
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
        <title>Password Confirmation</title>
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
                                  
                                  
                                  
                                  
                                  <%       
                                  
                                  String newpassword=request.getParameter("new_pass");
                                  try {
                                  
                                  Statement state=con.createStatement();
                                  
                                  //String query="select User_id from tb_registration where name='"+username+"' and password='"+password+"'";
                                  //out.print(query);
                                  //ResultSet result=state.executeQuery(query);
                                  // String userId=null;
                                  // if(result.next()) {//
                                  // userId=result.getString("User_id");
                                  //out.print(userId);
                                  // }
                                  
                                  String s="update recruiter_login set password ='"+newpassword+"' where rec_id='"+recid+"';";
                                  //out.print(s);
                                  boolean x=state.execute(s);
                                  
                                  con.commit();
                                  
                                  
                                  con.setAutoCommit(true);
                                  //con.close();
                                  
                                  } catch(Exception e) {
                                  //response.sendRedirect("PassChange.jsp") ;
                                  //username=null;
                                  }
                                  
                                  
                                  %>
                              <div class='thank2'> Your password has been changed successfully.</div></td>        
                          </tr>
                          
                      </table>
                      
              </td></tr>
              
              <tr><td>
                   
              
              <%@ include file="footer.jsp" %>
              
               </td></tr>
              
          
    </body>
</HTML>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="ConnectDB.jsp" %>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Video :Logout</title>
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>
    <body>

   <%
    //out.print("mayank");
    String username=null;    
    session.setAttribute("User_Name",username);
    session.setAttribute("Password",username);
    
    session.setAttribute("User_id",username);
    session.setAttribute("rec_id",username);
    
    
    con.close();
    session.setAttribute("Connection",null);
    session.invalidate();
    session.setMaxInactiveInterval(60);
    
    
    response.sendRedirect("index.jsp");
%>
    
    </body>
</html>

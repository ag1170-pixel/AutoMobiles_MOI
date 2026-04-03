<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ include file="ConnectDB.jsp" %> 
<%       
        int job_id; 
        job_id=Integer.parseInt(request.getParameter("x6546df5b6g5gfbfgh"));
        String userid=(String)session.getAttribute("User_id");
   String username=(String)session.getAttribute("User_Name");
   String password=(String)session.getAttribute("Password");
   //out.print(userid);
   if(userid==null)
       {
       response.sendRedirect("user_login.jsp?fav=1");
       }
else
{
     
        try{            
        
                Statement stmt = con.createStatement();
               String command = "";
                ResultSet rs=null;
                 command = "select * from favourite where User_id='"+userid+"' and job_id='"+job_id+"'";
                 
                rs=stmt.executeQuery(command);
                int querytype=0;
                if(rs.next())
                    {
                    command="update favourite set Favourite=1 where User_id='"+userid+"' and job_id='"+job_id+"'";
                    querytype=1;
                    }
                else
                    {
                    command="insert into favourite(User_id,job_id,Favourite)values('"+userid+"','"+job_id+"',1)";
                    querytype=2;
                    }
                    
                    if(querytype==1)
                        {
                        stmt.execute(command);
                        }
                    else
                        {
                        stmt.executeUpdate(command);
                        } 
                        //out.print(videoflashpath);
       // out.print(VideoID);
                    //session.setAttribute("userid",userid);
                    String url="MyFavourite.jsp";
                    response.sendRedirect(url);
                 //con.close();
                        }
                        
                catch (Exception e) 
                    {
                    out.print(e.getMessage());
                        }
}
                %> 

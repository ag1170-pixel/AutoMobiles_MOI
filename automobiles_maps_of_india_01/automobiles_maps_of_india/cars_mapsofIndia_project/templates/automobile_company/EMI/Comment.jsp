<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="ConnectDB.jsp" %> 
<%@ page import = "java.lang.*,java.util.Date,java.util.Calendar,java.util.*" %>
<%
        String comments=request.getParameter("t1");
        String userid=request.getParameter("user");
        String jobid=request.getParameter("jid");
        String dates=request.getParameter("dtes");
//out.print(dates);
		if(request.getParameter("user").equals("null"))
        {  
//out.print("---");
         response.sendRedirect("user_login.jsp");
         }
        
       // out.print(dates);
        String command=null;
try
        {        
        Statement state=con.createStatement();
        ResultSet rs=null;
        if(comments==null || comments.equals(""))
            {
            }
        else
            {
            command="select Comments from favourite where User_id='"+userid+"' and job_id='"+jobid+"'";            
            rs=state.executeQuery(command);               
            if(rs.next())
                {
            command="update favourite set Comments='"+comments+"', Comment_date='"+dates+"' where User_id='"+userid+"' and job_id='"+jobid+"'";
                }
            else
                {
            command = "insert into favourite(job_id,User_id,Comments,Comment_date)values('"+jobid+"','"+userid+"','"+comments+"','"+dates+"')";
                }
            state.execute(command);
            }
            //out.print(command);
            ArrayList countRow=new ArrayList();
            command="select User_id  from favourite where job_id='"+jobid+"'";
            rs=null;
            rs=state.executeQuery(command);    
            while(rs.next())
                {
                countRow.add(rs.getString("User_id"));
                }
                //out.println(countRow);           
        response.sendRedirect("proddetail.jsp?cv="+jobid);
        }
catch(Exception e)        
    {
    out.print(e.getMessage());
    }
%>

<%@ page language="java" %>
<%@ page import ="java.sql.*" %>

<%
String user_name = request.getParameter("username");
//System.out.println(user_name+"hh");
 try
        {
        
 %>  
<%@ include file="ConnectDB.jsp" %>        
<%
                
Statement stmt = con.createStatement();


        if(user_name.equals(""))
            {
            out.print("<font color='red'><strong>Email Id can not be blank</strong></font>");
            out.print("<input type='hidden' name='result' id='result' value='Email Id can not be blank'>");
            }
        else
            {
            String query="select * from user_login where Email_id='"+user_name+"'";
           // System.out.println(query);
            ResultSet rs = stmt.executeQuery(query); 
            if(rs.next())
                {
                //out.print(user_name+"hh");
                out.print("<font color='red'><strong>Email Id already registered.</strong></font>");
                out.print("<input type='hidden' name='result' id='result' value='Email Id already registered'>");
                }
            else
                {
                out.print("<font color='red'><strong></strong></font>");
                out.print("<input type='hidden' name='result' id='result' value=''>");
                }
            }
    if(stmt != null)
        {
	stmt.close();
        }
    if(con != null)
        {
	//con.close();
        }
    }
    catch(Exception e)
        {
        //out.print(e.getMessage());
        }
   
   
  
%>

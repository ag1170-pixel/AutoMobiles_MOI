<%@ page import="java.sql.*" %>
<%@ include  file="ConnectDB.jsp" %>
<%
try
        {
		String user_id=(String)session.getAttribute("User_id");
        String fname=request.getParameter("fname");
        String gender=request.getParameter("gender");
      
        String country=request.getParameter("country");
        String city=request.getParameter("city");
        String address=request.getParameter("address");
        String phone=request.getParameter("phone");
        //String mobile=request.getParameter("mobile");
        String month=request.getParameter("birthday_mon");
        String year=request.getParameter("birthday_yr");
        String day=request.getParameter("birthday_day");
        String dateofbirth=year+"-"+month+"-"+day;
        Statement state=con.createStatement();
        String query="update user_login set First_name='"+fname+"' ,Gender='"+gender+"',Date_of_birth='"+dateofbirth+"',Country='"+country+"',City='"+city+"',Address='"+address+"',Phone='"+phone+"' where User_id='"+user_id+"'";
        //out.print(query);
        state.execute(query);
        
        
        }
        catch(Exception e)
        {
            out.print(e.getMessage());
        }
response.sendRedirect("edit_my_profile.jsp");
%>
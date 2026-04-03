<%@ page import="java.sql.*" %>
<%@ include  file="ConnectDB.jsp" %>
<%
try
        {
	String recid=(String)session.getAttribute("rec_id");
        String comp_name=request.getParameter("fname");
        String comp_desc=request.getParameter("comp_desc");
        String website=   request.getParameter("website");
        String city=request.getParameter("city");
        String address=request.getParameter("address");
        String phone=request.getParameter("phone");

        Statement state=con.createStatement();
        String query="update recruiter_login set company_website='"+website+"',company_name='"+comp_name+"' ,company_desc='"+comp_desc+"',company_location='"+city+"',address='"+address+"',contact_no='"+phone+"' where rec_id='"+recid+"'";
        out.print(query);
        state.execute(query);
        
        
        }
        catch(Exception e)
        {
            out.print(e.getMessage());
        }

        response.sendRedirect("edit_rec_profile.jsp");
%>
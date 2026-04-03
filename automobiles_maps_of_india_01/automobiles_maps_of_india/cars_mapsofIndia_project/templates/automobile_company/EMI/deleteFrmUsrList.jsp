<%@ include file="ConnectDB.jsp" %>
<%
String checkbox[]=request.getParameterValues("delVideo");
if(checkbox!=null)
{
Statement state=con.createStatement();
//out.print(checkbox);
        try
        {
for(int i=0;i<checkbox.length;i++)
    {  
    String vid=checkbox[i];
    
    String query="delete from videopath where Video_id='"+vid+"'";
    //out.print(query);
    state.execute(query);    
    }    
    }
    catch(Exception e)
    {
        
    }
    response.sendRedirect("ShowVideoImage.jsp?i=1");
}
else
{
    response.sendRedirect("ShowVideoImage.jsp?i=0");
}
%>
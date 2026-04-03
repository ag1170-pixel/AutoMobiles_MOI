<%@ page import="java.util.*,java.net.*,java.io.*,java.sql.*,java.util.Date,java.util.Calendar"%>

<%@ include file="ConnectDB.jsp"%>


<%
              int result=0;
              String lid="";
              String month="";
              String rate="";
              String intType="";
              String cid="";
      
             
              if(request!=null) {
                  try {
                      
                      lid=request.getParameter("change");                      
                      month=request.getParameter("month"+lid);  
                      intType=request.getParameter("itype"+lid);
                      rate=request.getParameter("rate"+lid);
                      cid=request.getParameter("catid");  
                      Statement state=con.createStatement();
                      String query=null;
                    
                      String s=null;
                      
                      
                      s="update loanscheme set interestType='"+intType+"',months='"+month+"',rate='"+rate+"' where loanId='"+lid+"'";
                      
                    
                    
                    state.executeUpdate(s);
                    response.sendRedirect("viewLoan.jsp?cats="+cid);
                      
                      
                  }
                  
                  catch(Exception e) {
                      
                      System.out.println("Error -------"+e.getMessage());
                      response.sendRedirect("viewLoan.jsp?j=0");
                      
                  }
                  
              }  
    

              %>
    






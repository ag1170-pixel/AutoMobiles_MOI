<%@ include file="ConnectDB.jsp" %>

<%
        
        String job_id=request.getParameter("cv");
    
        try {
               
                String keyword=request.getParameter("keyword");
                
                String headline=request.getParameter("headline");
                
                String description=request.getParameter("description");
                String jlocation=request.getParameter("jlocaltion");
                String jobc=request.getParameter("jobc");
                String exp=request.getParameter("exp");
                String pack=request.getParameter("pack");
                
                String vack=request.getParameter("vack");
                
              
                
                
                
                Statement state=con.createStatement();
                String query=null;
                ResultSet result=null;
                String s=null;                      
                s="update jobs set job_headline='"+headline+"',job_description ='"+description+"',no_of_jobs='"+vack+"'," +
                "job_criteria='"+jobc+"',package='"+pack+"',location='"+jlocation+"',keywords='"+keyword+"',minexp='"+exp+"' " +
                "where job_id='"+job_id+"'" ;
              
                
                state.executeUpdate(s);
                
                
                
               
                
                
                response.sendRedirect("EditJob.jsp?cv="+job_id);
                }
                
                catch(Exception e) {
                
                System.out.println("Error -------"+e.getMessage());
                response.sendRedirect("EditJob.jsp?j=0");
                
                }
                
            
    

               
                %>
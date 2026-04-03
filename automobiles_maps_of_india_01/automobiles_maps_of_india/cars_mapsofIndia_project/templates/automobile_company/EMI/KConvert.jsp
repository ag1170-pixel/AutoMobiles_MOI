<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.net.*,java.io.*,java.sql.*,java.util.Date,java.util.Calendar"%>
<%@ include file="ConnectDB.jsp"%>

<%

String recruiter_id1 = (String)session.getAttribute("rec_id");

if(recruiter_id1==null ) {
    response.sendRedirect("user_login.jsp?ref=kc");
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
        <title>Add Brand</title>
        <meta name="description" content=" ">
        <meta name="keywords" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" type="text/css" href="style/style.css" />
        
        <style TYPE="text/css">
            <!--
    .style1 {
            font-size: 12px;
            font-family: Verdana;
    }
    -->
        </style>
        
        <script language="JavaScript">
        <!--
        function openStatus(){
        if (document.upform.uploadfile.value.length > 0){
            window.open('status.jsp?nocache=<%= System.currentTimeMillis() %>','UploadStatus','scrollbars=no,resizable=no,status=no,width=360,height=90');
            document.upform.submit();
        } else {
            alert("Select a file to upload");
        }
        //-->
        </script>
        
        <script>
    function ismaxlength(obj){
        var mlength = obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
        if (obj.getAttribute && obj.value.length>mlength)
        obj.value=obj.value.substring(0,mlength)
    }
    
    function checkEx(){  
        var Keyword = document.upform.keyword.value;
        var len = Keyword.length;
        
        // if(len==0)
        //{
        //  alert("Please provide some tags/keywords related to videos");
        //  document.getElementById("keyword").focus();
        //  return false;
        //  } 
           

        for(i=0;i<len;i++){
            var s = Keyword.substring(i,i+1);
            if( s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="\\" || s=="(" || s==")" || s=="~" || s=="#" ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||   s=="?"|| s=="<" || s==">") {
                alert("Please remove special characters from Keywords");
                document.getElementById("keyword").focus();
                return false;
            }  
        }
                        
        var headline = document.upform.headline.value;
        var len = headline.length;
        if(len==0){
            alert("Please provide a name related to your Brand");
            document.getElementById("headline").focus();
            return false;
        }
        var spacefound=0;
        for(i=0;i<len;i++){
            var s=headline.substring(i,i+1);
            if( s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="_" || s=="\\" || s=="-" || s=="(" || s==")" || s=="~" || s=="#" ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";"  || s=="?" || s=="<" || s==">") {
                alert("Please remove special characters from Brand name");
                document.getElementById("headline").focus();
                return false;
            }  
            if(s==" ") {
                spacefound=spacefound+1;
            }
        }
                        
        if(spacefound==len){
            alert("Please provide a Brand name");
            document.getElementById("headline").focus();
            return false;
        }
                        
        var description = document.upform.description.value;
        var len = description.length;
           
        for(i=0;i<len;i++){
            var s=description.substring(i,i+1);
            if( s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="_" || s=="\\" || s=="-" || s=="(" || s==")" || s=="~" || s=="#" ||  s=="{" || s=="}" || s=="[" || s=="]" ||  s==";"  || s=="?" || s=="<" || s==">") {
                alert("Please remove special characters from description");
                document.getElementById("description").focus();
                return false;
            }  
        }
                        
        var category=document.upform.cats.selectedIndex;
        if(category==0){
            alert("Please select category");
            return false;
        }
                
        var brandprice = document.upform.pack.value;
        var mindownpay=document.upform.downpay.value;
                
        if(isNaN(brandprice)){ alert ("Please enter numeric value only as Brand Price");  return false; } 
        if(isNaN(mindownpay)){ alert ("Please enter numeric value only as minimum down payment");  return false; } 
    }
                     </script>
    <script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>     
    
    <body>
        
        <%
        
        String category = "";
        String headline = "";
        String description = "";
        String model = "";
        String keyword = "";
        String pack = "";
        String mindownpay = "";
        String newName = "";
        
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        
        if (isMultipart){
            
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()){
                FileItem item = (FileItem) itr.next();
                
                if (item.isFormField()){
                    String name = item.getFieldName();
                    String value = item.getString();
                    
                    if(name.equals("cats")){
                        category = value;
                    }
                    if(name.equals("headline")){  
                        headline = value;            		 
                    }
                    if(name.equals("description")){  
                        description = value;            		 
                    }
                    if(name.equals("model")){  
                        model = value;            		 
                    }
                    if(name.equals("pack")){
                        pack = value;
                    }
                    if(name.equals("downpay")){
                        mindownpay = value;
                    }	    
                } else {
                    try {
                        String itemName = item.getName();
                        String extension = itemName.substring(itemName.lastIndexOf(".")+1);
                        
                        String path = request.getRealPath("brand-images");
                        File savedFile = new File(path+"/"+itemName);
                        item.write(savedFile);
                        
                        Calendar cal = Calendar.getInstance();
                        int day = cal.get(Calendar.DATE);
                        int month = cal.get(Calendar.MONTH);
                        int year = cal.get(Calendar.YEAR);
                        int hrs = cal.get(Calendar.HOUR);
                        int min = cal.get(Calendar.MINUTE);
                        int sec = cal.get(Calendar.SECOND);
                        int msec = cal.get(Calendar.MILLISECOND);
                        
                        newName = day + month + year + hrs + min + sec + msec + "." +extension;
                        File newFile = new File(path+"/"+newName); 
                        savedFile.renameTo(newFile);
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            
            if(headline==""){headline="Brand";}
            
            Statement state = con.createStatement();
            String query = null;
            ResultSet result = null;
            String s = null;
            
            try {
                s = "insert into jobs (rec_id, job_headline, job_description, package, keywords," +
                        " mindownpay, category, image, postedon, model) " +
                        " values ('"+recruiter_id1+"'," +
                        " '"+headline+"','"+description+"','"+pack+"','"+keyword+"','"+mindownpay+"','"+category+"'," +
                        " '"+newName+"',now(),'"+model+"') ";
                
                state.executeUpdate(s);
                response.sendRedirect("success.jsp");
            } catch(Exception e) {
                System.out.println("Error -------"+e.getMessage());
                response.sendRedirect("KConvert.jsp?j=0");
            }
        }
        
        %>
        
        <%@ include file="header.jsp" %>
        
        <tr>
            <td>
                <table cellspacing="5" cellpadding="0" border="0" width="98%" align="center" style="border:0px;">
                    <tr>
                        <td valign="top" width="1%">
                            <%//@ include file="leftpanelcommon.jsp" %>
                        </td>
                        <td class="valign" width="100%">
                            <table cellspacing="0" cellpadding="0" border="0" width="98%">
                                <tr>
                                    <td valign="top"> <img src="images/inner-page-left-outline.gif" width="2" height="187" alt="" />   </td>
                                    <td>                           
                                        <table cellspacing="0" cellpadding="0" border="0" width="100%" >
                                            <tr> 
                                                <td  class="inner-heading">     
                                                    <span class="featured">Add Brands </span> 
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td> <br>
                                                    <form name="upform" method="post" action="" enctype="multipart/form-data">             
                                                        <table  border="0" align="center" cellspacing="4" cellpadding="4" border="0"  bgcolor="#F9F9F9" class="upload-mid">
                                                            <tr>
                                                                <td width="70" align="left" height="40"  class="text4"  >
                                                                    Company
                                                                </td>
                                                                <td height="40"  width="200"  align="left">
                                                                    <select id="cats" name="cats">
                                                                        <option value="0" > ------Select----- </option>                                                                 <br>
                                                                        <%try
                                                                        {
                                                                        String cat_id="";
                                                                        String cat_name="";
                                                                        
                                                                        Statement st=con.createStatement();
                                                                        ResultSet rs=st.executeQuery("select * from category order by Category_name");
                                                                        while(rs.next())
                                                                        {
                                                                        cat_id=rs.getString("Category_id");
                                                                        cat_name=rs.getString("Category_name");
                                                                        
                                                                        %>     
                                                                        
                                                                        <option value="<%=cat_id%>" > <%=cat_name%> </option>                                                                 <br>
                                                                        
                                                                        
                                                                        <%        }
                                                                        
                                                                        } catch(Exception e) {
                                                                            
                                                                        }
                                                                        %>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td width="70" align="left" height="40" class="text4"  >
                                                                    Upload Brand Image
                                                                </td>
                                                                <td height="60" align="left"   class="text2">
                                                                    
                                                                    <input type="file" name="uploadfile" size="45"><br>
                                                                    <Strong> You can upload only JPG, PNG and GIF files </Strong>
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="70" align="left" height="40"  class="text4"  >
                                                                    Brand Name<font color="red">*</font>
                                                                </td>
                                                                <td height="40"  width="200" align="left" >
                                                                    
                                                                    <input type="text" id="headline" name="headline" maxlength="70" size="28"  value="">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="70" align="left" height="40" class="text4"  >
                                                                    Brand Description 
                                                                </td>
                                                                
                                                                
                                                                <td height="40"  width="200" class="text2" align="left" >
                                                                    <textarea name="description" id="description" cols="35" rows="7" maxlength="500" onkeyup="return ismaxlength(this)"></textarea>
                                                                    <br>  Not more than 500 words
                                                                    <!-- <input type="textarea" id="description" name="description" maxlength="250">-->
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td width="70" align="left" height="40"  class="text4"  >
                                                                    Model<font color="red">*</font> 
                                                                </td>
                                                                <td height="40"  width="200" align="left">
                                                                    <input type="text" name="model" id="model" size="28">
                                                                </td>
                                                            </tr>
                                                            
                                                            
                                                            <tr>
                                                                <td width="70" align="left" height="40"  class="text4" >
                                                                    Brand Keywords
                                                                </td>
                                                                <td height="40"  width="200" align="left" >
                                                                    
                                                                    <input type="text" id="keyword" name="keyword" maxlength="100" size="28" value="">
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td width="70" align="left" height="40"  class="text4"  >
                                                                    Brand Price
                                                                </td>
                                                                <td height="40"  width="200"  align="left">
                                                                    
                                                                    <input type="text" id="pack" name="pack" maxlength="70" size="28" value="">  in Rs.
                                                                    
                                                                    <!--for  <input type="text" id="year" name="year" maxlength="20" size="8" value="">   year-->
                                                                </td>
                                                            </tr>
                                                            
                                                            
                                                            <tr>
                                                                <td width="70" align="left" height="40"  class="text4"  >
                                                                    Minimum DownPayment
                                                                </td>
                                                                <td height="40"  width="200" align="left" >
                                                                    
                                                                    <input type="text" id="downpay" name="downpay" maxlength="70" size="28" value=""> in Rs.
                                                                </td>
                                                            </tr>
                                                            
                                                            
                                                            
                                                            <input type="hidden" name="purpose" id="purpose" value="general">
                                                            <tr>
                                                                <td height="40"  align="center" colspan="2">
                                                                    
                                                                    <input type="hidden" name="todo" value="upload">  
                                                                    
                                                                    <script type="text/javascript">
                                                   
                                                             <!--
                                                            document.write(' <input src="images/upload.gif" border="0" type="image" onClick="return checkEx()" >  ');
                                                            -->
                                                                    </script>
                                                                    <noscript> Please Enable Java Script to upload the resume succesfully. </noscript> 
                                                                    
                                                                    <!--  //<input type="button" name="Submit"  value="Upload"   onclick= "return checkEx()" >-->
                                                                    <!-- <input src="images/upload.gif" border="0" type="image" onClick="return checkEx()" >-->
                                               
                                                                    <!--input type="reset" name="Reset" value="Cancel"--> 
                                                         
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2"  align="center" >
                                                                    <%
                                                                    if((request.getParameter("i"))!=null) {
                                                                    
                                                                    %>
                                                                    <font color="red" size="2"><b>File size can not be more than 100 mb</b></font>
                                                                    
                                                                    <%
                                                                    } else if((request.getParameter("j"))!=null) {
                                                                    
                                                                    %>
                                                                    <font color="red" size="2"><b>There is some problem please try again.</b></font>
                                                                    <%
                                                                    }
                                                                    %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </form>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td  valign="top"><img src="images/inner-page-right-outline.gif" width="2" height="187" alt="" /></td>
                                </tr>
                            </table> 
                        </td>
                        
                        
                        <td valign="top" width="1" align="center">
                            
                            
                            
                        </td>
                    </tr>
                </table>	
        </td></tr>
        <tr><td>
                
                <%@ include file="footer.jsp" %> 
        </td></tr>
    </body>
</html>






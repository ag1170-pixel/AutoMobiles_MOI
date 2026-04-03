<%@ page import="java.util.*,java.net.*,java.io.*,java.sql.*,java.util.Date,java.util.Calendar,sample.progress.MyUploadListener"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*,java.io.*" %>
<jsp:useBean id="upListener" scope="session" class="sample.progress.MyUploadListener"/>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@ include file="ConnectDB.jsp"%>
<%
session.setAttribute("countpage","0");
String username=(String)session.getAttribute("User_Name");
String userid=(String)session.getAttribute("User_id");
String password=(String)session.getAttribute("Password");
if(username==null || password==null) {
     response.sendRedirect("user_login.jsp?ref=kc");
}
%>
<% String path=application.getRealPath("/")+"resume";//+"Convert";
   String path2=application.getRealPath("/")+"tmp";//+"Convert"+"/tmp";
   %>
<% String directory = path; %>
<% String tmpdirectory = path2; %>
<% boolean createsubfolders = true; %>
<% boolean allowresume = true; %>
<% boolean allowoverwrite = true; %>
<% String encoding = "ISO-8859-1"; %>
<% boolean keepalive = false; %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%= directory %>" />
  <jsp:setProperty name="upBean" property="parser" value="<%= MultipartFormDataRequest.CFUPARSER %>"/>
  <jsp:setProperty name="upBean" property="parsertmpdir" value="<%= tmpdirectory %>"/>
  <jsp:setProperty name="upBean" property="filesizelimit" value="8589934592"/>
  <jsp:setProperty name="upBean" property="overwrite" value="<%= allowoverwrite %>"/>
  <jsp:setProperty name="upBean" property="dump" value="true"/>
</jsp:useBean>
 <% upBean.addUploadListener(upListener); %>
<%
  //request.setCharacterEncoding(encoding);
  //response.setContentType("text/html; charset="+encoding);
  String method = request.getMethod();
  // Head processing to support resume and overwrite features.
  if (method.equalsIgnoreCase("head"))
  {
    String filename = request.getHeader("relativefilename");
    if (filename == null) filename = request.getHeader("filename");
    if (filename!=null)
    {
    	if (keepalive == false) response.setHeader("Connection","close");
    	String account = request.getHeader("account");
 	if (account == null) account="";
    	else if (!account.startsWith("/")) account = "/"+account;
    	File fhead = new File(directory+account+"/"+filename);
    	if (fhead.exists())
    	{
    	   response.setHeader("size", String.valueOf(fhead.length()));
    	   String checksum = request.getHeader("checksum");
    	   if ((checksum != null) && (checksum.equalsIgnoreCase("crc")))
    	   {
		long crc = upBean.computeCRC32(fhead,-1);
		if (crc != -1) response.setHeader("checksum", String.valueOf(crc));
    	   }
    	   else if ((checksum != null) && (checksum.equalsIgnoreCase("md5")))
    	   {
		String md5 = upBean.hexDump(upBean.computeMD5(fhead,-1)).toLowerCase();
		if ((md5 != null) && (!md5.equals(""))) response.setHeader("checksum", md5);
    	   }
    	}
    	else response.sendError(HttpServletResponse.SC_NOT_FOUND);
       return;
    }
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
    <title>Jobzing.com - Update Profile</title>
    <meta name="description" content=" ">
      <meta name="keywords" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    
    <meta name="generator" content="editplus" />
    <meta name="author" content="" />
    
    
    <link rel="stylesheet" type="text/css" href="style/style.css" />
    
    <style TYPE="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana;
}
-->
</style>

<script language="JavaScript"><!--
function openStatus()
{
  if (document.upform.uploadfile.value.length > 0)
  {
    window.open('status.jsp?nocache=<%= System.currentTimeMillis() %>','UploadStatus','scrollbars=no,resizable=no,status=no,width=360,height=90');
   document.upform.submit();
  }
  else
  {
    alert("Select a file to upload");
  }
}
//--></script>

<script>
     function ismaxlength(obj){
var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
if (obj.getAttribute && obj.value.length>mlength)
obj.value=obj.value.substring(0,mlength)
}
    function checkEx()
            {  
  
            var filename=document.upform.uploadfile.value;
	    if(filename=="")
		{
		alert("Please choose your resume to upload");
		return false;
		}
                
           var Keyword=document.upform.keyword.value;
           var len=Keyword.length;
           // if(len==0)
                        //{
                      //  alert("Please provide some tags/keywords related to videos");
                      //  document.getElementById("keyword").focus();
                      //  return false;
                      //  } 
           

                    for(i=0;i<len;i++)
                        {
                        var s=Keyword.substring(i,i+1);
                      
                        if( s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="\\" || s=="(" || s==")" || s=="~" || s=="#" ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";" || s=="'" ||   s=="?"|| s=="<" || s==">")
                        {
                        alert("Please remove special characters from Skills");
                        document.getElementById("keyword").focus();
                        return false;
                        }  
                        }
                        
                        
                    var headline=document.upform.headline.value;
                    var len=headline.length;
                    if(len==0)
                        {
                         alert("Please provide a headline related to your profile");
                         document.getElementById("headline").focus();
                         return false;
                       }
                       var spacefound=0;
                    for(i=0;i<len;i++)
                        {
                        var s=headline.substring(i,i+1);
                      
                        if( s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="_" || s=="\\" || s=="-" || s=="(" || s==")" || s=="~" || s=="#" ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";"  || s=="?" || s=="<" || s==">")
                        {
                        alert("Please remove special characters from headline");
                        document.getElementById("headline").focus();
                        return false;
                        }  
                        if(s==" ")
                        {
                        spacefound=spacefound+1;
                        }
                        }
                        
                        if(spacefound==len)
                        {
                         alert("Please provide a headline related to your profile");
                         document.getElementById("headline").focus();
                         return false;
                        }
                        
                        
                        
           var description=document.upform.description.value;
           var len=description.length;
            // if(len==0)
                       // {
                       // alert("Please provide description about the video");
                       // document.getElementById("description").focus();
                       // return false;
                       // } 
                    for(i=0;i<len;i++)
                        {
                        var s=description.substring(i,i+1);
                      
                        if( s=="$" || s=="@" || s=="%" || s=="&" || s=="*" || s=="_" || s=="\\" || s=="-" || s=="(" || s==")" || s=="~" || s=="#" ||  s=="/" || s=="{" || s=="}" || s=="[" || s=="]" || s==":" || s==";"  || s=="?" || s=="<" || s==">")
                        {
                        
                        alert("Please remove special characters from description");
                        document.getElementById("description").focus();
                        return false;
                        }  
                        }
                        
                        
            var category=document.upform.cats.selectedIndex;
            if(category==0)        
                {
                alert("Please select category");
                return false;
                }
                
             
			
            var i=filename.lastIndexOf(".");

            var last=filename.length;
            var extention=filename.substring(i,last);
         
            extention=extention.toLowerCase();
            
            if(extention==".doc" ||extention==".txt" || extention==".odt")
            {
           
             window.open('status.jsp?nocache=<%= System.currentTimeMillis() %>','UploadStatus','scrollbars=no,resizable=no,status=no,width=360,height=90');
             document.upform.submit();
             
             
          
            }
           
            else        
            {
            alert("This file format is not supported.  Please upload another file");
            return false;
            }
}
    
    
//function xyz()
//{
//document.getElementById("images").style.display="block";
//document.upform.submit();
//}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=<%=encoding %>">
    
<script async src="https://cdn.unibotscdn.com/player/mvp/player.js"></script>
</head>     

<body onload="document.getElementById('images').style.display='none'">
  
<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         Vector listeners = new Vector();
         listeners.addElement(upListener);
          String err = null;
         // Parse multipart HTTP POST request.
         MultipartFormDataRequest mrequest = null;
         try
         {
         	mrequest = new MultipartFormDataRequest(request,listeners,-1,MultipartFormDataRequest.CFUPARSER,encoding,allowresume);
                
         } catch (Exception e)
	   {
	        upListener.cancel();
		err = e.getMessage();
               
               // Cancel current upload (e.g. Stop transfer)
               // Only if allowresume = false
	   }
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
         else throw new Exception(err);
         if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
         {
    	   String account = mrequest.getParameter("account");
    	   if (account == null) account="";
    	   else if (!account.startsWith("/")) account = "/"+account;
           upBean.setFolderstore(directory+account);
           Hashtable files = mrequest.getFiles();
           if ( (files != null) && (!files.isEmpty()) )
           {
             UploadFile file = (UploadFile) files.get("uploadfile");
             if (file != null){ 
             //out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
             long size=(file.getFileSize())/1000000;
//out.print("size============"+(size));
			if(size>=101)
				{
				response.sendRedirect("KConvertI.jsp?i=0");
				}
		//	out.print("size>1============"+(size>1));
            
      

            }

             String relative = mrequest.getParameter("relativefilename");
             if ((createsubfolders == true) && (relative != null))
             {
               int inda=relative.length();
               int indb=file.getFileName().length();
               if (inda > indb)
               {
                 String subfolder = relative.substring(0,(inda-indb)-1);
                 subfolder = subfolder.replace('\\','/').replace('/',java.io.File.separatorChar);
                 upBean.setFolderstore(directory+account+java.io.File.separator+subfolder);
               }
             }
             if (keepalive == false) response.setHeader("Connection","close");
             // Chunks recomposion support.
             String chunkidStr = mrequest.getParameter("chunkid");
             String chunkamountStr = mrequest.getParameter("chunkamount");
             String chunkbaseStr = mrequest.getParameter("chunkbase");
             if ((chunkidStr != null) && (chunkamountStr != null) && (chunkbaseStr != null))
             {
               // Always overwrite chunks.
               upBean.setOverwrite(true);
               upBean.store(mrequest, "uploadfile");
               upBean.setOverwrite(allowoverwrite);
               int chunkid = Integer.parseInt(chunkidStr);
               int chunkamount = Integer.parseInt(chunkamountStr);
               if (chunkid == chunkamount)
               {
                 // recompose file.
                 String fname = upBean.getFolderstore()+java.io.File.separator+chunkbaseStr;
                 File fread = new File(fname);
                 if (fread.canRead() && (upBean.getOverwrite()==false)) fname = upBean.loadOverwriteFilter().process(fname);
                 FileOutputStream fout = new FileOutputStream(fname);
                 byte[] buffer = new byte[4096];
                 for (int c=1;c<=chunkamount;c++)
                 {
                   File filein = new File(upBean.getFolderstore()+java.io.File.separator+chunkbaseStr+"."+c);
                   FileInputStream fin = new FileInputStream(filein);
                   int read = -1;
                   while ((read = fin.read(buffer)) > 0) fout.write(buffer,0,read);
                   fin.close();
                   filein.delete();
                 }
                 fout.close();
               }
             }
             else upBean.store(mrequest, "uploadfile");
             upBean.setFolderstore(directory+account);
              String uploadfilename=file.getFileName();
              Runtime r = Runtime.getRuntime();
              Process p = null;
        try {
                Calendar cal=Calendar.getInstance();
                int day=cal.get(Calendar.DATE);
                int month=cal.get(Calendar.MONTH);
                int year=cal.get(Calendar.YEAR);
                int hrs=cal.get(Calendar.HOUR);
                int min=cal.get(Calendar.MINUTE);
                int sec=cal.get(Calendar.SECOND);
                int msec=cal.get(Calendar.MILLISECOND); 
                String vname_postfix=day+"-"+month+"-"+year+"-"+hrs+"-"+min+"-"+sec+"-"+msec;
               
                String path1=application.getRealPath("/"); 
                String separator = System.getProperty("file.separator");
                String FF=path1  +"resume"+ separator+ uploadfilename;
                File f1=new File(FF);
                uploadfilename=uploadfilename.replace(' ','_');
                
                String NewFile=path1 + "resume"+ separator+ uploadfilename;
               
                
                String video=NewFile;          
                
                int index2=video.lastIndexOf(".");
                int index3=video.lastIndexOf("/");
                String videoname=video.substring(index3+1,index2);
                videoname=videoname.replace("(","");
                videoname=videoname.replace(")","");
                String  extension=video.substring(index2+1);
               
                videoname=videoname+vname_postfix+"."+extension; 
                
                File New = new File(videoname);
                f1.renameTo(New);               
                
                String category="1";
                String keyword=mrequest.getParameter("keyword");
                
                String headline=mrequest.getParameter("headline");
                
                String description=mrequest.getParameter("description");
                String emp_location=mrequest.getParameter("location");
                String designation=mrequest.getParameter("designation");
                String profile=mrequest.getParameter("profile");
                String employer_details=mrequest.getParameter("employer_details");
                String exp=mrequest.getParameter("exp");
                String pack=mrequest.getParameter("pack");
                
                if(headline==""){headline="Video";}
                
                String date=year+"-"+(month+1)+"-"+day+" "+hrs+":"+min+":00";
                
                Statement state=con.createStatement();
                String query=null;
                ResultSet result=null;
                String s=null;                      
                s="update user_login set profile_desc='"+profile+"',education='"+description+"' , designation='"+designation+"'," +
                "skills='"+keyword+"',headline='"+headline+"',current_employer='"+emp_location+"',exp='"+exp+"',package='"+pack+"'," +
                "employer_history='"+employer_details+"',resume='"+videoname+"' where User_id='"+userid+"'";
              
                out.print(s);
                state.executeUpdate(s);
                
                
                
               
                
                
                response.sendRedirect("success.jsp");
                }
                
                catch(Exception e) {
                
                System.out.println("Videos Error -------"+e.getMessage());
                response.sendRedirect("KConvertI.jsp?j=0");
                
                }
                
                
    

                
                }
                else
                {
                String emptydirectory = mrequest.getParameter("emptydirectory");
                if ((emptydirectory != null) && (!emptydirectory.equals("")))
                {
                File dir = new File(directory+account+"/"+emptydirectory);
                dir.mkdirs();
                }
                out.println("<li>No uploaded files");
                }
                }
                else out.println("<BR> todo="+todo);
                
                
                }
                %>
    
    
<%@ include file="header.jsp" %>
<%@include  file="leftpanel.jsp" %>

<td width="4" class="vertical"></td>


		<!-- center Panel starts -->
<td width="800" valign="top">
        
<br /> 
    
<%
Statement stresume=con.createStatement();

ResultSet rsresume=stresume.executeQuery("select * from user_login where User_id='"+userid+"'");
String sk="" ;
String hd="" ;
String ed="" ;
String ce="" ;
String de="" ;
String pd="" ;
String ped="" ;
String te="" ;
String cp="" ;
if(rsresume.next())
    {
     sk=rsresume.getString("skills"); if(sk==null)sk="";
     hd=rsresume.getString("headline"); if(hd==null)hd="";
     ed=rsresume.getString("education"); if(ed==null)ed="";
     ce=rsresume.getString("current_employer") + " , " + rsresume.getString("location"); if(ce==null)ce="";
     de=rsresume.getString("designation"); if(de==null)de="";
     pd=rsresume.getString("profile_desc"); if(pd==null)pd="";
     ped=rsresume.getString("employer_history"); if(ped==null)ped="";
     te=rsresume.getString("exp"); if(te==null)te="";
     cp=rsresume.getString("package"); if(cp==null)cp="";
    
    
    
    }



%>



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
                         
                         <span class="featured">Update Resume </span> 
                     </td>
                     </tr>
                    
                     <tr>
                         <td> <br>
                             <form name="upform" method="post" action="KConvertI.jsp"  enctype="multipart/form-data">             
                             
                                   <table  border="0" align="center" cellspacing="4" cellpadding="4" border="0"  bgcolor="#F9F9F9" class="upload-mid">
                                            
                                                 <tr>
                                                    <td width="70" align="left" height="40" class="text4"  >
                                                        Upload Resume<font color="red">*</font>
                                                     </td>
                                                     <td height="60" align="left"   class="text2">
                                                         
                                                         <input type="file" name="uploadfile" size="45"><br>
                                                         <Strong> You can upload only doc ,txt and odt files </Strong>
                                                         
                                                     </td>
                                                 </tr>
												
                                                 <tr>
                                                     <td width="70" align="left" height="40"  class="text4" >
                                                         Skills
                                                     </td>
                                                     <td height="40"  width="200" align="left" >
                                                         
                                                         <input type="text" id="keyword" name="keyword" maxlength="100" size="28" value="<%=sk%>">
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td width="70" align="left" height="40"  class="text4"  >
                                                          Resume Headline<font color="red">*</font>
                                                     </td>
                                                     <td height="40"  width="200" align="left" >
                                                         
                                                         <input type="text" id="headline" name="headline" maxlength="70" size="28"  value="<%=hd%>">
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td width="70" align="left" height="40" class="text4"  >
                                                        Education 
                                                     </td>
                                                     
                                                     
                                                     <td height="40"  width="200" class="text2" align="left" >
                                                         <textarea name="description" id="description" cols="35" rows="7" maxlength="500" onkeyup="return ismaxlength(this)"><%=ed%></textarea>
                                                         <br>  Not more than 500 words
                                                         <!-- <input type="textarea" id="description" name="description" maxlength="250">-->
                                                     </td>
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td width="70" align="left" height="40"  class="text4"  >
                                                          Current Employer & Location (if any) 
                                                     </td>
                                                     <td height="40"  width="200" align="left" >
                                                         
                                                         <input type="text" id="location" name="location" maxlength="70" size="28" value="<%=ce%>">
                                                     </td>
                                                 </tr>
                                                 
                                                  <tr>
                                                     <td width="70" align="left" height="40" class="text4"  >
                                                        Current Designation  (if any) 
                                                     </td>
                                                     <td height="40"  width="200" align="left" >
                                                         
                                                         <input type="text" id="designation" name="designation" maxlength="70" size="28" value="<%=de%>">
                                                     </td>
                                                 </tr>
                                                 
                                                  <tr>
                                                     <td width="70" align="left" height="40" class="text4"  >
                                                        Profile Description
                                                     </td>
                                                     
                                                     
                                                     <td height="40"  width="200" class="text2" align="left" >
                                                         <textarea name="profile" id="profile" cols="35" rows="7" maxlength="200" onkeyup="return ismaxlength(this)"><%=pd%></textarea>
                                                         <br>  Not more than 200 words
                                                         <!-- <input type="textarea" id="description" name="description" maxlength="250">-->
                                                     </td>
                                                 </tr>
                                                  <tr>
                                                     <td width="70" align="left" height="40" class="text4"   >
                                                        Previous Employer Details
                                                     </td>
                                                     
                                                     
                                                     <td height="40"  width="200" class="text2"  align="left">
                                                         <textarea name="employer_details" id="employer_details" cols="35" rows="7" maxlength="500" onkeyup="return ismaxlength(this)"><%=ped%></textarea>
                                                         <br>  Not more than 500 words
                                                         <!-- <input type="textarea" id="description" name="description" maxlength="250">-->
                                                     </td>
                                                 </tr>
                                                 
                                                  <tr>
                                                     <td width="70" align="left" height="40"  class="text4"  >
                                                         Total Exp: 
                                                     </td>
                                                     <td height="40"  width="200"  align="left">
                                                         
                                                         <input type="text" id="exp" name="exp" maxlength="70" size="28" value="<%=te%>">
                                                     </td>
                                                 </tr>
                                                 
                                                  <tr>
                                                     <td width="70" align="left" height="40"  class="text4"  >
                                                         Current Package 
                                                     </td>
                                                     <td height="40"  width="200"  align="left">
                                                         
                                                         <input type="text" id="pack" name="pack" maxlength="70" size="28" value="<%=cp%>">
                                                     </td>
                                                 </tr>
                                                 
                                                
                                                 <tr>
                                                     <td width="70" align="left" height="40"  class="text4"  >
                                                      
                                                     </td>
                                                     <td height="40"  width="200"  align="left">
                                                       
                                                        <input type="hidden" name="cats" id="cats" value="1"/>
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
                                                         <font color="red" size="2"><b>There is some problem with file please upload any other file.</b></font>
                                                         <%
                                                         }
                                                         %>
                                                         
                                                         
                                                     </td>
                                                 </tr>

                                                 <tr><td align="center" colspan="2" ><br><div id="images" class="text4">Please wait.....<br><img src="images/loading.gif"></div></td></tr>
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


<%@ include file="footer.jsp" %> 
</body>
</html>






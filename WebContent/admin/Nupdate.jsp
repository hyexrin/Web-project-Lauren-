<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="posting.NMgr"%>
<%@ page import="posting.NBean"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>QnA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="../css/write.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="../css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/etc.css" />
   
<script language="JavaScript" src="../script.js"></script>
</head>
<body>
	<%
	String sid = null;
	if(session.getAttribute("sid") != null) {
		sid = (String)session.getAttribute("sid");
	}
 
	
	int n_number = 0;	
	if(request.getParameter("n_number")!=null){
	String n_number2 = request.getParameter("n_number");
	n_number = Integer.parseInt(n_number2.trim());
		//int QA_number = Integer.parseInt(request.getParameter("QA_number"));
	}
	
	if(n_number == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않을 글입니다.')");
		script.println("location.href = 'notice.jsp'");
		script.println("</script>");
	}
	
	  NBean nbean = new NMgr().getNBean(n_number);
	  if(!sid.equals("root") ){
		  PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
	  }
	%>


    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>
        
       <div align="center">
       	<form action="NupdateProc.jsp?n_number=<%=n_number %>" method="post"  id="container">
	        <table id ="container" style = "text-align : center; ">
		        <thread>
			        <tr>
				        <th style="background-color: #eeeeee; text-align:center; width:200px;">공지사항 글수정  양식</th>
			        </tr>
		        </thread>
		        <tbody>
		        	<tr>
		        		<td> <input type="text"  placeholder="글 제목" name = "n_title" maxlength="50" value="<%= nbean.getN_title()%>"> </td>
		        	</tr>
		        	<tr>
		        		<td> <textarea placeholder="글 내용" name = "n_content" maxlength="2048" style="height:350px;"><%= nbean.getN_content()  %></textarea></td>
		        	</tr>
		        	
		        </tbody>
	        </table>
	        <input type="submit" value="글 수정" >
	       </form>
	       
       </div>
       
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
        
        
    </div>
   
</body>
</html>
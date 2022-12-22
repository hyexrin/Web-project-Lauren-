<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="posting.PMgr"%>
<%@ page import="posting.PBean"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>QnA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/write.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
   
<script language="JavaScript" src="script.js"></script>
</head>
<body>
	<%
	String sid = null;
	if(session.getAttribute("sid") != null) {
		sid = (String)session.getAttribute("sid");
	}
 
	if(sid ==null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int QA_number = 0;	
	if(request.getParameter("QA_number")!=null){
	String QA_number2 = request.getParameter("QA_number");
	QA_number = Integer.parseInt(QA_number2.trim());
		//int QA_number = Integer.parseInt(request.getParameter("QA_number"));
	}
	
	if(QA_number == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않을 글입니다.')");
		script.println("location.href = 'QnA.jsp'");
		script.println("</script>");
	}
	
	  PBean pbean = new PMgr().getPBean(QA_number);
	  if(!sid.equals(pbean.getMem_id()) && !sid.equals("root")   ){
		  PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href = 'QnA.jsp'");
			script.println("</script>");
	  }
	%>


    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>
        
       <div align="center">
       	<form action="updateProc.jsp?QA_number=<%=QA_number %>" method="post"  id="container">
	        <table id ="container" style = "text-align : center; ">
		        <thread>
			        <tr>
				        <th style="background-color: #eeeeee; text-align:center; width:200px;">게시판 글수정  양식</th>
			        </tr>
		        </thread>
		        <tbody>
		        	<tr>
		        		<td> <input type="text"  placeholder="글 제목" name = "QA_title" maxlength="50" value="<%= pbean.getQA_title()%>"> </td>
		        	</tr>
		        	<tr>
		        		<td> <textarea placeholder="글 내용" name = "QA_content" maxlength="2048" style="height:350px;"><%= pbean.getQA_content()  %></textarea></td>
		        	</tr>
		        	<tr>
		        		<td> <textarea placeholder="email" name = "mem_email" maxlength="80" style="height:40px;">  ><%= pbean.getMem_email() %> </textarea></td>
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
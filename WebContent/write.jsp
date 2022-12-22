<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, posting.*"%>
<%@ page import="java.io.PrintWriter"%>
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
	String mem_id = (String)session.getAttribute("sid");
	if(session.getAttribute("mem_id") != null) {
		mem_id = (String)session.getAttribute("mem_id");
	}
	
	
	
	%>


    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>
        
       <div align="center">
       	<form action="writeProc.jsp" method="post"  id="container">
	        <table id ="container" style = "text-align : center; border: 1px solid #dddddd">
		        <thread>
			        <tr>
				        <th style="background-color: #eeeeee; text-align:center; width:200px;">게시판 글쓰기 양식</th>
			        </tr>
		        </thread>
		        <tbody>
		        	<tr>
		        		<td> <input type="text"  placeholder="글 제목" name = "QA_title" maxlength="50"> </td>
		        	</tr>
		        	<tr>
		        		<td> <textarea placeholder="글 내용" name = "QA_content" maxlength="2048" style="height:350px;"></textarea></td>
		        	</tr>
		        	<tr>
		        	<td> <input type="text"  placeholder="email" name = "mem_email" maxlength="50"> </td>
		        	</tr>
		        	
		        </tbody>
	        </table>
	        <input type="submit" value="글쓰기" >
	       </form>
	       
       </div>
       
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
        
        
    </div>
   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/login.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/content.css" />
</head>
<body>
<div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

		
		
		<%
        // 현재 로그인된 아이디가 없다면
        if(session.getAttribute("sid") == null) {
            %>

        <article id="side1"></article>

		<article id="form">
		
		<div align="center">

				
		<form action ="loginOk.jsp" method = "get">
		<table id="login">
		<tr>
			<td id="title">LOGIN</td>
		</tr>
		<tr>
			<td><input type = "text" name ="mem_id" placeholder="ID" size = "10"></td>
		</tr>
		<tr>
			<td><input type="password" name = "mem_password" placeholder="PASSWORD" size = "10"></td>
		</tr>
		<tr>
			<td colspan = "4">
			<input type="submit" value="LOGIN"><br>
			<input type="button" value="JOIN US" onclick="location.href='join.jsp'">
			</td>
		</tr>
		</table>
		</form>
				</div>
		
		</article>
        <article id="side2"></article>

		<%
        } 
		// 관리자로 로그인 했다면
        else if(session.getAttribute("sid").equals("root")){
        	%>
        <script> alert("관리자 로그인");
	        		location.href="admin/adminIndex.jsp";</script>
		
		<%
        }
        // 현재 로그인된 아이디가 있다면 
        else {
            %>
          <jsp:include page="main.jsp" flush="false" />

<%
        }
    %>
		



        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
</body>
</html>
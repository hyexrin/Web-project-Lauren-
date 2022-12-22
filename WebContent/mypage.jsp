<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>My Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/my.css" />
    <script src="main.js"></script>
</head>
<%
	if(session.getAttribute("sid") == null) {
		response.sendRedirect("login.jsp");
	}else{
%>	
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

			
       <div id ="main"  align="center">
       <%=session.getAttribute("sid") %>님, Lauren에서 따뜻한 쇼핑 되세요
       <div id="myBox">
	       	<input type="button" value="주문내역" onclick="location.href='OrderList.jsp'">
	       	<input type="button" value="회원정보 수정" onclick="location.href='PersonalInform.jsp'">
	       	<input type="button" value="Q&A" onclick="location.href='QnA.jsp'">
	       	<input type="button" value="공지사항" onclick="location.href='notice.jsp'">
	   </div>
       <div id="ad">
       <img src="img/sale2.png" width="600" height="270">
       </div> 
       </div>

        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
    <%} %>
</body>
</html>

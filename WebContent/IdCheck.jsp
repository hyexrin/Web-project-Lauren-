<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="member.Info.DButill" %>
<jsp:useBean id="member" class="member.Info.DButill" />

<%
   request.setCharacterEncoding("euc-kr");
   String mem_id = request.getParameter("mem_id");
   boolean check = member.checkId(mem_id);
%>

<html>
<head>
<title>ID중복체크</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<body bgcolor="#eeeeee" onload="self.moveTo(580,300)">    
    
<br>
<center>
<b><%=mem_id%></b>
<%
  if(check){
     out.println("는 이미 존재하는 ID입니다.<p>");
}else{    
     out.println("는 사용 가능 합니다.<p>");
}
%>
<input type="button" value="창닫기" onClick="window.close()">

</center>
</body>
</html>
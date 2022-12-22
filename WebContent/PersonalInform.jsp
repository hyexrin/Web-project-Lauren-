<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import ="java.util.*,product.*, member.Info.*" %> 
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memMgr" class="product.MemberMgr" />
<%
String sid = (String)session.getAttribute("sid");
%>

<html>
<head>
<title>회원수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
<script charset="utf-8" language="JavaScript" src="script.js"></script>
<style>
table{
	font-size: small;
	margin: 100px 0;
}

td{
	width: 150px;
	height: 40px;
}

#btn{
	width: 200px;
	height: 25px;
	background-color: #e6e6e6;
	border-radius: 5px;
	border-style: none;
}
</style>
</head>
<body>
<br>

		<header>
          <jsp:include page="top.jsp" flush="false" />
        </header>
        
	<%DBBean regBean= memMgr.getMember(sid);%>
	<div align="center">

		<table align="center">
		<form name="regForm" method="post" action="PersonalInformProc.jsp">
		<tr align="center" > 
		<td colspan="2"><b>회원정보 수정</b></td>
		</tr>
		<tr> 
		<td>아이디</td>
		<td><%=regBean.getMem_id()%></td>
		</tr>
		<tr> 
		<td>패스워드</td>
		<td><input type="text" name="mem_password" value="<%=regBean.getMem_password()%>"></td>
		</tr>
		<tr> 
		<td>이름</td>
		<td><input type="text" name="mem_name" value="<%=regBean.getMem_name()%>"></td>
		</tr>
		<tr> 
		<td>전화번호</td>
		<td><input type="text" name="mem_tel" value="<%=regBean.getMem_tel()%>"></td>
		</tr>
		<tr> 
		<td>이메일</td>
		<td><input type="text" name="mem_email" size="50" value="<%=regBean.getMem_email()%>"></td>
		</tr>
		 <tr>
	     <td>생 일</td>
	     <td><input type="date" name="mem_birth" value="<%=regBean.getMem_birth()%>"></td>
	    </tr>		
		<tr> 
		<td>회사</td>
		<td><input type="text" name="mem_comdept" size="50" value="<%=regBean.getMem_comdept()%>"></td></td>
		</tr>
		<tr>
		<td>메 모</td>
		<td><input type="text" name="mem_memo" value="<%=regBean.getMem_memo()%>"></td>
		</tr>		
		<tr> 
		<td colspan="2" align="center"><input id="btn" type="submit" value="수정완료"> 
		<input  id="btn" type="reset" value="다시쓰기"> 
		</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=sid%>">
		</form>
		</table>

	</div>
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
		
</body>
</html>

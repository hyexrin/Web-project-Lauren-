<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*,product.*, member.Info.*" %>
<jsp:useBean id="memMgr" class="product.MemberMgr" />
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/memMgr.css" />
<script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>
        
       <div align="center">
	<%
	DBBean regBean= memMgr.getMember(request.getParameter("mem_id"));
	%>
	<table id="tb" width="70%" align="center">
	<tr> 
	<td align="center">

		<table width="65%" align="center">
		<form name="regForm" method="post" action="MemberUpdateProc.jsp">
		<tr align="center" > 
		<td colspan="3"><b>
		<%=regBean.getMem_name()%>
		회원 정보 수정</b> </td>
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
		<td><input type="text" name="mem_memo" value="<%=regBean.getMem_memo() %>"></td>
		</tr>		
		<tr> 
		<td colspan="2" align="center"><input class="btn" type="submit" value="수정완료"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input class="btn" type="reset" value="다시쓰기"> 
	
		</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=request.getParameter("mem_id")%>">
		</form>
		</table>

	</td>
	</tr>
	</table>
       </div>
	   
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
</body>
</html>

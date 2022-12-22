<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, product.*, member.Info.*"%>
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
	
 	<%Vector vResult= memMgr.getMemberList();%>       
	
	<table id="tb" width="75%" align="center">
	<tr> 
	<td align="center">

		<table width="95%" align="center">
		<tr> 
		<td align="center"><b>회원이름</b></td>
		<td align="center"><b>회원아이디</b></td>
		<td align="center"><b>패스워드</b></td>
		<td align="center"><b>전화번호</b></td> 
		<td align="center"><b>이메일</b></td>
		<td align="center"><b>생일</b></td>
		<td align="center"><b>회사</b></td>
		<td align="center"><b>메모</b></td>
		<td align="center"><b>수정</b></td>
		</tr>
		<tr><br><br></tr>
		<%
		for(int i=0; i<vResult.size(); i++){
		DBBean regBean = (DBBean)vResult.get(i);
		%>
		<tr> 
		<td align="center"><%=regBean.getMem_name()%></a></td>
		<td align="center"><%=regBean.getMem_id()%></td>
		<td align="center"><%=regBean.getMem_password()%></td>
		<td align="center"><%=regBean.getMem_tel()%></td>
		<td align="center"><%=regBean.getMem_email()%></td>
		<td align="center"><%=regBean.getMem_birth()%></td>
		<td align="center"><%=regBean.getMem_comdept()%></td>
		<td align="center"><%=regBean.getMem_memo()%></td>
		<td align="center"><a href="javascript:Update('<%=regBean.getMem_id()%>')">수정하기</a></td>
		</tr>
		<%}%>
		</table>
	</td>
	</tr>
	</table>

       </div>
	   
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
        
	<form name="update" method="post" action="MemberUpdate.jsp">
	<input type=hidden name="mem_id">
	</form>
        
    </div>
</body>
</html>

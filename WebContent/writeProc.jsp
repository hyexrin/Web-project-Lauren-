<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="posting.PMgr"%>
<%@ page import="java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="pbean" class="posting.PBean" scope="page"/>
<jsp:setProperty name="pbean" property="QA_title" />
<jsp:setProperty name="pbean" property="QA_content" />
<jsp:setProperty name="pbean" property="mem_email" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String mem_id = (String)session.getAttribute("sid");
	if(session.getAttribute("mem_id") != null) {
		mem_id = (String)session.getAttribute("mem_id");
		
	}
	
	if(mem_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요. ')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		if(pbean.getQA_title() == null || pbean.getQA_content() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}else{
		PMgr pmgr = new PMgr();
		int result = pmgr.write(pbean.getQA_title(), mem_id, pbean.getQA_content(), pbean.getMem_email());
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 완료 ')");
			script.println("location.href = 'QnA.jsp'");
			script.println("</script>");
		}
		
	}
	}
	
	%>

</body>
</html>
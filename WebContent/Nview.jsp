<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="posting.NBean"%>
<%@ page import="posting.NMgr"%>
<%request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>공지사항</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/QnA.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
   
<script language="JavaScript" src="script.js"></script>
</head>
<body>
	<%
	String sid = (String)session.getAttribute("sid");
	
	if((sid) == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요. ')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
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
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'notice.jsp'");
		script.println("</script>");
	}
	
	NBean pbean = new NMgr().getNBean(n_number);
	
	%>

    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>
        
       <div align="center">
       
	        <table id ="container" style = "padding-top:30px; text-align : center; ">
		        <thread>
			        <tr>
				        <th colspan="3" style="background-color: #eeeeee; text-align:center; width:200px;">공지사항 글쓰기 보기</th>
			        </tr>
		        </thread>
		        <tbody>
		        	<tr>
		        		<td style ="width = 20%;">글 제목</td>
		        		<td colspan="2"> <%= pbean.getN_title() %> </td>
		        	</tr>
		        	<tr>
		        		<td>작성일자</td>
		        		<td colspan="2"> <%= pbean.getN_date().substring(0,11) + pbean.getN_date().substring(11,13) +"시" + pbean.getN_date().substring(14,16) + "분" %> </td>
		        	</tr>
		        	<tr>
		        		<td>내용</td>
		        		<td colspan="2"style="min-height:200px; text-align:center;"><pre> <%= pbean.getN_content() %></pre> </td>
		        	</tr>
		        </tbody>
	        </table>
	        
	         <div style="margin-top:20px; margin-bottom:50px;">
	       	 <a href ="notice.jsp" style="font-size: medium; margin: 10px;">목록</a>
	     
	        <%
	        
		      	if(sid.equals("root") ){
	        %>	
	        	<a href ="admin/Nupdate.jsp?n_number=<%=n_number %>" style="font-size: medium; margin: 10px;">수정</a>
	        	<a onclick="return confirm('정말로 삭제하시겠습니까?')" href ="admin/NdeleteProc.jsp?n_number=<%=n_number %>" style="font-size: medium; margin: 10px;">삭제</a>
	        <%
	        	}
	        %>
	       
       </div>
       </div>
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
        
        
    </div>
   
</body>
</html>
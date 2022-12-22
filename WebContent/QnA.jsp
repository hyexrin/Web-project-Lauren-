<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="posting.PBean"%>
<%@ page import="posting.PMgr"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>QnA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/QnA.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />

<script language="JavaScript" src="script.js"></script>
</head>
<body>
	<%
	if(session.getAttribute("sid") != null) {
		String sid = (String)session.getAttribute("sid");
	}

	int pageNumber = 1;

	if(request.getParameter("pageNumber")!=null
	&& request.getParameter("pageNumber")!=""){

	String pageNumber2 = request.getParameter("pageNumber");
	pageNumber = Integer.parseInt(pageNumber2.trim());
	}
	%>

    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

		<h3 style="text-align : center; ">Q & A</h3>


		<div id="qnabox2" align="center">
			24시간 이용이 가능한 문의게시판입니다. 문의주시면 이메일로 친절하게 답변해드리도록 하겠습니다.<br>
			전화량이 많아 전화연결이 원활하지 않을 수 있으며,Q&A게시판을 이용해주시면 좀더 빠르게 답변 받아보실 수 있습니다.<br>
			Q&A답변은 토/일/공휴일에는 운영되지 않으며 답변순서는 문의에 따라 달라질 수 있습니다.<br>
		</div>




       <div  align="center">
	        <table id ="container" style = "padding-top:20px;text-align : center; ">

		        <thread>
			        <tr >
				        <th style="background-color: #eeeeee; text-align:center;">번호 </th>
				        <th style="background-color: #eeeeee; text-align:center;">제목 </th>
				        <th style="background-color: #eeeeee; text-align:center;">작성자 </th>
				         <th style="background-color: #eeeeee; text-align:center;">email </th>
				        <th style="background-color: #eeeeee; text-align:center;">작성일 </th>
			        </tr>
		        </thread>
		        <tbody>
			        <%
			        	PMgr pmgr = new PMgr();
			        	ArrayList<PBean> list = pmgr.getList(pageNumber);
			       		 for(int i = 0; i< list.size(); i++){
			        %>
		        	<tr>
		        		<td><%= list.get(i).getQA_number() %></td>
		        		<td><a href="view.jsp?QA_number= <%= list.get(i).getQA_number() %>"><%=list.get(i).getQA_title() %></a></td>
		        		<td><%= list.get(i).getMem_id() %></td>
		        		<td><%=list.get(i).getMem_email() %></td>
		        		<td><%= list.get(i).getQA_date().substring(0,11) + list.get(i).getQA_date().substring(11,13) +"시" + list.get(i).getQA_date().substring(14,16) + "분" %></td>
		        	</tr>
		        	<%  } %>

		        </tbody>
	        </table>
	       <div style="margin-top:20px; margin-bottom:50px;">
	        <%
	        	if(pageNumber != 1 ) {

	        %>

	        <a href ="QnA.jsp?pageNumber= <%=pageNumber - 1%>"  style="font-size: medium; margin: 10px;"> 이전 </a>
	        <%
	        	}if(pmgr.nextPage(pageNumber + 1)){
	        %>

	        <a href ="QnA.jsp?pageNumber= <%=pageNumber + 1%>" style="font-size: medium; margin: 10px;"> 다음 </a>

	        <%
	        	}
	        %>
	         <a href ="write.jsp" style="font-size: medium; margin: 10px;"> 글쓰기</a>

       </div>
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>

    </div>
   </div>
</body>
</html>
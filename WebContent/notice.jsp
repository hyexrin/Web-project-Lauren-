<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="posting.NBean"%>
<%@ page import="posting.NMgr"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Notice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/QnA.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />

<script language="JavaScript" src="script.js"></script>
</head>
<body>
	<%
	String sid = null;
	if(session.getAttribute("sid") != null) {
		 sid = (String)session.getAttribute("sid");
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

		<h3 id="qnah3" style="text-align : center; ">Notice</h3>


		<div id="qnabox1">
		<pre>

<strong> CUSTOMER CENTER</strong>

 1661-0000

 MON - FRI AM 11:00 - PM 5:30 | SAT. SUN. HOLIDAY CLOSE

<strong> BANK ACCOUNT</strong>

 농협 317-0007-0000-41 국민 457401-04-000000 예금주 : (주)LARUEN
		</pre>

		</div>
		<div class="qnabox" style="border-left:none;">
		<pre>

<strong> NOTICE</strong>

ABOUT LAUREN

타임리스 디자인을 경험해보세요
모든 제품은 시간이 지나도 오래 입을 수 있도록 만들어집니다.
세심하고 정교한 기술로 완성된, 모던한 옷차림을 위한 디자인을 만나보세요.

Buy better, keep forever.

		</pre>

		</div>



       <div  align="center">
	        <table id ="container" style = "padding-top:30px; text-align : center; border: 0px solid #dddddd">

		        <thread>
			        <tr >
				        <th style="background-color: #eeeeee; text-align:center; width:15%">번호 </th>
				        <th style="background-color: #eeeeee; text-align:center; width:50%">제목 </th>
				        <th style="background-color: #eeeeee; text-align:center; width:35%">작성일 </th>
			        </tr>
		        </thread>
		        <tbody>
			        <%
			        NMgr nmgr = new NMgr();
			        ArrayList<NBean> list = nmgr.getList(pageNumber);
			        for(int i = 0; i< list.size(); i++){
			        %>
		        	<tr>
		        		<td><%= list.get(i).getN_number() %></td>
		        		<td><a href="Nview.jsp?n_number= <%= list.get(i).getN_number() %>"><%=list.get(i).getN_title() %></a></td>
		        		<td><%= list.get(i).getN_date().substring(0,11) + list.get(i).getN_date().substring(11,13) +"시" + list.get(i).getN_date().substring(14,16) + "분" %></td>
		        	</tr>
		        	<%  } %>

		        </tbody>
	        </table>
	           <div style="margin-top:20px; margin-bottom:50px;">

	        <%
	        	if(pageNumber != 1 ) {

	        %>

	        <a href ="notice.jsp?pageNumber= <%=pageNumber - 1%>" style="font-size: medium; margin: 10px;"> 이전 </a>
	        <%
	        	}if(nmgr.nextPage(pageNumber + 1)){
	        %>

	        <a href ="notice.jsp?pageNumber= <%=pageNumber + 1%>" style="font-size: medium; margin: 10px;"> 다음 </a>

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
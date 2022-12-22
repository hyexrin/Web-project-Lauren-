<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, product.*"%>
<jsp:useBean id="orderMgr" class="product.OrderMgr" />

<%
	String flag = request.getParameter("flag");
    String no = request.getParameter("no");
	String state = request.getParameter("state");
	boolean result = false;
	
	if(flag.equals("update")){
    	result=orderMgr.updateOrder(no, state);
    }else if(flag.equals("delete")){
		result=orderMgr.deleteOrder(no);
	}else{
		response.sendRedirect("OrderMgr.jsp");
	}

    if(result){
%>
	<script>
		alert("정상적으로 처리하였습니다.");
		location.href="OrderMgr.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("오류가 발생하였습니다.");
		location.href="OrderMgr.jsp";
	</script>
<%
	}
%>


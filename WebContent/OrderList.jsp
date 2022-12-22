<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, product.*, member.Info.*" %>
<jsp:useBean id="orderMgr" class="product.OrderMgr" />
<jsp:useBean id="proMgr" class="product.ProductMgr" />
<%

	String sid = (String)session.getAttribute("sid");
	if(session.getAttribute("sid") == null) {
		response.sendRedirect("login.jsp");
	}else{
%>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/content.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/OrderList.css" />
    <script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

       <div id ="main" align = "center">

	

		<table>
		<tr bgcolor="#000000"> 
		<td align="center"><font color="#FFFFFF">주문번호</font></td>
		<td align="center"><font color="#FFFFFF">제품</font></td>
		<td align="center"><font color="#FFFFFF">주문수량</font></td>
		<td align="center"><font color="#FFFFFF">주문날짜</font></td>
		<td align="center"><font color="#FFFFFF">주문상태</font></td>
		</tr>
		<%
		Vector vResult = orderMgr.getOrder(sid);
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">주문하신 물품이 없습니다.</td>
		</tr>		
		<%}else{
			for(int i=0; i< vResult.size(); i++){
			OrderBean order = (OrderBean)vResult.get(i);
			ProductBean product = proMgr.getProduct(order.getProduct_no());
		%>
		<tr> 
		<td align="center"><%=order.getNo()%></td>
		<td align="center"><a href="javascript:productDetail('<%=order.getProduct_no()%>')">no.<%=order.getProduct_no() %></a></td>
		<td align="center"><%=order.getQuantity()%></td>
		<td align="center"><%=order.getDate()%></td>
		<td align="center">
		<%
		switch(Integer.parseInt(order.getState())){
		case 1 : out.println("접수중");
		break;
		case 2 : out.println("접수");
		break;
		case 3 : out.println("입금확인");
		break;
		case 4 : out.println("배송준비");
		break;
		case 5 : out.println("배송중");
		break;
		default : out.println("완료");
		}
		%> 
		</td>
		</tr>
		<%}
		}%>
		</table> 
	
	
	

        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
        
        	
	<form name="detail" method="post" action="ProductDetail.jsp" >
	<input type="hidden" name="no">
	</form>	
    </div>
</body>
</html>
<%}%>
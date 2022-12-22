
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, product.*" %>
<jsp:useBean id="cartMgr" class="product.CartMgr" scope="session"/>
<jsp:useBean id="proMgr" class="product.ProductMgr" />
<%
	if(session.getAttribute("sid") == null) {
		response.sendRedirect("login.jsp");
	}else{
%>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/content.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/CartList.css" />
    <script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

       <div id ="main" align = "center">
	<table>
	<tr>
		<tr>
		<td align="center" bgcolor="#000000"><font>제품</font></td>
		<td align="center" bgcolor="#000000"><font>수량</font></td>
		<td align="center" bgcolor="#000000"><font>가격</font></td>
		<td align="center" bgcolor="#000000"><font>수정/삭제</font></td>
		<td align="center" bgcolor="#000000"><font>조회</font></td>
		</tr>
		<%
		int totalPrice =0 ;		
		Hashtable hCart = cartMgr.getCartList();
		if(hCart.size() == 0){
		%>
		<tr><td colspan="5" align="center">선택하신 물품이 없습니다.</td></tr>	

		<%
		}else{
		Enumeration hCartKey=hCart.keys();
			while(hCartKey.hasMoreElements()){
			OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
			ProductBean product = proMgr.getProduct(order.getProduct_no());
			int price = Integer.parseInt(product.getPrice().replace(",", ""));
			int quantity = order.getQuantity();
			int subTotal = price*quantity;
			totalPrice += price*quantity;
			
		%>
		<form method="post"action="CartProc.jsp">
		<input type="hidden" name="product_no" value="<%=product.getNo()%>">
		<input type="hidden" name="flag">
		<tr> 
		<td align="center">	<%=product.getName()%></td>
		<td align="center"><input style = "text-align:right" type=text name=quantity value="<%=order.getQuantity()%>" size=5 >개</td>
		<td align="center"><%=subTotal+""%></td>
		<td align="center">
		<input style ="cursor:pointer"type="button" value="수정" size="3" onclick="javascript:cartUpdate(this.form)"> /
		<input style ="cursor:pointer"type="button" value="삭제" size="3" onclick="javascript:cartDelete(this.form)">
		
		<td align="center"><a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a></td>
		</tr>
		</form>
		<%}%>
		<tr> 
		<td colspan="4" align="right">총 금액 : <%=totalPrice%>원</td>
		<td align="center" bgcolor="#000000"><a href="payList.jsp"><font>주문하기</font></a></td>
		</tr>
		<%
		}
		%>			
			
		

	
	</td>
	</tr>
	</table>
       </div>

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
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="cartMgr" class="product.CartMgr" scope="session"/>
<jsp:useBean id="order" class="product.OrderBean" />
<jsp:setProperty name="order" property="*" />
<%
	String flag=request.getParameter("flag");
	String id= (String)session.getAttribute("sid");
	
	if(id == null) {
		response.sendRedirect("login.jsp");
	}else{

		if(flag == null){
		order.setId(id);		
		cartMgr.addCart(order);	
%>
		<script>
		alert("장바구니에 담았습니다.");
		location.href="CartList.jsp";
		</script>
<%		}else if(flag.equals("update")){
	    order.setId(id);
		cartMgr.updateCart(order);
%>
		<script>
		alert("수정 하였습니다.");
		location.href="CartList.jsp";
		</script>
<%		}else{
		cartMgr.deleteCart(order);
%>
		<script>
		alert("삭제 하였습니다.");
		location.href="CartList.jsp";
		</script>
<%
		}
	}
%>
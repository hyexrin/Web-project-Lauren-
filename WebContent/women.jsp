<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, product.*"%>
<jsp:useBean id="proMgr" class="product.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Lauren Men</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/product.css" />
<script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>
<%Vector vResult= proMgr.getProductList();%>

       <div id ="product">	        
		<h1 align="center">WOMEN</h1><br>
<h1>Top</h1>

<%
for(int i=0; i<vResult.size(); i++){
	ProductBean product = (ProductBean)vResult.get(i);
	String gender = product.getGender();
	String kind = product.getKind();
	if(gender.equals("women")) {
		if(kind.equals("top")) { %>
			<div id="list">
					<img src="data/<%=product.getImage()%>" height="600" width="400"><br>
					<b><a href="javascript:productDetail('<%=product.getNo()%>')"><%=product.getName()%></a></b><br>
					<%=product.getPrice()%>원<br>
					누적 주문 횟수 : <%=product.getView() %>회<br>
	
				<a href="javascript:productDetail('<%=product.getNo()%>')"> [ 상세보기 ] </a><br>
			</div>	
		<%}
	}
}
%>
<br><br>
<h1>Bottom</h1>

<%
for(int i=0; i<vResult.size(); i++){
	ProductBean product = (ProductBean)vResult.get(i);
	String gender = product.getGender();
	String kind = product.getKind();
	if(gender.equals("women")) {
		if(kind.equals("bottom")) { %>
			<div id="list">
					<img src="data/<%=product.getImage()%>" height="600" width="400"><br>
					<b><a href="javascript:productDetail('<%=product.getNo()%>')"><%=product.getName()%></a></b><br>
					<%=product.getPrice()%>원<br>
					누적 주문 횟수 : <%=product.getView() %>회<br>
	
				<a href="javascript:productDetail('<%=product.getNo()%>')"> [ 상세보기 ] </a><br>
			</div>	
		<%}
	}
}
%>

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

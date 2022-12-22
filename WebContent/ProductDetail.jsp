<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, product.*"%>
<jsp:useBean id="proMgr" class="product.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Men</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/proDetail.css" />
<script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

       <div align="center">
 <%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>

	<table width="80%" >
		<tr> 
		<td align="center">
		<img src="data/<%=product.getImage()%>" height="750" width="500">
		</td>
		
		<td>
			<form name="cart" action="CartProc.jsp">
			<b><%=product.getName()%></b><br><br>
	

			￦<%=product.getPrice()%><br><br>


			수    량  </b><input type="text" name="quantity" size="5" value="1">개 <br> (	재고 : <%=product.getStock()%>)<br><br>


			누적판매량 </b><%=product.getView() %>회 <br><br>

			<input id="btn" type="submit" value="장바구니 담기"><br><br>

			<input type=hidden name=product_no value=<%=product.getNo()%>>			
			</form>
		
		<pre><%=product.getDetail()%></pre></td><br>
		</tr>
		<tr><td colspan="2" align="center">
			<img src="data/<%=product.getSub1()%>" height="480" width="320">
			<img src="data/<%=product.getSub2()%>" height="480" width="320">
			<img src="data/<%=product.getSub3()%>" height="480" width="320">
		
		</td></tr>
	</table>
	
       </div>

        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
        
		</form>
    </div>
</body>
</html>

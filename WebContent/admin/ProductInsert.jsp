<%@page import="product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>

<jsp:useBean id="proMgr" class="product.ProductMgr" />

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Admin Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/proInsert.css" />
    <script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

		<article id="side1"></article>

       <div id = "pro_insert" align="center">
			<table id="insert" width="75%" align="center">
	<tr> 
	<td align="center">

		<form method="post" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
		<table width="95%" align="center">
		<tr> 
		<td colspan="2" align="center"><h2>상품 등록</h2><br></td>
		</tr>
		<tr> 
		<td align="center">상품이름</td>
		<td align="left"><input type="text" name="name" size="20"></td>
		</tr>
		<tr> 
		<td align="center">상품가격</td>
		<td align="left"><input type="text" name="price" size="20">원</td>
		</tr>
		<tr> 
		<td align="center">상품설명</td>
		<td><textarea rows="15" cols="60" name="detail"></textarea></td>
		</tr>
		<tr> 
		<td align="center">상품수량</td>
		<td><input type="text" name="stock" size="20">개</td>
		</tr>
		<tr> 
		<td align="center">상품이미지</td>
		<td><input type="file" name="image"></td>
		</tr>
		<tr> 
		<td align="center">상세이미지1</td>
		<td><input type="file" name="sub1"></td>
		</tr>
		<tr> 
		<td align="center">상세이미지2</td>
		<td><input type="file" name="sub2"></td>
		</tr>
		<tr> 
		<td align="center">상품이미지3</td>
		<td><input type="file" name="sub3"></td>
		</tr>
		<tr> 
		<td align="center">카테고리</td>
		<td>
		<select name='gender'>
		  <option value='null' selected>-- 선택 --</option>
		  <option value='men'>남자</option>
		  <option value='women'>여자</option>
		  <option value='acc'>악세사리</option>
		</select>
		</td>
		</tr>
		<tr> 
		<td align="center">분류</td>
		<td>
		<select name='kind'>
		  <option value='null' selected>-- 선택 --</option>
		  <option value='top'>상의</option>
		  <option value='bottom'>하의</option>
		  <option value='etc'>기타</option>
		</select>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
		<input id="btn" type="submit" value="상품등록">&nbsp;&nbsp;&nbsp;
		<input id="btn" type="reset" value="다시쓰기">
		</td>
		</tr>
		</table>
		</form>
	
	</td>
	</tr>
	</table>
       </div>   
    
	<article id="side2"></article>
	
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
</body>
</html>

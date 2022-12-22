<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/top.css" />

  </head>
  <body>
      <section id="top">

         <nav id="top_menu">

         		<%
        // 현재 로그인된 아이디가 없다면
        if(session.getAttribute("sid") == null) {
            %>

           <ul>
             <li><a href="login.jsp">LOGIN</a></li>
             <li class="green"><a href="join.jsp">JOIN US</a></li>
             <li><a href="CartList.jsp">BASKET</a></li>
             <li><a href="mypage.jsp">MY PAGE</a></li>
           </ul>

         <%
        }
		// 관리자로 로그인 했다면
        else if(session.getAttribute("sid").equals("root")){
        	out.print("관리자님 환영합니다");
        	%>
        	<ul>
              <li><a href="logout.jsp">LOGOUT</a></li>
		      <li><a href="admin/adminIndex.jsp">ADMIN</a></li>
		      <li class="green"><a href="join.jsp">JOIN US</a></li>
              <li><a href="CartList.jsp">BASKET</a></li>
           </ul>

		<%
        }

        // 현재 로그인된 아이디가 있다면
        else {
            out.print(session.getAttribute("sid") + " 님 환영합니다");
          %>

         <ul>
            <li><a href="logout.jsp">LOGOUT</a></li>
            <li class="green"><a href="join.jsp">JOIN US</a></li>
            <li><a href="CartList.jsp">BASKET</a></li>
            <li>
            <div class="dropdown">
              <a href ="mypage.jsp" class="dropbtn">MY PAGE</a>
              <div class="dropdown-content">
              <a href="CartList.jsp">장바구니</a>
              <a href="OrderList.jsp">주문상품</a>
              <a href="PersonalInform.jsp">개인정보</a>
              <a href="logout.jsp">로그아웃</a>
              </div>
              </div>
            </li>
          </ul>
<%
        }
    %>
           </nav> <!— top_menu —>

         <div class="clear"></div>

      </section> <!— section top —>

       <nav id="main_menu">
         <ul>
           <li><a id="logo" href="index.jsp"><img src="img/logo.jpg" alt="로고" width="100%"></a></li>
           <li><a href="men.jsp">MEN</a></li>
           <li><a href="women.jsp">WOMEN</a></li>
           <li><a href="accessories.jsp">ACCESSORIES</a></li>
           <li><a href="sale.jsp">SALE</a></li>
           <li><a href="best.jsp">BEST</a></li>
         </ul>
       </nav>

  </body>
</html>
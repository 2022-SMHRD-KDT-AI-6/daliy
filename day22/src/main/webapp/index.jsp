<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <title>데일리영수증</title>
  <link rel="shortcut icon" href="img/favicon.ico">
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/commons.css">
  <link rel="stylesheet" href="css/notosanskr.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="css/swiper-bundle.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
	UserDTO dto = (UserDTO)session.getAttribute("user");
	
%>
  <header id="header">
    <div class="inner wrap">
      <div class="left"><h1 class="logo"><a href="./index.jsp"><img src="img/dailyLogo.png" alt="계좌이체 스크린" class="account-cover"></a></h1></div>
      <div class="right">
        <nav class="menu-wrap">
          <ul class="menu">
            <li><a href="./introduce.jsp">서비스소개</a></li>
            <!-- 차트는 로그인한사람만 네비바에 보여주기 -->
            
          </ul>
        </nav>
        
        <%if(dto==null){ %>
        <a href="./signin.jsp" class="document-submit">로그인/회원가입</a>
        <%} else{ %>
         <nav class="menu-wrap">
          <ul class="menu">
			<li><a href="http://localhost:8081/day22/MonthListService?">차트보기</a></li>
			<!-- <li><a href="./enroll.jsp">자산등록</a></li> -->
			<li><a href="logoutSer">로그아웃</a></li>
		  </ul>
        </nav>
		
		<%} %>
		
		
		
      </div>
    </div>
  </header>
  <main id="main">
    <section id="visual">
     
      <div class="inner">
        
        <span class="visual-bg"></span>
        <div class="box">
        
         <%if(dto!=null){ %>
           <h2 class="title">안녕하세요 
           <%=dto.getId()%>님</h2>
            <%} else {%>
          <h2 class="title">새로운 가계부<br>지금은 데일리영수증</h2>
          <%} %>
        
          
          <p class="text">한 사람, 한 사람을 위해 만들어<br>더 많은 사람들이 찾는 그런 영수증서비스가 되고싶어요</p>
          <button id="abutton" onclick="location.href='./introduce.jsp'">저희의 서비스 보러가기</button>
        </div>
      </div>
    </section>
    <section id="account">
      <div class="inner wrap">
        <div class="box"><img src="img/main-withdrawal.png" alt="계좌이체 스크린" class="account-cover"></div>
        <div class="box">
          <div class="info">
            <h2 class="title">수기입력보다<br>몇번조작한방으로</h2>
            <p class="text">간편하게 기록해보세요<br>몇 번의 조작으로 데이터를 보관할수있어요</p>
            
            <%if(dto!=null){%>
            <%	String id = dto.getId(); //이거  %>
            <a href="http://172.30.1.59:5000/upload?id=<%=id%>" class="btn bank-account">데일리 영수증<span class="material-icons arrow-right">chevron_right</span></a>
            <%} %>
          </div>
        </div>
      </div>
    </section>
    <span class="line"></span>
    <section id="deposit-savings">
      <div class="inner wrap">
        <div class="box">
          <div class="info">
            <h2 class="title">차트를<br>확인해보세요</h2>
            <p class="text">당신의 가계부데이터<br>차트로 관리하면 편리하고 합리적입니다.</p>
            <div class="btn-wrap">
            <%if(dto!=null) {%>
              <a href="http://localhost:8081/day22/MonthListService?" class="btn deposit">차트보러가기<span class="material-icons arrow-right">chevron_right</span></a>
             <%} %>
            </div>
            <img src="img/main-savings-moneys.png" alt="핵심 설명" class="deposit-savings-sub-cover">
          </div>
        </div>
        <div class="box"><img src="img/main-savings.png" alt="정기예금 스크린" class="deposit-savings-cover"></div>
      </div>
    </section>
    <span class="line"></span>
    <section id="loans">
      <div class="inner">
        <span class="loans-bg"></span>
        <div class="effect">
          <div class="moon-wrap">
            <span class="moon"></span>
            <span class="moon-eraser"></span>
          </div>
          <div class="star-wrap">
            <span class="star"></span>
            <span class="star"></span>
            <span class="star"></span>
            <span class="star"></span>
            <span class="star"></span>
            <span class="star"></span>
            <span class="star"></span>
          </div>
        </div>
        <div class="info">
          <h2 class="title">복잡한 가계부를 간편하게, 편리하게</h2>
          <p class="text">영수증을 업로드하면 차트로 보여드립니다.</p>
          <div class="btn-wrap">
          </div>
          <img src="img/main-loan.png" alt="대출 신청 스크린" class="loans-cover">
        </div>
      </div>
    </section>
    <section id="check-card">
      <div class="inner">
        <div class="info">
          <h2 class="title">영수증을 볼수있는<br>나만의 즐거움</h2>
          <p class="text">서비스를 이용해보세요</p>
          <%if(dto!=null) {%>
          <a href="http://localhost:8081/day22/Service?" class="btn friends-check-card">캘린더 보기<span class="material-icons arrow-right">chevron_right</span></a>
        	<%} %>
        </div>
        <div class="slider">
          <div class="swiper slide-vi">
            <ul class="swiper-wrapper slide-wrap">
              <li class="swiper-slide item"><img src="img/card/01.png" alt="영수증1"></li>
              <li class="swiper-slide item"><img src="img/card/02.png" alt="영수증2"></li>
              <li class="swiper-slide item"><img src="img/card/03.png" alt="영수증3"></li>
              <li class="swiper-slide item"><img src="img/card/04.png" alt="영수증4"></li>
              <li class="swiper-slide item"><img src="img/card/05.png" alt="영수증5"></li>
            </ul>
          </div>
          <button type="button" class="prev"><img src="img/img-left.png" alt="이전 버튼"></button>
          <button type="button" class="next"><img src="img/img-right.png" alt="다음 버튼"></button>
        </div>
      </div>
    </section>

  </main>
  <footer id="footer">
    <div class="inner">
      <ul class="top wrap">
        <li><a href="#">모바일뱅킹 서비스 이용약관</a></li>
        <li><a href="#">전자금융거래 기본약관</a></li>
        <li><a href="#">위치기반 서비스 이용약관</a></li>
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="#">전자민원접수</a></li>
        <li><a href="#">보호금융상품등록부</a></li>
        <li><a href="#">상품공시실</a></li>
        <li><a href="#">경영공시</a></li>
        <li><a href="#">공지사항</a></li>
      </ul>
      <div class="middle">
        <p class="call">대표전화 1599-3333<span>(해외 +82-2-6420-3333)</span></p>
        <p class="copyright">Copyright © KakaoBank Corp. All rights reserved.</p>
      </div>
      <div class="bottom wrap">
        <div class="left"><a href="#">웹 접근성 품질인증</a></div>
        <ul class="right">
          <li><a href="#" class="facebook"></a></li>
          <li><a href="#" class="instagram"></a></li>
          <li><a href="#" class="youtube"></a></li>
          <li><a href="#" class="brunch"></a></li>
          <li><a href="#" class="blog"></a></li>
        </ul>
      </div>
    </div>
  </footer>
  <script src="js/jquery-3.6.0.min.js"></script>
  <script src="js/swiper-bundle.min.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
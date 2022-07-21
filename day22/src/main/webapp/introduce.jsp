<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.ico">
    <title>데일리영수증</title>
    <meta name="author" content="데일리팀" />
    <meta name="description" content="영수증 내용 자동인식 서비스" />
    <meta name="keywords" content="영수증정리, 영수증이미지, 영수증자동서비스" />
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/upload.css" />
</head>
<body>
<%
	UserDTO dto = (UserDTO)session.getAttribute("user");
%>
    <nav>
        <div class="inner">
          <div class="nav-container">
            <h1 class="nav-title"><a href="index.jsp"><img src="img/dailyLogo.png" alt="계좌이체 스크린" class="account-cover"></a></h1>
            <% if(dto==null) {%>
            <div class="sign-container">
              <!-- 비회원 -->
              <div class="unsigned">
                <a href="./signin.jsp">로그인/회원가입</a>
              </div>
              <!-- 회원 -->
              <%}else{%>
              <div class="signed hidden">
                <div class="dropdown">
                  <div class="dropdown-button">
                    안녕하세요. <span class="nickname"></span>님.
                  </div>
                  <div class="dropdown-content">
                    <button id="sign-out" onclick="location.href='./logoutSer'">로그아웃</button>
                  </div>
                 <%} %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </nav>

    <section id="contents">
        <div class="wrapper">
            <div class="title">
                <img class="clock_img" src="img/move.png" alt="background">
                <div class="title_img">
                    <img src="img/headerImage.png" alt="영수증헤더이미지">
                </div>
            </div>
          
            
          
          
            <div class="result">
                <div class="buttons">
                    <div class="go">
                        <button class="modal_btn" hif>데일리란?</button>
                    </div>
                    <div class="share">
                        <button class="share_btn">공유하기</button>
                    </div>
                </div>
            </div>

            <div class="intro">
                <div class="intro_saying">"영수증을 업로드해서 텍스트를 보여주는 서비스"</div>
                <div class="explain">
                    <div class="quotes">
                        <img src="img/quotes.png" alt="따옴표">
                    </div>
                    <p>
                        <span>한번 버리는 영수증</span>도<br>누군가에게는<br>필요할수있다.
                    </p>
                </div>
            </div>

        </div>
    </section>
    <section id="modal">
        <div class="modal_wrap">
            <div class="cheer">
                <h1>안녕하세요?</h1>
                <h3>데일리팀입니다. 저희는 ocr을 활용한 영수증내용을<br> 자동으로 기록해주는 서비스를 만들고있습니다.</h3>
            </div>
            <div class="licat_img">
                <img src="img/licat.png" alt="라이캣 응원">
            </div>
            <div class="btn">
                <button class="close_btn">종료하고 영수증 업로드하러가기 GO!GO!</button>
                <p>이용해주셔서 감사합니다</p>
            </div>
        </div>
    </section>
    <section id="copyright">
        <div class="logo_img">
            <img src="img/dailyLogo.png" alt="weniv">
        </div>
        <p>
            ※ 본 서비스 내 이미지 및 콘텐츠의 저작권은 데일리팀에 있습니다.<br>
            수정 및 재배포, 무단 도용 시 법적인 문제가 발생할 수 있습니다.
        </p>
    </section>
    <script type="text/javascript" src="js/10000hours.js"></script>
</body>
</html>


    
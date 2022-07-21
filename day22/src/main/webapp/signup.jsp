<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>데일리영수증</title>
    <meta name="author" content="author" />
    <meta name="description" content="영수증 내용 자동인식 서비스" />
    <meta name="keywords" content="영수증정리, 영수증이미지, 영수증자동서비스" />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/sign.css" />
  </head>

  <body>
    <nav>
      <div class="inner">
        <div class="nav-container">
          <a href="./index.jsp"><img src="./img/dailyLogo.png" alt="데일리로고"></a>
          <!-- <h1 class="nav-title"><a href="./index.jsp">데일리영수증</a></h1> -->
          <button class="nav-contact">
            <a href="./signin.jsp">로그인/회원가입</a>
          </button>
        </div>
      </div>
    </nav>

<form name="join_form" action="joinSer" method="post">

    <main>
      <div class="inner">
        <div class="signin-container">
        <img src="./img/join1.png" alt="데일리로고">
          <div class="signin-form">
            <input type="text" placeholder="이메일" id="userID"  name ="userID"/>
            <input type="password" placeholder="비밀번호" id="password" name ="password"/>
            <input type="text" placeholder="이름" id="nickname" name ="nickname"/>
            <input type="submit" value="회원가입" id="signup" />
            <!-- signup-container -->
          </div>
          <!-- signin-form -->
        </div>
        <!-- signin-container -->
      </div>
    </main>
</form>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"
      integrity="sha512-bPh3uwgU5qEMipS/VOmRqynnMXGGSRv+72H/N260MQeXZIK4PG48401Bsby9Nq5P5fz7hy5UGNmC/W1Z51h2GQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
    <!-- <script src="./js/signup.js"></script> -->
  </body>
</html>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="img/favicon.ico">
  <title>데일리영수증</title>
  <meta name="author" content="데일리팀" />
  <meta name="description" content="영수증 내용 자동인식 서비스" />
  <meta name="keywords" content="영수증정리, 영수증이미지, 영수증자동서비스" />
  <link rel="stylesheet" href="./css/common.css" />
  <link rel="stylesheet" href="./css/upload.css" />
</head>
<body>
  <nav>
    <div class="inner">
      <div class="nav-container">
        <h1 class="nav-title"><a href="./index.jsp"><img src="img/dailyLogo.png" alt=""></a></h1>
        <div class="sign-container">
          <!-- 비회원 -->
          <div class="unsigned">
          <!-- <a href="./signin.html" class="document-submit">로그인/회원가입</a> -->
          </div>

          <!-- 회원 -->
          <div class="signed hidden">
            <div class="dropdown">
              <div class="dropdown-button">
                안녕하세요. <span class="nickname"></span>님.
              </div>
              <div class="dropdown-content">
                <button id="sign-out">로그아웃</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </nav>

  <main>
    <br><br><br><br>
    <section id="category">
      <div class="inner">
        <div class="category-container">
          <h2 class="category-title">영수증을 업로드해보세요😊</h2>
          <div class="category-list">
          </div>
        </div>
      </div>
      <br>
    </section>

    <div id="uploadContents" class="inner">
      <form id="all" action="post">

        <div class="container">

          <div class="box1">
            <span class="uploadText">결제방식</span>
        
         
            <br>
            <div class="select">
              <input type="radio" id="select" name="select" value="0"><label for="select">현금</label>
              <!-- 💳💵 -->
              <input type="radio" id="select2" name="select" value="1"><label for="select2">카드</label>
            </div>
          </div>
    <br> 

          <div class="box2 uploadText">
            
            영수증이미지업로드
            <!-- <input type="file" name="files1" accept="image/*" onchange="previewImage(this)" /> -->
            <!-- <br> -->
    <br> 
    <div class="dropbox">
      <label class="dropLabel" id="dropLabel" for="input">
        <div class="indiv" id="indiv">
          <img class="dropimg" src="img/move.png" alt="">
          
          </div>
      </label>
      <input id="input" class="input" accept="image/*" type="file" required="true" multiple="true" hidden="true" onchange="previewImage(this)">
      <p class="preview-title">미리보기</p>

      <div class="image-container">
        <div id="preview">
          <img style="width: 500px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
        </div>
      </div>
    </div>

            <!-- <div class="drag-area">
              <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>
              <header>이미지업로드</header>
              <span>OR</span>
              <button id="fileButton">파일가져오기</button>
                <img src="img/move.png" alt="업로드아이콘" style="height: 400px; width: 400px;">
              <input id="inputButton" type="file" hidden>
            </div> -->
          </div>
          <div class="box3">
            <br>
            <span class="uploadText">카테고리 선택</span>
            <br>
            <br>

            <div class="select">
              <input type="radio" id="select3" name="select2" value="2"><label for="select3">🍚</label>
              <input type="radio" id="select4" name="select2" value="3"><label for="select4">🍭</label>
              <input type="radio" id="select5" name="select2" value="4"><label for="select5">💉</label>
              <input type="radio" id="select6" name="select2" value="5"><label for="select6">🥃</label>
              <input type="radio" id="select7" name="select2" value="6"><label for="select7">💄</label>
              <input type="radio" id="select8" name="select2" value="7"><label for="select8">🚗</label>
              <input type="radio" id="select9" name="select2" value="8"><label for="select9">🚊</label>
              <input type="radio" id="select10" name="select2" value="9"><label for="select10">📡</label>
              <input type="radio" id="select11" name="select2" value="10"><label for="select11">🏌‍♀️</label>
              <input type="radio" id="select12" name="select2" value="11"><label for="select12">🧳</label>
              <input type="radio" id="select13" name="select2" value="12"><label for="select13">🏫</label>
              <input type="radio" id="select14" name="select2" value="13"><label for="select14">🎉</label>
              <input type="radio" id="select15" name="select2" value="14"><label for="select15">👟</label>
              <input type="radio" id="select16" name="select2" value="14"><label for="select16">👖</label>
            </div>
            <br>        
            <br>
          </div>
          <div class="box4">
            <span class="uploadText">내용입력</span>
            <br>
            <textarea class="noresize"></textarea>
          </div>
          <div class="box5">
            <!-- <div class="file">
              <span id="fileName" style="font-size: 20px">파일이름</span>
            </div> -->
            <div class="file">
              <h1 id="fileName">파일이름</h1>
           </div>
            <input id="abutton" type="button" value="업로드">
            <div class="upload">
            </div>
      </form>
    </div>
    </div>
  </main>
  <script src="./js/drag.js"></script>
  <script>
  
  </script>
</body>
</html>
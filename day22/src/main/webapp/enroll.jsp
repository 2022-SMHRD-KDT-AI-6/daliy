<%@page import="Model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="shortcut icon" href="img/favicon.ico">
	<title>데일리영수증</title>
	<meta name="author" content="데일리팀" />
	<meta name="description" content="영수증 내용 자동인식 서비스" />
	<meta name="keywords" content="영수증정리, 영수증이미지, 영수증자동서비스" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" href="./css/common.css" />
	<link rel="stylesheet" href="./css/upload.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<!--  -->
	<!-- <title>자산관리하기</title> -->
	<!-- <link rel="stylesheet" href="./css/common.css" />
<link rel="stylesheet" href="./css/upload.css" /> -->
	<!-- <link rel="stylesheet" href="css/commons.css"> -->
	<style>
		ul {
			width: 100%;
			float: left;
		}

		.id {
			flex-grow: 1;
			position: relative;
		}

		.session {
			position: absolute;
			right: 0;
		}

		a {
			text-decoration: none;
			color: #000000;
		}
	</style>
</head>
<body>
<%
	//	세션에서 사용자 정보 꺼내오기
	UserDTO dto = (UserDTO)session.getAttribute("user");
%>
	<nav>
		<div class="inner">
			<div class="nav-container">
				<h1 class="nav-title"><a href="./index.jsp"><img src="img/dailyLogo.png" alt=""></a></h1>
				<div class="sign-container">
					<!-- 비회원 -->
					<%if(dto==null){ %>
					<div class="unsigned">
						<a href="./signin.html" class="document-submit">로그인/회원가입</a>
					</div>
					<%} else{ %>
					<!-- 회원 -->
					<div class="signed hidden">
						<div class="dropdown">
							<div class="dropdown-button">
								안녕하세요. <span class="nickname"><%=dto.getId() %></span>님.
							</div>
							<div class="dropdown-content">
								<button id="sign-out">로그아웃</button>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>
		</div>
	</nav>
	<div class="containera">
		<br>
		<main>

			<div id="uploadContents" class="inner">
				<form id="all" method="post" action="EnrollController">
						<h1>📅자산관리 등록</h1><br>
						<br>
						<table class="table table-bordered ">
							<tr>
								<td class="table-info text-center  table-dark">
									<b>나의 자산입력하기</b>
								</td>
							</tr>
					<tr>
								<td><input type="number" name="cash" class="form-control" placeholder="보유현금"></td>
							</tr>
							<tr>
								<td><input type="number" name="cardlimit" class="form-control" placeholder="카드사용한도액">
								</td>
							</tr>
							<tr>
								<td><input type="number" name="goal" class="form-control" placeholder="지출목표금액"></td>
							</tr>
							<tr>	
								<td hidden=""><input type="text" name="id" class="form-control" value="<%=dto.getId()%>"></td>
							</tr>
						</table>
						<button type="submit" class="btn btn-warning float-right">입력</button>
				</form>
			</div>
		</main>
	</div>

</body>

</html>
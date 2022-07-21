<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cal.MyCalendar"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="jquery.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
<title>달력</title>

<!-- 스타일 적용시켜주기 -->
	<style type="text/css">
/* 폰트스타일 */
@font-face {
    font-family: 'KOTRAHOPE';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
html{
	font-family: 'KOTRAHOPE';
}
/* 헤더시작  */
ul {
    list-style: none;
}
a {
    text-decoration: none;
    outline: none;
}
.page {
    width: 1440px;
    margin: 0 auto;
}

header {
    width: 100;
    height: 80px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

header > h2 {
	margin-left:20px;
}

header > nav {
	width:600px;
	height:100%;
}

header ul {
	width:100%;
	height: 100%;
	display: flex;
	justify-content: space-between;
}

header ul > li {
	font-size:20px;
	height: 100%;
	display: flex;
	align-items: center;
}


/*헤더 끝  */
		/* 기본스타일  */
		table {
			background-color: #ffffff;
			width: 700;
			margin-left: auto;
 			margin-right: auto;
			border-color: black;
			border-style: solid;
			border-width: 10px;
			border-radius: 15px;
			border-spacing: 0px;
  			padding: 0px;
		}
		th, td,th {
 		 border: 1px solid #000000;
		  border-spacing: 0px;
		
		  font-family: 'KOTRAHOPE';

		border-spacing: 0px;
    
    	padding: 0px;
		}

		tr {
			height: 60px;
			border-spacing: 0px;
			padding: 0px;
			margin: 0px;
		}
		th {
			padding: 0px;
			margin: 0px;
		}

		td {
			width: 100px;
			text-align: right;
			font-size: 20pt;
			font-family: 'BMJUA';
		}

		/* 타이틀 스타일 */
		th#title {
			font-size: 20pt;
			font-weight: bold;
			color: #FFBF00;
			
			
		}
		td.sunday, td.saturday, td.etcday{
			background-color: #FFBF00;
		}

		/* 요일 스타일 */
		td.sunday {
			text-align: center;
			font-weight: bold;
			color: red;

		}

		td.saturday {
			text-align: center;
			font-weight: bold;
			color: blue;

			
		}

		td.etcday {
			text-align: center;
			font-weight: bold;
			color: black;
		
		}

		/* 날짜 스타일 */
		td.sun {
			text-align: right;
			font-size: 15pt;
			color: red;
			vertical-align: top;
		}

		td.sat {
			text-align: right;
			font-size: 15pt;
			color: blue;
		
			vertical-align: top;
		}

		td.etc {
			text-align: right;
			font-size: 15pt;
			color: black;
			vertical-align: top;
		}

		td.redbefore {
			text-align: right;
			font-size: 12pt;
			color: red;
			vertical-align: top;
		}
		td.before {
			text-align: right;
			font-size: 12pt;
			color: gray;
		
			vertical-align: top;
		}
		input.btn {
			background-color: #fdd354;
			width: 100%;
			height: 70px;
			font-family: 'KOTRAHOPE';
			font-size: 50px;
		}
		input.btn:hover {
			background-color: #ffa0a0;
			width: 100%;
			height: 70px;
		}
		
	</style>
</head>
<body>
<div class="page">
		<header>
			<a href="./index.jsp"><img src="./img/dailyLogo.png" alt="데일리로고"></a>
			<nav>
				<ul>
					<li><a href="#"></a></li>
				</ul>
			</nav>
		</header>
	</div>
<h1 style="text-align: center">데일리 영수증 달력</h1>
<%

//금액 변환
	DecimalFormat formatter = new DecimalFormat("###,###");


// 컴퓨터 시스템의 년, 월 받아오기
	Date date = new Date();
	int year = date.getYear() +1900;
	int month = date.getMonth() +1;

	//	오류사항 걸러주기	
	try{
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		
		if(month>=13){
			year++;
			month =1;
		}else if(month <=0){
			year--;
			month =12;
		}
	}catch(Exception e){
		
	}

%>



<!-- 달력 만들기 -->
<table>
	<tr>
<!-- 이전달 버튼 만들기 -->
		<th>
		<%-- <a href ="?year=<%=year%>&month=<%month-1%>">이전 달</a> --%>
		<input class="btn" type="button" value="이전 달" onclick="location.href='?year=<%=year%>&month=<%=month-1%>'">
		</th>
		
<!-- 제목 만들기 -->
		<th id = "title" colspan = "5">
		<%=year%>년  <%=month%>월
		</th>
		
<!-- 다음달 버튼 만들기 -->
		<th>
		<%-- <a href ="?year=<%=year%>&month=<%month+1%>">다음 달</a> --%>
		<input class="btn" type="button" value="다음 달" onclick="location.href='?year=<%=year%>&month=<%=month+1%>'">
		
		</th>
	</tr>
<!-- 요일 표시칸 만들어주기(단, 토,일요일은 색을 다르게 하기위해 구분해주기) -->
	<tr>
		<td class = "sunday">일</td>
		<td class = "etcday">월</td>
		<td class = "etcday">화</td>
		<td class = "etcday">수</td>
		<td class = "etcday">목</td>
		<td class = "etcday">금</td>
		<td class = "saturday">토</td>
	</tr>
	
	
	
	
	
<!-- 날짜 집어 넣기 -->
	<tr>
	<%
//	1일의 요일을 계산한다(자주 쓰이기 때문에 변수로 선언해두기)
		int first = MyCalendar.weekDay(year, month, 1);
	
//	1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산한다.
		int start = 0 ;
		start = month ==1? MyCalendar.lastDay(year-1, 12)- first : MyCalendar.lastDay(year, month-1)- first;

//	1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
		for(int i= 1; i<= first; i++){
			if(i==1){
/* 일요일(빨간색)과 다른날들의 색을 구별주기  */
				out.println("<td class = 'redbefore'>"+(month ==1? 12 : month-1)+"/"+ ++start +"</td>");
			}else{
				out.println("<td class = 'before'>"+(month ==1? 12 : month-1)+"/"+ ++start +"</td>");
				
			}
		}



/* 1일부터 달력을 출력한 달의 마지막 날짜까지 반복하며 날짜를 출력 */
		
		ArrayList<DTO> list = (ArrayList<DTO>)request.getAttribute("list"); 
	
		int [] days = new int[list.size()];
		//int [] months = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 , 12};
		
		System.out.println("Calendar in");
		
		//int [] months = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
		
		// 월별로 데이터 뽑기
		ArrayList<DTO> Data = new ArrayList<DTO>();
		
		for(int k = 0; k < list.size(); k++){
			if(month == Integer.parseInt(list.get(k).getDay().substring(5, 7))){
				for(int i = 0; i < list.size(); i++){
					Data.add(list.get(i));
				}
				System.out.println(Data.get(k).getDay());
				System.out.println(Data.get(k).getSum());
				
			}
		}
				System.out.println(Data.size());
		
		
		for(int i = 1; i <= MyCalendar.lastDay(year, month); i++){
		
			
			switch(MyCalendar.weekDay(year, month, i)){
					//일
				case 0 :
					out.println("<td class ='sun'>" + i);
		
					
					for(int j = 0; j < list.size(); j++){
						days[j] = Integer.parseInt(Data.get(j).getDay().substring(8, 10));
						
						if(i == days[j] && month == Integer.parseInt(list.get(j).getDay().substring(5, 7))){
								out.print("<br>지출<br>"+formatter.format(Data.get(j).getSum()) + "원");
								
						}
					}
					
					out.println("</td>");
					break;
					//토
				case 6 : 
					out.println("<td class ='sat'>" + i);
				
						for(int j = 0; j < list.size(); j++){
							days[j] = Integer.parseInt(Data.get(j).getDay().substring(8, 10));
							
							if(i == days[j] && month == Integer.parseInt(list.get(j).getDay().substring(5, 7))){
									out.print("<br>지출<br>"+formatter.format(Data.get(j).getSum()) + "원");
							}
						}
					out.println("</td>");
					break;
					
					//월~금
				default :
					out.println("<td class ='etc'>" + i);
					
						for(int j = 0; j < list.size(); j++){
							days[j] = Integer.parseInt(Data.get(j).getDay().substring(8, 10));
							
							if(i == days[j] && month == Integer.parseInt(list.get(j).getDay().substring(5, 7))){
									out.print("<br>지출<br>"+formatter.format(Data.get(j).getSum()) + "원");
							}
						}
					out.println("</td>");
					break;
			} // switch 끝
					
/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
			if(MyCalendar.weekDay(year, month, i) == 6 && i != MyCalendar.lastDay(year, month)){
				out.println("</tr><tr>");			
			}
		} // for문 끝
		
		if(MyCalendar.weekDay(year, month, MyCalendar.lastDay(year, month)) !=6){
			for(int i = MyCalendar.weekDay(year, month, MyCalendar.lastDay(year, month))+1; i < 7; i++){
				out.println("<td></td>");	
			}
		}

	%>
	</tr>
	
</table>
</body>
</html>
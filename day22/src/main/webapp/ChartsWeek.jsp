<%@page import="Model.t_expenseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="echarts.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<style type="text/css">

@font-face {
  font-family: 'KOTRAHOPE';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
}

html {
  font-family: "KOTRAHOPE";
}
.chartBtn {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  color: #ffffff;
  background-color: #e47b52; 
  border-radius: 30px;
  padding: 10px 40px;
  border-style: solid;
  border-color: #FFFFFF;
  cursor: pointer;
  width: 300px;
  font-weight: 900;
  margin: 3px;
}

.btnGroup{
	display: flex;
	justify-content: center
}

#main{
	display: flex;
	justify-content: center
	
}
</style>
</head>
<body>
<div class="page">
		<header>
			<a href="./index.jsp"><img src="./img/dailyLogo.png" alt="데일리로고"></a>
		</header>
	</div>
<h1 style="text-align: center">데일리 주 차트</h1>

<div id="main" style="width: 100%; height:700px;"></div>

	 <!-- 다른 차트로 가는 버튼 -->
	 <div class="btnGroup">
	 	<input id='go day' class='chartBtn'
	 	type='button'
	 	onclick=window.location.href='http://localhost:8081/day22/DayListService?'
	 	value='오늘 차트 보기'/>
	 	<input id='go month'
	 	type='button' class='chartBtn'
	 	onclick=window.location.href='http://localhost:8081/day22/MonthListService?'
	 	value='월별 차트 보기'/>
	 	<input id='go main'
	 	type='button' class='chartBtn'
	 	onclick=window.location.href='http://localhost:8081/day22/index.jsp'
	 	value='메인으로 가기'/>
	 </div>
	 
	<script type="text/javascript">
	// 우리 html문서가 준비가 다 되면 실행
	$(document).ready( function(){
		 
		 loadData();
		 
	 } );
	
	// chart에 필요한 main div가져오기
	 var chartDom = document.getElementById('main');
	 var myChart = echarts.init(chartDom);
	 var option;
	 // 오늘날짜 가져오기
	 var today = new Date();
	 today = new Date();
	 
	 // 날짜를 oracle과 같은 데이터 포맷으로 바꾸는 함수
	 function dateFormat(today){
		 var year = today.getFullYear()
		 var month = today.getMonth()+1
		 var day = today.getDate()
		 // 삼항연산자를 이용해서 만약 10보다 작은 날짜라면 0추가
		 var date = year + "-" + (month>9?month+"":"0"+month) + "-" + (day>9?day+"":"0"+day)
		 
		 return date
	 }
	 
     // 날짜리스트 만들기
	 dates = [];
     
     
     for(let i = 6 ; i >= 0; i-- ){
    	 today = new Date();
    	 var last = new Date(today.setDate(today.getDate() - i))
    	 dates.push(dateFormat(last));
     }
     
     
	 // 14개 카테고리 리스트
	 // ex) 의류, 주거/통신, 교통, 의료/건강, 화장품, 카페
	 datasets = {//
		 '의류' : ['의류',0, 0, 0, 0, 0, 0, 0],
		 "주거/통신" : ["주거/통신", 0, 0, 0, 0, 0, 0, 0],
		 "교통" : ["교통", 0, 0, 0, 0, 0, 0, 0],
		 "의료/건강" : ["의료/건강", 0, 0, 0, 0, 0, 0, 0],
		 "화장품" : ["화장품", 0, 0, 0, 0, 0, 0, 0],
		 "카페" : ["카페", 0, 0, 0, 0, 0, 0, 0],
		 "식사"  : ["식사", 0, 0, 0, 0, 0, 0, 0],
		 "술/유흥"  : ["술/유흥", 0, 0, 0, 0, 0, 0, 0],
		 "자동차"  : ["자동차", 0, 0, 0, 0, 0, 0, 0],
		 "교육"  : ["교육", 0, 0, 0, 0, 0, 0, 0],
		 "문화/여가"  : ["문화/여가", 0, 0, 0, 0, 0, 0, 0],
		 "운동"  : ["운동", 0, 0, 0, 0, 0, 0, 0],
		 "여행/숙박"  : ["여행/숙박", 0, 0, 0, 0, 0, 0, 0],
		 "경조사"  : ["경조사", 0, 0, 0, 0, 0, 0, 0]
		 
	 }
	 // datasets의 키값들만 모아서 배열 만들기
	 dataKeys = Object.keys(datasets);
	 
	 
	 // datasets에 가져온 데이터 삽입
	 function makeData(res){
		 for (var i = 0; i < dates.length; i++) {
				for (var j = 0; j < res.length; j++) {
					if(res[j].day == dates[i]){
						// 날짜 같은게 있었던경우
						for (var k = 0; k < dataKeys.length; k++) {
							// 같은 이름의 요소 배열에 값 변경
							if(res[j].cate == dataKeys[k]){
								datasets[dataKeys[k]][i+1] = res[j].sum
							}
							
							//datasets["교통"].splice(3, 3, 55)
						}
						// ---
						
						
					}
					//-----
					
				}
				//-------
		}
		 console.log(datasets)
	 }
	 
	 // DB에서 데이터를 꺼내오는 ajax 요청
	 function loadData(){
		 
		 $.ajax({
			 url : 'WeekListService', // 어디로 요청
			 type : 'get', // get? post?
			 data : {
				 // "key" : value,
			 },
			 dataType : 'json', // json을 받아올때는 써줄것
			 success : function(res){
				 // 요청이 성공하면 무슨일을 할건지
				 // res -> 응답받은 내용이 res에 담김
				 console.log(res);
				
				 makeData(res);
				 
				 dates.unshift("cate")
				 drawChart();
			 },
			 error : function(e){
				 // 요청이 실패하면 무슨일을 할건지
				 console.log(e);
			 }
			 
		 });
		 
	 }
	 
	 
       
    
     // 차트 그리기
	 function drawChart(){
		 console.log("start DrawChart")
		
		 // 준비된 data들에 맞춰서 source 준비
		 mysource = [];
		 mysource.push(dates)
		 for(let m = 0; m < dataKeys.length; m++){
			 mysource.push(datasets[dataKeys[m]])
		 } 
		 
		 // 준비된 data들에 맞춰서 선 준비
		 var myseries = []
		 for (let n = 0; n < dataKeys.length; n++){
			 myseries.push({
		         type: 'line',
		         smooth: true,
		         seriesLayoutBy: 'row',
		         emphasis: { focus: 'series' }
		       })
		 }
		 myseries.push({
	         type: 'pie',
	         id: 'pie',
	         radius: '30%',
	         center: ['50%', '25%'],
	         emphasis: {
	           focus: 'self'
	         },
	         label: {
	           formatter: '{b}: {@2012} ({d}%)'
	         },
	         encode: {
	           itemName: 'cate',
	           value: '2012',
	           tooltip: '2012'
	         }
	       })
	       console.log(myseries)
		 
		 setTimeout(function () {
			   option = {
			     legend: {},
			     tooltip: {
			       trigger: 'axis',
			       showContent: false
			     },
			     dataset: {
			       source: mysource
			     },
			     xAxis: { type: 'category' },
			     yAxis: { gridIndex: 0 },
			     grid: { top: '55%' },
			     series: myseries
			   };
			   myChart.on('updateAxisPointer', function (event) {
			     const xAxisInfo = event.axesInfo[0];
			     if (xAxisInfo) {
			       const dimension = xAxisInfo.value + 1;
			       myChart.setOption({
			         series: {
			           id: 'pie',
			           label: {
			             formatter: '{b}: {@[' + dimension + ']} ({d}%)'
			           },
			           encode: {
			             value: dimension,
			             tooltip: dimension
			           }
			         }
			       });
			     }
			   });
			   myChart.setOption(option);
			 });

			 option && myChart.setOption(option);
	 }

	 
	 
	 </script>
	 
	 

	 
	 
	 
    
</body>
</html>
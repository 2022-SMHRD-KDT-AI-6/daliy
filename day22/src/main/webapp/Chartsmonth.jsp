<%@page import="Model.t_expenseDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="echarts.js"></script>
	<!--flex는 두 개의 버튼을 한 줄로 보여줄 수 있는 방법 -->
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

#charts{
	display: flex;
	justify-content: center
}
</style>
</head>
<body>
<%
System.out.print("Chartsmonth in");


int sum1 = (int)request.getAttribute("sum1");
int sum2 = (int)request.getAttribute("sum2");
int sum3 = (int)request.getAttribute("sum3");
int sum4 = (int)request.getAttribute("sum4");
int sum5 = (int)request.getAttribute("sum5");
int sum6 = (int)request.getAttribute("sum6");
int sum7 = (int)request.getAttribute("sum7");
int sum8 = (int)request.getAttribute("sum8");
int sum9 = (int)request.getAttribute("sum9");
int sum10 = (int)request.getAttribute("sum10");
int sum11 = (int)request.getAttribute("sum11");
int sum12 = (int)request.getAttribute("sum12");

%>
<div class="page">
		<header>
			<a href="./index.jsp"><img src="./img/dailyLogo.png" alt="데일리로고"></a>
		</header>
	</div>
<h1 style="text-align: center">데일리 월 차트</h1>

<div id="charts" style="width:100%; height:700px;"></div>

    <!-- 다른 차트로 가는 버튼 -->
    <div class="btnGroup">
        <input id='go day'
	 	type='button' class='chartBtn'
	 	onclick=window.location.href='http://localhost:8081/day22/DayListService?'
	 	value='오늘 차트 보기'/>
	 	<input id='go week'
    	type='button' class='chartBtn'
    	onclick=window.location.href='http://localhost:8081/day22/ChartsWeek.jsp?'
    	value='지난 7일간 차트 보기'/>
    	<input id='go main'
	 	type='button' class='chartBtn'
	 	onclick=window.location.href='http://localhost:8081/day22/index.jsp'
	 	value='메인으로 가기'/>
    </div>
    
 <script>
        var chartDom = document.getElementById('charts');
        var myChart = echarts.init(chartDom);
        var option;
        // DB에서 가격 정보 받아올 곳

        option = {
        /*legend: {
            top: 'bottom'
        },*/
        toolbox: {
            show: true,
            feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            restore: { show: true },
            saveAsImage: { show: true }
            }
        },
        series: [
            {
            name: 'Nightingale Chart',
            type: 'pie',
            radius: [50, 250],
            center: ['50%', '50%'],
            roseType: 'area',
            itemStyle: {
                borderRadius: 8
            },
           
            data: [
                { value: <%=sum1%>, name: 'Jan' },
                { value: <%=sum2%>, name: 'Feb' },
                { value: <%=sum3%>, name: 'Mar' },
                { value: <%=sum4%>, name: 'Apr' },
                { value: <%=sum5%>, name: 'May' },
                { value: <%=sum6%>, name: 'Jun' },
                { value: <%=sum7%>, name: 'Jul' },
                { value: <%=sum8%>, name: 'Aug' },
                { value: <%=sum9%>, name: 'Sep' },
                { value: <%=sum10%>, name: 'Oct' },
                { value: <%=sum11%>, name: 'Nov' },
                { value: <%=sum12%>, name: 'Dec' }
            ]
            }
        ]
        };

        option && myChart.setOption(option);
    </script>
</body>
</html>
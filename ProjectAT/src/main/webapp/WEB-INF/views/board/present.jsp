<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
<script type="text/javascript">

	$(function(){
		graph(60,7,120); // 출석일수, 결석일수, 총일수
	})
	
	function graph(g1,g2,g3){
		var arry =  [(parseInt(g1/g3*10000))/100, (parseInt(g2/g3*10000))/100, (parseInt((g3-(g1+g2))/g3*10000))/100];
		//parseInt
		
		var width = $("#graph").width(); // 전체 가로값 (즉, 100%의 길이)
		//var size = $(".graph").size(); // 막대 그래프 갯수
		
		$(".graph").each(function(i){
			var ttt = parseInt(width * (arry[i]/100));
			var lineheight = $(this).height();
			$(this).animate({"width": ttt+"px"},1500);
			//$(this).css("width",ttt);
			$(this).find("em").text(arry[i]+"%").css("line-height", lineheight + "px"); 
		})
	}
	
</script>
<style>
	#graph {width: 700px;height:100px;}

	#graph > p {position:relative;display:inline-block;float:left;font-weight:bold;color:#fff;font-size:13px;text-align: center}
	#graph > p strong {position:absolute;bottom:-20px;display:block;width:100%;text-align:center;color:#777;}
	#graph > p em {vertical-align:middle;font-size:20px;}
	#graph > p:nth-child(1) {height:30px;background:#337AB7;}
	#graph > p:nth-child(2) {height:30px;background:#FB5175;}
	#graph > p:nth-child(3) {height:30px;background:#dddddd;}
	
	.calendar {width: 500px}
	
</style>
<h1>출결현황</h1>
<div>
	<table>
		<tr>
			<th id="training_organ">훈련 기관명</th><td headers="training_organ">한국디지털기업협회</td>
			<th id="training_term">훈련 기간</th><td headers="training_term">160105~160704</td>
		</tr>
		<tr>
			<th id="training_title">훈련 과정명</th><td headers="training_title">전자정부표준프레임워크기반 자바개발자과정</td>
			<th id="attendance_term">출석 기간</th><td headers="attendance_term">160105~160704</td>
		</tr>
	</table>
</div>	
<div id="graph">
	<p class="graph01 graph"><em></em><strong>출석</strong></p>
	<p class="graph02 graph"><em></em><strong>결석</strong></p>
	<p class="graph03 graph"><em></em><strong></strong></p>
</div>

<!--달력  -->

<div ng-app="myApp" ng-controller="MyCtrl" class="calendar">
    <div rm-datepicker ng-model="oDate1" rm-config="rmConfig1"></div>
    <div>Selected date: {{oDate1 | date: 'yyyy-MM-dd'}}</div>
    <hr>
    <input rm-datepicker type="text" ng-model="oDate2" rm-config="rmConfig2">
    <br>

</div>


<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<!--<script src="http://fian.my.id/Waves/static/waves.min.js?v=0.7.4"></script>-->
<script src='<c:url value="/resources/calendar/rm-datepicker.js"/>'></script>
<!--<script src="dist/rm-datepicker.min.js"></script>-->
<script>

    var app = angular.module("myApp", ["rmDatepicker"]);

    /* Datepicker global configuration */
    app.config(["rmDatepickerConfig", function (rmDatepickerConfig) {
        rmDatepickerConfig.mondayStart = true;
        rmDatepickerConfig.initState = "month";
    }]);

</script>
<script>

    (function () {

        var app = angular.module("myApp");

        var MyCtrl = function ($scope) {

            /* Datepicker local configuration */
            $scope.rmConfig1 = {
                mondayStart: false,
                initState: "month", /* decade || year || month */
                maxState: null,
                minState: "month",
                decadeSize: 12,
                monthSize: 42, /* "auto" || fixed nr. (35 or 42) */
                min: new Date('2000-11-21'),
                max: new Date('2023-11-21'),
                format: "yyyy-MM-dd" /* https://docs.angularjs.org/api/ng/filter/date */
            };

            $scope.rmConfig2 = { format: "d MMM yyyy" };

            $scope.oDate1 = new Date('2015-12-12');
            $scope.oDate2 = new Date();
        };
        app.controller("MyCtrl", ['$scope', MyCtrl]);

    }());

    // Init waves (OPTIONAL) :)
    // window.onload = Waves.init();

</script>
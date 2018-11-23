<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>

<div class="container" style="height:600px;">
	<div class="row">
		<div class="col-md-3">
			<canvas id="joinCountChart" class="mt-2" width="5" height="5"></canvas>
			<p id="joinCountDetail" class="text-center" style="font-size:12px; font-weight:bold;"></p>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	getJoinCount();
})

getJoinCount = function(){
	var param = {};
	$.ajax({
		type: "POST",
		url: '/common/getJoinCountList',
		data: JSON.stringify(param),
		contentType: 'application/json',
		success: function(res) {
			$("#joinCountDetail").append("TOTAL : <span class='badge badge-secondary'>" + res.joinCountTotalSum +
					"</span><br/> TODAY : <span class='badge badge-secondary'>" + res.joinCountOfToday + "</span>")
			var joinCountList = res.joinCountWeekList;
			var joinCountArray = new Array();
			var joinDateArray = new Array();
			for (var i in joinCountList) {
				joinDateArray.push(joinCountList[i].joinDate.substr(6,8));
				joinCountArray.push(joinCountList[i].joinCount);
			}	
			setChart(joinDateArray, joinCountArray);
		}
  	});
}

setChart = function(joinDateArray, joinCountArray){
	var ctx = document.getElementById("joinCountChart");
	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	    	label: '일자',
	        labels: joinDateArray,
	        datasets: [{
	            data: joinCountArray,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            fill: 'start',
            	pointStyle: 'rectRot',
				pointRadius: 5,
				pointBorderColor: 'rgb(0, 0, 0)'
	        }]
	    },
	    options: {
	    	bezierCurve: false,
	    	legend: {
	            display: false,
	        },
			elements: {
				line: {
					tension: 0.000001
				}
			},
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        },
			title: {
				display: true,
				text: '방문자 통계'
			}
	    }
	});
}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<style>

</style>

<div class="rightArea" id="rightArea" style="height:100%; background-color:#f3f3f3;">
	<p id="joinCountListArea" class="mt-2 text-right"></p>
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
			var joinCountList = res;
			for (var i in joinCountList) {
				$("#joinCountListArea").append("<b>"+joinCountList[i].joinDate + " : " +joinCountList[i].joinCount +"명 </b><br/>");
			}		
		}
  	});
}
</script>

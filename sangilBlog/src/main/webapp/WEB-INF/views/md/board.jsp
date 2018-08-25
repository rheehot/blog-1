<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src="/lib/dataTables/js/jquery.dataTables.min.js"></script>
<script src="/lib/dataTables/js/dataTables.bootstrap4.min.js"></script>
<script src="/lib/Buttons-1.5.2/js/dataTables.buttons.min.js"></script>
<script src="/lib/Buttons-1.5.2/js/buttons.bootstrap4.min.js"></script>
<script src="/lib/Select-1.2.6/js/dataTables.select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<link rel="stylesheet" href="/lib/dataTables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/lib/Buttons-1.5.2/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="/lib/Select-1.2.6/css/select.bootstrap4.min.css">
 
<div class="mt-3">
	<table id="board" class="table table-striped table-bordered table-sm" style="width:100%">
		<thead style="font-size:12px;">
		    <tr>
		        <th>번호</th>
		        <th>대카테고리</th>
		        <th>중카테고리</th>
		        <th>제목</th>
		        <th>작성일</th>
		        <th>작성자</th>
		    </tr>
		</thead>
	</table>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var param = {};
	
	$('#board').DataTable( {
		"processing": true,
		"serverSide": true,
		"paging" : true,
		"pagingType" : "full_numbers",
		"search" : false,
		"ordering" : false,
		"ajax": {
			"url":"/common/getAdminArticleList",
			"type":"POST",
			"data": param,
		},
		"columns": [
		    { "data": "boardId", "width": "5%" },
		    { "data": "largeCategoryName", "width": "10%" },
		    { "data": "middleCategoryName", "width": "10%" },
		    { "data": "title" },
		    { "data": "registerDate", "width": "10%", "type":"datetime" },
		    { "data": "registerId", "width": "10%" },
		],
		 "columnDefs":[{targets:4, render:function(data){
		      return moment(data).format('YYYY/MM/DD');
	    }}],
		select: true
	});
})
</script>
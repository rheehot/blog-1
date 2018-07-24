<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- <script src="/dataTables/js/dataTables.bootstrap4.min.js"></script>
<script src="/dataTables/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="/dataTables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/dataTables/css/jquery.dataTables.min.css"> -->


<script src="/lib/dataTables/js/jquery.dataTables.min.js"></script>
<script src="/lib/dataTables/js/dataTables.bootstrap4.min.js"></script>
<script src="/lib/Buttons-1.5.2/js/dataTables.buttons.min.js"></script>
<script src="/lib/Buttons-1.5.2/js/buttons.bootstrap4.min.js"></script>
<script src="/lib/Select-1.2.6/js/dataTables.select.min.js"></script>

<link rel="stylesheet" href="/lib/dataTables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/lib/Buttons-1.5.2/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="/lib/Select-1.2.6/css/select.bootstrap4.min.css">

<div class="card mt-2">
    <div class="card-body">
    	<h4>카테고리관리</h4>
    </div>
</div>

<div class="row d-plex mt-3">
	<div class="col">
		<table id="upCategoryTable" class="table table-striped table-bordered mt-0">
		<thead>
			<tr>
                <th>number</th>
                <th>name</th>
            </tr>
        </thead>
        <tbody></tbody>
		</table>
	</div>
	<div class="col">
		<table id="middleCategoryTable" class="table table-striped table-bordered" style="width:100%">
		<thead>
			<tr>
                <th>number</th>
                <th>name</th>
            </tr>
        <thead>
        <tbody></tbody>
		</table>
	</div>
</div> 

<script type="text/javascript">
$(document).ready(function(){
	getUpCategoryList();
	//getMiddleCategoryList(0);
});

getUpCategoryList = function(){
	var param = {};
	param.parentId = 0;
	
	var table = $('#upCategoryTable').DataTable( {
		"processing": true,
		"paging": false,
		"searching": true,
		"serverside": true,
		"ajax": {
			"url":"/common/getCategoryList",
			"type":"POST",
			"data": param
		},
		"columns": [
		    { "data": "categoryId" },
		    { "data": "categoryName" }
		],
		select: true
	} );
	
	table
	 .on( 'select', function ( e, dt, type, indexes ) {
	     var rowData = table.rows( indexes ).data().toArray();
	     getMiddleCategoryList(rowData[0].categoryId);
	 } );
}

/*
 * 원하는 부모id 리스트를 가져온다. 0->root
 */
getMiddleCategoryList = function(parentId){
	$('#middleCategoryTable').DataTable().destroy(); 
	 
	var param = {};
	param.parentId = parentId;
	
	middleCategoryTable = $('#middleCategoryTable').DataTable( {
		"processing": true,
		"paging": false,
		"retrieve": false,
		"searching": true,
		"serverside": true,
		"ajax": {
			"url":"/common/getCategoryList",
			"type":"POST",
			"data": param
		},
		"columns": [
		    { "data": "categoryId" },
		    { "data": "categoryName" }
		],
		select: true
	} );
}

 
 

 
/* $('#upCategoryTable tbody').on( 'click', 'tr', function () {
	var rowData = $('#upCategoryTable').DataTable().rows('.selected').data(); 
	alert("id::"+rowData[0].categoryId +"name::" + rowData[0].categoryName);
} );
 */
</script>
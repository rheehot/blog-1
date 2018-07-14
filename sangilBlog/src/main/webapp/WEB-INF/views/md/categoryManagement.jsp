<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- <script src="/dataTables/js/dataTables.bootstrap4.min.js"></script>
<script src="/dataTables/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="/dataTables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/dataTables/css/jquery.dataTables.min.css"> -->


<script src="/dataTables/js/jquery.dataTables.min.js"></script>
<script src="/dataTables/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="/dataTables/css/dataTables.bootstrap4.min.css">

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
		</table>
	</div>
	<div class="col">
		<table id="middleCategoryTable" class="table table-striped table-bordered" style="width:100%">
			<tr>
                <th>number</th>
                <th>name</th>
            </tr>
		</table>
	</div>
	<div class="col">
		<table id="bottomCategoryTable" class="table table-striped table-bordered" style="width:100%">
			<tr>
                <th>number</th>
                <th>name</th>
            </tr>
		</table>
	</div>
</div> 

<script type="text/javascript">
$(document).ready(function(){
	getCategoryList();
	  $('#upCategoryTable').DataTable( {
	        "processing": true,
	        "paging": false,
	        "searching": false,
	        "ajax": {
	        	"url":"/md/getCategoryList",
	        	"type":"POST",
	        	"data": function(d){
	        	}
	        },
	        "columns": [
	            { "data": "categoryId" },
	            { "data": "categoryName" }
	        ],
	        select: true
	  } );
	  
	  /*
	  $('#upCategoryTable tbody').on( 'click', 'tr', function () {
		  alert("123");
	        if ( $(this).hasClass('selected') ) {
	            $(this).removeClass('selected');
	        }
	        else {
	            $('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	        }
	    } )*/
	 //$('#upCategoryTable').DataTable();
	 //$('#middleCategoryTable').DataTable();
	 //$('#bottomCategoryTable').DataTable();
});



getCategoryList = function(){
	var param = {};
	$.ajax({
		type: "POST",
		url: '/md/getCategoryList',
		data: JSON.stringify(param),
		contentType: 'application/json',
		success: function(res) {
		}
  	});
}

</script>
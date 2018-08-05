<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<form method="post" id="frm" name="frm">
	<div class="row d-flex justify-content-center mt-3 mb-3">
	    <div class="col-xs-2 ml-3 mr-1">
	        <select class="form-control" id="largeCategory" name="largeCategory">
			</select>
	    </div>
	    <div class="col-xs-3">
			<select class="form-control" id="middleCategory" name="middleCategory">
			</select>
	    </div>
	    <div class="col">
	        <input type="text" class="form-control" placeholder="title" id="title" name="title">
	    </div>
	</div>
	
	<div>
		<div class="summernote"></div>
		<div class="row justify-content-center mt-2">
			<button type="button" class="btn btn-primary" onClick="javascript:save();">저장</button>
		</div>
	</div>
</form>

<%-- 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
--%>

<script type="text/javascript">

$(document).ready(function(){	
$('.summernote').summernote({
	placeholder: 'Write contents',
	height: 500,
	minHeight: null,             // set minimum height of editor
	maxHeight: null,             // set maximum height of editor
	callbacks:{
		onImageUpload: function(files){
 			for (var i = files.length - 1; i >= 0; i--) {
	  			console.log("upload image");
	  			sendFile(files[i], this);
			}
		},
		onMediaDelete : function ($target, $editable) {
       		console.log($target.attr('remove image"'));   // get image url 
       		$target.remove();
   		}
	}
});   
	
	getUpCategoryList();

})
	
sendFile = function(file, summernote){
	var form_data = new FormData();
    form_data.append('file', file);
	    
	$.ajax({
			data: form_data,
			type: "POST",
			url: '/common/uploadArticleImage',
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function(url) {
					$('.summernote').summernote('insertImage',url);
  			}
      });
}

getUpCategoryList = function(){
	var param = {};
	param.parentId = 0;
	
	$.ajax({
		type: "POST",
		url: '/common/getCategoryList',
		data: param,
		success: function(res) {
			var categoryList = res.data;
			if(categoryList.length > 0){
				$("#largeCategory").append("<option value=''>선택하세요</option>");
				for(var i=0; i< categoryList.length; i++){
					$("#largeCategory").append("<option value='"+categoryList[i].categoryId+"'>"+categoryList[i].categoryName+"</option>");
				}	
			}else{
				//카테고리가 존재하지 X
			}
			
		}
  	});
}

/*
 * 원하는 부모id 리스트를 가져온다. 0->root
 */
getMiddleCategoryList = function(parentId){
	var param = {};
	param.parentId = parentId;
	
	$("#middleCategory").empty();
	
	$.ajax({
		type: "POST",
		url: '/common/getCategoryList',
		data: param,
		success: function(res) {
			var categoryList = res.data;
			if(categoryList.length > 0){
				$("#middleCategory").append("<option value=''>선택하세요</option>");
				for(var i=0; i< categoryList.length; i++){
					$("#middleCategory").append("<option value='"+categoryList[i].categoryId+"'>"+categoryList[i].categoryName+"</option>");
				}	
			}else{
				//카테고리가 존재하지 X
			}
			
		}
  	});
}


$("#largeCategory").change(function(){
	var categoryId = $("#largeCategory option:selected").val();
	getMiddleCategoryList(categoryId);
});

save = function(){
	//var param = $("#frm").serializeObject();
	
	param = {};
	param.largeCategory = $("#largeCategory").val();
	param.middleCategory = $("#middleCategory").val();
	//param.bottomCategory = "1";
	param.title = $("#title").val();
	param.content = $(".summernote").summernote('code');
	
	$.ajax({
		type: "POST",
		url: '/common/writeArticle',
		data: param,
		success: function(msg) {
				alert(msg);
		}
  	});
}
</script>
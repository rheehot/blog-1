<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<input type="hidden" id="paramLargeCateogryId" value="${data.largeCategory }"/>
<input type="hidden" id="paramMiddleCateogryId" value="${data.middleCategory }"/>

<form method="post" id="frm" name="frm">
	<input type="hidden" id="boardId" name="boardId" value="${data.boardId}"/>
	
	<div class="row d-flex justify-content-center mt-3 mb-1">
	    <div class="col-md-4">
	    	<label>category</label>
	        <select class="form-control" id="largeCategory" name="largeCategory"></select>
	    </div>
	    <div class="col-md-4">
	    	<label>category</label>
			<select class="form-control" id="middleCategory" name="middleCategory"></select>
	    </div>
	     <div class="col-md-4">
	     	<label>전시여부</label>
			<select class="form-control" id="displayYn" name="displayYn">
				<c:if test="${data.displayYn eq 'Y' }">
					<option value="N">N</option>
					<option value="Y" selected>Y</option>				
				</c:if>
				<c:if test="${data.displayYn eq 'N' }">
					<option value="N" selected>N</option>
					<option value="Y">Y</option>				
				</c:if>
			</select>
	    </div>
	</div>
	
	<div class="row d-flex justify-content-center mb-2">
	    <div class="col">
	    	<label>Title</label>
	        <input type="text" class="form-control" placeholder="title" id="title" name="title" value="${data.title}">
	    </div>
	</div>
	
	<div class="row d-flex justify-content-center mt-1 mb-3">
		<div class="col">
			<div class="summernote">${data.content}</div>
		</div>
	</div>
	
	<div class="row d-flex justify-content-center mt-1 mb-3">
    	<div class="col">
	        <input type="text" class="form-control" placeholder="keyword" id="keyword" name="keyword" value="${data.keyword}">
	    </div>
	</div>
	
	<div class="row justify-content-center mt-2">
		<button type="button" class="btn btn-primary" onClick="javascript:modify();">수정</button>
	</div>
</form>

<script type="text/javascript">

$(document).ready(function(){	
	getUpCategoryList();
	getMiddleCategoryList($("#paramLargeCateogryId").val());
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
})


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
					if($("#paramLargeCateogryId").val() == categoryList[i].categoryId ){
						$("#largeCategory").append("<option value='"+categoryList[i].categoryId+"' selected>"+categoryList[i].categoryName+"</option>");
					}else{
						$("#largeCategory").append("<option value='"+categoryList[i].categoryId+"'>"+categoryList[i].categoryName+"</option>");
					}
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
	
	if(parentId != '' && parentId != null){
		$.ajax({
			type: "POST",
			url: '/common/getCategoryList',
			data: param,
			success: function(res) {
				var categoryList = res.data;
				if(categoryList.length > 0){
					$("#middleCategory").append("<option value=''>선택하세요</option>");
					for(var i=0; i< categoryList.length; i++){
						if($("#paramMiddleCateogryId").val() == categoryList[i].categoryId ){
							$("#middleCategory").append("<option value='"+categoryList[i].categoryId+"' selected>"+categoryList[i].categoryName+"</option>");
						}else{
							$("#middleCategory").append("<option value='"+categoryList[i].categoryId+"'>"+categoryList[i].categoryName+"</option>");
						}
					}	
				}else{
					//카테고리가 존재하지 X
				}
				
			}
	  	});		
	}
}
 
modify = function(){
	param = {};
	param.largeCategory = $("#largeCategory").val();
	param.middleCategory = $("#middleCategory").val();
	param.boardId = $("#boardId").val();
	param.title = $("#title").val();
	param.content = $(".summernote").summernote('code');
	param.keyword = $("#keyword").val();
	param.displayYn = $("#displayYn").attr("checked", true).val();
	
	$.ajax({
		type: "POST",
		url: '/md/modifyArticle',
		data: param,
		success: function(msg) {
			alert("수정하였습니다.");
			window.location.reload();
		}
  	});
}
 
sendFile = function(file, summernote){
	var form_data = new FormData();
    form_data.append('file', file);
	    
	$.ajax({
			data: form_data,
			type: "POST",
			url: '/md/uploadArticleImage',
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function(url) {
					$('.summernote').summernote('insertImage',url);
  			}
      });
}
 
$("#largeCategory").change(function(){
	var categoryId = $("#largeCategory option:selected").val();
	getMiddleCategoryList(categoryId);
});


</script>
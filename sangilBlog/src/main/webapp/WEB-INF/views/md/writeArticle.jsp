<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

<!--  
<script src="/lib/summernote-0.8.9/summernote-bs4.min.js"></script>
<script src="/lib/summernote-0.8.9/summernote-bs4.css"></script>
<script src="/lib/summernote-0.8.9/lang/summernote-ko-KR.js"></script>
-->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="/webjars/summernote/0.8.10/dist/summernote-bs4.js"></script>
<script src="/webjars/summernote/0.8.10/dist/summernote.css"></script>
<script src="/webjars/summernote/0.8.10/dist/lang/summernote-ko-KR.js"></script> -->

<div class="row d-flex justify-content-center mt-3 mb-3">
    <div class="col-xs-2 ml-3 mr-1">
        <select class="form-control" id="sel1">
			<option>선택하세요</option>
			<option>BootStrap4</option>
			<option>Spring</option>
			<option>Android</option>
		</select>
    </div>
    <div class="col-xs-3">
		<select class="form-control" id="sel1">
			<option>선택하세요</option>
			<option>sub category1</option>
			<option>sub category2</option>
			<option>sub category3</option>
		</select>
    </div>
    <div class="col">
        <input type="text" class="form-control" placeholder="title">
    </div>
</div>

<div>
	<div class="summernote"></div>
	<div class="row justify-content-center mt-2">
		<button type="button" class="btn btn-primary" onClick="javascript:save();">저장</button>
	</div>
</div>

<%-- 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
--%>

<script type="text/javascript">

$(document).ready(function(){
	 $('.summernote').summernote({
         placeholder: 'Write contents',
         height: 500,
	 });
	
	/* $('.summernote').summernote({
          placeholder: 'Write contents',
          height: 300,
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
   }); */  

})
	
sendFile = function(file, summernote){
	var form_data = new FormData();
    form_data.append('file', file);
	    
	$.ajax({
			data: form_data,
			type: "POST",
			url: '/image',
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function(url) {
					$('.summernote').summernote('insertImage',url);
  			}
      });
}
	
save = function(){
	var param = {};
	param.title = $("#title").val();
	param.content = $(".summernote").summernote('code');
	
	$.ajax({
		type: "POST",
		url: '/article/write',
		data: JSON.stringify(param),
		contentType: 'application/json',
		success: function(msg) {
				alert(msg);
		}
  	});
}
</script>
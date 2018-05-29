<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/webjars/bootstrap/4.1.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="/webjars/summernote/0.8.10/dist/summernote-bs4.css" rel="stylesheet">
<script src="/webjars/summernote/0.8.10/dist/summernote-bs4.js"></script>
<script src="/webjars/summernote/0.8.10/dist/lang/summernote-ko-KR.js"></script>

<div class="container">
	<div class="input-group" style="margin-bottom:5px;">
    	<span class="input-group-addon">Title</span>
    	<form id="frm" name="frm" method="post">
    	<input id="title" name="title" type="text" class="form-control" placeholder="Additional Title">
    	</form>
	</div>
	<div style="margin-bottom:100px;">
		<div class="summernote"></div>
		<button type="button" class="btn btn-primary center-block" onClick="javascript:save();">저장</button>
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
   });  

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
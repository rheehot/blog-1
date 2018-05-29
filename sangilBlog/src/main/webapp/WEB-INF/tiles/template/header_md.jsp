<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
		  		<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="/md/main">Sangil's Admin Page</a>
		</div>
		
		<div class="collapse navbar-collapse" id="navb">
			<ul class="navbar-nav mr-auto">
	  			<li class="nav-item dropdown">
		    		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">운영</a>
		    		<div class="dropdown-menu">
		      			<a class="dropdown-item" href="#">방문자관리</a>
		      			<a class="dropdown-item" href="#">공통코드관리</a>
		    		</div>
		  		</li>
		  		<li class="nav-item dropdown">
		    		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
		    		<div class="dropdown-menu">
		    			<a class="dropdown-item" href="#">카테고리관리</a>
		      			<a class="dropdown-item" href="/md/writeArticle">글작성</a>
		    		</div>
		  		</li>
	    	</ul>
		</div>
			
 		<ul class="nav navbar-nav pull-right">
			<li><button type="button" class="btn btn-primary mt-1 mr-1" onclick="location.href='/main'">Home</button></li>
			<li><button class="btn btn-danger mt-1" onclick="javascript:logout();">Logout</button></li>
 		</ul>
		</div>
</nav>

<script type="text/javascript">
logout = function(){
	var param = {};
	$.ajax({
		type: "POST",
		url: '/logout',
		data: JSON.stringify(param),
		contentType: 'application/json',
		success: function(res) {
			if(res.isReceived){
				location.href="/md/main"
			}else{
				alert("아이디와 암호를 확인하여 주십시오");
			}
		}
  	});
}
</script>
    
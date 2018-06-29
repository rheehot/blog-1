<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src="/webjars/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0//css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<div class="container-fluid d-flex justify-content-center h-100">
	<div class="align-self-center text-center">
		<i class="fa fa-frown-o fa-5x" style="color:red;"></i>
		<h2 class="text-center">아이고 잘못된 접근입니다</h2>
		<h3>해당 페이지는 존재하지 않아요</h3>
		<h3>3초 후 메인페이지로 이동합니다</h3>
		<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>
	</div>
</div>

<script type="text/javascript">
	setInterval(function(){ 
		location.href = "/front/main";
	}, 2000);
</script>
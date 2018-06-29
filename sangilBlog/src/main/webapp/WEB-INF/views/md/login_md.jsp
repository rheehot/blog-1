<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="row d-plex justify-content-center" style="margin-top:7rem">
		<div class="col-md-6">
            <h2>Admin Login Page</h2><hr>
		</div>
	</div>
	
	<div class="row d-plex justify-content-center">
		<div class="col-md-6">
          	<div class="form-group has-danger">
			<label class="sr-only" for="email">E-Mail Address</label>
				<div class="input-group mb-2 mr-sm-2 mb-sm-0">
					<div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
					<input type="text" name="email" class="form-control" id="email" placeholder="you@example.com" required autofocus>
	            </div>
     		</div>
		</div>
	</div>
	
	<div class="row d-plex justify-content-center">
		<div class="col-md-6">
			<div class="form-group">
				<label class="sr-only" for="password">Password</label>
				<div class="input-group mb-2 mr-sm-2 mb-sm-0">
				    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-key"></i></div>
				    <input type="password" name="password" class="form-control" id="password"placeholder="Password" required>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row d-plex justify-content-center">
		<div class="col-md-6" style="padding-top: .35rem">
			<div class="form-check mb-2 mr-sm-2 mb-sm-0">
				<label class="form-check-label">
					<input class="form-check-input" name="remember" type="checkbox" >
					<span style="padding-bottom: .15rem">Remember me</span>
				</label>
			</div>
		</div>
	</div>
	
	<div class="row d-plex justify-content-center mt-3">
		<div class="col-md-6">
			<button type="submit" class="btn btn-success" onClick="javascript:alert('구현중인 기능입니다')"><i class="fa fa-sign-in"></i> Login</button>
			<a class="btn btn-link" href="javascript:alert('구현중');">Forgot Your Password?</a>
		</div>
	</div>
</div>



<script type="text/javascript">
$(document).ready(function(){
})

doLogin = function(){
	var param = $("#frm").serializeObject();
	$.ajax({
		type: "POST",
		url: '/login/do',
		data: JSON.stringify(param),
		contentType: 'application/json',
		success: function(res) {
			if(res.isReceived){
				location.href="md/main";
			}else{
				alert("아이디와 암호를 확인하여 주십시오");
			}
		}
  	});
}
</script>
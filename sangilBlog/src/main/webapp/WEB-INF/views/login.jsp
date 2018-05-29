<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<form id="frm" name="frm" method="post">
		<div class="row" style="margin-top:200px;">
			<div class="input-group col-xs-12 col-sm-4" style="float: none; margin: 0 auto;">
				<div class="input-group-prepend">
      				<div class="input-group-text" id="btnGroupAddon">id</div>
    			</div>
				<input id="userId" type="text" class="form-control" name="userId" placeholder="Id">
			</div>
		</div>
		<div class="row">
			<div class="input-group col-xs-12 col-sm-4" style="float: none; margin: 0 auto; margin-top:5px;">
				<div class="input-group-prepend">
      				<div class="input-group-text" id="btnGroupAddon">pw</div>
    			</div>
				<input id="password" type="password" class="form-control" name="password" placeholder="Password">
			</div>
		</div>
		<div class="mx-auto mt-1" style="text-align:center">
			<button type="button" class="btn btn-outline-primary" onClick="javascript:doLogin();">로그인</button>
		</div>
	</form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div style="background-color: #ffffff; height:6em;">
  	<h1 class="ml-3"><a href="/" style="color: #6a6e71;">Sangil's blog</a></h1>
  	<div class="float-right mr-3 mt-3"> 
	  	<span class="badge badge-primary" style="cursor:hand" onclick="javascript:location.href='/md/main'">Admin</span>
  	</div>
</div>

<nav class="navbar sticky-top navbar-expand-md navbar-dark bg-dark sidebarNavigation" data-sidebarClass="navbar-dark bg-dark" style="height:4em;">
	<button class="navbar-toggler leftNavbarToggler" type="button" data-toggle="collapse" data-target="#navb"
	    aria-controls="navb" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navb">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
 				<a class="nav-link" href="/intro">INTRODUCTION</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">LABORATORY</a>
				<div class="dropdown-menu">
		  		<a class="dropdown-item" href="/lab/bootstrap4">BootStrap4</a>
				</div>
			</li>
			<%-- 
			<li class="nav-item">
				<a class="nav-link" href="/logbook">LOGBOOK</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/guestbook">GUESTBOOK</a>
			</li>
			--%>
		</ul>

		<div class="form-inline f">
			<span class="badge badge-light mt-3 mr-2" style="cursor:hand" onclick="javascript:location.href='/rss'">RSS</span>
			<input class="form-control mr-sm-2" type="text" placeholder="Search" name="keyword" id="keyword" onkeypress="javascript:enterKeySubmit(event);">
			<button class="btn btn-success my-2 my-sm-0" type="button" onclick="javascript:search();">Search</button>
		</div>
    </div>
</nav>

<script type="text/javascript">
$(document).ready(function(){
	
});

enterKeySubmit = function(e){
	if (e.keyCode == 13) {
		search();
        return false;
    }
}

search = function(){
	var keyword = $("#keyword").val();
	if(util.isNull(keyword)){
		alert("검색어를 입력하여 주십시오.");
		return;
	}
	
	var url = "/search/" + keyword;
	location.href=url;
}

</script>
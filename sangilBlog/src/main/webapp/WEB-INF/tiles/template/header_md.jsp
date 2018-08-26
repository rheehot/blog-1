<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div style="background-color: #ffffff; height:6em;">
  	<h1><a href="/md/main">Sangil's blog Admin</a></h1>
	 <div class="float-right mr-3 mt-3"> 
	  	<span class="badge badge-primary" style="cursor:hand" onclick="javascript:location.href='/'">Home</span>
  	</div>
</div>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
	  <span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navb">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
     				<a class="nav-link" href="/md/categoryManagement">카테고리</a>
   			</li>
   			<li class="nav-item">
   				<a class="nav-link" href="/md/board">게시판</a>
   			</li>
  			<!-- <li class="nav-item dropdown">
	    		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
	    		<div class="dropdown-menu">
	      		<a class="dropdown-item" href="/md/categoryManagement">카테고리관리</a>
	      		<a class="dropdown-item" href="/md/writeArticle">글작성</a>
	    		</div>
	  		</li> -->
    	</ul>
	</div>
</nav>

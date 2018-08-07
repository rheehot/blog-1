<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div style="background-color: #ffffff; height:6em;">
  	<h1 class="ml-3"><a href="/front/main" style="color: #6a6e71;">Sangil's blog</a></h1>
  	<div class="float-right mr-3 mt-3"> 
	  	<span class="badge badge-primary" style="cursor:hand" onclick="javascript:location.href='/md/main'">Admin</span>
  	</div>
</div>

<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navb">
		  <span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navb">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
     				<a class="nav-link" href="/front/intro">INTRODUCTION</a>
   				</li>
	  			<li class="nav-item dropdown">
		    		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">LABORATORY</a>
		    		<div class="dropdown-menu">
		      		<a class="dropdown-item" href="#">Link 1</a>
		      		<a class="dropdown-item" href="#">Link 2</a>
		      		<a class="dropdown-item" href="#">Link 3</a>
		    		</div>
		  		</li>
		  		<li class="nav-item">
     				<a class="nav-link" href="/front/logbook">LOGBOOK</a>
   				</li>
		  		<li class="nav-item">
     				<a class="nav-link" href="/front/guestbook">GUESTBOOK</a>
   				</li>
	    	</ul>
	    	
	    	<div class="form-inline f">
	  			<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
	   		</div>
		</div>
</nav>

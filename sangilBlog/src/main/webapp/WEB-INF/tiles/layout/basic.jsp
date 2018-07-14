<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link rel="stylesheet" href="/webjars/bootstrap/4.1.0//css/bootstrap.min.css">

<style>
html, body{
  margin:0;
  padding:0;
  height:100%;
}
</style>

<html lang="ko">
	<head>
	    <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
	    <title><tiles:getAsString name="title" /></title>
	    <script src="/webjars/jquery/3.2.1/jquery.js"></script>
	    <script src="/webjars/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	    <%--awesome --%>
	    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	   	<script src="/js/common/jquery.serializeObject.js"></script>
	    <%-- 
	   	<script src="/js/common/util.js"></script>
	   	--%>
	</head>
	<body>
		<div class="container-flud">
			<tiles:insertAttribute name="header" />
			<div class="row d-flex p-0 mr-0 ml-0">
				<div class="col-md-2 d-none d-sm-block h-100" style="background-color:#f3f3f3">
					<tiles:insertAttribute name="leftArea"/>
				</div>
				<div class="col">
		     		<tiles:insertAttribute name="body"/>
				</div>
				<div class="col-md-2 d-none d-sm-block h-100" style="background-color:#f3f3f3">
					<tiles:insertAttribute name="rightArea"/>	
				</div>
			</div>
		    <tiles:insertAttribute name="footer" />	
		</div>
	</body>
</html>



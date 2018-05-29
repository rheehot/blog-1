<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link type="text/css" href="/css/common/footer.css" rel="stylesheet">
<link type="text/css" href="/css/common/offcanvas.css" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/css/bootstrap.min.css">

<html lang="ko">
	<head>
	    <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
	    <title><tiles:getAsString name="title" /></title>
	    <script src="/webjars/jquery/3.2.1/jquery.js"></script>
	    <script src="/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	   	<script src="/js/common/jquery.serialize-object.js"></script>
	   	<script src="/js/common/util.js"></script>
	</head>
	<body>
	    <tiles:insertAttribute name="header" />
	    <tiles:insertAttribute name="body" />
	    <tiles:insertAttribute name="footer" />
	</body>
</html>



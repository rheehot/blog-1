<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


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
	    <script src="/webjars/bootstrap/4.1.2/dist/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" href="/webjars/bootstrap/4.1.2/dist/css/bootstrap.min.css">
	    <%--awesome --%>
	    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	   	<script src="/js/common/jquery.serializeObject.js"></script>
	    <%-- 
	   	<script src="/js/common/util.js"></script>
	   	--%>
	   	<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-123358087-1"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		  gtag('config', 'UA-123358087-1');
		</script>
	</head>
	<body>
		<div class="container-flud">
			<tiles:insertAttribute name="header" />
			<div class="row d-flex p-0 mr-0 ml-0">
				<div class="col-md-2 d-none d-sm-block" style="background-color: #e4e4e4;">
					<tiles:insertAttribute name="leftArea"/>
				</div>
				<div class="col col-xs-12" style="background-color: #e4e4e4;">
		     		<tiles:insertAttribute name="body"/>
				</div>
				<div class="col-md-2 d-none d-sm-block" style="background-color: #e4e4e4;">
					<tiles:insertAttribute name="rightArea"/>	
				</div>
			</div>
		    <tiles:insertAttribute name="footer" />	
		</div>
	</body>
</html>



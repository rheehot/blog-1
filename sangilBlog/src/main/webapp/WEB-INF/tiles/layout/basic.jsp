<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
html, body{
  margin:0;
  padding:0;
  height:100%;
}
</style>

<html lang="ko" xmlns:og='http://ogp.me/ns#'>
	<head>
	    <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
	    <c:if test="${ mainData.mainTitle ne null}">
	    	<title>${mainData.mainTitle} :: <tiles:getAsString name="title"/></title>
	    	<meta name="description" content='<c:out value='${fn:substring(mainData.articleList[0].content.replaceAll("\\\<.*?\\\>",""),0,100)}' escapeXml="false"/>'>
	    	<meta name="keywords" content="${mainData.articleList[0].keyword }">
	    	<link rel="canonical" href="http://sang12.co.kr/${mainData.articleList[0].boardId }">	
	    	<meta property="og:type" content="article">
			<meta property="og:title" content="${mainData.mainTitle} :: <tiles:getAsString name="title"/>">
			<meta property="og:description" content="<c:out value='${fn:substring(mainData.articleList[0].content.replaceAll("\\\<.*?\\\>",""),0,100)}' escapeXml="false"/>">
			<meta property="og:url" content="http://sang12.co.kr/${mainData.articleList[0].boardId }">
	    </c:if>
	    <c:if test="${ mainData.mainTitle eq null}">
	    	<title><tiles:getAsString name="title"/></title>
	    	<meta name="description" content='취미 및 관심사를 공유하는 최상일의 개인 블로그입니다.'>
	    	<meta name="keywords" content="blog, sang12, 개인블로그">
	    	<link rel="canonical" href="http://sang12.co.kr">	
 		    <meta property="og:type" content="blog">
			<meta property="og:title" content="${mainData.mainTitle} :: <tiles:getAsString name="title"/>">
			<meta property="og:description" content="취미 및 관심사를 공유하는 최상일의 개인 블로그입니다.">
			<meta property="og:url" content="http://sang12.co.kr">
	    </c:if>
	    <script src="/webjars/jquery/3.2.1/jquery.js"></script>
	    <script src="/webjars/bootstrap/4.1.2/dist/js/bootstrap.min.js"></script>
	    <link rel="stylesheet" href="/webjars/bootstrap/4.1.2/dist/css/bootstrap.min.css">
	    <%--awesome --%>
	    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	   	<script src="/js/common/jquery.serializeObject.js"></script>
	   	<script src="/js/common/common.js"></script>
	   	<script src="/js/common/b4_sidebar.js?20181015"></script>
	   	<script src="/js/common/util.js"></script>
	   	
	   	<!-- google ads -->
    	<script data-ad-client="ca-pub-2918447982815807" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-123358087-1"></script>
		<script>
  			window.dataLayer = window.dataLayer || [];
  			function gtag(){dataLayer.push(arguments);}
  			gtag('js', new Date());
 			 gtag('config', 'UA-123358087-1');
		</script>
		
		<link rel="stylesheet" href="/css/highlight/androidstudio.css"> 
		<link rel="stylesheet" href="/css/common/b4_sidebar.css"> 
		<script src="/js/common/highlight.pack.js"></script>
		<script>
			hljs.initHighlightingOnLoad();
		</script>
	</head>
	<body>
		<div class="container-flud">
			<tiles:insertAttribute name="header" />
			<div class="row d-flex p-0 mr-0 ml-0">
				<div class="col col-md-2 d-none d-sm-block" style="background-color: #f7f7f7;">
					<tiles:insertAttribute name="leftArea"/>
				</div>
				<div class="col col-md-8" style="background-color: #f7f7f7;">
		     		<tiles:insertAttribute name="body"/>
				</div>
				<div class="col col-md-2 d-none d-sm-block" style="background-color: #f7f7f7;">
					<tiles:insertAttribute name="rightArea"/>	
				</div>
			</div>
		    <tiles:insertAttribute name="footer" />	
		</div>
	</body>
</html>



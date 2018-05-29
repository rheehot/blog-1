<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--방문자 리스트 --%>
<c:set var="joinCountList" value="${data.joinCountList }" />
<c:set var="articleList" value="${data.articleList }" />

<div class="container">
	<div class="pull-right">
		<a href="/md/main"><b>Admin</b></a>
	</div>

	<div class="jumbotron">
		<div class="container">
	    	<h1>Welcome Sangil's blog</h1>
	    	<c:forEach var="list" items="${joinCountList}">
				<fmt:parseDate var="dateString" value="${list.joinDate}" pattern="yyyyMMdd" />
				<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" /> : <span class="badge">${list.joinCount}</span><br/>
			</c:forEach>
	  </div>
	</div>
	
	<div class="col-xs-12 col-lg-4">
    	<div class="panel panel-default" style="background-color:#aaaaaa; padding:10px; margin-bottom:0px;">
    		<span style="color:#FFFFFF;"><b>test title</b></span>
    		<span class="pull-right"><kbd style="padding:2px 6px;"><a href="#" style="color:#FFFFFF;">+</a></kbd></span>
    	</div>
    	<div class="list-group">
    		<c:forEach var="list" items="${articleList}">
					<a class="list-group-item" href="/articleDetail/${list.id}" style="color:#333;">${list.title}</a>
			</c:forEach>
		</div>
    </div>
</div>

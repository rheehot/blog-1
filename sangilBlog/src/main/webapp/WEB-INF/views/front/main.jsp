<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="articleList" value="${mainData.articleList}"/>
<c:set var="paging" value="${mainData.paging}"/>

<%-- 메인 게시물 영역 --%>
<div class="container-flue">
<c:forEach items="${articleList}" var="list">
	<div class="mt-2" style="height:140px; background: white; border:solid 2px; border-color: 989898; border-radius: 10px;">
			<h2 class="ml-3 mt-4 text-center">${list.title}</h2>
			<div class="float-right p-3 mt-3" style="">
				<p><b><fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.registerDate}"/> posted by sang12</b></p>
			</div>
	</div>
		
	<div class ="mt-0 p-2 mt-2" style="background-color: white; border-radius: 10px; border: solid 1px; border-color: #25252582;">
		${list.content}
	</div>
</c:forEach>
</div>


<nav class="navbar navbar-expand-md fixed-bottom" style="border-top:solid; border-color: #343a40; background-color: white;">
	<div class="navbar-collapse collapse justify-content-center">
		<ul class="navbar-nav">
		<c:if test="${paging.startPage > 1 }">
			<li class="page-item"><a class="page-link" href="/main?page=${paging.startPage - 1}">이전</a></li>
		</c:if>
		<c:forEach var="pagingNum" begin="${paging.startPage}" end="${paging.endPage}" step="1">
			<c:choose>
				<c:when test="${pagingNum eq paging.page }">
					<li class="page-item active"><a class="page-link" href="/main?page=${pagingNum}">${pagingNum}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/main?page=${pagingNum}">${pagingNum}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage < paging.totalPage }">
			<li class="page-item"><a class="page-link" href="/main?page=${paging.endPage + 1}">다음</a></li>
		</c:if>
		</ul>
	</div>
</nav>



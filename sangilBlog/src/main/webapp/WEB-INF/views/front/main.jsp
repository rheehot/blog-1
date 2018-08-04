<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="articleList" value="${mainData.articleList}"/>
<c:set var="paging" value="${mainData.paging}"/>

<%-- 메인 게시물 영역 --%>
<c:forEach items="${articleList}" var="list">
	<div class="jumbotron mt-2 mb-1 p-4">
		<div class="text-center"><h3>${list.title}</h3></div> 
		<div class="float-right">posted by sang12 date: ${list.registerDate}</div>
	</div>
	<div class ="mt-0">
		${list.content}
	</div>
</c:forEach>


<%--페이징 영역 --%> 
<ul class="pagination justify-content-center" style="margin:20px 0">
	<c:if test="${paging.startPage > 1 }">
		<li class="page-item"><a class="page-link" href="/front/main?page=${paging.startPage - 1}">이전</a></li>
	</c:if>
	<c:forEach var="pagingNum" begin="${paging.startPage}" end="${paging.endPage}" step="1">
		<c:choose>
			<c:when test="${pagingNum eq paging.page }">
				<li class="page-item active"><a class="page-link" href="/front/main?page=${pagingNum}">${pagingNum}</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="/front/main?page=${pagingNum}">${pagingNum}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage < paging.totalPage }">
		<li class="page-item"><a class="page-link" href="/front/main?page=${paging.endPage + 1}">다음</a></li>
	</c:if>
</ul>


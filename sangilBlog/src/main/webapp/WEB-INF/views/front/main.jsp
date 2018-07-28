<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
		 
<c:forEach items="${articleList.content}" var="list">
	<div class="jumbotron mt-2 mb-1 p-4">
		<div class="text-center"><h3>${list.title}</h3></div> 
		<div class="float-right">posted by sang12 date: ${list.registerDate}</div>
	</div>
	<div class ="mt-0">
		${list.content}
	</div>
</c:forEach>

<%--
	totalElements : ${articleList.totalElements }
	totalPages : ${articleList.totalPages }
	number  : ${articleList.number}
	hasNext  : ${articleList.hasNext()}
	nextPageable  : ${articleList.nextPageable()}
	hasPrevious  : ${articleList.hasPrevious()}
	previousPageable  : ${articleList.previousPageable()}
--%>
   
<ul class="pagination justify-content-center" style="margin:20px 0">
	<c:if test="${articleList.hasPrevious()}">
		<li class="page-item"><a class="page-link" href="/front/main?page=${articleList.number-1}">Previous</a></li>
		<li class="page-item"><a class="page-link" href="/front/main?page=${articleList.number-1}">${articleList.number}</a></li>
	</c:if>
	<li class="page-item active"><a class="page-link" href="/front/main?page=${articleList.number}">${articleList.number + 1}</a></li>
	<c:if test="${articleList.hasNext()}">
		<li class="page-item"><a class="page-link" href="/front/main?page=${articleList.number+1}">${articleList.number + 2}</a></li>
		<li class="page-item"><a class="page-link" href="/front/main?page=${articleList.number+1}">Next</a></li>
	</c:if>
</ul>
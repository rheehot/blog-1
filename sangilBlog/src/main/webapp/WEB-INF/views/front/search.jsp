<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<c:set var="articleList" value="${mainData.articleList}"/>

<div class="search h-100 mt-3">
	<%--type에 따른 상단 표시 --%>
	<div class="card mb-4">
		<div class="card-body">
			<h4>"${mainData.keyword}" 검색 결과입니다<span style="font-size:12px;"> (제목과 내용을 함께 검색합니다 )</span></h4>
		</div>
	</div>
	<div class="mb-5">	
	<c:forEach items="${articleList}" var="list">
		<div class="card">
			<div class="card-body">
				<h5 class=""><a href="/${list.boardId }" style="color:#000;">${list.title}</a> <span style="font-size:8px;">${list.largeCategoryName} <c:if test="${list.middleCategoryName ne null }">/ ${list.middleCategoryName}</c:if></span></h5>
			</div>
		</div>
	</c:forEach>
	</div>
</div>

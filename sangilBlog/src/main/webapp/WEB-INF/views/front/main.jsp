<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="articleList" value="${mainData.articleList}"/>
<c:set var="paging" value="${mainData.paging}"/>


<form name="mainFrm" id="mainFrm" method="post">
	<input type="hidden" name="largeCategoryId" id="largeCategoryId" value="${param.largeCategoryId }"/>
	<input type="hidden" name="middleCategoryId" id="middleCategoryId" value="${param.middleCategoryId }"/>
	<input type="hidden" name="page" id="page" value=""/>
</form>


<%-- 메인 게시물 영역 --%>
<div class="container" style="margin-bottom:80px;">
<c:forEach items="${articleList}" var="list">
	<div class="card mb-3">
		<div class="card-body mb-5">
			<h2 class="mt-4 text-center"><a href="/${list.boardId }" style="color:#000;">${list.title}</a> <span style="font-size:8px;">${list.largeCategoryName} <c:if test="${list.middleCategoryName ne null }">/ ${list.middleCategoryName}</c:if></span></h2>
			<p class="text-right mb-2 mt-5"><b><fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.registerDate}"/> posted by sang12</b></p>
			<hr>
			<div class="mt-3">
			${list.content}
			</div>
		</div>
	</div>
</c:forEach>
</div>

<c:if test="${paging.length > 0 }">
<ul class="pagination" style="justify-content: center;">
	<c:if test="${paging.startPage > 1 }">
		<li class="page-item"><a class="page-link" href="javascript:go_page(${paging.startPage - 1})">이전</a></li>
	</c:if>
	<c:forEach var="pagingNum" begin="${paging.startPage}" end="${paging.endPage}" step="1">
		<c:choose>
			<c:when test="${pagingNum eq paging.page }">
				<li class="page-item active"><a class="page-link" href="javascript:go_page(${pagingNum})">${pagingNum}</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="javascript:go_page(${pagingNum})">${pagingNum}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage < paging.totalPage }">
		<li class="page-item"><a class="page-link" href="javascript:go_page(${paging.endPage + 1})">다음</a></li>
	</c:if>
</ul>
</c:if>

<div id="goBottom"></div>

<script type="text/javascript">

go_page = function(page){
	$("#page").val(page);
	document.getElementById("mainFrm").submit();
}

$('img').on('click', function(){
    simpleLightbox($(this).attr('src'));
});

function simpleLightbox(imageUrl, bgColor, maxWidth){
    if(typeof bgColor === 'undefined'){
        bgColor = '#000';
    }
    if(typeof maxWidth === 'undefined'){
        maxWidth = '1100px';
    }
    window.open('', 'simpleLightbox').document.write('<html><head><meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, minimum-scale=1.0, width=device-width" /></head><body style="margin:0; background:'+bgColor+';height:100%;" onclick="javascript:window.close(\'simpleLightbox\');"><table border="0" width="100%" height="100%"><tr><td valign="middle" align="center"><img style="position:relative;z-index:2;width:100%;max-width:'+maxWidth+';" src="'+imageUrl+'"/></td></tr></table></body></html>');
}

</script>



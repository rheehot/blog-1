<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<style>
	/* The sidebar menu */
	.leftArea {
	    height: 100%; /* Full-height: remove this if you want "auto" height */
	    width: 15%; /* Set the width of the sidebar */
	    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
	    z-index: 1; /* Stay on top */
	    top: 0; /* Stay at the top */
	    left: 0;
	    background-color: #ffffff00; 
	    overflow-x: hidden; /* Disable horizontal scroll */
	    padding-top: 20px;
	    margin-top:200px;
	}
	
	/* The navigation menu links */
	.leftArea a {
	    padding: 6px 8px 6px 16px;
	    text-decoration: none;
	    font-size: 15px;
	    color: #464242;
	    display: block;
	}
	
	/* When you mouse over the navigation links, change their color */
	.leftArea a:hover {
	    color: black;
	}
	
</style>
	
<c:set var="upCategoryList" value="${mainData.upCategoryList}"/>
<c:set var="childCategoryList" value="${mainData.childCategoryList}"/>

<nav class="leftArea">
	<ul class="list-unstyled">
		<li>
			<a href="/"><b>ALL</b></a>
		</li>
		<c:forEach var="upCategory" items="${upCategoryList}">
			<li>
				<a href="/category/${fn:replace(upCategory.categoryName, ' ', '-')}"><b>${upCategory.categoryName}</b><span style="font-size:5px;"> (${upCategory.articleCount})</span></a>
				<c:forEach var="childCategory" items="${childCategoryList}">
					<c:if test="${upCategory.categoryId eq childCategory.parentId }">
						<div class ="ml-2">
							<ul class="list-unstyled" id="menu${childCategory.parentId }">
								<li>
									<a href="/category/${fn:replace(upCategory.categoryName, ' ', '-')}/${fn:replace(childCategory.categoryName, ' ', '-')}">-${childCategory.categoryName} <%-- <span class="badge badge-secondary">NEW</span>--%></a>
								</li>
							</ul>
						</div>
					</c:if>
				</c:forEach>
			</li>
		</c:forEach>
	</ul>
</nav>


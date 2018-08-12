<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
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
			<a href="javascript:getArticle('', '')"><b>ALL</b></a>
		</li>
		<c:forEach var="upCategory" items="${upCategoryList}">
			<li>
				<a href="javascript:getArticle(${upCategory.categoryId}, '')"><b>${upCategory.categoryName}</b><span style="font-size:5px;"> (${upCategory.articleCount})</span></a>
				<c:forEach var="childCategory" items="${childCategoryList}">
					<c:if test="${upCategory.categoryId eq childCategory.parentId }">
						<div class ="ml-2">
							<ul class="list-unstyled" id="menu${childCategory.parentId }">
								<li>
									<a href="javascript:getArticle(${upCategory.categoryId}, ${childCategory.categoryId})">-${childCategory.categoryName} <%-- <span class="badge badge-secondary">NEW</span>--%></a>
								</li>
							</ul>
						</div>
					</c:if>
				</c:forEach>
			</li>
		</c:forEach>
	</ul>
</nav>

<%-- <div>
	<nav class="leftArea">
		<ul class="list-unstyled components">
			<c:forEach var="upCategory" items="${upCategoryList}">
				<li>
	 				<a href="#menu${upCategory.categoryId }" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">${upCategory.categoryName}</a> 
					<c:forEach var="childCategory" items="${childCategoryList}">
						<c:if test="${upCategory.categoryId eq childCategory.parentId }">
							<div class ="ml-2">
								<ul class="list-unstyled" id="menu${childCategory.parentId }">
									<li>
										<a href="#">${childCategory.categoryName }</a>
									</li>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</li>
			</c:forEach>
		</ul>
	</nav>
</div> --%>
<%-- 
<div>
	<nav class="leftArea">
        <ul class="list-unstyled components">
           <li>
               <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
               <ul class="collapse list-unstyled" id="homeSubmenu">
                   <li>
                       <a href="#home1Submenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home 1</a>
						<ul class="collapse list-unstyled" id="home1Submenu">
							<li>
                       			<a href="#">Home1_1</a>
                  			</li>
                   			<li>
                       			<a href="#">Home1_2</a>
                   			</li>
                   			<li>
                       			<a href="#">Home1_3</a>
                   			</li>
               			</ul>
                   </li>
                   <li>
                       <a href="#">Home 2</a>
                   </li>
                   <li>
                       <a href="#">Home 3</a>
                   </li>
               </ul>
           </li>
           <li>
               <a href="#">About</a>
           </li>
           <li>
               <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
               <ul class="collapse list-unstyled" id="pageSubmenu">
                   <li>
                       <a href="#">Page 1</a>
                   </li>
                   <li>
                       <a href="#">Page 2</a>
                   </li>
                   <li>
                       <a href="#">Page 3</a>
                   </li>
               </ul>
           </li>
           <li>
               <a href="#">Portfolio</a>
           </li>
           <li>
               <a href="#">Contact</a>
           </li>
       </ul> 
   </nav>
</div>
--%>

<script>
getArticle = function(largeCategoryId, middleCategoryId){
	console.log("largeCategory:"+largeCategoryId+ " middleCategoryId::" +middleCategoryId);
	$("#largeCategoryId").val(largeCategoryId);
	$("#middleCategoryId").val(middleCategoryId);
	go_page(1);
}


</script>
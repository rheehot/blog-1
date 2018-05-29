<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--방문자 리스트 --%>
<c:set var="joinCountList" value="${data.joinCountList }" />
<c:set var="articleList" value="${data.articleList }" />

<div class="container-fluid h-100">
    <div class="row h-100">
        <aside class="d-none d-md-block col-md-2 p-0 bg-Secondary">
            <nav class="navbar navbar-expand navbar-dark flex-md-column flex-row align-items-start">
                <div class="collapse navbar-collapse">
                    <ul class="flex-md-column flex-row navbar-nav w-100 justify-content-between">
                        <li class="nav-item">
                            <a class="nav-link pl-0" href="#">Link</a>
                        </li>
                    </ul>
                </div>
            </nav>
		</aside>
	
	<div class="col bg-dark">

	<span class="badge badge-primary float-right mt-3" onclick="javascript:window.location.href='/md/main'" style="cursor: pointer;">Admin</span>
	<div class="jumbotron mt-3">
	    	<h1>Welcome Sangil's blog</h1>
	    	<%-- 
	    	<c:forEach var="list" items="${joinCountList}">
				<fmt:parseDate var="dateString" value="${list.joinDate}" pattern="yyyyMMdd" />
				<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" /> : <span class="badge badge-dark">${list.joinCount}</span><br/>
			</c:forEach>
			--%>
	</div>
	
	<div class="row">
		<%-- first --%>
		<div class="col-sm-12 col-lg-4">
			<div class="mb-2">
		    	<div class="card p-2" style="background-color:#aaaaaa; margin-bottom:0px;">
		    		<div>
		    			<span style="color:#FFFFFF;"><b>test title</b></span>
		    			<kbd class="float-right" style="padding:2px 6px;"><a href="#" style="color:#FFFFFF;">+</a></kbd>
		    		</div>
		    	</div>
		    	<div class="list-group">
		    		<c:forEach var="list" items="${articleList}">
						<a class="list-group-item list-group-item-action p-2" href="/articleDetail/${list.id}" style="color:#333;">
							${list.title} <span class="badge badge-secondary float-right mt-1"> <fmt:formatDate type="date" value = "${list.regDate}" /> </span>
						</a>
					</c:forEach>
						<a class="list-group-item list-group-item-action p-2">test1</a>
						<a class="list-group-item list-group-item-action p-2">test2</a>
						<a class="list-group-item list-group-item-action p-2">test3</a>
						<a class="list-group-item list-group-item-action p-2">test4</a>
						<a class="list-group-item list-group-item-action p-2">test5</a>
				</div>
			</div>
	    </div>
	    
	    <%-- second --%>
	    <div class="col-sm-12 col-lg-4">
			<div class="mb-2">
		    	<div class="card p-2" style="background-color:#aaaaaa; margin-bottom:0px;">
		    		<div>
		    			<span style="color:#FFFFFF;"><b>test title</b></span>
		    			<kbd class="float-right" style="padding:2px 6px;"><a href="#" style="color:#FFFFFF;">+</a></kbd>
		    		</div>
		    	</div>
		    	<div class="list-group">
				    	<a class="list-group-item list-group-item-action p-2">test1</a>
		    			<a class="list-group-item list-group-item-action p-2">test2</a>
						<a class="list-group-item list-group-item-action p-2">test3</a>
						<a class="list-group-item list-group-item-action p-2">test4</a>
						<a class="list-group-item list-group-item-action p-2">test5</a>
				</div>
			</div>
	    </div>
	    
	    <%-- last --%>
	    <div class="col-sm-12 col-lg-4">
			<div class="mb-2">
		    	<div class="card p-2" style="background-color:#aaaaaa;">
		    		<div>
		    			<span style="color:#FFFFFF;"><b>test title</b></span>
		    			<kbd class="float-right" style="padding:2px 6px;"><a href="#" style="color:#FFFFFF;">+</a></kbd>
		    		</div>
		    	</div>
		    	<div class="list-group">
						<a class="list-group-item list-group-item-action p-2">test1</a>
						<a class="list-group-item list-group-item-action p-2">test2</a>
				</div>
			</div>
			<div class="mb-2">
		    	<div class="card p-2" style="background-color:#aaaaaa;">
		    		<div>
		    			<span style="color:#FFFFFF;"><b>test title</b></span>
		    			<kbd class="float-right" style="padding:2px 6px;"><a href="#" style="color:#FFFFFF;">+</a></kbd>
		    		</div>
		    	</div>
		    	<div class="list-group">
						<a class="list-group-item list-group-item-action p-2">test1</a>
						<a class="list-group-item list-group-item-action p-2">test2</a>
				</div>
			</div>
	    </div>
    </div>
    
	</div>

      <aside class="d-none d-md-block col-md-2 p-0 bg-Secondary">
          <nav class="navbar navbar-expand navbar-dark flex-md-column flex-row align-items-start">
              <div class="collapse navbar-collapse">
                  <ul class="flex-md-column flex-row navbar-nav w-100 justify-content-between">
                      <li class="nav-item">
                          <a class="nav-link pl-0" href="#">Link</a>
                      </li>
                  </ul>
              </div>
          </nav>
      </aside>
    </div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<c:set var="articleList" value="${mainData.articleList}"/>
<c:set var="paging" value="${mainData.paging}"/>

<form name="mainFrm" id="mainFrm" method="post">
	<input type="hidden" name="largeCategoryId" id="largeCategoryId" value="${param.largeCategoryId }"/>
	<input type="hidden" name="middleCategoryId" id="middleCategoryId" value="${param.middleCategoryId }"/>
	<input type="hidden" name="page" id="page" value=""/>
</form>


<div class="main" style="margin-bottom:80px;">
<%--type에 따른 상단 표시 --%>
<c:choose>
	<c:when test="${mainData.type eq 'tag' }">
		<div class="card mb-4">
			<div class="card-body">
				<h4>tag 검색결과 :: ${fn:replace(mainData.tagName, '-', ' ')}</h4>
			</div>
		</div>
	</c:when>
</c:choose>

<%-- 메인 게시물 영역 --%>
<c:forEach items="${articleList}" var="list">
	<div class="card mb-3">
		<div class="card-body mb-1">
			<h2 class="mt-4 text-center"><a href="/${list.boardId}/${fn:replace(fn:replace(list.title, ' ', '-'), '/', '')}" style="color:#000;">${list.title}</a> <span style="font-size:8px;">${list.largeCategoryName} <c:if test="${list.middleCategoryName ne null }">/ ${list.middleCategoryName}</c:if></span></h2>
			<p class="text-right mb-2 mt-5"><b><fmt:formatDate pattern = "yyyy-MM-dd" value = "${list.registerDate}"/> posted by sang12</b></p><hr/>
			<%--main content area--%>
			<div class="mt-3">
				${list.content}
			</div>
			
			<!-- 게시글 하단 배너 -->		
			<ins class="adsbygoogle"
			     style="display:inline-block;width:100%;height:120px"
			     data-ad-client="ca-pub-2918447982815807"
			     data-ad-slot="4912443342">
			</ins>
			<script>
			     (adsbygoogle = window.adsbygoogle || []).push({});
			</script>
			
			<%--relateTitle area --%>
			<div class="card mt-2">
				<div class="pl-2 pr-2 pt-3  mb-0">
					<span class="">
						<a style="color:black;" href="/category/${fn:replace(list.largeCategoryName, ' ', '-')}"><b>${list.largeCategoryName}</b></a> 
						<c:if test="${list.middleCategoryName ne null }">
							<b>></b><a style="color:black;" href="/category/${fn:replace(list.largeCategoryName, ' ', '-')}/${fn:replace(list.middleCategoryName, ' ', '-')}"><b> ${list.middleCategoryName}</b></a>
						</c:if> 
						<b> 다른글</b></span> 
					<hr>
				</div>
				<div class="pl-2">
					<c:forEach items="${list.relateBoardTitleList}" var="relateBoardTitle">
							<c:choose>
								<c:when test="${list.boardId eq relateBoardTitle.boardId }">
									<a class="text-dark" href="/${relateBoardTitle.boardId}/${fn:replace(relateBoardTitle.title, ' ', '-')}"><b>${relateBoardTitle.title }</b></a><br/>		
								</c:when>
								<c:otherwise>
									<a class="text-dark" href="/${relateBoardTitle.boardId}/${fn:replace(relateBoardTitle.title, ' ', '-')}">${relateBoardTitle.title }</a><br/>
								</c:otherwise>
							</c:choose>
					</c:forEach>
					<br/>
				</div>
			</div>
			<%--keyword area--%>
			<c:if test="${fn:length(list.keyword) > 0}">
				<c:set var="keywordArray" value="${fn:split(list.keyword,',')}"/>
				<div class="text-center mt-3">
					<c:forEach items="${keywordArray }" var="keyword">
						<span class="badge badge-dark" style="cursor:hand;" onClick="location.href='/tag/${fn:replace(keyword, ' ', '-')}'">#${keyword }</span>
					</c:forEach>
				</div>
			</c:if>
			
			<%-- 댓글창 --%>
			<div id="replyContent_${list.boardId}">
				<c:if test="${fn:length(list.boardReplyEntity) > 0}"><hr/></c:if>
				<c:forEach items="${list.boardReplyEntity}" var="reply">
					<%--메인 댓글 창--%>
					<c:if test="${ reply.depth eq 0}">
						<div class="card mt-2">
							<div class="card-header p-2">
								<table>
									<tr class="align-middle">
										<td rowspan="2" class="pr-2"><i class="fa fa-user-o fa-2x"></i></td>
										<td class="ml">${reply.reply_writer}</td>
									</tr>
									<tr>
										<td>
											<font size="2">${reply.register_datetime}</font> 
											<c:if test="${reply.del_yn eq 'N' }">
												<span style="cursor:pointer" onClick="javascript:showDeleteReplyModal(${list.boardId}, ${reply.reply_id});"><i class="fa fa-window-close fa" aria-hidden="true"></i></span>
											</c:if>
										</td>
									</tr>
								</table>
						    </div>
						    <div class="card-body">
								<p class="card-text">${reply.reply_content }</p>
								<span class="badge badge-dark" style="cursor:pointer"><a onClick="javascript:showReReplyArea(${list.boardId},${reply.reply_id});">답글</a></span>
							</div>
						</div>
					</c:if>
					
					<%--자식 댓글 창 (대댓글)--%>
					<c:if test="${ reply.depth ne 0}">
						<div class="d-flex">
							<div class="p-2"><i class='mt-3 fa fa-reply fa fa-rotate-180' aria-hidden='true'></i></div>
							<div class="flex-fill">
								<div class="card mt-2">
									<div class="card-header">
										<table>
											<tr class="align-middle">
												<td rowspan="2" class="pr-2"><i class="fa fa-user-o fa-2x"></i></td>
												<td class="ml">${reply.reply_writer}</td>
											</tr>
											<tr>
												<td>
													<font size="2">${reply.register_datetime}</font> 
													<c:if test="${reply.del_yn eq 'N' }">
														<span style="cursor:pointer" onClick="javascript:showDeleteReplyModal(${list.boardId}, ${reply.reply_id});"><i class="fa fa-window-close fa" aria-hidden="true"></i></span>
													</c:if>
												</td>
											</tr>
										</table>
									</div>
									<div class="card-body">
										<p class="card-text">${reply.reply_content }</p>
										<c:if test="${reply.del_yn eq 'N' }">
											<span class="badge badge-dark" style="cursor:pointer"><a onClick="javascript:showReReplyArea(${list.boardId},${reply.reply_id}, ${reply.parent_id});">답글</a></span>
										</c:if>
									</div>
								</div>
							</div>
						</div>					
					</c:if>
					
					<%--대댓글 작성 공간 --%>
					<div id="reReply_${reply.reply_id}"></div>
			    	
				</c:forEach>
			</div>
		</div>
	</div>
	
	<%-- 댓글 작성 --%>
	<div class="card mb-2">
		<div class="card-header bg-light">
    		<i class="fa fa-comment fa"></i> REPLY
  		</div>
		<div class="card-body">
 			<ul class="list-group list-group-flush">
			    <li class="list-group-item">
			    <form id = "boardReplyFrm_${list.boardId}">
			    	<table>
			    		<tr>
			    			<td class="align-middle"><label for="replyId"><i class="fa fa-user-circle-o fa"></i></label></td>
			    			<td><input type="text" class="form-control ml-2" placeholder="Enter yourId" id="reply_writer_${list.boardId}" name="reply_writer">
			    			<td class="align-middle"><label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa"></i></label></td>
			    			<td><input type="password" class="form-control ml-2" placeholder="Enter password" id="reply_password_${list.boardId}" name="reply_password"></td>
			    		</tr>
			    	</table>
					<textarea class="form-control mt-2" id="reply_content_${list.boardId}" name="reply_content" rows="3"></textarea>
				</form>
   				<button type="button" class="btn btn-dark" onClick="javascript:addReply(${list.boardId}, 0);">post reply</button>
			    </li>
			</ul>
		</div>
	</div>
</c:forEach>

</div>

<%--paging 영역--%>
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


<!-- 댓글 삭제 Modal -->
<div class="modal fade" id="deleteReplyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteReplyModalLabel">암호를 입력하여 주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        <input class="w-100" type="password" id="deleteReplyPassword">
      </div>
      
      <div class="modal-footer" id="deleteModalArea">
        <button type="button" class="btn btn-primary">삭제</button>
      </div>
    </div>
  </div>
</div>

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

function showDeleteReplyModal(boardId, replyId){
	$("#deleteModalArea").empty();
	$('#deleteReplyPassword').val('');
  	$("#deleteModalArea").append("<button type='button' class='btn btn-primary' onClick='javascript:deleteReply("+boardId+","+replyId+")'>삭제</button>");
	$('#deleteReplyModal').modal('toggle');
}

//댓글을 삭제한다
function deleteReply(boardId, replyId){
	var param = {};
	param.reply_id = replyId;
	param.board_id = boardId;
	param.reply_password = $("#deleteReplyPassword").val();;

	if(param.reply_password == ""){
		alert("암호를 입력하여 주십시오");
		return;
	}
	
	$.ajax({
		type: "POST",
		url: '/deleteBoardReplyAjax',
		data: param,
		success: function(result) {
			if(result){
				$('#deleteReplyModal').modal('toggle');
				$('#deleteReplyPassword').val('');
				getBoardReplyList(boardId);				
			}else{
				alert("암호가 일치하지 않습니다");
			}
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
  	});
}

//게시판 댓글 리스트를 가져온다.
function getBoardReplyList(boardId){
	var param = {};
	param.boardId = boardId;
	
	$.ajax({
		type: "POST",
		url: '/getBoardReplyListAjax',
		data: param,
		success: function(result) {
			clearAndSetReplyContent(result, boardId);
		}
  	});
}

//댓글창을 삭제하고 받아온 리스트로 다시 그린다.
function clearAndSetReplyContent(reply, boardId){
	$("#replyContent_" +boardId ).empty();
	var html = "<hr/>";
		
	reply.forEach(function (item, index, array) {
	    console.log(item, index);
	    
	    if(item.depth == 0){
		    html = html 
	    	+"<div class='card mt-2'>"
	    	+	"<div class='card-header p-2'>"
	    	+ 		"<table>"
	    	+ 			"<tr class='align-middle'>"
			+				"<td rowspan='2' class='pr-2'><i class='fa fa-user-o fa-2x'></i></td>"
			+				"<td class='ml'>"+ item.reply_writer +"</td>"
	        +			"</tr>"
	        +			"<tr>"
			+				"<td>"
	        +					"<font size='2'>"+item.register_datetime+" </font>"; 
	        if(item.del_yn == 'N') html = html + "<span style='cursor:pointer' onClick='javascript:showDeleteReplyModal("+boardId+","+item.reply_id+");'><i class='fa fa-window-close fa' aria-hidden='true'></i></span>";
	        html = html 
	        +				"</td>"
			+			"</tr>"
			+		"</table>"
			+	"</div>"
			+	"<div class='card-body'>"
			+		"<p class='card-text'>"+item.reply_content+"</p>";
			//if(item.del_yn == 'N') html = html + "<span class='badge badge-dark' style='cursor:pointer'><a onClick='javascript:showReReplyArea("+boardId+","+item.reply_id+")'>답글</a></span>";
			html = html
			+"	<span class='badge badge-dark' style='cursor:pointer'><a onClick='javascript:showReReplyArea("+boardId+","+item.reply_id+")'>답글</a></span>"
			+"	</div>"
			+"</div>"
			+"<div id=reReply_"+item.reply_id+"></div>";
	    }else{
	    	html = html
		    +	"<div class='d-flex'>"
			+    	"<div class='p-2'><i class='mt-3 fa fa-reply fa fa-rotate-180' aria-hidden='true'></i></div>"
			+    	"<div class='flex-fill'>"
			+    		"<div class='card mt-2'>"
			+    			"<div class='card-header'>"
			+    				"<table>"
			+    					"<tr class='align-middle'>"
			+    						"<td rowspan='2' class='pr-2'><i class='fa fa-user-o fa-2x'></i></td>"
			+    						"<td class='ml'>"+item.reply_writer+"</td>"
			+    					"</tr>"
			+    					"<tr>"
			+							"<td>"
	        +								"<font size='2'>"+item.register_datetime+" </font>"; 
	        if(item.del_yn == 'N') html = html + "<span style='cursor:pointer' onClick='javascript:showDeleteReplyModal("+boardId+","+item.reply_id+");'><i class='fa fa-window-close fa' aria-hidden='true'></i></span>";
	        html = html 
	        +							"</td>"
			+    					"</tr>"
			+    				"</table>"
			+    			"</div>"
			+    			"<div class='card-body'>"
			+    				"<p class='card-text'>"+item.reply_content+"</p>"
			if(item.del_yn == 'N') html = html + "<span class='badge badge-dark' style='cursor:pointer'><a onClick='javascript:showReReplyArea("+boardId+","+item.reply_id+","+item.parent_id+")'>답글</a></span>";
			html = html
			+    			"</div>"
			+    		"</div>"
			+    	"</div>"
			+    "</div>"
			+"<div id=reReply_"+item.reply_id+"></div>";
	    	
	    }
	});
	
	$("#replyContent_" +boardId).append(html);	
}

//대댓글 작성창 출력 뷰가 그립다
function showReReplyArea(boardId, replyId, parentId){
	if($("#reReplayTable" + replyId).length > 0){
		$("#reReply_" + replyId).empty();
	}else{
		var html = "";
		html = html
		+ "<table class='table table-bordered mt-3' id=reReplayTable"+replyId+">"
		+	"<colgroup>"
		+		"<col width='1%'>"
		+		"<col width='2%'>"
		+		"<col width='*'>"
		+		"<col width='2%'>"
		+		"<col width='*'>"
		+	"</colgroup>"
		+	"<tr>"
		+		"<td rowspan='3' class='align-top'><i class='mt-3 fa fa-reply fa fa-rotate-180' aria-hidden='true'></i></td>"
		+		"<td class='align-middle'><i class='fa fa-user-circle-o fa'></i></td>"
		+		"<td><input type='text' class='form-control' placeholder='Enter yourId' id='reReply_writer_"+replyId+"' name='reply_writer'>"
		+		"<td class='align-middle'><i class='fa fa-unlock-alt fa'></i></td>"
		+		"<td><input type='password' class='form-control' placeholder='Enter password' id='reReply_password_"+replyId+"' name='reply_password'></td>"
		+	"</tr>"
		+	"<tr>"
		+		"<td colspan='4'>"
		+			"<textarea class='form-control' id='reReply_content_"+replyId+"' name='reply_content' rows='3'></textarea>"
		+		"</td>"
		+	"</tr>"
		+	"<tr>"
		+		"<td colspan='4'>";
		if(parentId != null && parentId != '' && parentId != 'undefined'){
			html = html  
				+ "<button type='button' class='btn btn-dark' onClick='addReReply("+boardId+","+replyId+", "+parentId+")'>post reply</button>";
		} 
		else{
			html = html  
				+ "<button type='button' class='btn btn-dark' onClick='addReReply("+boardId+","+replyId+")'>post reply</button>";
		}
		html = html  
		+		"</td>"
		+	"</tr>"
		+	"</table>";
		
		$("#reReply_" + replyId).append(html);		
		$("#reReply_writer_" + replyId).focus();
	}
}

//대댓글 작성 
function addReReply(boardId, replyId, parentId){
	param = {};
	param.reply_writer = $("#reReply_writer_"+replyId).val();
	param.reply_password = $("#reReply_password_"+replyId).val();
	param.reply_content = $("#reReply_content_"+replyId).val();
	
	if(parentId != null && parentId != '' && parentId != 'undefined'){
		param.parent_id = parentId;
	}else{
		param.parent_id = replyId;
	}
	param.board_id = boardId;
	param.depth = 1;
	
	if(param.reply_writer == ""){
		alert("아이디를 입력하세요");
		return;
	}
	if(param.reply_password == ""){
		alert("암호를 입력하세요");
		return;
	}
	if(param.reply_content == ""){
		alert("댓글내용이 존재하지 않습니다");
		return;
	}
	
	$.ajax({
		type: "POST",
		url: '/addReply',
		data: param,
		success: function(msg) {
			$("#reReply_" + replyId).empty();
			getBoardReplyList(boardId);
		}
  	});
	
}

function addReply(boardId, depth){	
	var param = $("#boardReplyFrm_" + boardId).serializeObject();
	param.board_id = boardId;
	param.depth = depth;
	
	if(param.reply_writer == ""){
		alert("아이디를 입력하세요");
		return;
	}
	if(param.reply_password == ""){
		alert("암호를 입력하세요");
		return;
	}
	if(param.reply_content == ""){
		alert("댓글내용이 존재하지 않습니다");
		return;
	}
	
	$.ajax({
		type: "POST",
		url: '/addReply',
		data: param,
		success: function(msg) {
			getBoardReplyList(boardId);
			$("#reply_writer_" + boardId).val("");
			$("#reply_password_" + boardId).val("");
			$("#reply_content_" + boardId).val("");
		}
  	});
}
</script>


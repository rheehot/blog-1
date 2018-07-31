package com.sang12.blog.vo.common;

import java.io.Serializable;

import lombok.Data;

/**
 * com.sang12.blog.vo.common
 * PagingVo.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 30.
 * @Description : 공통 paging vo
 */
@Data
public class PagingVo implements Serializable {

	private static final long serialVersionUID = -8380031519896341326L;
	
	//db에서 페이징 할 시작번호
	private int start;
	
	//db에서 페이징 할 종료번호
	private int end;
	
	//현재페이지
	private int page;
	
	//하단에 ㅇ표시 할 페이징 범위
	private int countPage;
	
	//출력될 게시 물 수 
	private int countList;
	
	//총 게시물 수
	private int totalCount;
	
	//전체 페이지 수
	private int totalPage;
	
	//하단에 표시할 페이지 시작 번호
	private int startPage;
	
	//하단에 표시할 페이지 마지막 번호 
	private int endPage;
	
	public void setPaging() {
		totalPage = totalCount / countList;

		if (totalCount % countList > 0) {
		    totalPage++;
		}
		
		if (totalPage < page) {
		    page = totalPage;
		}
		
		startPage = ((page - 1) / 10) * 10 + 1;
		endPage = startPage + countPage - 1;
		
		if (endPage > totalPage) {
		    endPage = totalPage;
		}
	}
	
}

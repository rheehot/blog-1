package com.sang12.blog.service.common;

import com.sang12.blog.domain.board.Board;

/**
 * com.sang12.blog.service.common
 * BoardService.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 25.
 * @Description : 게시판 관련 서비스 
 */
public interface BoardService {
	public abstract void articleSave(Board board);
}

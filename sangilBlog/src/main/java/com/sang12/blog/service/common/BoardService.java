package com.sang12.blog.service.common;

import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.vo.admin.boardVo;

/**
 * com.sang12.blog.service.common
 * BoardService.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 25.
 * @Description : 게시판 관련 서비스 
 */
public interface BoardService {
	public abstract void articleSave(BoardEntity board);
	
	public abstract void articleUpdate(BoardEntity board);
	
	public abstract Page<BoardEntity> getMainArticleList(Pageable pageable);
	
	public abstract Map<String, Object> getAdminArticleList(boardVo vo);
	
	public abstract BoardEntity getArticleDetail(int boardId);
}

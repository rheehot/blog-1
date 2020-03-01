package com.sang12.blog.service.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.domain.board.BoardReplyEntity;
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
	
	
	/**
	 * main page호출시 데이터를 가져옴.
	 * @param vo
	 * @return
	 */
	public abstract Map<String, Object> getArticle(int boardId);
	
	/**
	 * 댓글 저장
	 * @param boardId
	 * @return
	 */
	public abstract Boolean addReply(BoardReplyEntity boardReply);
	
	
	/**
	 * 댓글 저장
	 * @param boardId
	 * @return
	 */
	public abstract List<BoardReplyEntity> getBoardReplyList(BoardEntity board);

	/**
	 * 댓글 삭제
	 * @param boardId
	 * @return
	 */
	public abstract Boolean deleteBoardReply(BoardReplyEntity boardReply);
}

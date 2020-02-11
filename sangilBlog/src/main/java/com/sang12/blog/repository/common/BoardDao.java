package com.sang12.blog.repository.common;

import java.util.List;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.domain.board.BoardReplyEntity;
import com.sang12.blog.domain.board.RelateBoardTitleEntity;
import com.sang12.blog.vo.admin.boardVo;
import com.sang12.blog.vo.common.PagingVo;
import com.sang12.blog.vo.front.MainPageVo;

/**
 * com.sang12.blog.repository.common
 * BoardDao.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 29.
 * @Description : 
 */
public interface BoardDao {
	public List<BoardEntity> getMainArticle(PagingVo vo);
	
	public List<RelateBoardTitleEntity> getRelateBoardTitleList(BoardEntity board);
	
	public List<BoardEntity> getMainArticleByBoardId(int boardId);
	
	int getMainArticleCount(MainPageVo vo);
	
	public List<BoardEntity> getAdminArticleList(boardVo vo);
	
	int getAdminArticleListCount(boardVo vo);
	
	public BoardEntity getArticleDetail(int boardId);
	
	public List<BoardEntity> getRssArticleList();
	
	public List<BoardEntity> saerchKeyword(String Keyword);
	
	/**
	 * addReply
	 * @param boardReply
	 */
	public void addReply(BoardReplyEntity boardReply);
	
	/**
	 * getReplyList
	 * @param board
	 * @return
	 */
	public List<BoardReplyEntity> getReplyList(BoardEntity board);
	
	/**
	 * getReplyList
	 * @param board
	 * @return
	 */
	public List<BoardReplyEntity> getReplyList(BoardReplyEntity board);
}

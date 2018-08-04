package com.sang12.blog.repository.common;

import java.util.List;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.vo.common.PagingVo;

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
	
	int getMainArticleCount();
}

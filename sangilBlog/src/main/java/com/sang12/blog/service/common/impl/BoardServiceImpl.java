package com.sang12.blog.service.common.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.repository.common.BoardDao;
import com.sang12.blog.repository.common.BoardRepository;
import com.sang12.blog.service.common.BoardService;
import com.sang12.blog.vo.common.PagingVo;

/**
 * com.sang12.blog.service.common.impl
 * BoardServiceImpl.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 25.
 * @Description : board 서비스 구현체 
 */

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardRepository boardRep;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void articleSave(BoardEntity board) {
		board.setRegisterDate(new Date());
		board.setFinalChangeDate(new Date());
		boardRep.save(board);
	}

	@Override
	public Page<BoardEntity> getMainArticleList(Pageable pageable) {
		Page<BoardEntity> board = boardRep.findAll(pageable);
		return board;
	}

	@Override
	public Map<String, Object> getMainBoardList(PagingVo vo) {
		Map<String, Object> returnData = new HashMap<String, Object>();
		vo.setTotalCount(boardDao.getMainArticleCount());
		returnData.put("paging", vo);
		returnData.put("articleList", boardDao.getMainArticle(vo));
		return returnData;
	}

}

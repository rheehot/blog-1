package com.sang12.blog.service.common.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.sang12.blog.domain.board.Board;
import com.sang12.blog.repository.common.BoardRepository;
import com.sang12.blog.service.common.BoardService;

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
	
	@Override
	public void articleSave(Board board) {
		board.setRegisterDate(new Date());
		board.setFinalChangeDate(new Date());
		boardRep.save(board);
	}

	@Override
	public Page<Board> getMainArticleList(Pageable pageable) {
		return boardRep.findAll(pageable);
	}

}

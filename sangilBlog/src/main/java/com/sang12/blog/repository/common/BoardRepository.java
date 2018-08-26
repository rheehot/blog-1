package com.sang12.blog.repository.common;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.sang12.blog.domain.board.BoardEntity;

public interface BoardRepository  extends JpaRepository<BoardEntity, Long>{ 
	Page<BoardEntity> findAllByOrderByBoardId(Pageable pageable);
}

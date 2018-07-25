package com.sang12.blog.repository.common;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sang12.blog.domain.board.Board;

public interface BoardRepository  extends JpaRepository<Board, Integer>{ 

}

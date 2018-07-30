package com.sang12.blog.repository.security;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.repository.common.BoardDao;

/**
 * com.sang12.blog.repository.security
 * BoardDaoTest.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 29.
 * @Description : boardDao Test
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class BoardDaoTest {
	@Autowired
	private BoardDao boardDao;
	
	@Test
	public void getMainArticleTest() {
		List<BoardEntity> board = boardDao.getMainArticle();
		System.out.println("#######################################"+board);

	}
}

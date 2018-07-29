package com.sang12.blog.repository.security;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sang12.blog.repository.common.BoardRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BoardRepositoryTest {
	@Autowired
	private BoardRepository boardRep;
	
	@Autowired
	private DataSource ds;
		
	@Test
	public void userObjectTest() throws SQLException {
		//PageRequest request = new PageRequest(0, 10, Direction.DESC, "boardId");
		//Page<Board> board = boardRep.findAllMainAtricle(request);
		//System.out.println(board.getContent());
		
		
		//List<Board> board = boardRep.test123();
		//System.out.println(boardRep.test123());
		
	}
}

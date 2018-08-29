package com.sang12.blog.repository.security;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BoardRepositoryTest {
	
/*	@Autowired
	private DataSource ds;*/
		
	@Test
	public void userObjectTest() throws SQLException {
		//PageRequest request = new PageRequest(0, 10, Direction.DESC, "boardId");
		//Page<Board> board = boardRep.findAllMainAtricle(request);
		//System.out.println(board.getContent());
		
		
		//List<Board> board = boardRep.test123();
		//System.out.println(boardRep.test123());
		
	}
	
	@Test
	public void boardTest() {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("start", 10);
		parameterMap.put("length", 10);
		//System.out.println("data::"+boardDao.getAdminArticleList(parameterMap));
	}
}

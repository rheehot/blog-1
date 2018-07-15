package com.sang12.blog.repository.security;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sang12.blog.repository.common.JoinCountRepository;
import com.sang12.blog.utils.DateUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JoinCountRepositoryTest {
	@Autowired
	private JoinCountRepository joinCountRep;
		
	@Test
	public void userObjectTest() {
		int testVal = joinCountRep.findByTodayCount(DateUtil.addDayGetString(0));
		System.out.println(testVal);
		
		System.out.println(DateUtil.getLastDayOfMonth());
	}
}

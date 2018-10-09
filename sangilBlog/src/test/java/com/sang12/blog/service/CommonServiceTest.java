package com.sang12.blog.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sang12.blog.domain.common.JoinCountEntity;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.utils.DateUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CommonServiceTest {
	@Autowired
	private CommonService commonService;
	
	//@Test
	public void joinCountListTest() {
		List<JoinCountEntity> list = commonService.getJoinCount(DateUtil.addDayGetString(-7), DateUtil.addDayGetString(0));
		System.out.println(list);
	}
	
	@Test
	public void getMainData() {
		
	}

}

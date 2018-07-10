package com.sang12.blog.repository.security;

import java.util.Calendar;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.sang12.blog.domain.security.User;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserRepositoryTest {
	@Autowired
	private UserRepository userRepo;
		
	@Test
	public void userObjectTest() {
		User user;
		user = userRepo.findByUserIdAndPassword("sang12", "test");
		System.out.println(user);
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, 1);
		Date date = calendar.getTime();
		System.out.println(date);
	}
}

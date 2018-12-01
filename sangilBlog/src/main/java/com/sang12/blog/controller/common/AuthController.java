package com.sang12.blog.controller.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sang12.blog.domain.security.UserEntity;
import com.sang12.blog.repository.security.UserRepository;

@Controller
@RequestMapping("/common")
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	private UserRepository userRepo;

	@PostMapping("/login")
	@ResponseBody
	public Map<String, Object> login(@RequestBody UserEntity user, HttpServletRequest request) throws Exception {
		user = this.userRepo.findByUserIdAndPassword(user.getUserId(), user.getPassword());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug(user +"");
		
		if (user != null)
		{
			 HttpSession session = request.getSession(false);
			 session.setAttribute("user", user.getUserId());
			 returnMap.put("isReceived", true);
			 return returnMap;
		}
			
		returnMap.put("isReceived", false);
		return returnMap;
	  }
}

package com.sang12.blog.controller.md;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * ADMIN CONTROLLER 
 */

@Controller
@RequestMapping("/md")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/main")
	public String adminMain(){
		logger.info("admin Controller");
		return "md/main_md";
	}
	
	@RequestMapping("/login")
	public String loginPage(){
		return "md/login_md";
	}
}

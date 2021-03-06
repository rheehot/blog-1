package com.sang12.blog.controller.md;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sang12.blog.domain.common.CategoryEntity;
import com.sang12.blog.service.common.CommonService;

/*
 * ADMIN CONTROLLER 
 */

@Controller
@RequestMapping("/md")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/main")
	public String adminMain(){
		logger.debug("admin Controller");
		return "md/main_md";
	}
	
	@RequestMapping("/login")
	public String loginPage(){
		return "md/login_md";
	}
	
	@RequestMapping("/categoryManagement")
	public ModelAndView categoryManagement(){
		List<CategoryEntity> categoryList= commonService.getCategoryList(0);
		return new ModelAndView("md/categoryManagement", "data", categoryList);
	}
}

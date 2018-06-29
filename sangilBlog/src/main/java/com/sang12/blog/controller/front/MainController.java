package com.sang12.blog.controller.front;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/*
	@RequestMapping("/main")
	public ModelAndView main() throws Exception {
		ModelMap model = new ModelMap();
		logger.info("main Controller");
		return new ModelAndView("front/main", "data", model);
	}
	*/
	
	@RequestMapping("front/main")
	public String main(){
		ModelMap model = new ModelMap();
		logger.info("main Controller");
		return "front/main";
	}
	
	@RequestMapping("front/main_test")
	public String main_test(){
		ModelMap model = new ModelMap();
		logger.info("main Controller");
		return "front/main_test";
	}
	
	@RequestMapping("/md/test")
	public String main2(){
		ModelMap model = new ModelMap();
		logger.info("main Controller");
		return "front/main";
	}
	
	@GetMapping("/articleDetail/{articleId}")
	public ModelAndView boardDetail(@PathVariable int articleId) throws Exception {
		System.out.println("articleId:::" + articleId);
		return new ModelAndView("front/articleDetail", "data", "");
	}
}

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
@RequestMapping("front")
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
	
	@RequestMapping("/main")
	public String main(){
		ModelMap model = new ModelMap();
		logger.info("main Controller");
		return "front/main";
	}
	
	@RequestMapping("/intro")
	public String intro(){
		return "front/intro";
	}
	
	@RequestMapping("/logbook")
	public ModelAndView logbook(){
		return new ModelAndView("front/logbook");
	}
	
	@RequestMapping("/guestbook")
	public ModelAndView guestbook(){
		return new ModelAndView("front/guestbook");
	}
	
	@RequestMapping("/main_test")
	public String main_test(){
		ModelMap model = new ModelMap();
		logger.info("main Controller");
		return "front/main_test";
	}
	
	@GetMapping("/articleDetail/{articleId}")
	public ModelAndView boardDetail(@PathVariable int articleId) throws Exception {
		System.out.println("articleId:::" + articleId);
		return new ModelAndView("front/articleDetail", "data", "");
	}
}

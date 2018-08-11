package com.sang12.blog.controller.front;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.vo.common.PagingVo;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/main")
	public ModelAndView main(PagingVo vo){
		logger.info("vo:::::"+vo);
		Map<String, Object> data = commonService.getMainData(vo);
		logger.info("data:::::"+data);
		return new ModelAndView("front/main", "mainData", data);
	}
	
	@RequestMapping("/main/{largeCategory}")
	public ModelAndView mainBoardCategory(PagingVo vo, @PathVariable int largeCategory){
		logger.info("vo:::::"+vo);
		logger.info("vo:::::"+largeCategory);
		Map<String, Object> data = commonService.getMainData(vo);
		logger.info("data:::::"+data);
		return new ModelAndView("front/main", "mainData", data);
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
	
	@GetMapping("/articleDetail/{articleId}")
	public ModelAndView boardDetail(@PathVariable int articleId) throws Exception {
		System.out.println("articleId:::" + articleId);
		return new ModelAndView("front/articleDetail", "data", "");
	}
}

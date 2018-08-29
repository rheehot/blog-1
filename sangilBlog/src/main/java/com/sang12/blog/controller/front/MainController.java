package com.sang12.blog.controller.front;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rometools.rome.feed.rss.Channel;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.vo.front.MainPageVo;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/")
	public ModelAndView main(MainPageVo vo){
		logger.info("vo:::::"+vo);
		Map<String, Object> data = commonService.getMainData(vo);
		logger.info("data:::::"+data);
		return new ModelAndView("front/main", "mainData", data);
	}
	
	@RequestMapping("/{articleId}")
	public ModelAndView getArticle(@PathVariable int articleId){
		Map<String, Object> data = commonService.getArticle(articleId);
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
	public ModelAndView boardDetail(@PathVariable int articleId) {
		System.out.println("articleId:::" + articleId);
		return new ModelAndView("front/articleDetail", "data", "");
	}
	
	@GetMapping(path = "/rss")
	@ResponseBody
	public Channel rss() {
		return commonService.getRssList();
	}
}

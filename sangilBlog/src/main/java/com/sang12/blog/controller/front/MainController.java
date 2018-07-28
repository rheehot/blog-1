package com.sang12.blog.controller.front;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sang12.blog.domain.board.Board;
import com.sang12.blog.service.common.BoardService;


@Controller
@RequestMapping("front")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/main")
	public ModelAndView main( @PageableDefault(value = 5, sort="boardId", direction = Direction.DESC) Pageable pageable){
		logger.info("param:"+pageable);
		Page<Board> data = boardService.getMainArticleList(pageable);
		logger.info("data:"+data);
		return new ModelAndView("front/main", "articleList", data);
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

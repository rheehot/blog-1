package com.sang12.blog.controller.common;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sang12.blog.domain.board.Board;
import com.sang12.blog.domain.common.Category;
import com.sang12.blog.service.common.BoardService;
import com.sang12.blog.service.common.CommonService;

/**
 * 게시판 컨트롤러
 * @author Choi Sang Il
 *
 */
@Controller
@RequestMapping("/common")
public class BoardController {
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/getCategoryList")
	@ResponseBody
	public Map<String, Object> getCategoryList(Category category){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("param::"+category);
		map.put("data", commonService.getCategoryList(category.getParentId()));
		return map;
	}
	
	@PostMapping("/writeArticle")
	@ResponseBody
	public boolean writeArticle(Board board){
		System.out.println("param::"+board);
		boardService.articleSave(board);
		return true;
	}
}

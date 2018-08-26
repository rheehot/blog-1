package com.sang12.blog.controller.md;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.service.common.BoardService;
import com.sang12.blog.service.common.StorageService;
import com.sang12.blog.vo.admin.boardVo;

/**
 * 게시판 컨트롤러
 * @author Choi Sang Il
 *
 */
@Controller
@RequestMapping("/md")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private StorageService storageService;
	
	@Value("${static.image.path}")
	String imagePath;
	
	@RequestMapping("/writeArticle")
	public ModelAndView writeArticle(){
		return new ModelAndView("md/writeArticle");
	}
	
	@RequestMapping("/modifyArticle/{articleId}")
	public ModelAndView modifyArticle(@PathVariable int articleId){
		System.out.println(articleId);
		return new ModelAndView("md/modifyArticle", "data", boardService.getArticleDetail(articleId));
	}
	
	@RequestMapping("/board")
	public ModelAndView board(){
		return new ModelAndView("md/board");
	}
	
	@PostMapping("/writeArticle")
	@ResponseBody
	public boolean writeArticle(BoardEntity board){
		boardService.articleSave(board);
		return true;
	}
	
	@PostMapping("/uploadArticleImage")
	@ResponseBody
	public String handleFileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request){
		try{
			String imageUrl = this.storageService.imageStore(file);
			String address = request.getRequestURL().toString().replace(request.getRequestURI(), "");
			System.out.println("###########"+address + this.imagePath + imageUrl);
			return address + this.imagePath + imageUrl;
	    }catch (Exception e){
	      e.printStackTrace();
	    }
	    return null;
	}
	
	@PostMapping("/getAdminArticleList")
	@ResponseBody
	public Map<String, Object> getArticleList(boardVo vo){
		System.out.println("parameterMap::"+vo);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = boardService.getAdminArticleList(vo);
		System.out.println("return" + returnMap);
		return returnMap;
	}
	
	@PostMapping("/modifyArticle")
	@ResponseBody
	public boolean modifyArticle(BoardEntity board){
		boardService.articleUpdate(board);
		return true;
	}
	
}

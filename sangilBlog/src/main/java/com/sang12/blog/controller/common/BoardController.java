package com.sang12.blog.controller.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sang12.blog.domain.board.BoardEntity;
import com.sang12.blog.domain.common.CategoryEntity;
import com.sang12.blog.service.common.BoardService;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.service.common.StorageService;

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
	
	@Autowired
	private StorageService storageService;
	
	@Value("${static.image.path}")
	String imagePath;
	
	@PostMapping("/getCategoryList")
	@ResponseBody
	public Map<String, Object> getCategoryList(CategoryEntity category){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", commonService.getCategoryList(category.getParentId()));
		return map;
	}
	
	@PostMapping("/writeArticle")
	@ResponseBody
	public boolean writeArticle(BoardEntity board){
		System.out.println("param::"+board);
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
}

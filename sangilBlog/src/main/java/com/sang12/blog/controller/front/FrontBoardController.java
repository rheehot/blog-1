package com.sang12.blog.controller.front;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sang12.blog.domain.board.BoardReplyEntity;
import com.sang12.blog.domain.common.CategoryEntity;
import com.sang12.blog.service.common.BoardService;

@Controller
public class FrontBoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/{articleId}")
	public RedirectView getArticle(@PathVariable int articleId){
		RedirectView redirectView = null;
		try {
			Map<String, Object> data = boardService.getArticle(articleId);
			String articleTitle = data.get("mainTitle") + "";
			articleTitle = URLEncoder.encode(articleTitle.replaceAll(" ", "-").replaceAll("/", ""), "UTF-8");
			String redirectUrl = "/" + articleId + "/" + articleTitle;
		    redirectView = new RedirectView(redirectUrl);
		    redirectView.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    return redirectView ;
	}
	
	/**
	 * domain/articleId/title로 상세 검색한다. (구글 아날리틱스에서 게시판 번호만 나와서 이름도 가져오게끔 변경)
	 * @param articleId
	 * @return
	 */
	@RequestMapping("/{articleId}/{title}")
	public ModelAndView getArticleTitle(@PathVariable int articleId, @PathVariable String title){
		Map<String, Object> data = boardService.getArticle(articleId);
		return new ModelAndView("front/main", "mainData", data);
	}
	
	/**
	 * 댓글 저장
	 * @param category
	 * @return
	 */
	@PostMapping("/addReply")
	@ResponseBody
	public Boolean addReply(BoardReplyEntity boardReply){
		boardService.addReply(boardReply);
		return true;
	}
}

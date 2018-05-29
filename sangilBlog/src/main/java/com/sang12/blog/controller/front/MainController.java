package com.sang12.blog.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {

	@RequestMapping("/main")
	public ModelAndView main() throws Exception {
		ModelMap model = new ModelMap();
		return new ModelAndView("front/main", "data", model);
	}
	
	@GetMapping("/articleDetail/{articleId}")
	public ModelAndView boardDetail(@PathVariable int articleId) throws Exception {
		System.out.println("articleId:::" + articleId);
		return new ModelAndView("front/articleDetail", "data", "");
	}
}

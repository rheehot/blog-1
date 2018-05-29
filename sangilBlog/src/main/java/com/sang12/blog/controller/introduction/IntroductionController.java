package com.sang12.blog.controller.introduction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroductionController {
	@RequestMapping("/about")
	public String main() {
		////1234435345345345345
		return "about";
	}
}
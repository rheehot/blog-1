package com.sang12.blog.controller.front;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author Choi Sang Il
 * LabController
 */

@Controller
@RequestMapping("/lab")
public class LabController {
	
	@RequestMapping("/bootstrap4")
	public ModelAndView main(){
		System.out.println("test##################################3");
		return new ModelAndView("lab/bootstrap4/helloBootStrap4");
	}
	
}

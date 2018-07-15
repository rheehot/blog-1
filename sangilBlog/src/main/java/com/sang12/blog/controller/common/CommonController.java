package com.sang12.blog.controller.common;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sang12.blog.service.common.CommonService;

@Controller
@RequestMapping("/common")
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@PostMapping("/getJoinCountList")
	@ResponseBody
	public Map<String, Object> getJoinCount(){
		logger.debug("getJoinCountList Controller");
		return commonService.getJoinCountTotalList();
	}
}

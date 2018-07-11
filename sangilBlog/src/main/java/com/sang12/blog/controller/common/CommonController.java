package com.sang12.blog.controller.common;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sang12.blog.domain.common.JoinCount;
import com.sang12.blog.service.common.CommonService;
import com.sang12.blog.utils.DateUtil;

@Controller
@RequestMapping("/common")
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@PostMapping("/getJoinCountList")
	@ResponseBody
	public List<JoinCount> getJoinCount(){
		logger.debug("getJoinCountList Controller");
		return commonService.getJoinCount(DateUtil.addDayGetString(-7), DateUtil.addDayGetString(0));
	}
}

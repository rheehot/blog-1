package com.sang12.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sang12.blog.service.common.CommonService;

/*
 * 방문자 카운터용 인터셉터
 */

@Component
public class FrontSessionInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(FrontSessionInterceptor.class);
	@Autowired
	private CommonService commonService;
  
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		logger.debug("Front Session Interceptor");
		HttpSession session = request.getSession(false);
		if(session != null){
			return true;
		}
		session = request.getSession();
		commonService.checkAndCount();
		return true;
	}
}

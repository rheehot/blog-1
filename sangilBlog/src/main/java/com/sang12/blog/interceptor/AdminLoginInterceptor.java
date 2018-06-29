package com.sang12.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 *  Admin Login Interceptor
 *  2018. 06. 03 Choi Sang Il 
 */

@Component
public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(PageNotFoundInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession(false);
		if(session != null) {
			String userId = (String)session.getAttribute("userId");
			if (userId != null){
				logger.info("login::true");
				return true;
			}else {
				logger.info("login::false");
				response.sendRedirect("/md/login");
			}
		}
		return true;
	}
}

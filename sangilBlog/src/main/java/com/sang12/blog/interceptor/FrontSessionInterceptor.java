package com.sang12.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 방문자 카운터용 인터셉터
 */

@Component
public class FrontSessionInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(FrontSessionInterceptor.class);
	//@Autowired
	//private CommonService commonService;
  
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		/*
		String requestURI = request.getRequestURI();
		HttpSession session = request.getSession(false);
		if (requestURI.substring(0, 3).equals("/md") && session != null){
			String userId = (String)session.getAttribute("user");
			if (userId != null){
				logger.info("MD 세션에 USER존재 로긍니처리");
				return true;
			}
			logger.info("MD 세션에 USER존재하지 않음. 로그인페이지로 리다이렉트");
			response.sendRedirect("/login");
			return false;
		}
		*/
		logger.info("Front Session Interceptor");
		HttpSession session = request.getSession(false);
		if(session != null){
			return true;
		}
		session = request.getSession();
		//this.commonService.checkAndCount();
		return true;
	}
}

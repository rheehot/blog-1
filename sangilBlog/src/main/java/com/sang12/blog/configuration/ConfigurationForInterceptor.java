package com.sang12.blog.configuration;

import com.sang12.blog.interceptor.AdminLoginInterceptor;
import com.sang12.blog.interceptor.FrontSessionInterceptor;
import com.sang12.blog.interceptor.PageNotFoundInterceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class ConfigurationForInterceptor extends WebMvcConfigurerAdapter{
	@Autowired
	FrontSessionInterceptor frontSessionInterceptor;
	
	@Autowired
	PageNotFoundInterceptor pageNotFoundInterceptor;
	
	@Autowired
	AdminLoginInterceptor adminLoginInterceptor;
  
	public void addInterceptors(InterceptorRegistry registry){
		registry.addInterceptor(this.frontSessionInterceptor)
				.addPathPatterns("/front/**")
				.excludePathPatterns("/md/**");
		
		registry.addInterceptor(this.adminLoginInterceptor).addPathPatterns("/md/**")
		.excludePathPatterns("/front/**")
		.excludePathPatterns("/md/login*");
		
		registry.addInterceptor(this.pageNotFoundInterceptor).addPathPatterns("/**")
				.excludePathPatterns("/md/**")
				.excludePathPatterns("/front/**")
				.excludePathPatterns("/common/**")
				.excludePathPatterns("/pageNotFound");
		//excludePathPatterns�뒗 而⑦듃濡ㅻ윭�뿉 嫄몃졇�쓣�븣 requestMapping�씠 /md濡� �젒洹쇳뻽�쓣 寃쎌슦�뿉留� �븞�깂�떎.
	}
}

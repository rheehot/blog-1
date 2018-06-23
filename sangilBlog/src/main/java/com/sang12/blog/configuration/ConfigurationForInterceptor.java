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
		.excludePathPatterns("/front/**");
		
		registry.addInterceptor(this.pageNotFoundInterceptor).addPathPatterns("/**")
				.excludePathPatterns("/md/**")
				.excludePathPatterns("/front/**")
				.excludePathPatterns("/pageNotFound");
		//excludePathPatterns는 컨트롤러에 걸렸을때 requestMapping이 /md로 접근했을 경우에만 안탄다.
	}
}

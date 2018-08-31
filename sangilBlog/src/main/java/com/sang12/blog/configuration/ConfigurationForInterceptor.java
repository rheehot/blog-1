package com.sang12.blog.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.sang12.blog.interceptor.AdminLoginInterceptor;
import com.sang12.blog.interceptor.FrontSessionInterceptor;
import com.sang12.blog.interceptor.PageNotFoundInterceptor;

@Configuration
public class ConfigurationForInterceptor extends WebMvcConfigurerAdapter{
	@Autowired
	FrontSessionInterceptor frontSessionInterceptor;
	
	@Autowired
	PageNotFoundInterceptor pageNotFoundInterceptor;
	
	@Autowired
	AdminLoginInterceptor adminLoginInterceptor;
  
	public void addInterceptors(InterceptorRegistry registry){
		registry.addInterceptor(this.frontSessionInterceptor).addPathPatterns("/*")
				.excludePathPatterns("/md/**");
		
		registry.addInterceptor(this.adminLoginInterceptor).addPathPatterns("/md/**")
		.excludePathPatterns("/md/login*");
	}
}

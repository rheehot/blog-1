package com.sang12.blog.configuration;

import com.sang12.blog.interceptor.CountInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class ConfigurationForInterceptor extends WebMvcConfigurerAdapter{
	@Autowired
	CountInterceptor countInterceptor;
  
	public void addInterceptors(InterceptorRegistry registry){
		registry.addInterceptor(this.countInterceptor)
				.addPathPatterns("/front/**")
				.excludePathPatterns("/md/**");
				//excludePathPatterns는 컨트롤러에 걸렸을때 requestMapping이 /md로 접근했을 경우에만 안탄다.
	}
}

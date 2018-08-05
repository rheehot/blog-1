package com.sang12.blog.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class ConfigurationForStaticResource extends WebMvcConfigurerAdapter {

	@Value("${static.resource.location}")
	private String staticResouceLocation;
	
	public void addResourceHandlers(ResourceHandlerRegistry registry){
		registry.addResourceHandler("/upload/**").addResourceLocations(this.staticResouceLocation);
	}
}

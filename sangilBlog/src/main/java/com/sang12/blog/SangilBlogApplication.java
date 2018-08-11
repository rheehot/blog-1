package com.sang12.blog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;



@SpringBootApplication
public class SangilBlogApplication extends SpringBootServletInitializer  {

	public static void main(String[] args) {
		SpringApplication.run(SangilBlogApplication.class, args);
	}
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SangilBlogApplication.class);
    }
	
	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {
		
	return new EmbeddedServletContainerCustomizer() {
		@Override
		public void customize(ConfigurableEmbeddedServletContainer container) {
			ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/pageNotFound");
			container.addErrorPages(error404Page);
		}};
	}
}

package com.sang12.blog.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

/**
 * com.sang12.blog.configuration
 * ConfigurationForMaybatis.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 7. 29.
 * @Description : mybatis 설정
 */
@Configuration
@MapperScan(value = {"com.sang12.blog.repository"})
public class ConfigurationForMaybatis {
	/**
     * SqlSessionFactory 설정
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource)throws Exception{
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
    	Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*Mapper.xml");
        sessionFactory.setMapperLocations(res);
        return sessionFactory.getObject();
    }

}

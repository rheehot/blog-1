package com.sang12.blog;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class SangilBlogApplicationTests {

	@Autowired
	private DataSource ds; 
	  
	@Test
	public void contextLoads() {
	}
	
	//@Test
    public void testConnection() throws Exception{ //작성
        System.out.println("ds : "+ds);
        Connection con = ds.getConnection(); //ds(DataSource)에서 Connection을 얻어내고
        
        System.out.println("con : "+con); //확인 후        
        con.close(); //close
    }


}

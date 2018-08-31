package com.sang12.blog.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.rometools.rome.feed.rss.Category;

/**
 * com.sang12.blog.utils
 * ObjectUtils.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 8. 31.
 * @Description : Object Utils
 */
public class ObjectUtils {
	public static List<Category> getCategory(String target,String splitType) {
		List<Category> categoryList = new ArrayList<Category>();
		List<String> list = new ArrayList<String>(Arrays.asList(target.split(splitType)));
		for(String targetString : list) {
			Category category = new Category();
			category.setValue(targetString);
			categoryList.add(category);
		}
		return categoryList;
	}
}

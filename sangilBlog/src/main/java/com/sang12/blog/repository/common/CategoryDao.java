package com.sang12.blog.repository.common;

import java.util.List;

import com.sang12.blog.domain.common.CategoryEntity;

/**
 * com.sang12.blog.repository.common
 * CategoryDao.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 8. 7.
 * @Description : category dao
 */
public interface CategoryDao {
	public List<CategoryEntity> getLargeCategoryList();
}

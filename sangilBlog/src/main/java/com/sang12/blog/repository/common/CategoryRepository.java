package com.sang12.blog.repository.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sang12.blog.domain.common.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	List<Category> findByParentId(int parentId);
	
	@Query(value="SELECT categoryName FROM COMM03TM WHERE categoryId = :categoryId", nativeQuery = true)
	String findCategoryNameByCategoryId(@Param("categoryId") Integer categoryId);
}

package com.sang12.blog.repository.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sang12.blog.domain.common.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer>{
	List<CategoryEntity> findByParentIdOrderBySortNumber(int parentId);
	
	@Query(value="SELECT categoryName FROM COMM03TM WHERE categoryId = :categoryId", nativeQuery = true)
	String findCategoryNameByCategoryId(@Param("categoryId") Integer categoryId);
	
	@Query(value="SELECT * FROM COMM03TM WHERE parentId <> 0", nativeQuery=true)
	List<CategoryEntity> findChildCategory();
	
}

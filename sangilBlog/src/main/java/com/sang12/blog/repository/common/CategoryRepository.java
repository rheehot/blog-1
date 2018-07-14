package com.sang12.blog.repository.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sang12.blog.domain.common.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	List<Category> findByParentId(int parentId);
}

package com.sang12.blog.service.common;

import java.util.List;

import com.sang12.blog.domain.common.Category;
import com.sang12.blog.domain.common.JoinCount;

public interface CommonService {
	public abstract void checkAndCount();
	
	public abstract List<JoinCount> getJoinCount(String fromDate, String toDate);
	
	/**
	 * 부모카테고리(0) 부터 자식카테고리 리스트를 카테고리 번호로 가져온다.
	 * @param CategoryNumber
	 * @return
	 */
	public abstract List<Category> getCategoryList(int CategoryNumber);
}

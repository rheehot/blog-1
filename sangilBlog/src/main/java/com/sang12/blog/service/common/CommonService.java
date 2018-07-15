package com.sang12.blog.service.common;

import java.util.List;
import java.util.Map;

import com.sang12.blog.domain.common.Category;
import com.sang12.blog.domain.common.JoinCount;

public interface CommonService {
	public abstract void checkAndCount();
	
	/**
	 * fromDate ~ toDate까지의 방문자수르 가져온다.
	 * @param fromDate
	 * @param toDate
	 * @return
	 */
	public abstract List<JoinCount> getJoinCount(String fromDate, String toDate);
	
	/**
	 * 일주일동안 일별 방문자, 현재 월의 전체 방문자 수, 전체 방문자수를 가져온다. 
	 * @return
	 */
	public abstract Map<String, Object> getJoinCountTotalList();
	
	/**
	 * 부모카테고리(0) 부터 자식카테고리 리스트를 카테고리 번호로 가져온다.
	 * @param CategoryNumber
	 * @return
	 */
	public abstract List<Category> getCategoryList(int CategoryNumber);
	
}

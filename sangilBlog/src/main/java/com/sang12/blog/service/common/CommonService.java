package com.sang12.blog.service.common;

import java.util.List;
import java.util.Map;

import com.sang12.blog.domain.common.CategoryEntity;
import com.sang12.blog.domain.common.JoinCountEntity;
import com.sang12.blog.vo.front.MainPageVo;

public interface CommonService {
	public abstract void checkAndCount();
	
	/**
	 * fromDate ~ toDate까지의 방문자수르 가져온다.
	 * @param fromDate
	 * @param toDate
	 * @return
	 */
	public abstract List<JoinCountEntity> getJoinCount(String fromDate, String toDate);
	
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
	public abstract List<CategoryEntity> getCategoryList(int CategoryNumber);
	
	/**
	 * main page호출시 데이터를 가져옴.
	 * @param vo
	 * @return
	 */
	public abstract Map<String, Object> getMainData(MainPageVo vo);
	
}

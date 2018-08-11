package com.sang12.blog.vo.front;

import com.sang12.blog.vo.common.PagingVo;

/**
 * com.sang12.blog.vo.front
 * MainPageVo.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 8. 11.
 * @Description : 메인 전용 VO
 */

public class MainPageVo extends PagingVo{

	private static final long serialVersionUID = 8107438721323783802L;
	
	private String largeCategoryId;
	private String middleCategoryId;
	private String bottomCategoryId;

	public String getMiddleCategoryId() {
		return middleCategoryId;
	}

	public void setMiddleCategoryId(String middleCategoryId) {
		this.middleCategoryId = middleCategoryId;
	}

	public String getBottomCategoryId() {
		return bottomCategoryId;
	}

	public void setBottomCategoryId(String bottomCategoryId) {
		this.bottomCategoryId = bottomCategoryId;
	}

	public String getLargeCategoryId() {
		return largeCategoryId;
	}

	public void setLargeCategoryId(String largeCategoryId) {
		this.largeCategoryId = largeCategoryId;
	}

}

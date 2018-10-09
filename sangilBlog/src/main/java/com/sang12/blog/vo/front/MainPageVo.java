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
	private String largeCategoryName;
	private String middleCategoryName;
	private String bottomCategoryId;
	
	private int boardId;

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

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getLargeCategoryName() {
		return largeCategoryName;
	}

	public void setLargeCategoryName(String largeCategoryName) {
		this.largeCategoryName = largeCategoryName;
	}

	public String getMiddleCategoryName() {
		return middleCategoryName;
	}

	public void setMiddleCategoryName(String middleCategoryName) {
		this.middleCategoryName = middleCategoryName;
	}

}

package com.sang12.blog.domain.board;

import java.io.Serializable;
import lombok.Data;

/**
 * 카테고리 관련 게시물 Vo
 * @author Choi Sang Il
 *
 */
@Data
public class RelateBoardTitleEntity implements Serializable{
	private static final long serialVersionUID = 7240149006149537059L;
	
	private String boardId;
	private String title;
	private String registerDate;
	private String registerId;
}

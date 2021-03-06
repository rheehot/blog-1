package com.sang12.blog.domain.board;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import lombok.Data;


/**
 * @author Choi Sang Il
 * BOARD 도메인 객체
 */
@Entity
@Data
@Table(name="BOARD01TM")
public class BoardEntity implements Serializable{
	private static final long serialVersionUID = -7410113111280947387L;
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long boardId;
	
	Integer largeCategory;
	Integer middleCategory;
	Integer bottomCategory;
	
	@NotNull
	String title;
	
	@NotNull
	String displayYn;
	
	String keyword;
	
	@NotNull
	@Lob
	@Column( length = 100000 )
	String content;
	
	@Temporal(TemporalType.DATE)
	Date registerDate;
	String registerId;
	@Temporal(TemporalType.DATE)
	Date finalChangeDate;
	String finalChangeId;
	
	@Transient
	String largeCategoryName;
	@Transient
	String middleCategoryName;
	@Transient
	String bottomCategoryName;
	
	@Transient
	List<RelateBoardTitleEntity> relateBoardTitleList;
	
	@Transient
	List<BoardReplyEntity> boardReplyEntity;
}

package com.sang12.blog.domain.common;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="COMM03TM")
public class CategoryEntity implements Serializable {
	private static final long serialVersionUID = 4632631363169579856L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int categoryId;
	
	private String categoryName;
	
	private int parentId;
	
	private int sortNumber;
	
	Date registerDate;
	String registerId;
	Date finalChangeDate;
	String finalChangeId;
}

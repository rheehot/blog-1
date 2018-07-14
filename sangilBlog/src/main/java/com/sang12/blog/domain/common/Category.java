package com.sang12.blog.domain.common;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="COMM03TM")
public class Category implements Serializable {
	private static final long serialVersionUID = 4632631363169579856L;
	
	@Id
	private int category_id;
	
	private String category_name;
	
	private int parent_id;
	
	Date registerDate;
	String registerId;
	Date finalChangeDate;
	String finalChangeId;
}

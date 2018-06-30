package com.sang12.blog.domain.security;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import lombok.Data;

/*
 * USER  
 */

@Entity
@Data
public class User implements Serializable{

	private static final long serialVersionUID = -5741060582566417154L;

	@Id
	String userId;
	
	@NotNull
	String password;
	
	Date registerDate;
	
	Date finalChangeDate;
}

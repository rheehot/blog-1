package com.sang12.blog.domain.security;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.Data;

/*
 * USER  
 */

@Entity
@Data
@Table(name="AUTH01TM")
public class UserEntity implements Serializable{

	private static final long serialVersionUID = -5741060582566417154L;

	@Id
	String userId;
	
	@NotNull
	String password;
	
	String authDivCode;
	
	Date registerDate;
	String registerId;
	Date finalChangeDate;
	String finalChangeId;
}

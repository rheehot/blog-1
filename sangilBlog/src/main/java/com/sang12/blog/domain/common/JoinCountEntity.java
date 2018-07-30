package com.sang12.blog.domain.common;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="COMM01TM")
public class JoinCountEntity implements Serializable {
	private static final long serialVersionUID = -8418977751769689035L;

	@Id
	private String joinDate;
	
	private int joinCount;
	
	public void count(){
	    this.joinCount += 1;
	}
}

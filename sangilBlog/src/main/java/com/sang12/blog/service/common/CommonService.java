package com.sang12.blog.service.common;

import java.util.List;

import com.sang12.blog.domain.common.JoinCount;

public interface CommonService {
	public abstract void checkAndCount();
	
	public abstract List<JoinCount> getJoinCount(String fromDate, String toDate);
}

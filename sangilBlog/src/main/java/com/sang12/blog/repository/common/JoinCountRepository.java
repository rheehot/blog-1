package com.sang12.blog.repository.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sang12.blog.domain.common.JoinCount;

public interface JoinCountRepository extends JpaRepository<JoinCount, String> {
	List<JoinCount> findByJoinDateBetween(String startDate, String endDate);
}

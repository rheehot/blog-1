package com.sang12.blog.repository.common;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sang12.blog.domain.common.JoinCount;

public interface JoinCountRepository extends JpaRepository<JoinCount, String> {
	List<JoinCount> findByJoinDateBetween(String startDate, String endDate);
	
	@Query(value="SELECT joinCount FROM COMM01TM WHERE joinDate = :day", nativeQuery = true)
	int findByTodayCount(@Param("day") String day);
	
	@Query(value="SELECT SUM(joinCount) FROM COMM01TM", nativeQuery = true)
	int findByJoinDateSum();
}

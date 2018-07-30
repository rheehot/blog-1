package com.sang12.blog.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sang12.blog.domain.security.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, String> {
	UserEntity findByUserIdAndPassword(String username, String password);
}

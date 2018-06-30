package com.sang12.blog.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sang12.blog.domain.security.User;

public interface UserRepository extends JpaRepository<User, String> {
	User findByUserIdAndPassword(String username, String password);
}

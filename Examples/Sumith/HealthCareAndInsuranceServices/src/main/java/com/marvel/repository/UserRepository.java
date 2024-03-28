package com.marvel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.marvel.entity.Users;

public interface UserRepository extends JpaRepository<Users, Integer>{

	Users findByUsername(String username);

}

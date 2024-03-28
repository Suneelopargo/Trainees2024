package com.marvel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.marvel.entity.HealthCareServices;

public interface HealthCareRepository extends JpaRepository<HealthCareServices, Integer> {

}

package com.marvel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.marvel.entity.Insurance;

public interface InsuranceRepository extends JpaRepository<Insurance, Integer> {

}

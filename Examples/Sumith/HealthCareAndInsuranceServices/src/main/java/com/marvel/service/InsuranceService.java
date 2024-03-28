package com.marvel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marvel.entity.Insurance;
import com.marvel.repository.InsuranceRepository;

@Service
public class InsuranceService {
	
	@Autowired
	InsuranceRepository insuranceRepository;
	
	public List<Insurance> getAllInsurances() {
        return insuranceRepository.findAll();
    }

    public Optional<Insurance> getInsuranceById(Integer id) {
        return insuranceRepository.findById(id);
    }

    public Insurance saveInsurance(Insurance insurance) {
        return insuranceRepository.save(insurance);
    }

    public void deleteInsurance(Integer id) {
        insuranceRepository.deleteById(id);
    }

}

package com.marvel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marvel.entity.HealthCareServices;
import com.marvel.repository.HealthCareRepository;

@Service
public class HealthCareService {

    @Autowired
    private HealthCareRepository healthCareRepository;

    // Create operation
    public HealthCareServices addService(HealthCareServices service) {
        return healthCareRepository.save(service);
    }

    // Read operation
    public List<HealthCareServices> getAllServices() {
        return healthCareRepository.findAll();
    }

    public Optional<HealthCareServices> getServiceById(int id) {
        return healthCareRepository.findById(id);
    }

    // Update operation
    public HealthCareServices updateService(int id, HealthCareServices updatedService) {
        Optional<HealthCareServices> serviceOptional = healthCareRepository.findById(id);
        if (serviceOptional.isPresent()) {
            HealthCareServices service = serviceOptional.get();
            // Update only if the fields are not null
            if (updatedService.getDoctorName() != null) {
                service.setDoctorName(updatedService.getDoctorName());
            }
            if (updatedService.getCost() != 0.0) {
                service.setCost(updatedService.getCost());
            }
            return healthCareRepository.save(service);
        } else {
            throw new IllegalArgumentException("Service not found with id: " + id);
        }
    }

    // Delete operation
    public void deleteService(int id) {
        healthCareRepository.deleteById(id);
    }
}

package com.marvel.controller;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.marvel.entity.HealthCareServices;
import com.marvel.service.HealthCareService;

@RestController
@RequestMapping("/api/healthcare")
public class HealthCareController {

    @Autowired
    private HealthCareService healthCareService;

    // Get all health care services
    @GetMapping("/services")
    public List<HealthCareServices> getAllServices() {
    	System.out.println(healthCareService.getAllServices());
        return healthCareService.getAllServices();
    }

    // Get a specific health care service by ID
    @GetMapping("/services/{id}")
    public ResponseEntity<HealthCareServices> getServiceById(@PathVariable int id) {
        Optional<HealthCareServices> service = healthCareService.getServiceById(id);
        return service.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Create a new health care service
    @PostMapping("/services")
    public ResponseEntity<HealthCareServices> createService(@RequestBody HealthCareServices service) {
        HealthCareServices savedService = healthCareService.addService(service);
        return new ResponseEntity<>(savedService, HttpStatus.CREATED);
    }

    // Update a health care service
    @PutMapping("/services/{id}")
    public ResponseEntity<HealthCareServices> updateService(@PathVariable int id, @RequestBody HealthCareServices updatedService) {
        HealthCareServices service = healthCareService.updateService(id, updatedService);
        return ResponseEntity.ok(service);
    }

    // Delete a health care service by ID
    @DeleteMapping("/services/{id}")
    public ResponseEntity<Void> deleteService(@PathVariable int id) {
        healthCareService.deleteService(id);
        return ResponseEntity.noContent().build();
    }
}

package com.marvel.controller;

import com.marvel.entity.Insurance;
import com.marvel.service.InsuranceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/insurances")
public class InsuranceController {
	
   @Autowired
   InsuranceService insuranceService;

    @GetMapping
    public ResponseEntity<List<Insurance>> getAllInsurances() {
        List<Insurance> insurances = insuranceService.getAllInsurances();
        return new ResponseEntity<>(insurances, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Insurance> getInsuranceById(@PathVariable("id") Integer id) {
        Optional<Insurance> insurance = insuranceService.getInsuranceById(id);
        return insurance.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public ResponseEntity<Insurance> saveInsurance(@RequestBody Insurance insurance) {
        Insurance savedInsurance = insuranceService.saveInsurance(insurance);
        return new ResponseEntity<>(savedInsurance, HttpStatus.CREATED);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteInsurance(@PathVariable("id") Integer id) {
        insuranceService.deleteInsurance(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}


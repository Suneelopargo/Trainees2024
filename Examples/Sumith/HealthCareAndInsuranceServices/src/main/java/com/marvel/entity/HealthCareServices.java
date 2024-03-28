package com.marvel.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class HealthCareServices {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 
    private String serviceName;
    private String doctorName;
    private double cost; 
    private String consultingArea;
}

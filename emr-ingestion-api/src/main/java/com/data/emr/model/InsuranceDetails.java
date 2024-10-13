package com.data.emr.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsuranceDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long insuranceId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String provider;
    private String policyNumber;
    private LocalDate coverageStartDate;
    private LocalDate coverageEndDate;
}


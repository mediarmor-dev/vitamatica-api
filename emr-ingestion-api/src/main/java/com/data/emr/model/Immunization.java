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
public class Immunization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long immunizationId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String vaccine;
    private LocalDate dateAdministered;
    private Integer doseNumber;
    private String lotNumber;
    private String administeredBy;
}


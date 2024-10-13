package com.data.emr.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PharmacyInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long pharmacyId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String preferredPharmacy;
    private String street;
    private String city;
    private String state;
    private String zipCode;
    private String country;
    private String phone;

    @Column(columnDefinition = "TEXT")
    private String lastPrescriptionFilled;  // JSONB equivalent
}


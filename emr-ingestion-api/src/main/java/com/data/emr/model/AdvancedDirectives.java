package com.data.emr.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdvancedDirectives {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long directiveId; // Primary Key

    @ManyToOne
    @JoinColumn(name = "patient_id", nullable = false)
    private Patient patient; // Foreign Key to Patient

    private Boolean doNotResuscitate;
    private Boolean organDonor;
    private Boolean livingWill;
    private String powerOfAttorney;
}


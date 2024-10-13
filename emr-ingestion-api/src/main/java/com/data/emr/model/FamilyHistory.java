package com.data.emr.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FamilyHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long familyId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String relationship;
    private String condition;
    private Integer ageAtDiagnosis;
    private Boolean deceased;
    private Integer ageAtDeath;
}

package com.data.emr.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SocialHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long socialId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String smokingStatus;
    private String alcoholUse;
    private String exerciseFrequency;
    private String dietaryPreferences;
    private String occupation;
    private String maritalStatus;
}


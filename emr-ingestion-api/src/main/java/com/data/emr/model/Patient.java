package com.data.emr.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Patient {
    @Id
    @Column(name = "patient_id", nullable = false)
    private String patientId;  // Primary key

    private String firstName;
    private String lastName;
    private LocalDate dateOfBirth;
    private String gender;
}

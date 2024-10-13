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
public class PsychiatricHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long psychiatricId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String condition;
    private LocalDate diagnosedDate;

    @Column(columnDefinition = "TEXT")
    private String treatmentPlan;

    @Column(columnDefinition = "TEXT")
    private String medications;  // JSONB equivalent

    @Column(columnDefinition = "TEXT")
    private String notes;
}

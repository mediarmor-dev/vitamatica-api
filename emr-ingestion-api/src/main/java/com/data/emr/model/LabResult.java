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
public class LabResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long labResultId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String testName;

    @Column(columnDefinition = "TEXT")
    private String result;

    private LocalDate date;
    private String normalRange;

    @Column(columnDefinition = "TEXT")
    private String notes;
}


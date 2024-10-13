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
public class Rehabilitation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long rehabId;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private String condition;

    @Column(columnDefinition = "TEXT")
    private String therapyPlan;

    private String therapistName;
    private Integer sessionsPerWeek;
    private LocalDate startDate;

    @Column(columnDefinition = "TEXT")
    private String progressNotes;
}

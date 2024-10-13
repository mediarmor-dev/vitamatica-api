package com.data.emr.dto;

import com.data.emr.model.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PatientDataAggregate {

    private Patient patient;
    private List<MedicalHistory> medicalHistories;
    private List<MedicalVisit> medicalVisits;
    private List<LabResult> labResults;
    private List<VitalSigns> vitalSigns;
    // Add other fields as necessary, like immunizations, family history, etc.
}

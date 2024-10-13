package com.data.emr.repository;

import com.data.emr.model.LabResult;
import com.data.emr.model.MedicalHistory;
import com.data.emr.model.Patient;
import com.data.emr.model.VitalSigns;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PatientRepository extends JpaRepository<Patient, String> {
}


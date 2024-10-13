package com.data.emr.repository;

import com.data.emr.model.LabResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LabResultsRepository extends JpaRepository<LabResult, Long> {
    List<LabResult> findByPatient_PatientId(String patientId);
}

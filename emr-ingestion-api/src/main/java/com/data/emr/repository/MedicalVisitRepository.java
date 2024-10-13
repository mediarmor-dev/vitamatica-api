package com.data.emr.repository;

import com.data.emr.model.MedicalHistory;
import com.data.emr.model.MedicalVisit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MedicalVisitRepository extends JpaRepository<MedicalVisit, Long> {
    List<MedicalVisit> findByPatient_PatientId(String patientId);
}

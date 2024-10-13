package com.data.emr.service;

import com.data.emr.dto.PatientDataAggregate;
import com.data.emr.exception.ResourceNotFoundException;
import com.data.emr.model.*;
import com.data.emr.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private MedicalHistoryRepository medicalHistoryRepository;

    @Autowired
    private MedicalVisitRepository medicalVisitRepository;

    @Autowired
    private LabResultsRepository labResultsRepository;

    @Autowired
    private VitalSignsRepository vitalSignsRepository;

    public Patient createPatient(Patient patient) {
        return patientRepository.save(patient);
    }

    public Patient getPatientById(String id) {
        return patientRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Patient not found"));
    }

    public Patient updatePatient(String id, Patient updatedPatient) {
        Patient existingPatient = getPatientById(id);
        existingPatient.setFirstName(updatedPatient.getFirstName());
        existingPatient.setLastName(updatedPatient.getLastName());
        existingPatient.setDateOfBirth(updatedPatient.getDateOfBirth());
        existingPatient.setGender(updatedPatient.getGender());
        return patientRepository.save(existingPatient);
    }

    public void deletePatient(String id) {
        Patient patient = getPatientById(id);
        patientRepository.delete(patient);
    }

    public MedicalHistory addMedicalHistory(String patientId, MedicalHistory medicalHistory) {
        // Fetch the Patient object based on the patientId
        Patient patient = getPatientById(patientId);

        // Set the Patient object in the MedicalHistory entity
        medicalHistory.setPatient(patient);  // Now we set the whole patient object, not just the patientId

        // Save the MedicalHistory entry
        return medicalHistoryRepository.save(medicalHistory);
    }

    public List<MedicalHistory> getMedicalHistory(String patientId) {
        return medicalHistoryRepository.findByPatient_PatientId(patientId);
    }

    public List<Patient> getAllPatients() {
        return patientRepository.findAll();
    }

    public PatientDataAggregate aggregatePatientData(String patientId) {
        Patient patient = getPatientById(patientId);
        List<MedicalHistory> medicalHistories = medicalHistoryRepository.findByPatient_PatientId(patientId);
        List<MedicalVisit> medicalVisits = medicalVisitRepository.findByPatient_PatientId(patientId);  // Add this
        List<LabResult> labResults = labResultsRepository.findByPatient_PatientId(patientId);  // Add this
        List<VitalSigns> vitalSigns = vitalSignsRepository.findByPatient_PatientId(patientId);  // Add this

        return new PatientDataAggregate(patient, medicalHistories, medicalVisits, labResults, vitalSigns);
    }
}

package com.data.emr.controller;

import com.data.emr.dto.PatientDataAggregate;
import com.data.emr.model.MedicalHistory;
import com.data.emr.model.Patient;
import com.data.emr.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/patients")
public class PatientController {

    @Autowired
    private PatientService patientService;

    @GetMapping("/details")
    public ResponseEntity<String> getAPIDetails() {
        return new ResponseEntity<>("Patient API", HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Patient> createPatient(@RequestBody Patient patient) {
        return new ResponseEntity<>(patientService.createPatient(patient), HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Patient> getPatient(@PathVariable String id) {
        return new ResponseEntity<>(patientService.getPatientById(id), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Patient> updatePatient(@PathVariable String id, @RequestBody Patient patient) {
        return new ResponseEntity<>(patientService.updatePatient(id, patient), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePatient(@PathVariable String id) {
        patientService.deletePatient(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PostMapping("/{id}/medical-history")
    public ResponseEntity<MedicalHistory> addMedicalHistory(@PathVariable String id, @RequestBody MedicalHistory medicalHistory) {
        return new ResponseEntity<>(patientService.addMedicalHistory(id, medicalHistory), HttpStatus.CREATED);
    }

    @GetMapping("/{id}/medical-history")
    public ResponseEntity<List<MedicalHistory>> getMedicalHistory(@PathVariable String id) {
        return new ResponseEntity<>(patientService.getMedicalHistory(id), HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<List<Patient>> getAllPatients() {
        return new ResponseEntity<>(patientService.getAllPatients(), HttpStatus.OK);
    }

    @GetMapping("/aggregate/{id}")
    public ResponseEntity<PatientDataAggregate> aggregatePatientData(@PathVariable String id) {
        return new ResponseEntity<>(patientService.aggregatePatientData(id), HttpStatus.OK);
    }
}


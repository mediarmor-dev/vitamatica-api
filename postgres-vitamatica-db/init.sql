-- Patients Table
CREATE TABLE patient (
                          patient_id VARCHAR(50) PRIMARY KEY,
                          first_name VARCHAR(50),
                          last_name VARCHAR(50),
                          date_of_birth DATE,
                          gender VARCHAR(10)
);

-- Contact Info Table
CREATE TABLE contact_info (
                              contact_id SERIAL PRIMARY KEY,
                              patient_id VARCHAR(50) REFERENCES patient(patient_id),
                              phone VARCHAR(15),
                              email VARCHAR(100),
                              street VARCHAR(100),
                              city VARCHAR(50),
                              state VARCHAR(50),
                              zip_code VARCHAR(10),
                              country VARCHAR(50)
);

-- Medical History Table
CREATE TABLE medical_history (
                                 history_id SERIAL PRIMARY KEY,
                                 patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                 type VARCHAR(50),
                                 description TEXT,
                                 additional_info JSONB
);

-- Family History Table
CREATE TABLE family_history (
                                family_id SERIAL PRIMARY KEY,
                                patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                relationship VARCHAR(50),
                                condition VARCHAR(100),
                                age_at_diagnosis INT,
                                deceased BOOLEAN,
                                age_at_death INT
);

-- Immunizations Table
CREATE TABLE immunizations (
                               immunization_id SERIAL PRIMARY KEY,
                               patient_id VARCHAR(50) REFERENCES patient(patient_id),
                               vaccine VARCHAR(100),
                               date_administered DATE,
                               dose_number INT,
                               lot_number VARCHAR(50),
                               administered_by VARCHAR(100)
);

-- Vital Signs Table
CREATE TABLE vital_signs (
                             vital_sign_id SERIAL PRIMARY KEY,
                             patient_id VARCHAR(50) REFERENCES patient(patient_id),
                             date DATE,
                             blood_pressure_systolic INT,
                             blood_pressure_diastolic INT,
                             heart_rate INT,
                             respiratory_rate INT,
                             temperature FLOAT,
                             oxygen_saturation INT
);

-- Lab Results Table
CREATE TABLE lab_results (
                             lab_result_id SERIAL PRIMARY KEY,
                             patient_id VARCHAR(50) REFERENCES patient(patient_id),
                             test_name VARCHAR(100),
                             result TEXT,  -- Changed from VARCHAR(50) to TEXT
                             date DATE,
                             normal_range VARCHAR(50),
                             notes TEXT
);

-- Create MedicalVisits table
CREATE TABLE medical_visits (
                                visit_id SERIAL PRIMARY KEY,
                                patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                visit_date DATE NOT NULL,
                                clinic VARCHAR(100),
                                doctor VARCHAR(100),
                                reason_for_visit TEXT,
                                diagnosis TEXT
);

-- Insurance Details Table
CREATE TABLE insurance_details (
                                   insurance_id SERIAL PRIMARY KEY,
                                   patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                   provider VARCHAR(100),
                                   policy_number VARCHAR(50),
                                   coverage_start_date DATE,
                                   coverage_end_date DATE
);

-- Billing Info Table
CREATE TABLE billing_info (
                              billing_id SERIAL PRIMARY KEY,
                              patient_id VARCHAR(50) REFERENCES patient(patient_id),
                              last_billed_date DATE,
                              total_amount_due FLOAT,
                              last_payment_date DATE,
                              insurance_covered FLOAT,
                              patient_responsible FLOAT
);

-- Social History Table
CREATE TABLE social_history (
                                social_id SERIAL PRIMARY KEY,
                                patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                smoking_status VARCHAR(50),
                                alcohol_use VARCHAR(50),
                                exercise_frequency VARCHAR(50),
                                dietary_preferences VARCHAR(50),
                                occupation VARCHAR(100),
                                marital_status VARCHAR(50)
);

-- Psychiatric History Table
CREATE TABLE psychiatric_history (
                                     psychiatric_id SERIAL PRIMARY KEY,
                                     patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                     condition VARCHAR(100),
                                     diagnosed_date DATE,
                                     treatment_plan TEXT,
                                     medications JSONB,
                                     notes TEXT
);

-- Rehabilitation and Physical Therapy Table
CREATE TABLE rehabilitation (
                                rehab_id SERIAL PRIMARY KEY,
                                patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                condition VARCHAR(100),
                                therapy_plan TEXT,
                                therapist_name VARCHAR(100),
                                sessions_per_week INT,
                                start_date DATE,
                                progress_notes TEXT
);

-- Pharmacy Information Table
CREATE TABLE pharmacy_info (
                               pharmacy_id SERIAL PRIMARY KEY,
                               patient_id VARCHAR(50) REFERENCES patient(patient_id),
                               preferred_pharmacy VARCHAR(100),
                               street VARCHAR(100),
                               city VARCHAR(50),
                               state VARCHAR(50),
                               zip_code VARCHAR(10),
                               country VARCHAR(50),
                               phone VARCHAR(15),
                               last_prescription_filled JSONB
);

-- Advanced Directives Table
CREATE TABLE advanced_directives (
                                     directive_id SERIAL PRIMARY KEY,
                                     patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                     do_not_resuscitate BOOLEAN,
                                     organ_donor BOOLEAN,
                                     living_will BOOLEAN,
                                     power_of_attorney VARCHAR(100)
);

-- Referral Information Table
CREATE TABLE referral_info (
                               referral_id SERIAL PRIMARY KEY,
                               patient_id VARCHAR(50) REFERENCES patient(patient_id),
                               referred_by VARCHAR(100),
                               referred_to VARCHAR(100),
                               reason_for_referral TEXT
);

-- Emergency Contacts Table
CREATE TABLE emergency_contacts (
                                    contact_id SERIAL PRIMARY KEY,
                                    patient_id VARCHAR(50) REFERENCES patient(patient_id),
                                    name VARCHAR(100),
                                    relationship VARCHAR(50),
                                    phone VARCHAR(15),
                                    email VARCHAR(100)
);

-- Insert Sample Data

-- Patient
INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender) VALUES
                                                                                    ('12345', 'John', 'Doe', '1985-07-20', 'Male'),
                                                                                    ('12346', 'Jane', 'Smith', '1990-03-10', 'Female'),
                                                                                    ('12347', 'Mike', 'Johnson', '1975-12-05', 'Male'),
                                                                                    ('12348', 'Alice', 'Williams', '1982-06-15', 'Female'),
                                                                                    ('12349', 'Robert', 'Brown', '1965-02-20', 'Male');

-- Contact Info
INSERT INTO contact_info (patient_id, phone, email, street, city, state, zip_code, country) VALUES
                                                                                                ('12345', '+1-555-555-5555', 'johndoe@example.com', '123 Main St', 'Anytown', 'CA', '90210', 'USA'),
                                                                                                ('12346', '+1-555-555-5556', 'janesmith@example.com', '456 Elm St', 'Anytown', 'CA', '90210', 'USA'),
                                                                                                ('12347', '+1-555-555-5557', 'mikejohnson@example.com', '789 Oak St', 'Anytown', 'CA', '90210', 'USA'),
                                                                                                ('12348', '+1-555-555-5558', 'alicewilliams@example.com', '101 Pine St', 'Anytown', 'CA', '90210', 'USA'),
                                                                                                ('12349', '+1-555-555-5559', 'robertbrown@example.com', '202 Maple St', 'Anytown', 'CA', '90210', 'USA');

-- Medical History
INSERT INTO medical_history (patient_id, type, description, additional_info) VALUES
                                                                                 ('12345', 'allergy', 'Peanuts', '{"reaction": "Anaphylaxis", "recorded_date": "2010-06-15"}'),
                                                                                 ('12345', 'diagnosis', 'Type 2 Diabetes', '{"diagnosed_date": "2019-11-20", "notes": "Under control with medication"}'),
                                                                                 ('12346', 'surgery', 'Appendectomy', '{"date": "2015-05-22", "hospital": "Anytown General Hospital", "surgeon": "Dr. Smith"}'),
                                                                                 ('12347', 'medication', 'Metformin', '{"dosage": "500 mg", "frequency": "Once daily", "start_date": "2020-01-10"}'),
                                                                                 ('12348', 'diagnosis', 'Hypertension', '{"diagnosed_date": "2015-09-10"}');

-- Family History
INSERT INTO family_history (patient_id, relationship, condition, age_at_diagnosis, deceased, age_at_death) VALUES
                                                                                                               ('12345', 'Father', 'Hypertension', 55, FALSE, NULL),
                                                                                                               ('12345', 'Mother', 'Breast Cancer', 60, TRUE, 65),
                                                                                                               ('12346', 'Father', 'Diabetes', 50, FALSE, NULL),
                                                                                                               ('12347', 'Mother', 'Heart Disease', 62, TRUE, 70),
                                                                                                               ('12348', 'Father', 'Hypertension', 56, FALSE, NULL);

-- Immunizations
INSERT INTO immunizations (patient_id, vaccine, date_administered, dose_number, lot_number, administered_by) VALUES
                                                                                                                 ('12345', 'COVID-19', '2021-03-15', 2, '123456', 'Dr. Jane Smith'),
                                                                                                                 ('12346', 'Influenza', '2023-10-01', 1, '654321', 'Nurse Michael Johnson'),
                                                                                                                 ('12347', 'COVID-19', '2021-04-10', 2, '789012', 'Dr. Alex Green'),
                                                                                                                 ('12348', 'Tetanus', '2023-01-15', 1, '543210', 'Dr. Olivia Scott'),
                                                                                                                 ('12349', 'Influenza', '2023-11-05', 1, '432109', 'Nurse Emma Wilson');

-- Vital Signs
INSERT INTO vital_signs (patient_id, date, blood_pressure_systolic, blood_pressure_diastolic, heart_rate, respiratory_rate, temperature, oxygen_saturation) VALUES
                                                                                                                                                                ('12345', '2024-09-01', 120, 80, 72, 16, 98.6, 98),
                                                                                                                                                                ('12346', '2024-09-02', 115, 78, 75, 18, 98.7, 97),
                                                                                                                                                                ('12347', '2024-09-03', 125, 85, 70, 15, 98.5, 99),
                                                                                                                                                                ('12348', '2024-09-04', 110, 75, 74, 16, 98.6, 96),
                                                                                                                                                                ('12349', '2024-09-05', 130, 90, 80, 17, 98.8, 97);

-- Insert Sample Data for Lab Results
INSERT INTO lab_results (patient_id, test_name, result, date, normal_range, notes) VALUES
                                                                                       ('12345', 'Hemoglobin A1C', '6.4%', '2024-08-15', '4.0% - 5.6%', 'Elevated'),
                                                                                       ('12346', 'Lipid Panel', '{"total_cholesterol": "190 mg/dL", "hdl": "45 mg/dL", "ldl": "120 mg/dL", "triglycerides": "150 mg/dL"}', '2024-08-10', 'Cholesterol <200 mg/dL', 'Borderline high LDL'),
                                                                                       ('12347', 'Hemoglobin A1C', '5.5%', '2024-08-12', '4.0% - 5.6%', 'Normal'),
                                                                                       ('12348', 'Lipid Panel', '{"total_cholesterol": "175 mg/dL", "hdl": "50 mg/dL", "ldl": "110 mg/dL", "triglycerides": "120 mg/dL"}', '2024-08-18', 'Cholesterol <200 mg/dL', 'Normal'),
                                                                                       ('12349', 'Hemoglobin A1C', '7.0%', '2024-08-20', '4.0% - 5.6%', 'Elevated');


-- Insert 5 sample dummy records into MedicalVisits table
INSERT INTO medical_visits (patient_id, visit_date, clinic, doctor, reason_for_visit, diagnosis) VALUES
                                                                                                     ('12345', '2024-09-01', 'Anytown Medical Center', 'Dr. Jane Smith', 'Routine checkup', 'Stable'),
                                                                                                     ('12346', '2024-09-02', 'Downtown Clinic', 'Dr. John Doe', 'Follow-up on diabetes', 'Improving'),
                                                                                                     ('12347', '2024-08-25', 'HealthCare Plus Clinic', 'Dr. Sarah Johnson', 'High blood pressure', 'Elevated BP'),
                                                                                                     ('12348', '2024-07-15', 'Wellness Clinic', 'Dr. Michael Lee', 'Cholesterol management', 'Normalizing cholesterol levels'),
                                                                                                     ('12349', '2024-06-30', 'Primary Health Center', 'Dr. Emily Davis', 'Annual physical exam', 'Healthy');

-- Insurance Details
INSERT INTO insurance_details (patient_id, provider, policy_number, coverage_start_date, coverage_end_date) VALUES
                                                                                                                ('12345', 'Blue Cross', 'BC123456789', '2021-01-01', '2025-01-01'),
                                                                                                                ('12346', 'Aetna', 'AE987654321', '2020-05-01', '2024-05-01'),
                                                                                                                ('12347', 'Cigna', 'CI567890123', '2019-09-01', '2023-09-01'),
                                                                                                                ('12348', 'United Healthcare', 'UH345678901', '2022-03-01', '2026-03-01'),
                                                                                                                ('12349', 'Humana', 'HU234567890', '2021-12-01', '2025-12-01');

-- Billing Info
INSERT INTO billing_info (patient_id, last_billed_date, total_amount_due, last_payment_date, insurance_covered, patient_responsible) VALUES
                                                                                                                                         ('12345', '2024-08-25', 200.00, '2024-08-30', 150.00, 50.00),
                                                                                                                                         ('12346', '2024-08-26', 250.00, '2024-08-31', 200.00, 50.00),
                                                                                                                                         ('12347', '2024-08-27', 180.00, '2024-09-01', 130.00, 50.00),
                                                                                                                                         ('12348', '2024-08-28', 220.00, '2024-09-02', 170.00, 50.00),
                                                                                                                                         ('12349', '2024-08-29', 300.00, '2024-09-03', 250.00, 50.00);

-- Social History
INSERT INTO social_history (patient_id, smoking_status, alcohol_use, exercise_frequency, dietary_preferences, occupation, marital_status) VALUES
                                                                                                                                              ('12345', 'Never', 'Occasional', '3 times a week', 'Vegetarian', 'Software Engineer', 'Single'),
                                                                                                                                              ('12346', 'Former smoker', 'None', 'Daily', 'Non-vegetarian', 'Teacher', 'Married'),
                                                                                                                                              ('12347', 'Never', 'Occasional', 'Weekly', 'Non-vegetarian', 'Accountant', 'Married'),
                                                                                                                                              ('12348', 'Occasional', 'Regularly', '2 times a week', 'Vegetarian', 'Nurse', 'Single'),
                                                                                                                                              ('12349', 'Never', 'Occasional', '3 times a week', 'Vegan', 'Engineer', 'Divorced');

-- Psychiatric History
INSERT INTO psychiatric_history (patient_id, condition, diagnosed_date, treatment_plan, medications, notes) VALUES
                                                                                                                ('12345', 'Generalized Anxiety Disorder', '2020-02-20', 'Cognitive Behavioral Therapy', '{"name": "Sertraline", "dosage": "50 mg", "frequency": "Once daily"}', 'Patient responds well to therapy'),
                                                                                                                ('12346', 'Depression', '2018-04-10', 'Medication and Therapy', '{"name": "Fluoxetine", "dosage": "20 mg", "frequency": "Once daily"}', 'Patient stable with treatment'),
                                                                                                                ('12347', 'PTSD', '2019-06-15', 'Trauma-Focused Therapy', '{"name": "Venlafaxine", "dosage": "75 mg", "frequency": "Once daily"}', 'Improvement with therapy'),
                                                                                                                ('12348', 'Panic Disorder', '2021-05-05', 'Cognitive Behavioral Therapy', '{"name": "Alprazolam", "dosage": "0.5 mg", "frequency": "As needed"}', 'Patient stable'),
                                                                                                                ('12349', 'Bipolar Disorder', '2020-08-01', 'Medication', '{"name": "Lithium", "dosage": "300 mg", "frequency": "Twice daily"}', 'Monitoring required');

-- Rehabilitation and Physical Therapy
INSERT INTO rehabilitation (patient_id, condition, therapy_plan, therapist_name, sessions_per_week, start_date, progress_notes) VALUES
                                                                                                                                    ('12345', 'Lower back pain', 'Physical Therapy', 'Dr. Emma Wilson', 2, '2024-07-01', 'Significant improvement in mobility'),
                                                                                                                                    ('12346', 'Shoulder injury', 'Physical Therapy', 'Dr. Jane Smith', 3, '2024-06-15', 'Patient reports less pain'),
                                                                                                                                    ('12347', 'Knee pain', 'Strength Training', 'Dr. Alex Green', 2, '2024-07-10', 'Improvement in strength'),
                                                                                                                                    ('12348', 'Neck pain', 'Posture Correction', 'Dr. Olivia Scott', 1, '2024-05-20', 'Reduced stiffness'),
                                                                                                                                    ('12349', 'Ankle sprain', 'Physical Therapy', 'Dr. Emma Wilson', 2, '2024-04-15', 'Patient has regained mobility');

-- Pharmacy Information
INSERT INTO pharmacy_info (patient_id, preferred_pharmacy, street, city, state, zip_code, country, phone, last_prescription_filled) VALUES
                                                                                                                                        ('12345', 'Anytown Pharmacy', '456 Pharmacy Blvd', 'Anytown', 'CA', '90210', 'USA', '+1-555-789-1011', '{"medication": "Metformin", "date_filled": "2024-08-15", "refills_left": 3}'),
                                                                                                                                        ('12346', 'HealthPlus Pharmacy', '789 Med St', 'Anytown', 'CA', '90210', 'USA', '+1-555-789-1022', '{"medication": "Fluoxetine", "date_filled": "2024-07-01", "refills_left": 2}'),
                                                                                                                                        ('12347', 'WellCare Pharmacy', '123 Wellness Rd', 'Anytown', 'CA', '90210', 'USA', '+1-555-789-1033', '{"medication": "Venlafaxine", "date_filled": "2024-06-20", "refills_left": 1}'),
                                                                                                                                        ('12348', 'CareRx Pharmacy', '101 Health St', 'Anytown', 'CA', '90210', 'USA', '+1-555-789-1044', '{"medication": "Alprazolam", "date_filled": "2024-05-10", "refills_left": 2}'),
                                                                                                                                        ('12349', 'LifeMed Pharmacy', '202 Care Blvd', 'Anytown', 'CA', '90210', 'USA', '+1-555-789-1055', '{"medication": "Lithium", "date_filled": "2024-08-01", "refills_left": 3}');

-- Advanced Directives
INSERT INTO advanced_directives (patient_id, do_not_resuscitate, organ_donor, living_will, power_of_attorney) VALUES
                                                                                                                  ('12345', FALSE, TRUE, TRUE, 'Jane Doe'),
                                                                                                                  ('12346', TRUE, TRUE, FALSE, 'John Smith'),
                                                                                                                  ('12347', FALSE, TRUE, TRUE, 'Sarah Johnson'),
                                                                                                                  ('12348', TRUE, TRUE, TRUE, 'Emily Davis'),
                                                                                                                  ('12349', FALSE, TRUE, FALSE, 'Michael Brown');

-- Referral Information
INSERT INTO referral_info (patient_id, referred_by, referred_to, reason_for_referral) VALUES
                                                                                          ('12345', 'Dr. Jane Smith', 'Dr. Michael Lee', 'Diabetes management'),
                                                                                          ('12346', 'Dr. Alex Green', 'Dr. Olivia Scott', 'Cholesterol monitoring'),
                                                                                          ('12347', 'Dr. Emma Wilson', 'Dr. John Carter', 'Blood pressure management'),
                                                                                          ('12348', 'Dr. Olivia Scott', 'Dr. Emily Davis', 'Nutrition consultation'),
                                                                                          ('12349', 'Dr. Michael Lee', 'Dr. Sarah Johnson', 'Cardiac follow-up');

-- Emergency Contacts
INSERT INTO emergency_contacts (patient_id, name, relationship, phone, email) VALUES
                                                                                  ('12345', 'Jane Doe', 'Sister', '+1-555-123-4567', 'janedoe@example.com'),
                                                                                  ('12346', 'John Smith', 'Brother', '+1-555-123-4568', 'johnsmith@example.com'),
                                                                                  ('12347', 'Sarah Johnson', 'Wife', '+1-555-123-4569', 'sarahjohnson@example.com'),
                                                                                  ('12348', 'Emily Davis', 'Mother', '+1-555-123-4570', 'emilydavis@example.com'),
                                                                                  ('12349', 'Michael Brown', 'Son', '+1-555-123-4571', 'michaelbrown@example.com');

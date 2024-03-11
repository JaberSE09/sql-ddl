-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE  medical_center;

\c medical_center

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100),
    specialty VARCHAR(100),
    contact_info VARCHAR(100)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100),
    date_of_birth DATE,
    contact_info VARCHAR(100)
);

CREATE TABLE Visit (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    patient_id INT,
    visit_date DATE,
    notes TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Diagnosis (
    diagnosis_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT,
    disease_name VARCHAR(100),
    diagnosis_date DATE,
    FOREIGN KEY (visit_id) REFERENCES Visit(visit_id)
);
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    contact_number VARCHAR(15) 
);

CREATE TABLE patients(
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    contact_number VARCHAR(15)
);

CREATE TABLE visits(
    visit_id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors(doctor_id),
    patient_id INT REFERENCES patients(patient_id),
    visit_date DATE NOT NULL,
    diagnosis TEXT
);

CREATE TABLE diseases(
    disease_id SERIAL PRIMARY KEY,
    disease_name VARCHAR(100) NOT NULL
);

CREATE TABLE patient_diagnoses(
    diagnosis_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    disease_id INT REFERENCES diseases(disease_id)
);
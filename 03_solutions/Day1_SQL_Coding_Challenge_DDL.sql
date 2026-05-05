-- create a databse named hospital
create database hospital_db;
use hospital_db;
-- create table patients
create table patients(
	patient_id int,
    patient_name varchar(20),
    age int,
    gender enum('M','F'),
    admission_date date
    );
    
--  Add a new column DoctorAssigned VARCHAR(50) to the Patients
alter table patients
	add column doctor_assigned varchar(50);
    
--  Increase the length of PatientName from VARCHAR(20) to VARCHAR(100)
alter table patients
	modify column patient_name varchar(100);

 -- Rename the table Patients to Patient_Info
 rename table patients to patient_info;
 
 -- TRUNCATE patients
 truncate table patient_info;

-- DROP removes the table patient_info
drop table patient_info;
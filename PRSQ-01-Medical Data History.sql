use project_medical_data_history;
show tables;
select*from patients;
select*from admissions;
select*from province_names;
select*from doctors;
select first_name, last_name, gender from patients where gender = 'M';
select first_name, last_name, allergies from patients where allergies is null;
select first_name from patients where first_name like 'c%';
select first_name, last_name, weight from patients where weight between 100 and 120;
select concat(first_name,' ', last_name) from patients;
select first_name, last_name, province_id from patients;
select count(patient_id) from patients where year(birth_date) = '2010';
select first_name, last_name, height from patients order by height desc;
select*from patients where patient_id in ('1','45','534','879','1000');

select*from admissions;
select count(patient_id) from admissions;
select*from admissions where admission_date = discharge_date;
select count(admission_date) from admissions where patient_id = '579';

select*from province_names;
select*from province_names where province_id = 'NS';

select first_name, last_name, birth_date, height, weight from patients where height > 160 and weight > 70;
select distinct year(birth_date) as birth_year from patients order by birth_year asc;
select first_name from patients group by first_name having count(first_name) = 1;
select patient_id, first_name from patients where first_name like 's____%s';

select patients.patient_id, patients.first_name, patients.last_name, admissions.diagnosis
from patients join admissions on patients.patient_id = admissions.patient_id 
where diagnosis = 'dementia';

select first_name from patients order by length(first_name) asc, first_name asc;
select count(gender) from patients group by gender;
select patient_id, diagnosis, count(admission_date) as admission_count from admissions group by patient_id, diagnosis having count(admission_date) > 1;
select city, count(patient_id) as count_of_patient_id from patients group by city order by count_of_patient_id desc, city asc;
select first_name, last_name, 'doctor' as role from doctors union select first_name, last_name, 'patient' as role from patients;
select count(allergies) as popular_allergies, allergies from patients where allergies is not null group by allergies order by popular_allergies desc;
select first_name, last_name, birth_date from patients where year(birth_date) like '197%' order by birth_date asc;
select concat(upper(last_name),',', lower(first_name)) as full_name from patients order by first_name desc;
select province_id, sum(height) as total_height from patients group by province_id having total_height >= 7000 ;
select max(weight) - min(weight) as weight_diff, last_name from patients where last_name = 'maroni';
select day (admission_date) as day_of_month, count(admission_date) as admissions_count from admissions
group by day_of_month order by admissions_count desc, day_of_month;

select patients.patient_id, patients.first_name, patients.last_name, admissions.diagnosis, doctors.specialty, doctors.first_name as doctors_first_name from patients
join admissions on patients.patient_id = admissions.patient_id
join doctors on doctors.doctor_id = admissions.attending_doctor_id
where doctors.first_name = 'lisa' and admissions.diagnosis = 'epilepsy';

select patient_id, 
concat( patient_id, length(last_name), year(birth_date)) as temp_password from patients 
where patient_id in (select distinct patient_id from admissions);





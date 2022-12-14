/*Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. 
Order the list by the weight group decending.
For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.*/
SELECT count(patient_id) AS patients_in_group, FLOOR(weight / 10) * 10 AS weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC
;


/*Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. 
Show results ordered ascending by allergies then by first_name then by last_name.*/
SELECT first_name, last_name, allergies
FROM patients
WHERE allergies = 'Penicillin' OR allergies = 'Morphine'
ORDER BY allergies ASC, first_name ASC, last_name ASC
;


/*Show the city and the total number of patients in the city in the order from most to least patients.*/
SELECT city, count(patient_id)
FROM patients
GROUP BY city
ORDER BY COUNT(patient_ID) DESC
;


/*Show unique first names from the patients table which only occurs once in the list. 
For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. 
If only 1 person is named 'Leo' then include them in the output.*/
SELECT first_name 
FROM patients 
GROUP BY first_name 
HAVING COUNT(*)=1
;


/*Show the city and the total number of patients in the city in the order from most to least patients.*/
SELECT city, count(patient_id)
FROM patients
GROUP BY city
ORDER BY COUNT(patient_ID) DESC
;


/*Show patient_id, first_name, last_name from patients whos primary_diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.*/
SELECT patients.patient_id, first_name, last_name 
FROM patients
JOIN admissions
ON patients.patient_id = admissions.patient_id
WHERE primary_diagnosis = 'Dementia'
;

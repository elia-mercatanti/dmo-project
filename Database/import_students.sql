LOAD DATA LOCAL INFILE 'students.csv'
INTO TABLE students
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cohort, student_id, test_grade, hs_diploma_grade, hs_diploma_title);
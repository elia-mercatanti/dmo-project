LOAD DATA LOCAL INFILE 'students.csv'
INTO TABLE students
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

(cohort, student_id, test_grade, hs_diploma_grade, hs_diploma_title);
LOAD DATA LOCAL INFILE 'exams_preproc.csv'
INTO TABLE courses
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@dummy, course_id, @dummy, @dummy, cfu, description, @dummy);

LOAD DATA LOCAL INFILE 'exams_preproc.csv'
INTO TABLE exams
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(student_id, course_id, date, grade, @dummy, @dummy, semester);
LOAD DATA LOCAL INFILE 'exams_preproc.csv'
INTO TABLE exams
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(student_id, course_id, date, grade, @dummy, @dummy, semester);
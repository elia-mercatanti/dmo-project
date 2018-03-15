LOAD DATA LOCAL INFILE 'exams_preproc.csv'
INTO TABLE courses
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@dummy, course_id, @dummy, @dummy, cfu, description, @dummy);
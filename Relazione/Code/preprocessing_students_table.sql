UPDATE students s1 , (SELECT round(avg(test_grade)) as avarage FROM students) s2
SET s1.test_grade = s2.avarage
WHERE s1.test_grade=0;
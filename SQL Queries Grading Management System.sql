-- SQL Queries

use grading;

-- Insert a new student into the student table
INSERT INTO Students (student_id, first_name, last_name, birth_date, email, phone, address, degree_name)
VALUES (011, 'Jake', 'Peralta', '1992-11-21', 'jakeperalta@example.com', '123-456-7890', '123 Main St', 'Computer Science');

-- Insert new teacher into the Instructor table
INSERT INTO Instructors (instructor_id, name, Gender, email, phone, address)
VALUES (11, 'Anushka Patil', 'F', 'anushkapatil@gmail.com', '9175916459', '123 Main St, Anytown, USA');

-- Update the students information in the Students table
UPDATE Students SET first_name = 'Bhavishya', last_name = 'Garg', email = 'bhavishyagarg@gmail.com', phone = '555-555-5555', address = '456 Main St', degree_name = 'Data Science'
WHERE student_id = 1;


-- Retrive all information about a particular student
SELECT * from Students where student_id = 02;

-- Retrieve the number of students who scored above a certain grade for a specific course for a specific class.
SELECT COUNT(*) 
FROM Grades 
JOIN Courses ON Courses.course_id = Courses.course_id
WHERE Courses.course_name = 'Database Systems' 
AND Grades.course_id = 1
AND Grades.Total_Marks > 70;


-- Retrieve the lowest grade for a specific course for a specific class.
SELECT MIN(Total_Marks) AS lowest_grade
FROM examination
JOIN grades ON Examination.course_id = Grades.course_id
WHERE Examination.course_id = 1
AND examination.exam_id = 1;

-- Retrive a student's progress
SELECT Courses.course_name, Grades.Total_marks, Grades.grade
FROM Grades 
JOIN Courses ON Grades.course_id = Courses.course_id
WHERE Grades.student_id = 1;

-- Update a student's grade in a course.
UPDATE Grades SET grade = 'A'
WHERE student_id = 1;

-- Delete Instructor from Instructor table
DELETE FROM Instructor WHERE instructior_id = 2;
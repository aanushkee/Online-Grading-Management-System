
--           GRADING MANAGEMENT SYSTEM          --


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbgrading`
--

create database grading;
use grading;


-- create table for students

CREATE TABLE Students (
  student_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  birth_date DATE NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20),
  address VARCHAR(200),
  degree_name VARCHAR(50),
  PRIMARY KEY (student_id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- insert 10 records for students

INSERT INTO Students (student_id, first_name, last_name, birth_date, email, phone, address, degree_name)
VALUES
  (01 , 'John', 'Doe', '1995-05-10', 'johndoe@example.com', '555-555-5555', '123 Main St, Anytown, USA', 'Computer Science'),
  (02, 'Jane', 'Smith', '1996-08-15', 'janesmith@example.com', '555-555-5555', '456 Oak Ave, Anytown, USA', 'Marketing'),
  (03, 'Bob', 'Johnson', '1997-11-20', 'bobjohnson@example.com', '555-555-5555', '789 Elm Blvd, Anytown, USA', 'Business'),
  (04, 'Sarah', 'Lee', '1998-02-25', 'sarahlee@example.com', '555-555-5555', '111 Pine St, Anytown, USA', 'Computer Science'),
  (05, 'David', 'Kim', '1999-05-01', 'davidkim@example.com', '555-555-5555', '222 Maple Ave, Anytown, USA', 'Engineering'),
  (06, 'Karen', 'Nguyen', '1995-08-06', 'karennguyen@example.com', '555-555-5555', '333 Oak Ave, Anytown, USA', 'Biology'),
  (07, 'Mark', 'Garcia', '1996-11-11', 'markgarcia@example.com', '555-555-5555', '444 Elm Blvd, Anytown, USA', 'Business'),
  (08, 'Emily', 'Chen', '1997-02-16', 'emilychen@example.com', '555-555-5555', '555 Pine St, Anytown, USA', 'Psychology'),
  (09, 'Michael', 'Wong', '1998-05-23', 'michaelwong@example.com', '555-555-5555', '666 Maple Ave, Anytown, USA', 'Computer Science'),
  (010, 'Lisa', 'Kim', '1999-08-28', 'lisakim@example.com', '555-555-5555', '777 Oak Ave, Anytown, USA', 'Engineering');

-- create table for instructors

CREATE TABLE Instructors (
  instructor_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  Gender ENUM('M', 'F', 'O') NOT NULL,
  email VARCHAR(100),
  phone VARCHAR(20),
  address VARCHAR(200),
  PRIMARY KEY (instructor_id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert 10 records into Instructors table

INSERT INTO Instructors (instructor_id, name, Gender, email, phone, address)
VALUES
  (1, 'John Smith', 'M', 'johnsmith@example.com', '555-555-5555', '123 Main St, Anytown, USA'),
  (2, 'Jane Doe', 'F', 'janedoe@example.com', '555-555-5555', '456 Oak Ave, Anytown, USA'),
  (3, 'Bob Johnson', 'M', 'bobjohnson@example.com', '555-555-5555', '789 Elm Blvd, Anytown, USA'),
  (4, 'Sarah Lee', 'F', 'sarahlee@example.com', '555-555-5555', '111 Pine St Anytown, USA'),
  (5, 'David Kim', 'M', 'davidkim@example.com', '555-555-5555', '222 Maple Ave, Anytown, USA'),
  (6, 'Chris Brown', 'M', 'chrisbrown@example.com', '777-888-9999', '789 Oak Ave'),
  (7, 'Eva Garcia', 'F', 'evagarcia@example.com', '555-444-3333', '555 Maple Rd'),
  (8, 'Frank Davis', 'M', 'frankdavis@example.com', '111-222-3333', '101 2nd St'),
  (9, 'Grace Kim', 'F', 'gracekim@example.com', '444-555-6666', '456 Pine St'),
  (10, 'Henry Nguyen', 'M', 'henrynguyen@example.com', '777-888-9999', '789 Cedar St');
  
  -- create table for courses

CREATE TABLE Courses (
  course_id INT NOT NULL AUTO_INCREMENT,
  course_name VARCHAR(100) NOT NULL,
  instructor_id INT NOT NULL,
  PRIMARY KEY (course_id),
  FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- insert 10 records into courses table

INSERT INTO Courses (course_id, course_name, instructor_id) 
VALUES
  (1, 'Introduction to Programming', 1),
  (2, 'Database Systems', 2),
  (3, 'Data Structures and Algorithms', 3),
  (4, 'Web Development', 4),
  (5, 'Operating Systems', 5),
  (6, 'Computer Networks', 6),
  (7, 'Artificial Intelligence', 7),
  (8, 'Software Engineering', 8),
  (9, 'Computer Graphics', 9),
  (10, 'Mobile Application Development', 10);

-- create table for examinations conducted


CREATE TABLE Examination (
  exam_id INT NOT NULL AUTO_INCREMENT,
  course_id INT NOT NULL,
  exam_type VARCHAR(50) NOT NULL,
  Marks_Obtained INT NOT NULL,
  Weightage DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (exam_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- insert 10 records into the examination table

INSERT INTO Examination (exam_id, course_id, exam_type, Marks_Obtained, Weightage) 
VALUES
  (1, 1, 'Midterm Exam', 20, 0.3),
  (2, 1, 'Final Exam', 20, 0.5),
  (3, 2, 'Midterm Exam', 25, 0.3),
  (4, 2, 'Final Exam', 35, 0.5),
  (5, 3, 'Midterm Exam', 45, 0.3),
  (6, 3, 'Final Exam', 50, 0.5),
  (7, 4, 'Midterm Exam', 60, 0.3),
  (8, 4, 'Final Exam', 70, 0.5),
  (9, 5, 'Midterm Exam', 10, 0.3),
  (10, 5, 'Final Exam', 19, 0.5);

-- create table for grades

CREATE TABLE Grades (
  grade_id INT NOT NULL AUTO_INCREMENT,
  course_id INT NOT NULL,
  student_id INT NOT NULL,
  Total_Marks INT NOT NULL,
  grade VARCHAR(2) NOT NULL,
  PRIMARY KEY (grade_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- insert 10 records into grades table

INSERT INTO Grades (grade_id, course_id, student_id, Total_Marks, Grade) 
VALUES
  (1, 1, 1, 85, 'A'),
  (2, 1, 2, 70, 'B'),
  (3, 1, 3, 92, 'A'),
  (4, 2, 1, 90, 'A'),
  (5, 2, 2, 85, 'A'),
  (6, 2, 3, 95, 'A+'),
  (7, 3, 4, 75, 'B'),
  (8, 3, 5, 82, 'B+'),
  (9, 4, 4, 80, 'B'),
  (10, 4, 5, 87, 'B+');


-- create table to define permissions for given users


CREATE TABLE Permissions (
  Access_ID INT NOT NULL AUTO_INCREMENT,
  User_ID INT NOT NULL,
  Access_Level ENUM('Student', 'Teacher', 'Admin') NOT NULL,
  PRIMARY KEY (Access_ID),
  FOREIGN KEY (User_ID) REFERENCES Students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (User_ID) REFERENCES Instructors(instructor_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO Permissions (Access_ID, User_ID, Access_Level) VALUES
  (11, 01, 'Student'),
  (12, 02, 'Student'),
  (13, 03, 'Student'),
  (14, 4, 'Teacher'),
  (15, 5, 'Teacher'),
  (16, 6, 'Teacher'),
  (17, 7, 'Admin'),
  (18, 8, 'Admin'),
  (19, 9, 'Admin'),
  (20, 10, 'Admin');




CREATE TABLE Reports (
  Report_ID INT NOT NULL AUTO_INCREMENT,
  course_id INT NOT NULL,
  exam_id INT NOT NULL,
  student_id INT NOT NULL,
  instructor_id INT NOT NULL,
  Report_Type ENUM('Student Performance', 'Progress Report', 'Other') NOT NULL,
  Report_Date DATE NOT NULL,
  Report_Data TEXT NOT NULL,
  PRIMARY KEY (Report_ID),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id),
  FOREIGN KEY (exam_id) REFERENCES Examination(exam_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO Reports (course_id, exam_id, student_id, instructor_id, Report_Type, Report_Date, Report_Data) VALUES
  (1, 1, 01, 1, 'Student Performance', '2023-01-01', 'This is the report data for student 1.'),
  (2, 2, 02, 2, 'Progress Report', '2023-01-02', 'This is the report data for student 2.'),
  (3, 3, 03, 3, 'Other', '2023-01-03', 'This is the report data for student 3.'),
  (4, 4, 04, 4, 'Student Performance', '2023-01-04', 'This is the report data for student 4.'),
  (5, 5, 05, 5, 'Progress Report', '2023-01-05', 'This is the report data for student 5.'),
  (6, 6, 06, 6, 'Other', '2023-01-06', 'This is the report data for student 6.'),
  (7, 7, 07, 7, 'Student Performance', '2023-01-07', 'This is the report data for student 7.'),
  (8, 8, 08, 8, 'Progress Report', '2023-01-08', 'This is the report data for student 8.'),
  (9, 9, 09, 9, 'Other', '2023-01-09', 'This is the report data for student 9.'),
  (10, 10, 010, 10, 'Student Performance', '2023-01-10', 'This is the report data for student 10.');
  


  
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
  
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;




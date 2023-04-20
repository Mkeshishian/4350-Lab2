DROP DATABASE IF EXISTS school_db;
CREATE DATABASE school_db;
USE school_db;

CREATE TABLE Student (
 SSN CHAR(11) PRIMARY KEY,
 Name VARCHAR(50),
 Major VARCHAR(50)
);

CREATE TABLE Course (
 CourseNumber CHAR(8) PRIMARY KEY,
 PrerequisiteCourseNumber CHAR(8),
 CourseTitle VARCHAR(50),
 NumberUnits INT
);

CREATE TABLE Section (
 CourseNumber CHAR(8),
 Quarter VARCHAR(10),
 RoomNumber VARCHAR(10),
 DayTime VARCHAR(50),
 PRIMARY KEY (CourseNumber, Quarter),
 FOREIGN KEY (CourseNumber) REFERENCES Course(CourseNumber)
);

CREATE TABLE Enrollment (
 SSN CHAR(11),
 CourseNumber CHAR(8),
 Quarter VARCHAR(10),
 Grade CHAR(4),
 PRIMARY KEY (SSN, CourseNumber, Quarter),
 CONSTRAINT FK_Enrollment_Student FOREIGN KEY (SSN) REFERENCES Student(SSN),
 CONSTRAINT FK_Enrollment_Section FOREIGN KEY (CourseNumber, Quarter)
 REFERENCES Section(CourseNumber, Quarter)
);

INSERT INTO Student (SSN, Name, Major) VALUES
   ('123-45-6789', 'John Smith', 'Computer Science'),
   ('234-56-7890', 'Jane Doe', 'Mathematics'),
   ('345-67-8901', 'Bob Johnson', 'English');
INSERT INTO Course (CourseNumber, PrerequisiteCourseNumber, CourseTitle, NumberUnits)
VALUES
   ('CS101', NULL, 'Intro to Computer Science', 4),
   ('CS201', 'CS101', 'Data Structures', 4),
   ('CS301', 'CS101', 'DataBase', 4),
   ('MATH101', NULL, 'Calculus I', 4),
   ('MATH102', 'MATH101', 'Calculus II', 4),
   ('ENGL101', NULL, 'Composition I', 3),
   ('ENGL102', 'ENGL101', 'Composition II', 3);
INSERT INTO Section (CourseNumber, Quarter, RoomNumber, DayTime) VALUES
   ('CS101', 'Fall2022', '100', 'MW 1:00-2:00PM'),
   ('CS101', 'Winter2023', '101', 'TR 10:00-11:30AM'),
   ('CS101', 'Spring2023', '102', 'MW 3:00-4:30PM'),
   ('CS201', 'Winter2023', '201', 'MW 1:00-2:30PM'),
   ('CS201', 'Spring2023', '202', 'TR 10:00-11:30AM'),
   ('CS301', 'Spring2023', '204', 'TR 10:00-11:30AM'),
   ('MATH101', 'Fall2022', '300', 'MW 10:00-11:30AM'),
   ('MATH102', 'Winter2023', '301', 'TR 3:00-4:30PM'),
   ('ENGL101', 'Fall2022', '200', 'MW 1:00-2:30PM'),
   ('ENGL102', 'Winter2023', '201', 'TR 10:00-11:30AM');
INSERT INTO Enrollment (SSN, CourseNumber, Quarter, Grade) VALUES
   ('123-45-6789', 'CS101', 'Fall2022', 'A'),
   ('123-45-6789', 'CS101', 'Winter2023', 'A'),
   ('123-45-6789', 'CS201', 'Spring2023', 'A'),
   ('234-56-7890', 'MATH101', 'Fall2022', 'A'),
   ('234-56-7890', 'MATH102', 'Winter2023', 'A'),
   ('234-56-7890', 'ENGL101', 'Fall2022', 'B'),
   ('234-56-7890', 'ENGL102', 'Winter2023', NULL)

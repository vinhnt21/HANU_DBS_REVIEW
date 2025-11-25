-- =========================================
-- 1. CREATE DATABASE (Optional, good for completeness)
-- =========================================
-- CREATE DATABASE IF NOT EXISTS DBS_Review;
-- USE DBS_Review;

-- =========================================
-- 2. TABLE STRUCTURES (DDL)
-- =========================================

-- Table: Department
-- -----------------
CREATE TABLE Department (
    deptID INT PRIMARY KEY,
    deptName VARCHAR(100) NOT NULL,
    location VARCHAR(50)
);

-- Table: Student
-- -----------------
CREATE TABLE Student (
    studentID INT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    dob DATE,
    deptID INT,
    email VARCHAR(100),
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

-- Table: Course
-- -----------------
CREATE TABLE Course (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL,
    credit INT,
    deptID INT, -- Department offering the course
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

-- Table: Enrollment (Junction Table for Student-Course)
-- -----------------
CREATE TABLE Enrollment (
    enrollID INT PRIMARY KEY AUTO_INCREMENT,
    studentID INT,
    courseID INT,
    semester VARCHAR(10),
    score DECIMAL(4,2),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

-- =========================================
-- 3. INSERT DATA (DML)
-- =========================================

-- Insert Departments
-- Edge Case: Dept 6 has NO students
INSERT INTO Department (deptID, deptName, location) VALUES
(1, 'Computer Science', 'Building A1'),
(2, 'Information Technology', 'Building A2'),
(3, 'Business Administration', 'Building B1'),
(4, 'Marketing', 'Building B2'),
(5, 'Graphic Design', 'Building C1'),
(6, 'Research & Development', 'Building D1'); 

-- Insert Students
-- Edge Case: Student 117 has NO Department (NULL)
-- Edge Case: Student 116 has NO Enrollments
INSERT INTO Student (studentID, fullName, gender, dob, deptID, email) VALUES
(101, 'Nguyen Van A', 'Male', '2003-01-10', 1, 'a.nguyen@uni.edu'),
(102, 'Tran Thi B', 'Female', '2004-03-15', 1, 'b.tran@uni.edu'),
(103, 'Le Van C', 'Male',  '2003-08-22', 2, 'c.le@uni.edu'),
(104, 'Pham Thi D', 'Female', '2004-11-02', 2, 'd.pham@uni.edu'),
(105, 'Hoang Van E', 'Male',  '2003-05-19', 3, 'e.hoang@uni.edu'),
(106, 'Trinh Thi F', 'Female', '2004-07-25', 4, 'f.trinh@uni.edu'),
(107, 'Nguyen Van G', 'Male',  '2002-09-30', 5, 'g.nguyen@uni.edu'),
(108, 'Nguyen Thi H', 'Female', '2003-12-12', 1, 'h.nguyen@uni.edu'),
(109, 'Pham Van I', 'Male', '2004-02-18', 3, 'i.pham@uni.edu'),
(110, 'Tran Thi J', 'Female', '2003-10-09', 5, 'j.tran@uni.edu'),
(111, 'Le Van K', 'Male', '2004-03-20', 1, 'k.le@uni.edu'),
(112, 'Nguyen Thi L', 'Female', '2002-06-11', 2, 'l.nguyen@uni.edu'),
(113, 'Pham Van M', 'Male', '2003-07-05', 4, 'm.pham@uni.edu'),
(114, 'Tran Thi N', 'Female', '2004-01-27', 3, 'n.tran@uni.edu'),
(115, 'Nguyen Van O', 'Male', '2003-04-18', 5, 'o.nguyen@uni.edu'),
(116, 'Le Thi P (No Enroll)', 'Female', '2004-09-09', 1, 'p.le@uni.edu'),
(117, 'Do Van Q (No Dept)', 'Male', '2003-11-11', NULL, 'q.do@uni.edu');

-- Insert Courses
-- Edge Case: Course 211 has NO Enrollments
INSERT INTO Course (courseID, courseName, credit, deptID) VALUES
(201, 'Database Systems', 3, 1),
(202, 'Operating Systems', 4, 1),
(203, 'Networking Basics', 3, 2),
(204, 'Web Development', 3, 2),
(205, 'Business Management', 3, 3),
(206, 'Marketing Principles', 4, 4),
(207, 'Graphic Design 1', 3, 5),
(208, 'Graphic Design 2', 3, 5),
(209, 'Digital Marketing', 3, 4),
(210, 'E-Commerce', 3, 3),
(211, 'Artificial Intelligence', 4, 1);

-- Insert Enrollments
INSERT INTO Enrollment (studentID, courseID, semester, score) VALUES
-- Student 101 (CS)
(101, 201, '2023A', 85.5),
(101, 202, '2023A', 78.0),
-- Student 102 (CS)
(102, 201, '2023A', 92.0),
(102, 210, '2023B', 88.0), -- Taking course from Business
-- Student 103 (IT)
(103, 203, '2023A', 74.5),
(103, 204, '2023B', 80.0),
-- Student 104 (IT)
(104, 203, '2023A', 88.5),
-- Student 105 (Biz)
(105, 205, '2023A', 90.0),
(105, 210, '2023B', 91.0),
-- Student 106 (Marketing)
(106, 206, '2023A', 83.0),
(106, 209, '2023B', 79.0),
-- Student 107 (Design)
(107, 207, '2023A', 75.0),
(107, 208, '2023B', 79.0),
-- Student 108 (CS)
(108, 201, '2023B', 91.0),
-- Student 109 (Biz)
(109, 205, '2023A', 67.0), -- Low score
(109, 210, '2023B', 84.0),
-- Student 110 (Design)
(110, 207, '2023A', 88.0),
(110, 208, '2023A', 84.0),
-- Student 111 (CS)
(111, 204, '2023B', 72.0), -- CS taking Web Dev
-- Student 112 (IT)
(112, 203, '2023B', 95.0),
-- Student 113 (Marketing)
(113, 206, '2023A', 89.0),
-- Student 114 (Biz)
(114, 205, '2023B', 82.0),
(114, 209, '2023A', 76.0),
-- Student 115 (Design)
(115, 207, '2023A', 73.0),
(115, 209, '2023B', 86.0);

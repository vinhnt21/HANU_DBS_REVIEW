-- =========================================
-- TABLE 1: Department
-- =========================================
CREATE TABLE Department (
    deptID INT PRIMARY KEY,
    deptName VARCHAR(100) NOT NULL,
    location VARCHAR(50)
);

INSERT INTO Department VALUES
(1, 'Computer Science', 'A1'),
(2, 'Information Technology', 'A2'),
(3, 'Business Administration', 'B1'),
(4, 'Marketing', 'B2'),
(5, 'Graphic Design', 'C1');

-- =========================================
-- TABLE 2: Student
-- =========================================
CREATE TABLE Student (
    studentID INT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    dob DATE,
    deptID INT,
    email VARCHAR(100),
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

INSERT INTO Student VALUES
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
(115, 'Nguyen Van O', 'Male', '2003-04-18', 5, 'o.nguyen@uni.edu');

-- =========================================
-- TABLE 3: Course
-- =========================================
CREATE TABLE Course (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL,
    credit INT,
    deptID INT,
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

INSERT INTO Course VALUES
(201, 'Database Systems', 3, 1),
(202, 'Operating Systems', 4, 1),
(203, 'Networking Basics', 3, 2),
(204, 'Web Development', 3, 2),
(205, 'Business Management', 3, 3),
(206, 'Marketing Principles', 4, 4),
(207, 'Graphic Design 1', 3, 5),
(208, 'Graphic Design 2', 3, 5),
(209, 'Digital Marketing', 3, 4),
(210, 'E-Commerce', 3, 3);

-- =========================================
-- TABLE 4: Enrollment (Many-to-Many)
-- =========================================
CREATE TABLE Enrollment (
    enrollID INT PRIMARY KEY AUTO_INCREMENT,
    studentID INT,
    courseID INT,
    semester VARCHAR(10),
    score DECIMAL(4,2),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

INSERT INTO Enrollment (studentID, courseID, semester, score) VALUES
(101, 201, '2023A', 85.5),
(101, 202, '2023A', 78.0),
(102, 201, '2023A', 92.0),
(103, 203, '2023A', 74.5),
(103, 204, '2023B', 80.0),
(104, 203, '2023A', 88.5),
(105, 205, '2023A', 90.0),
(106, 206, '2023A', 83.0),
(107, 207, '2023A', 75.0),
(107, 208, '2023B', 79.0),
(108, 201, '2023B', 91.0),
(109, 205, '2023A', 67.0),
(110, 207, '2023A', 88.0),
(110, 208, '2023A', 84.0),
(111, 204, '2023B', 72.0),
(112, 203, '2023B', 95.0),
(113, 206, '2023A', 89.0),
(114, 205, '2023B', 82.0),
(115, 207, '2023A', 73.0),
(115, 209, '2023B', 86.0),
(102, 210, '2023B', 88.0),
(105, 210, '2023B', 91.0),
(106, 209, '2023B', 79.0),
(109, 210, '2023B', 84.0),
(114, 209, '2023A', 76.0);


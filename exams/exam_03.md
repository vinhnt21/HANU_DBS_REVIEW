# 📝 DBS Mock Exam 03

**Time Limit:** 70 minutes
**Format:** Paper-based
**Scope:** ERD, Relational Model, Normalization (1NF-3NF), SQL (DDL, DML, SELECT)

---

## Part 1: Multiple Choice (5.0 points)

1. **(MCQ)** Which of the following is a violation of 3NF?
   a) Partial Dependency
   b) Repeating Groups
   c) Transitive Dependency
   d) Multi-valued Attributes

2. **(MCQ)** In a 1:N relationship between `Department` and `Employee`, where should the Foreign Key be placed?
   a) In the `Department` table
   b) In the `Employee` table
   c) In a new junction table
   d) Both tables

3. **(Fill-in-blank)** The SQL command to remove a table *and* its data permanently is _________.

4. **(True/False)** The logical order of execution for a SQL query places `SELECT` before `HAVING`.
   (True / False)

5. **(MCQ)** Which constraint ensures that a value in a column is unique within the table but can accept one or more NULLs (depending on DB)?
   a) PRIMARY KEY
   b) FOREIGN KEY
   c) UNIQUE
   d) CHECK

6. **(MCQ)** To extract the year from a date column `order_date`, the function is:
   a) `EXTRACT_YEAR(order_date)`
   b) `GETDATE(order_date)`
   c) `YEAR(order_date)`
   d) `DATE(order_date)`

7. **(Fill-in-blank)** An attribute that can be calculated from other attributes is called a _________ attribute.

8. **(True/False)** `UPDATE` statements must always include a `SET` clause.
   (True / False)

9. **(MCQ)** Which symbol in an ER diagram represents a multivalued attribute?
   a) Single Oval
   b) Double Oval
   c) Rectangle
   d) Diamond

10. **(MCQ)** What is the result of `SELECT CONCAT('SQL', NULL);`?
    a) 'SQL'
    b) 'SQLNULL'
    c) NULL
    d) Error

---

## Part 2: Short Answer (5.0 points)

### Question 1: ER Diagram Design (1.5 pts)
**Scenario:** A University Course System manages academic data including professors, courses, and students. The system records which professor teaches which class sections of a course. It also tracks student enrollments in these classes, allowing for grade recording for each student in each class they take.

**Task:** Draw/Describe the ER Diagram, identifying entities, relationships, and any bridge tables needed.

### Question 2: Normalization (1.5 pts)
**Given the table `LibraryLoan`:**
`Loan(LoanID, MemberID, MemberName, MemberAddress, BookID, BookTitle, Author, DueDate)`

**Dependencies:**
- `LoanID` → `MemberID`, `BookID`, `DueDate`
- `MemberID` → `MemberName`, `MemberAddress`
- `BookID` → `BookTitle`, `Author`

**Task:**
1. Explain why this table is **not in 3NF**.
2. Decompose the table into **3NF**. List the tables with their Primary Keys.

### Question 3: SQL Writing (2.0 pts)
**Based on the schema in `script.sql`:**

1. **(DDL)** Create a table named `Club` with columns: `clubID` (INT, PK), `clubName` (VARCHAR 50), and `establishedDate` (DATE).
2. **(DML)** Insert a new club: ID=1, Name="Coding Club", Established Today (use a function for today's date).
3. **(SELECT)** List the `fullName` of students, the `courseName`, and the `deptName` of the department offering that course. (Requires joining Student -> Enrollment -> Course -> Department).
4. **(SELECT)** Find the `semester` and the number of students enrolled in that semester, but only for semesters with more than 5 students.

---
---

# 🔑 Answer Key - Exam 03

### Part 1
1. **c)** Transitive Dependency
2. **b)** In the Employee table (The "Many" side gets the FK)
3. **DROP TABLE**
4. **False** (FROM -> WHERE -> GROUP BY -> HAVING -> SELECT)
5. **c)** UNIQUE
6. **c)** YEAR(order_date)
7. **Derived**
8. **True**
9. **b)** Double Oval
10. **c)** NULL (Concatenating with NULL usually yields NULL in standard SQL/MySQL)

### Part 2

**Q1: ERD**
- **Entities:** Professor, Course, Class (Weak entity? or Strong?), Student.
- **Relationships:**
  - Course `1` -- `N` Class (One course has many class sections).
  - Professor `1` -- `N` Class (One prof teaches many classes).
  - Student `M` -- `N` Class (Enrolls).
- **Bridge Table:** `Enrollment` (Student - Class).
  - Attributes: `StudentID`, `ClassID`, `Grade`.
  - Keys: Composite `{StudentID, ClassID}`.

**Q2: Normalization**
1. **Violation:** It has transitive dependencies. `LoanID` determines `MemberID`, which determines `MemberName`. `LoanID` determines `BookID`, which determines `BookTitle`. Non-key attributes depend on other non-key attributes.
2. **3NF Decomposition:**
   - **Member:** (MemberID [PK], MemberName, MemberAddress)
   - **Book:** (BookID [PK], BookTitle, Author)
   - **Loan:** (LoanID [PK], MemberID [FK], BookID [FK], DueDate)

**Q3: SQL**
1.
   ```sql
   CREATE TABLE Club (
       clubID INT PRIMARY KEY,
       clubName VARCHAR(50),
       establishedDate DATE
   );
   ```
2.
   ```sql
   INSERT INTO Club VALUES (1, 'Coding Club', CURDATE()); -- or NOW()
   ```
3.
   ```sql
   SELECT s.fullName, c.courseName, d.deptName
   FROM Student s
   JOIN Enrollment e ON s.studentID = e.studentID
   JOIN Course c ON e.courseID = c.courseID
   JOIN Department d ON c.deptID = d.deptID;
   ```
   *(Note: Question asks for dept offering the COURSE, so join Course -> Dept, not Student -> Dept)*

4.
   ```sql
   SELECT semester, COUNT(studentID)
   FROM Enrollment
   GROUP BY semester
   HAVING COUNT(studentID) > 5;
   ```


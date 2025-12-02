# 📝 DBS Mock Exam 01

**Time Limit:** 70 minutes
**Format:** Paper-based
**Scope:** ERD, Relational Model, Normalization (1NF-3NF), SQL (DDL, DML, SELECT)

---

## Part 1: Multiple Choice (5.0 points)

**Choose the best answer or fill in the blank.**

1. **(MCQ)** Which of the following is NOT a property of a Primary Key?
   a) Unique
   b) Not Null
   c) Stable
   d) Can be duplicated if necessary

2. **(MCQ)** In the Relational Model, a "Tuple" corresponds to a _________ in a table.
   a) Column
   b) Row
   c) Key
   d) Relationship

3. **(MCQ)** Which Normal Form eliminates **transitive dependencies**?
   a) 1NF
   b) 2NF
   c) 3NF
   d) BCNF

4. **(True/False)** A Foreign Key must always refer to a Primary Key in the same table.
   (True / False)

5. **(True/False)** `DELETE FROM Student;` will delete the table structure and all data.
   (True / False)

6. **(Fill-in-blank)** The SQL command to modify the data type of an existing column is `ALTER TABLE ... _________ ...`

7. **(Fill-in-blank)** In an ER diagram, a relationship between an entity and itself is called a _________ relationship.

8. **(MCQ)** Which aggregate function ignores NULL values?
   a) `COUNT(*)`
   b) `COUNT(column_name)`
   c) Both ignore NULL
   d) Neither ignores NULL

9. **(MCQ)** To filter groups of data AFTER applying `GROUP BY`, you must use:
   a) WHERE
   b) HAVING
   c) ORDER BY
   d) DISTINCT

10. **(MCQ)** What is the result of `SELECT SUBSTRING('Database', 1, 4);`?
    a) Data
    b) Data
    c) Base
    d) Dat

---

## Part 2: Short Answer (5.0 points)

### Question 1: ER Diagram Design (1.5 pts)
**Scenario:** A Hospital Management System needs to store data about its operations. The system tracks doctors with their specializations and the patients they care for. Each patient is treated by a primary doctor. Furthermore, patients are admitted to specific wards, and the system must record which ward each patient is assigned to, ensuring proper bed management.

**Task:** Draw the ER Diagram (Entity names, Attributes, Relationships, Cardinalities).

### Question 2: Normalization (1.5 pts)
**Given the unnormalized table `ProjectAssignment`:**

| EmpID | EmpName | ProjID | ProjName | ProjLocation | HoursWorked |
|-------|---------|--------|----------|--------------|-------------|
| E01   | Alice   | P1     | Website  | NY           | 20          |
| E01   | Alice   | P2     | App      | CA           | 15          |
| E02   | Bob     | P1     | Website  | NY           | 30          |

**Dependencies:**
- `EmpID` → `EmpName`
- `ProjID` → `ProjName`, `ProjLocation`
- `{EmpID, ProjID}` → `HoursWorked`

**Task:** Normalize this table to **3NF**. Show the resulting table structures (Table Name, PK, FK, Attributes).

### Question 3: SQL Writing (2.0 pts)
**Based on the schema in `script.sql` (Student, Department, Course, Enrollment):**

1. **(DDL)** Write a SQL statement to add a column `phoneNumber` (VARCHAR 15) to the `Student` table.
2. **(DML)** Increase the `score` by 1.0 for all enrollments in the semester '2023A'.
3. **(SELECT from singgle table)**  List all student is male
4. **(SELECT)** List the `fullName` of students and the `courseName` of courses they have enrolled in, but ONLY for students in the "Computer Science" department (Assume `deptID=1` for CS).
5. **(SELECT)** Calculate the average score for each course (`courseID`), showing `courseID` and `avg_score`, but only for courses with an average score greater than 80.

---
---

# 🔑 Answer Key - Exam 01

### Part 1
1. **d)** (PK must be unique)
2. **b)** (Tuple = Row)
3. **c)** (3NF eliminates transitive)
4. **False** (FK usually refers to PK in *another* table, though self-referencing is possible, "must always... same table" is false)
5. **False** (DELETE only deletes data, DROP deletes structure)
6. **MODIFY** (or `ALTER COLUMN` / `CHANGE` depending on DB dialect)
7. **Recursive**
8. **b)** (`COUNT(col)` ignores NULL, `COUNT(*)` counts all rows)
9. **b)** (HAVING filters groups)
10. **a)** (Data - typically 1-based index in SQL standard)

### Part 2

**Q1: ERD**
- **Entities:**
  - **Doctor** (DoctorID [PK], Name, Specialization)
  - **Patient** (PatientID [PK], Name, DateOfBirth)
  - **Ward** (WardID [PK], Location)
- **Relationships:**
  - Doctor `1` ---- `N` Patient (Treats)
  - Ward `1` ---- `N` Patient (Assigned)
- **Diagram Description:**
  - One Doctor connects to Many Patients.
  - One Ward connects to Many Patients.
  - Patient has FKs to Doctor and Ward.

**Q2: Normalization**
- **Table Employee:**
  - `EmpID` (PK)
  - `EmpName`
- **Table Project:**
  - `ProjID` (PK)
  - `ProjName`
  - `ProjLocation`
- **Table Assignment:**
  - `EmpID` (FK) \
  - `ProjID` (FK) / **Composite PK**
  - `HoursWorked`

**Q3: SQL**
1. `ALTER TABLE Student ADD phoneNumber VARCHAR(15);`
2. `UPDATE Enrollment SET score = score + 1.0 WHERE semester = '2023A';`
3.
   ```sql
   SELECT s.fullName, c.courseName
   FROM Student s
   JOIN Enrollment e ON s.studentID = e.studentID
   JOIN Course c ON e.courseID = c.courseID
   WHERE s.deptID = 1;
   ```
4.
   ```sql
   SELECT courseID, AVG(score) AS avg_score
   FROM Enrollment
   GROUP BY courseID
   HAVING AVG(score) > 80;
   ```


# 📝 DBS Mock Exam 04

**Time Limit:** 70 minutes
**Format:** Paper-based
**Scope:** ERD, Relational Model, Normalization (1NF-3NF), SQL (DDL, DML, SELECT)

---

## Part 1: Multiple Choice (5.0 points)

1. **(MCQ)** **Entity Integrity** Rule states that:
   a) Foreign Keys cannot be NULL
   b) Primary Keys cannot be NULL
   c) All attributes must be atomic
   d) Relationships must be consistent

2. **(MCQ)** An attribute that is a potential Primary Key but was not chosen is called:
   a) Super Key
   b) Foreign Key
   c) Alternate Key
   d) Composite Key

3. **(True/False)** A **Ternary Relationship** involves three entities.
   (True / False)

4. **(MCQ)** If you do not specify `ASC` or `DESC` in `ORDER BY`, the default sort order is:
   a) Random
   b) Descending
   c) Ascending
   d) None

5. **(Fill-in-blank)** The SQL datatype `VARCHAR(n)` stores _________ length strings, while `CHAR(n)` stores fixed length strings.

6. **(MCQ)** Which of the following is NOT a valid Aggregate Function?
   a) `SUM()`
   b) `AVG()`
   c) `TOTAL()`
   d) `MAX()`

7. **(True/False)** You can join a table to itself (Self Join).
   (True / False)

8. **(MCQ)** Which normal form deals with eliminating "partial dependencies"?
   a) 1NF
   b) 2NF
   c) 3NF
   d) 4NF

9. **(Fill-in-blank)** In SQL, to select rows where a column value is "undefined" or "unknown", you use `WHERE column _________`. (Write the operator)

10. **(MCQ)** In an ERD, a double line between an Entity and a Relationship indicates:
    a) Partial Participation
    b) Total Participation
    c) Weak Entity
    d) Composite Attribute

---

## Part 2: Short Answer (5.0 points)

### Question 1: ER Diagram Design (1.5 pts)
**Scenario:** An **E-commerce System**.
- **Customers** (CustID, Name, Address) place **Orders**.
- **Orders** (OrderID, Date) contain **Products**.
- **Products** (ProdID, Name, Price).
- An Order belongs to one Customer. A Customer can place many Orders.
- An Order can contain many Products, and a Product can be in many Orders.
- We need to store the `Quantity` of each product in an order.

**Task:** Draw/Describe the ER Diagram and the schema for the Order-Product relationship.

### Question 2: Normalization (1.5 pts)
**Given the table `EmployeeTraining`:**
`Training(EmpID, EmpName, CourseID, CourseTitle, DateCompleted, Instructor)`

**Dependencies:**
- `EmpID` → `EmpName`
- `CourseID` → `CourseTitle`
- `{EmpID, CourseID}` → `DateCompleted`, `Instructor` (Assumption: Instructor depends on the specific session/course taken by employee? Or does CourseID determine Instructor? *Assume Instructor depends on CourseID* for this exercise).
- **Revised Assumption for question:** `CourseID` → `Instructor`.

**Task:**
1. Identify the **PK** of the unnormalized table.
2. Identify dependencies that violate **2NF** or **3NF**.
3. Normalize to **3NF**.

### Question 3: SQL Writing (2.0 pts)
**Based on the schema in `script.sql`:**

1. **(DDL)** Remove the column `gender` from the `Student` table.
2. **(DML)** Update the `credit` of all courses offered by the 'Marketing' department (`deptID`=4) to 5.
3. **(SELECT)** List the `fullName` of students who scored the **highest score** found in the entire `Enrollment` table. (Hint: You can use `WHERE score = (SELECT MAX(score) ...)` or `ORDER BY ... LIMIT 1` if allowed, but since Subquery is NO, use `ORDER BY score DESC LIMIT 1` or just list the query logic). *Wait, Subquery is listed as NOT IN EXAM. Use ORDER BY.*
4. **(SELECT)** Find all departments that do **not** have any courses. (Hint: `LEFT JOIN` Department and Course).

---
---

# 🔑 Answer Key - Exam 04

### Part 1
1. **b)** Primary Keys cannot be NULL
2. **c)** Alternate Key
3. **True**
4. **c)** Ascending
5. **Variable**
6. **c)** `TOTAL()` (SQL uses `SUM()`, `TOTAL` is not standard)
7. **True**
8. **b)** 2NF
9. **IS NULL**
10. **b)** Total Participation

### Part 2

**Q1: ERD**
- **Entities:** Customer, Order, Product.
- **Relationships:**
  - Customer `1` -- `N` Order.
  - Order `M` -- `N` Product.
- **Associative Entity:** `OrderItem` (or `OrderDetail`).
  - PK: `{OrderID, ProdID}`.
  - Attributes: `Quantity`.

**Q2: Normalization**
- **PK:** `{EmpID, CourseID}`
- **Violations:**
  - `EmpID` → `EmpName` (Partial Dependency -> Violated 2NF).
  - `CourseID` → `CourseTitle`, `Instructor` (Partial Dependency -> Violated 2NF).
- **3NF Transformation:**
  - **Employee:** (EmpID, EmpName)
  - **Course:** (CourseID, CourseTitle, Instructor)
  - **TrainingLog:** (EmpID, CourseID, DateCompleted)

**Q3: SQL**
1. `ALTER TABLE Student DROP COLUMN gender;`
2. `UPDATE Course SET credit = 5 WHERE deptID = 4;`
3.
   ```sql
   SELECT s.fullName, e.score
   FROM Student s
   JOIN Enrollment e ON s.studentID = e.studentID
   ORDER BY e.score DESC
   LIMIT 1;
   ```
   *(Note: LIMIT is standard MySQL, widely used).*

4.
   ```sql
   SELECT d.deptName
   FROM Department d
   LEFT JOIN Course c ON d.deptID = c.deptID
   WHERE c.courseID IS NULL;
   ```


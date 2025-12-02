# 📝 DBS Mock Exam 02

**Time Limit:** 70 minutes
**Format:** Paper-based
**Scope:** ERD, Relational Model, Normalization (1NF-3NF), SQL (DDL, DML, SELECT)

---

## Part 1: Multiple Choice (5.0 points)

1. **(MCQ)** Data that has been processed to have meaning is called:
   a) Database
   b) Information
   c) Knowledge
   d) Schema

2. **(MCQ)** Which relationship allows a record in Table A to be related to multiple records in Table B, and vice versa?
   a) One-to-One
   b) One-to-Many
   c) Many-to-Many
   d) Self-Referencing

3. **(True/False)** The `BETWEEN` operator is inclusive (includes both start and end values).
   (True / False)

4. **(True/False)** A Weak Entity always has a Primary Key that is independent of other entities.
   (True / False)

5. **(MCQ)** Which SQL clause is used to pattern match strings?
   a) MATCH
   b) LIKE
   c) SAME
   d) EQUALS

6. **(Fill-in-blank)** To remove duplicate rows from a SELECT result, use the keyword _________.

7. **(Fill-in-blank)** The constraint that ensures a column cannot contain NULL values is _________.

8. **(MCQ)** `LEFT JOIN` returns:
   a) Matching rows from both tables
   b) All rows from the left table and matching from the right
   c) All rows from the right table and matching from the left
   d) All rows from both tables

9. **(MCQ)** Which violates 1NF?
   a) Composite Key
   b) Multi-valued attribute (repeating group)
   c) Transitive Dependency
   d) Partial Dependency

10. **(MCQ)** What does `DATEDIFF('2024-01-10', '2024-01-01')` return?
    a) 10
    b) 9
    c) -9
    d) '9 days'

---

## Part 2: Short Answer (5.0 points)

### Question 1: ER Diagram Design (1.5 pts)
**Scenario:** A Bookstore System requires a database to manage authors, books, and publishers. The system needs to track which authors wrote which books, handling cases where books have multiple authors. Additionally, it stores information about publishers and links them to the books they have published, ensuring every book is associated with a publisher.

**Task:** Draw/Describe the ER Diagram, specifically mentioning how to handle the Many-to-Many relationship.

### Question 2: Normalization (1.5 pts)
**Given the table `OrderData`:**
`Order(OrderID, Date, CustomerID, CustomerName, ProductID, ProductName, Quantity)`

**Dependencies:**
- `OrderID` → `Date`, `CustomerID`
- `CustomerID` → `CustomerName`
- `ProductID` → `ProductName`
- `{OrderID, ProductID}` → `Quantity`

**Task:**
1. Identify the **Partial Dependency**.
2. Identify the **Transitive Dependency**.
3. Convert to **3NF**.

### Question 3: SQL Writing (2.0 pts)
**Based on the schema in `script.sql`:**

1. **(DDL)** Create a view named `TopStudents` that selects `studentID` and `fullName` of students who have an `Enrollment` score equal to 100.
2. **(DML)** Delete all courses that have `credit` less than 2.
3. **(SELECT)** Find the total number of students in each department (`deptName`). Sort the result by the count in descending order.
4. **(SELECT)** Find students (`fullName`) who have NOT enrolled in any course. (Hint: Use LEFT JOIN and check for NULL).

---
---

# 🔑 Answer Key - Exam 02

### Part 1
1. **b)** Information
2. **c)** Many-to-Many
3. **True**
4. **False** (Weak entity relies on strong entity's PK)
5. **b)** LIKE
6. **DISTINCT**
7. **NOT NULL**
8. **b)**
9. **b)** (Atomic values rule)
10. **b)** 9

### Part 2

**Q1: ERD**
- **Entities:**
  - **Author** (AuthorID [PK], Name)
  - **Book** (ISBN [PK], Title)
  - **Publisher** (PubID [PK], Name)
- **Relationships:**
  - Author `M` ---- `N` Book (Writes)
  - Book `N` ---- `1` Publisher (Published By)
- **Handling M:N:**
  - Create a junction table (Associative Entity) named `Author_Book` (or similar).
  - Attributes: `AuthorID` (FK), `ISBN` (FK).
  - Composite PK: `{AuthorID, ISBN}`.

**Q2: Normalization**
Assuming PK for `OrderData` is `{OrderID, ProductID}`:
1. **Partial:**
   - `OrderID` → `Date`, `CustomerID` (Depends only on part of PK)
   - `ProductID` → `ProductName` (Depends only on part of PK)
2. **Transitive:**
   - `OrderID` → `CustomerID` → `CustomerName`
3. **3NF Transformation:**
   - **Customer:** (CustomerID, CustomerName)
   - **Product:** (ProductID, ProductName)
   - **Order:** (OrderID, Date, CustomerID)
   - **OrderDetail:** (OrderID, ProductID, Quantity)

**Q3: SQL**
1.
   ```sql
   CREATE VIEW TopStudents AS
   SELECT s.studentID, s.fullName
   FROM Student s
   JOIN Enrollment e ON s.studentID = e.studentID
   WHERE e.score = 100;
   ```
2. `DELETE FROM Course WHERE credit < 2;`
3.
   ```sql
   SELECT d.deptName, COUNT(s.studentID)
   FROM Department d
   LEFT JOIN Student s ON d.deptID = s.deptID
   GROUP BY d.deptName
   ORDER BY COUNT(s.studentID) DESC;
   ```
4.
   ```sql
   SELECT s.fullName
   FROM Student s
   LEFT JOIN Enrollment e ON s.studentID = e.studentID
   WHERE e.enrollID IS NULL;
   ```


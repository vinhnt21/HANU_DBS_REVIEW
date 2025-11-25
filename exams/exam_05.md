# 📝 DBS Mock Exam 05

**Time Limit:** 70 minutes
**Format:** Paper-based
**Scope:** ERD, Relational Model, Normalization (1NF-3NF), SQL (DDL, DML, SELECT)

---

## Part 1: Multiple Choice (5.0 points)

1. **(MCQ)** A collection of related data is called a:
   a) System
   b) Database
   c) Management
   d) Process

2. **(MCQ)** Which of the following guarantees that a database transaction is processed reliably (All or Nothing)?
   a) Atomicity
   b) Consistency
   c) Isolation
   d) Durability

3. **(True/False)** In 2NF, all non-key attributes must be fully dependent on the Primary Key.
   (True / False)

4. **(Fill-in-blank)** A Key composed of more than one attribute is called a _________ Key.

5. **(MCQ)** `DROP TABLE` vs `DELETE FROM`:
   a) They are the same
   b) DROP deletes data only, DELETE deletes structure
   c) DELETE deletes data only, DROP deletes structure and data
   d) DELETE cannot be rolled back

6. **(MCQ)** Which SQL keyword is used to combine the result-set of two or more SELECT statements?
   a) JOIN
   b) MERGE
   c) UNION
   d) COMBINE

7. **(True/False)** `COUNT(DISTINCT col)` counts the number of unique non-null values in `col`.
   (True / False)

8. **(MCQ)** The "Schema" of a database refers to:
   a) The data stored in it at a given moment
   b) The logical structure or blueprint
   c) The hardware it runs on
   d) The list of users

9. **(Fill-in-blank)** In an ERD, a diamond shape usually represents a _________.

10. **(MCQ)** To check if a string ends with 'system', the LIKE pattern is:
    a) 'system%'
    b) '%system'
    c) '_system'
    d) 'system_'

---

## Part 2: Short Answer (5.0 points)

### Question 1: ER Diagram Design (1.5 pts)
**Scenario:** A **Hotel Booking System**.
- **Guests** (GuestID, Name, Phone).
- **Rooms** (RoomNumber, Type, Price).
- Guests make **Reservations** for Rooms.
  - A Guest can make many reservations.
  - A Room can be reserved many times (on different dates).
  - A Reservation tracks `CheckInDate` and `CheckOutDate`.

**Task:** Draw/Describe the ER Diagram. What is the Primary Key for the Reservation entity/table?

### Question 2: Normalization (1.5 pts)
**Given the table `Invoice`:**
`Invoice(InvoiceNum, Date, CustID, CustName, ItemID, ItemName, UnitPrice, Qty)`

**Dependencies:**
- `InvoiceNum` → `Date`, `CustID`
- `CustID` → `CustName`
- `ItemID` → `ItemName`, `UnitPrice`
- `{InvoiceNum, ItemID}` → `Qty`

**Task:** Normalize to **3NF**.

### Question 3: SQL Writing (2.0 pts)
**Based on the schema in `script.sql`:**

1. **(DDL)** Drop the table `Enrollment`. (Write the command).
2. **(DML)** Insert a new Department: ID=10, Name="Physics", Location="Building C".
3. **(SELECT)** Calculate the total number of credits (`credit`) for all courses offered by the "Computer Science" department.
4. **(SELECT)** List the `fullName` of students and their `gender`. If the gender is NULL, it should theoretically display NULL, but assume data is clean. Order the results by Gender first, then Name.

---
---

# 🔑 Answer Key - Exam 05

### Part 1
1. **b)** Database
2. **a)** Atomicity
3. **True**
4. **Composite**
5. **c)** DELETE deletes data, DROP deletes structure
6. **c)** UNION
7. **True**
8. **b)** Logical structure
9. **Relationship**
10. **b)** '%system'

### Part 2

**Q1: ERD**
- **Entities:** Guest, Room.
- **Relationship:** Reservation (M:N).
- **Associative Entity/Table:** `Reservation`.
  - Attributes: `GuestID`, `RoomNumber`, `CheckInDate`, `CheckOutDate`.
  - **PK:** `{GuestID, RoomNumber, CheckInDate}` (Since a guest could reserve the same room on different dates). Alternatively, a surrogate `ReservationID` is often used in practice, but based on natural keys, we need Date included.

**Q2: Normalization**
- **1NF:** Already 1NF (assuming atomic).
- **2NF:**
  - `{InvoiceNum, ItemID}` is PK.
  - `InvoiceNum` → `Date`, `CustID` (Partial).
  - `ItemID` → `ItemName`, `UnitPrice` (Partial).
- **3NF:**
  - `CustID` → `CustName` (Transitive).
- **Resulting Tables:**
  1. **Customer:** (CustID, CustName)
  2. **Item:** (ItemID, ItemName, UnitPrice)
  3. **Invoice:** (InvoiceNum, Date, CustID)
  4. **InvoiceLine:** (InvoiceNum, ItemID, Qty)

**Q3: SQL**
1. `DROP TABLE Enrollment;`
2. `INSERT INTO Department VALUES (10, 'Physics', 'Building C');`
3.
   ```sql
   SELECT SUM(c.credit)
   FROM Course c
   JOIN Department d ON c.deptID = d.deptID
   WHERE d.deptName = 'Computer Science';
   ```
4.
   ```sql
   SELECT fullName, gender
   FROM Student
   ORDER BY gender, fullName;
   ```


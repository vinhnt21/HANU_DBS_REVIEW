---
markmap:
  initialExpandLevel: 2
  colorFreezeLevel: 4
---

# SQL Review (Exam Scope)

## 📋 Exam Scope Overview (Phạm vi thi)

### ✅ What is IN the Exam (Có thi)
- **DDL:** CREATE, ALTER, DROP
- **DML:** INSERT, UPDATE, DELETE
- **Basic SELECT:** SELECT, Alias, ORDER BY, Operators (+, -, *, /), WHERE
- **Advanced SELECT:** JOIN, Aggregate Functions, GROUP BY, HAVING, DateTime Functions, String Functions, VIEW

### ❌ What is NOT in the Exam (Không thi)
- ❌ Subquery (Truy vấn con)
- ❌ Stored Procedures (Thủ tục lưu trữ)

---

## 🔹 SQL Overview

### What is SQL?
- **EN:** Structured Query Language; used to interact with relational databases
- **VN:** Ngôn ngữ truy vấn dùng để làm việc với CSDL quan hệ
- Includes: **DDL, DML, DQL, DCL** (thi chỉ yêu cầu DDL/DML/DQL)

### CRUD Operations
- **Create** - Tạo dữ liệu mới (INSERT)
- **Read** - Đọc/truy vấn dữ liệu (SELECT)
- **Update** - Cập nhật dữ liệu (UPDATE)
- **Delete** - Xóa dữ liệu (DELETE)

---

## 🔹 Logical Query Processing Order

### Execution Order (Thứ tự thực thi)
1. **FROM / JOIN** - Lấy và kết hợp bảng
2. **WHERE** - Lọc dữ liệu
3. **GROUP BY** - Gom nhóm
4. **HAVING** - Lọc sau khi nhóm
5. **SELECT** - Chọn cột
6. **ORDER BY** - Sắp xếp

- **VN dễ hiểu:** SQL thực thi *không* theo thứ tự bạn viết — nó xử lý bảng → lọc → gom nhóm → lọc sau nhóm → chọn cột → sắp xếp
- ⚠️ **LƯU Ý THI:** Câu hỏi về thứ tự thực thi thường xuất hiện trong phần trắc nghiệm!

---

## 🔹 DDL — Data Definition Language

### CREATE

#### Create Database
- **VN:** Tạo cơ sở dữ liệu mới
  ```sql
  CREATE DATABASE dbname;
  ```
#### Create Table
- **VN:** Tạo bảng mới với cấu trúc
  ```sql
  CREATE TABLE tableName (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    createdAt DATE
  );
  ```
#### Constraints (Ràng buộc)
- **PRIMARY KEY** - Khóa chính (duy nhất, không NULL)
- **FOREIGN KEY** - Khóa ngoại (tham chiếu bảng khác)
- **NOT NULL** - Không được để trống
- **UNIQUE** - Giá trị duy nhất
- **DEFAULT** - Giá trị mặc định
- **AUTO_INCREMENT** - Tự động tăng

#### Example with Constraints
- **VN:** Ví dụ tạo bảng với đầy đủ ràng buộc
  ```sql
  CREATE TABLE Student (
    studentID INT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    deptID INT,
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
  );
  ```

---

### ALTER TABLE

#### Add Column
- **VN:** Thêm cột mới vào bảng
  ```sql
  ALTER TABLE Student ADD email VARCHAR(100);
  ```

#### Modify Column
- **VN:** Thay đổi kiểu dữ liệu hoặc kích thước cột
  ```sql
  ALTER TABLE Student MODIFY email VARCHAR(150);
  ```

#### Drop Column
- **VN:** Xóa cột khỏi bảng
  ```sql
  ALTER TABLE Student DROP COLUMN email;
  ```

#### Rename Table
- **VN:** Đổi tên bảng
  ```sql
  ALTER TABLE Student RENAME TO Students;
  ```

---

### DROP TABLE
- **VN:** Xóa bảng (cẩn thận, không thể khôi phục!)
  ```sql
  DROP TABLE Student;
  ```

---

## 🔹 DML — Data Manipulation Language

### INSERT

#### Insert full row
- **VN:** Thêm dòng mới với đầy đủ giá trị (theo thứ tự cột)
  ```sql
  INSERT INTO Student VALUES (101, 'Nguyen Van A', 'Male', '2003-01-10', 1, 'a.nguyen@uni.edu');
  ```

#### Insert specific columns
- **VN:** Chỉ thêm giá trị cho một số cột cụ thể
  ```sql
  INSERT INTO Student (studentID, fullName)
  VALUES (101, 'Nguyen Van A');
  ```

#### Insert multiple rows
- **VN:** Thêm nhiều dòng cùng lúc
  ```sql
  INSERT INTO Student (studentID, fullName) VALUES
  (101, 'Nguyen Van A'),
  (102, 'Tran Thi B'),
  (103, 'Le Van C');
  ```

---

### UPDATE

#### Basic Update
- ⚠️ **Luôn nhớ WHERE** - Nếu thiếu → cập nhật TẤT CẢ dòng!
- **VN:** Cập nhật dữ liệu có sẵn
  ```sql
  UPDATE Student
  SET fullName = 'Nguyen Van A (Updated)'
  WHERE studentID = 101;
  ```

#### Update multiple columns
- **VN:** Cập nhật nhiều cột cùng lúc
  ```sql
  UPDATE Student
  SET fullName = 'Nguyen Van A', email = 'new.email@uni.edu'
  WHERE studentID = 101;
  ```

---

### DELETE

#### Basic Delete
- ⚠️ **Luôn nhớ WHERE** - Nếu thiếu → xóa TẤT CẢ dòng!
- **VN:** Xóa dữ liệu
  ```sql
  DELETE FROM Student
  WHERE studentID = 101;
  ```

#### Delete all rows (Keep structure)
- **VN:** Xóa tất cả dữ liệu nhưng giữ lại cấu trúc bảng
  ```sql
  DELETE FROM Student;
  ```

---

## 🔹 DQL — Data Query Language (SELECT)

### Basic SELECT

#### Select all columns
- **VN:** Lấy tất cả cột từ bảng Student
  ```sql
  SELECT * FROM Student;
  ```

#### Select specific columns
- **VN:** Chỉ lấy một số cột cụ thể
  ```sql
  SELECT studentID, fullName FROM Student;
  ```

#### Arithmetic Operators (+, -, *, /)
- **VN:** Có thể dùng toán tử số học để tính toán trong SELECT
- **Operators:**
  - `+` - Cộng
  - `-` - Trừ
  - `*` - Nhân
  - `/` - Chia
- **Examples:**
  ```sql
  SELECT courseName, credit, 
         credit * 2 AS double_credit
  FROM Course;
  
  SELECT studentID, score, 
         score * 1.1 AS curved_score
  FROM Enrollment;
  ```

---

### DISTINCT
- **EN:** Remove duplicates
- **VN:** Loại bỏ các giá trị trùng lặp
  ```sql
  SELECT DISTINCT deptID FROM Student;
  ```

---

### Alias (AS)

#### Column Alias
- **VN:** Đặt tên tạm thời cho cột
  ```sql
  SELECT fullName AS name, studentID AS id
  FROM Student;
  ```

#### Table Alias
- **VN:** Đặt tên ngắn gọn cho bảng
  ```sql
  SELECT s.fullName, s.studentID
  FROM Student AS s;
  ```

---

## 🔹 WHERE Clause (Filtering)

### Comparison Operators
- `=` - Bằng
- `<>` hoặc `!=` - Khác
- `>` - Lớn hơn
- `<` - Nhỏ hơn
- `>=` - Lớn hơn hoặc bằng
- `<=` - Nhỏ hơn hoặc bằng

### Logical Operators
- **AND** - Và (cả 2 điều kiện đều đúng)
- **OR** - Hoặc (ít nhất 1 điều kiện đúng)
- **NOT** - Phủ định

#### Example
- **VN:** Kết hợp nhiều điều kiện
  ```sql
  SELECT * FROM Student
  WHERE gender = 'Male' AND deptID = 1;
  ```

---

### Special Operators

#### BETWEEN
- **VN:** Trong khoảng (bao gồm 2 đầu)
  ```sql
  SELECT * FROM Enrollment
  WHERE score BETWEEN 80.0 AND 90.0;
  ```

#### IN
- **VN:** Thuộc một trong các giá trị cho trước
  ```sql
  SELECT * FROM Student
  WHERE deptID IN (1, 2, 3);
  ```

#### LIKE (Pattern Matching)
- **Wildcards:**
  - `%` - Đại diện cho 0 hoặc nhiều ký tự
  - `_` - Đại diện cho 1 ký tự
- **Examples:**
  - `'Nguyen%'` - Bắt đầu bằng "Nguyen"
  - `'%Van%'` - Chứa "Van"
  - `'_ohn'` - 4 ký tự, 3 ký tự cuối là "ohn" (John, Rohn...)
- **VN:** Tìm kiếm theo mẫu
  ```sql
  SELECT * FROM Student
  WHERE fullName LIKE 'Nguyen%';
  ```

#### IS NULL / IS NOT NULL
- **VN:** Kiểm tra giá trị NULL (không dùng `= NULL`)
  ```sql
  SELECT * FROM Student
  WHERE email IS NULL;
  
  SELECT * FROM Student
  WHERE email IS NOT NULL;
  ```

---

## 🔹 ORDER BY

### Basic Sorting
- **ASC** - Ascending (tăng dần) - Mặc định
- **DESC** - Descending (giảm dần)
- **VN:** Sắp xếp dữ liệu
  ```sql
  SELECT * FROM Student
  ORDER BY fullName ASC;
  ```

### Multiple Columns
- **VN:** Sắp xếp theo phòng ban tăng dần, trong cùng phòng ban thì sắp theo tên giảm dần
  ```sql
  SELECT * FROM Student
  ORDER BY deptID ASC, fullName DESC;
  ```

---

## 🔹 Aggregate Functions

### Common Aggregate Functions
- **COUNT()** - Đếm số dòng
- **SUM()** - Tính tổng
- **AVG()** - Tính trung bình
- **MIN()** - Tìm giá trị nhỏ nhất
- **MAX()** - Tìm giá trị lớn nhất

### Examples

#### COUNT
- **VN:** Đếm số lượng
  ```sql
  SELECT COUNT(*) FROM Student;
  SELECT COUNT(DISTINCT deptID) FROM Student;
  ```

#### SUM and AVG
- **VN:** Tính tổng và trung bình
  ```sql
  SELECT SUM(credit) FROM Course;
  SELECT AVG(score) FROM Enrollment;
  ```

#### MIN and MAX
- **VN:** Tìm giá trị nhỏ nhất và lớn nhất
  ```sql
  SELECT MIN(score), MAX(score) FROM Enrollment;
  ```

---

## 🔹 GROUP BY

### Basic Grouping
- **EN:** Groups rows that have the same values
- **VN:** Gom nhóm các dòng có cùng giá trị
  ```sql
  SELECT deptID, COUNT(studentID) AS total_students
  FROM Student
  GROUP BY deptID;
  ```

### Multiple Columns Grouping
- **VN:** Nhóm theo nhiều cột
  ```sql
  SELECT courseID, semester, AVG(score)
  FROM Enrollment
  GROUP BY courseID, semester;
  ```

---

## 🔹 HAVING

### Filter After Grouping
- **EN:** Filter groups (use after GROUP BY)
- **VN:** Lọc các nhóm sau khi GROUP BY
- **Difference:** WHERE lọc trước khi nhóm, HAVING lọc sau khi nhóm
  ```sql
  SELECT deptID, COUNT(*) AS student_count
  FROM Student
  GROUP BY deptID
  HAVING COUNT(*) > 5;
  ```

### Example: WHERE vs HAVING
- **VN:** So sánh WHERE và HAVING
  ```sql
  SELECT deptID, COUNT(studentID) AS count
  FROM Student
  WHERE gender = 'Female'   -- Lọc TRƯỚC khi nhóm (chỉ lấy nữ)
  GROUP BY deptID
  HAVING COUNT(studentID) > 2; -- Lọc SAU khi nhóm (nhóm có > 2 nữ)
  ```

---

## 🔹 JOINs (Important)

### INNER JOIN
- **EN:** Returns only matching rows from both tables
- **VN:** Chỉ lấy các dòng có khớp ở cả 2 bảng
  ```sql
  SELECT s.fullName, d.deptName
  FROM Student s
  INNER JOIN Department d ON s.deptID = d.deptID;
  ```

### LEFT JOIN (LEFT OUTER JOIN)
- **EN:** Returns all rows from left table + matching rows from right table
- **VN:** Lấy TẤT CẢ từ bảng bên trái + dòng khớp từ bên phải
- Nếu không khớp → giá trị bên phải là NULL
  ```sql
  SELECT s.fullName, d.deptName
  FROM Student s
  LEFT JOIN Department d ON s.deptID = d.deptID;
  ```

### RIGHT JOIN (RIGHT OUTER JOIN)
- **EN:** Returns all rows from right table + matching rows from left table
- **VN:** Lấy TẤT CẢ từ bảng bên phải + dòng khớp từ bên trái
  ```sql
  SELECT d.deptName, s.fullName
  FROM Student s
  RIGHT JOIN Department d ON s.deptID = d.deptID;
  ```

### FULL OUTER JOIN
- ❗ **MySQL không hỗ trợ trực tiếp**
- **VN:** Dùng LEFT JOIN UNION RIGHT JOIN để mô phỏng
  ```sql
  SELECT *
  FROM Student s
  LEFT JOIN Department d ON s.deptID = d.deptID
  UNION
  SELECT *
  FROM Student s
  RIGHT JOIN Department d ON s.deptID = d.deptID;
  ```

---

## 🔹 Built-in Functions

### DateTime Functions (MySQL)

#### Current Date/Time
- `NOW()` - Current date and time
- `CURDATE()` - Current date only
- `CURTIME()` - Current time only

#### Extract Parts
- `YEAR(date)` - Extract year
- `MONTH(date)` - Extract month
- `DAY(date)` - Extract day

#### Date Calculations
- `DATEDIFF(date1, date2)` - Difference in days
- `DATE_ADD(date, INTERVAL n DAY/MONTH/YEAR)` - Add time
- `DATE_SUB(date, INTERVAL n DAY/MONTH/YEAR)` - Subtract time

#### Examples
- **VN:** Ví dụ sử dụng DateTime functions
  ```sql
  SELECT NOW(), CURDATE();
  SELECT YEAR(dob) AS birth_year FROM Student;
  SELECT DATEDIFF(NOW(), dob) / 365 AS age_approx FROM Student;
  ```

---

### String Functions

#### Case Conversion
- `UPPER(str)` - Chuyển sang IN HOA
- `LOWER(str)` - Chuyển sang in thường

#### Concatenation
- `CONCAT(str1, str2, ...)` - Nối chuỗi

#### Length & Substring
- `LENGTH(str)` - Độ dài chuỗi
- `SUBSTRING(str, start, length)` - Cắt chuỗi con

#### Examples
- **VN:** Ví dụ sử dụng String functions
  ```sql
  SELECT UPPER(fullName);
  SELECT CONCAT('Student: ', fullName);
  SELECT LENGTH(email);
  ```

---

## 🔹 VIEW

### What is a VIEW?
- **EN:** Virtual table based on a SELECT query
- **VN:** Bảng ảo dựa trên câu truy vấn SELECT
- Không lưu dữ liệu, chỉ lưu câu query
- Dùng để đơn giản hóa truy vấn phức tạp

### Create View
- **VN:** Tạo view để dễ dàng truy vấn sinh viên IT
  ```sql
  CREATE VIEW ITStudents AS
  SELECT studentID, fullName, email
  FROM Student
  WHERE deptID = 1; -- Assuming 1 is IT/CS
  ```

### Use View
- **VN:** Dùng view như một bảng thông thường
  ```sql
  SELECT * FROM ITStudents;
  ```

### Drop View
- **VN:** Xóa view (không ảnh hưởng bảng gốc)
  ```sql
  DROP VIEW ITStudents;
  ```

---

## 🔹 Common Exam Questions

### Query Execution Order
- **Question:** What is executed first: SELECT or WHERE?
- **Answer:** WHERE (filter first, then select columns)

### JOIN Types
- **Question:** Which JOIN returns all rows from left table?
- **Answer:** LEFT JOIN

### Aggregate with GROUP BY
- **Question:** Can you use WHERE to filter after GROUP BY?
- **Answer:** No, use HAVING instead

### NULL Values
- **Question:** How to check if a column is NULL?
- **Answer:** Use `IS NULL`, not `= NULL`

### COUNT vs COUNT(*)
- **Question:** Difference between COUNT(*) and COUNT(column)?
- **Answer:**
  - COUNT(*) counts all rows
  - COUNT(column) counts non-NULL values only

---

## 📝 Exam Format (Hình thức thi)

### Exam Structure
- **Time:** 70 minutes (70 phút)
- **Format:** Paper-based exam (Thi trên giấy)
- **Structure:**
  - **50% Multiple Choice** - MCQ + T/F + Fill-in-the-blank (Trắc nghiệm)
  - **50% Short Answer** - Vẽ ERD, Chuẩn hóa 3NF, Viết SQL (Tự luận)

### What SQL Topics are Tested?
- **DDL:** CREATE, ALTER, DROP
- **DML:** INSERT, UPDATE, DELETE ⚠️ (Nhớ WHERE!)
- **Basic SELECT:** SELECT, Alias, ORDER BY, Operators, WHERE
- **Advanced SELECT:** JOIN, Aggregate Functions, GROUP BY, HAVING, DateTime/String Functions, VIEW

### ❌ What is NOT in the Exam (Không thi)
- ❌ **Subquery** (Truy vấn con)
- ❌ **Stored Procedures** (Thủ tục lưu trữ)

---

## 🎯 Exam Tips (Mẹo thi)

### ⚠️ CRITICAL WARNINGS (CỰC KỲ QUAN TRỌNG!)
- 🚨 **UPDATE và DELETE LUÔN CẦN WHERE!**
  - Nếu quên WHERE → Mất toàn bộ điểm câu đó!
  - Trừ khi đề yêu cầu cập nhật/xóa TẤT CẢ dòng
- 🚨 **NULL comparison:**
  - ✅ Đúng: `IS NULL` / `IS NOT NULL`
  - ❌ Sai: `= NULL` / `!= NULL`
- 🚨 **Query Execution Order:**
  - Nhớ: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
  - WHERE trước GROUP BY, HAVING sau GROUP BY

---

### For DDL Questions (CREATE, ALTER, DROP)
- **CREATE TABLE:** Nhớ định nghĩa constraints (PK, FK, NOT NULL, UNIQUE)
- **FOREIGN KEY:** Phải tham chiếu đến PK của bảng khác đã tồn tại
- **ALTER TABLE:** Add/Modify/Drop column - chọn đúng từ khóa
- **Syntax quan trọng:**
  - `PRIMARY KEY (columnName)`
  - `FOREIGN KEY (columnName) REFERENCES tableName(columnName)`
  - `NOT NULL`, `UNIQUE`, `DEFAULT value`, `AUTO_INCREMENT`

---

### For DML Questions (INSERT, UPDATE, DELETE)
- **INSERT:**
  - Nếu insert tất cả cột: `INSERT INTO table VALUES (...)`
  - Nếu insert một số cột: `INSERT INTO table (col1, col2) VALUES (...)`
  - Kiểm tra constraints: PK không NULL, FK phải tồn tại
  
- **UPDATE:**
  - ⚠️ **LUÔN CẦN WHERE** (trừ khi đề yêu cầu update tất cả)
  - Syntax: `UPDATE table SET col1 = value WHERE condition`
  
- **DELETE:**
  - ⚠️ **LUÔN CẦN WHERE** (trừ khi đề yêu cầu xóa tất cả)
  - Syntax: `DELETE FROM table WHERE condition`

---

### For SELECT Queries
- **Đọc kỹ yêu cầu:**
  - "all students" → `SELECT *`
  - "student names" → `SELECT fullName`
  - "list of..." → có thể cần DISTINCT
  
- **Thứ tự thực thi:**
  - FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
  - Viết đúng thứ tự này trong câu query!
  
- **Operators:**
  - Arithmetic: +, -, *, /
  - Comparison: =, <>, >, <, >=, <=
  - Logical: AND, OR, NOT
  - Special: BETWEEN, IN, LIKE, IS NULL

---

### For JOIN Questions
- **Xác định loại JOIN:**
  - "all from left table" → **LEFT JOIN**
  - "only matching rows" → **INNER JOIN**
  - "all from right table" → **RIGHT JOIN**
  
- **Visualization:**
  - INNER JOIN: ⚪ ∩ ⚪ (phần giao)
  - LEFT JOIN: ⚫ ∩ ⚪ (toàn bộ trái + giao)
  - RIGHT JOIN: ⚪ ∩ ⚫ (toàn bộ phải + giao)
  
- **Syntax:**
  - Nhớ dùng alias cho bảng: `FROM Student s`
  - Điều kiện ON: `ON s.deptID = d.deptID`

---

### For GROUP BY / HAVING
- **Khi nào dùng GROUP BY?**
  - Khi có aggregate function (COUNT, SUM, AVG, MIN, MAX)
  - Khi cần gom nhóm dữ liệu
  
- **WHERE vs HAVING:**
  - **WHERE** → Lọc TRƯỚC khi nhóm (lọc từng dòng)
  - **HAVING** → Lọc SAU khi nhóm (lọc nhóm)
  
- **Example:**

```sql
SELECT deptID, AVG(score)
FROM Enrollment
WHERE score > 50      -- Lọc trước
GROUP BY deptID
HAVING AVG(score) > 80;  -- Lọc sau
```

---

### For Aggregate Functions
- **COUNT(*)** vs **COUNT(column):**
  - COUNT(*) → đếm TẤT CẢ dòng
  - COUNT(column) → đếm dòng có giá trị NOT NULL
  
- **Common functions:**
  - COUNT() - Đếm
  - SUM() - Tổng
  - AVG() - Trung bình
  - MIN() - Nhỏ nhất
  - MAX() - Lớn nhất

---

### For DateTime Functions
- `NOW()` - Ngày giờ hiện tại
- `CURDATE()` - Ngày hiện tại
- `YEAR(date)`, `MONTH(date)`, `DAY(date)` - Tách phần
- `DATEDIFF(date1, date2)` - Số ngày chênh lệch

---

### For String Functions
- `UPPER()`, `LOWER()` - Chuyển hoa/thường
- `CONCAT()` - Nối chuỗi
- `LENGTH()` - Độ dài
- `SUBSTRING()` - Cắt chuỗi con

---

### For VIEW
- **CREATE VIEW viewName AS SELECT ...**
- View là bảng ảo, không lưu dữ liệu
- Dùng view như bảng thông thường trong SELECT

---

### Common Mistakes to Avoid (Lỗi hay gặp)
- ❌ **Quên WHERE trong UPDATE/DELETE** → MẤT ĐIỂM NẶNG!
- ❌ Dùng `= NULL` thay vì `IS NULL`
- ❌ Dùng WHERE sau GROUP BY (phải dùng HAVING)
- ❌ Quên ON trong JOIN
- ❌ Sai thứ tự: viết SELECT trước FROM
- ❌ Quên alias khi JOIN nhiều bảng
- ❌ Dùng aggregate function mà không có GROUP BY (nếu có non-aggregate column)
- ❌ INSERT thiếu giá trị cho cột NOT NULL
- ❌ FOREIGN KEY tham chiếu đến cột không phải PK

---

### Final Checklist Before Submit (Kiểm tra cuối)
- ✅ UPDATE/DELETE có WHERE chưa?
- ✅ JOIN có ON chưa?
- ✅ GROUP BY có đủ cột chưa?
- ✅ NULL comparison dùng IS/IS NOT?
- ✅ Aggregate function có GROUP BY chưa?
- ✅ Constraints đầy đủ chưa? (PK, FK, NOT NULL)
- ✅ Syntax đúng chưa? (dấu phẩy, ngoặc, semicolon)
- ✅ Đọc lại yêu cầu đề một lần nữa!

---

## 📚 Practice Examples (Ví dụ thực hành)

### Sample Database Schema

**Table: Student**
- studentID (PK) INT
- fullName VARCHAR(100)
- gender VARCHAR(10)
- dob DATE
- email VARCHAR(100)
- deptID (FK) INT

**Table: Department**
- deptID (PK) INT
- deptName VARCHAR(100)
- location VARCHAR(50)

**Table: Course**
- courseID (PK) INT
- courseName VARCHAR(100)
- credit INT
- deptID (FK) INT

**Table: Enrollment**
- enrollID (PK) INT
- studentID (FK) INT
- courseID (FK) INT
- semester VARCHAR(10)
- score DECIMAL(4,2)

---

### Practice Question 1: DDL
- **Question:** Create the Student table with all constraints
- **Answer:**
  ```sql
  CREATE TABLE Student (
    studentID INT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    dob DATE,
    deptID INT,
    email VARCHAR(100),
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
  );
  ```

---

### Practice Question 2: DML - INSERT
- **Question:** Insert a new student: ID=120, Name="John Doe", Gender="Male", DOB="2004-01-01", DeptID=1, Email="john@uni.edu"
- **Answer:**
  ```sql
  INSERT INTO Student (studentID, fullName, gender, dob, deptID, email)
  VALUES (120, 'John Doe', 'Male', '2004-01-01', 1, 'john@uni.edu');
  ```

---

### Practice Question 3: DML - UPDATE
- **Question:** Update email of student with ID=120 to "johndoe@email.com"
- **Answer:**
  ```sql
  UPDATE Student
  SET email = 'johndoe@email.com'
  WHERE studentID = 120;
  ```

---

### Practice Question 4: DML - DELETE
- **Question:** Delete student with ID 120
- **Answer:**
  ```sql
  DELETE FROM Student
  WHERE studentID = 120;
  ```

---

### Practice Question 5: Basic SELECT
- **Question:** List all student names and their birth dates, sorted by name
- **Answer:**
  ```sql
  SELECT fullName, dob
  FROM Student
  ORDER BY fullName ASC;
  ```

---

### Practice Question 6: WHERE with LIKE
- **Question:** Find all students whose name starts with "Nguyen"
- **Answer:**
  ```sql
  SELECT * FROM Student
  WHERE fullName LIKE 'Nguyen%';
  ```

---

### Practice Question 7: INNER JOIN
- **Question:** List student names and their department names
- **Answer:**
  ```sql
  SELECT s.fullName, d.deptName
  FROM Student s
  INNER JOIN Department d ON s.deptID = d.deptID;
  ```

---

### Practice Question 8: LEFT JOIN
- **Question:** List all students and their department names (include students without department)
- **Answer:**
  ```sql
  SELECT s.fullName, d.deptName
  FROM Student s
  LEFT JOIN Department d ON s.deptID = d.deptID;
  ```

---

### Practice Question 9: GROUP BY with COUNT
- **Question:** Count how many students in each department
- **Answer:**
  ```sql
  SELECT deptID, COUNT(*) AS student_count
  FROM Student
  GROUP BY deptID;
  ```

---

### Practice Question 10: GROUP BY with HAVING
- **Question:** Find departments that have more than 5 students
- **Answer:**
  ```sql
  SELECT deptID, COUNT(*) AS student_count
  FROM Student
  GROUP BY deptID
  HAVING COUNT(*) > 5;
  ```

---

### Practice Question 11: Multiple JOINs
- **Question:** List student names, course names, and scores
- **Answer:**
  ```sql
  SELECT s.fullName, c.courseName, e.score
  FROM Student s
  INNER JOIN Enrollment e ON s.studentID = e.studentID
  INNER JOIN Course c ON e.courseID = c.courseID;
  ```

---

### Practice Question 12: Aggregate with JOIN
- **Question:** Find average score of students in each department (show department name)
- **Answer:**
  ```sql
  SELECT d.deptName, AVG(e.score) AS avg_score
  FROM Department d
  INNER JOIN Student s ON d.deptID = s.deptID
  INNER JOIN Enrollment e ON s.studentID = e.studentID
  GROUP BY d.deptName;
  ```

---

### Practice Question 13: WHERE vs HAVING
- **Question:** Find departments where male students have average score > 80
- **Answer:**
  ```sql
  SELECT d.deptID, AVG(e.score) AS avg_score
  FROM Student s
  INNER JOIN Enrollment e ON s.studentID = e.studentID
  WHERE s.gender = 'Male'    -- Filter before grouping
  GROUP BY d.deptID
  HAVING AVG(e.score) > 80;  -- Filter after grouping
  ```

---

### Practice Question 14: DateTime Functions
- **Question:** Find students born in year 2003
- **Answer:**
  ```sql
  SELECT *
  FROM Student
  WHERE YEAR(dob) = 2003;
  ```

---

### Practice Question 15: String Functions
- **Question:** Show student names in uppercase and email length
- **Answer:**
  ```sql
  SELECT UPPER(fullName) AS name_upper, 
         LENGTH(email) AS email_length
  FROM Student;
  ```

---

### Practice Question 16: CREATE VIEW
- **Question:** Create a view showing high performing enrollments (score >= 90)
- **Answer:**
  ```sql
  CREATE VIEW HighScores AS
  SELECT studentID, courseID, score
  FROM Enrollment
  WHERE score >= 90;
  ```

---

### Practice Question 17: Complex Query
- **Question:** Find department names and count of courses, but only show departments located in 'Building A1' or 'Building A2' that offer more than 1 course.
- **Answer:**
  ```sql
  SELECT d.deptName, COUNT(c.courseID) AS course_count
  FROM Department d
  INNER JOIN Course c ON d.deptID = c.deptID
  WHERE d.location IN ('Building A1', 'Building A2')
  GROUP BY d.deptName
  HAVING COUNT(c.courseID) > 1;
  ```

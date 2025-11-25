---
markmap:
  initialExpandLevel: 2
  colorFreezeLevel: 4
---

# DBS Theory Review
## 🔹 Fundamental Terms & Definitions

### Data vs Information
- **Data (EN):** Raw, unprocessed facts.  
  **VN:** Dữ liệu thô.  
  - Example: "25", "John", "2024-01-01", "85.5"

- **Information (EN):** Processed data with meaning.  
  **VN:** Thông tin có ý nghĩa.  
  - Example: "John is 25 years old and scored 85.5 on the exam."
  - **VN Giải thích:** Data là những mẩu thông tin riêng lẻ chưa xử lý, Information là khi ta kết hợp các data lại để tạo ra ý nghĩa

### Database
- **EN:** Organized collection of related data.  
  **VN:** Kho dữ liệu có tổ chức.

### Database Management System (DBMS)
- **EN:** Software that manages and controls access to databases.  
  **VN:** Phần mềm quản lý cơ sở dữ liệu.  
  - Example: MySQL, PostgreSQL, SQL Server, Oracle, MongoDB
  - **Functions:** Data storage, retrieval, security, backup, recovery

### RDBMS (Relational DBMS)
- **EN:** DBMS based on relational model (tables).  
  **VN:** Hệ quản trị CSDL quan hệ.
  - Example: MySQL, PostgreSQL, SQL Server (dùng bảng và quan hệ)
  - Non-RDBMS Example: MongoDB (dùng documents)

---

## 🔹 Entity Concepts

### Entity (Entity Type) / Entity Instance
- **Entity Type (EN):** Blueprint/category of objects.  
  - Example: Student  
- **Entity Instance (EN):** One specific occurrence.  
  - Example: Student ID = S01

### Weak Entity
- **EN:** Depends on a strong entity; no PK of its own.  
- **VN:** Phụ thuộc thực thể mạnh, không có PK độc lập.  
- Example: **OrderItem** depends on **Order**
  - OrderItem needs OrderID + ItemNumber (partial key) to be unique
  - VN: OrderItem không thể tồn tại nếu không có Order


---

## 🔹 Attributes

### Attribute Types
- **Key attribute:** Part of candidate key (e.g., studentID)  
- **Non-key attribute:** Other attributes (e.g., name)

### Simple vs Composite
- **Simple:** Cannot be split into smaller parts
  - Example: Gender (Male/Female), Age (25), Email (john@email.com)
  - VN: Không thể chia nhỏ hơn được nữa
  
- **Composite:** Can be split into sub-attributes
  - Example: **Address** → Street, City, ZipCode, Country
  - Example: **FullName** → FirstName, MiddleName, LastName
  - VN: Có thể chia thành nhiều thuộc tính con

### Single-valued vs Multi-valued
- **Single-valued:** One value per entity
  - Example: DateOfBirth (one person has one birthday)
  - Example: StudentID (one student has one ID)
  
- **Multi-valued:** Multiple values possible
  - Example: **PhoneNumbers** (a person can have: 0912345678, 0987654321)
  - Example: **Skills** (HTML, CSS, JavaScript, Python)
  - VN: Một người có thể có nhiều giá trị cho thuộc tính này

### Stored vs Derived
- **Stored:** Saved directly in database
  - Example: BirthDate (1999-05-15)
  - Example: Price (100), Quantity (5)
  
- **Derived:** Calculated from other attributes
  - Example: **Age** (calculated from BirthDate)
  - Example: **TotalAmount** (calculated from Price × Quantity)
  - VN: Không lưu trực tiếp mà tính toán từ các thuộc tính khác

### Identifier Attribute (Primary Key)
- Unique  
- Not null  
- Stable  

---

## 🔹 ERD (Entity–Relationship Diagram)

### Relationship
- **EN:** Association between entities.  
- **VN:** Mối quan hệ giữa các thực thể.

### Degree of Relationship - Basic on number of entities
- Unary (1 entity)  
- Binary (2 entities, most common)  
- Ternary (3 entities)

### Cardinality - Basic on number of entity instances
- **1:1 (One-to-One)**
  - Example: **Person** ←→ **Passport** (one person has one passport)
  - Example: **Employee** ←→ **Desk** (one employee has one desk)
  - VN: Mỗi thực thể bên này chỉ liên kết với 1 thực thể bên kia
  
- **1:N (One-to-Many)**
  - Example: **Department** ←→ **Employee** (one dept has many employees)
  - Example: **Customer** ←→ **Order** (one customer can place many orders)
  - VN: Một bên có 1, bên kia có nhiều
  
- **N:N (Many-to-Many)**
  - Example: **Student** ←→ **Course** (students take many courses, courses have many students)
  - Example: **Author** ←→ **Book** (authors write many books, books have many authors)
  - ⚠️ **Must create intermediate/junction table**
  - VN: Cả 2 bên đều nhiều, phải tạo bảng trung gian

### Optionality (O and |)
- **O:** Optional (minimum 0)
- **|:** Mandatory (minimum 1)

**Examples:**
- **Student |——O| Scholarship**  
  → A student may or may not have a scholarship, but a scholarship must belong to a student
  → VN: Sinh viên có thể có hoặc không có học bổng
  
- **Employee |——|| Department**  
  → Every employee must belong to a department
  → VN: Mỗi nhân viên bắt buộc phải thuộc 1 phòng ban
  
- **Customer O——O| Order**  
  → A customer may have no orders yet
  → VN: Khách hàng có thể chưa đặt hàng

---

## 🔹 EER (Enhanced ER Model) (Bỏ qua với MME)

### Specialization
- **EN:** Top-down approach - split entity into sub-entities.  
- **VN:** Chuyên biệt hóa - chia từ tổng quát xuống cụ thể.  

**Examples:**
- **Employee** → FullTimeEmployee, PartTimeEmployee
  - FullTime has: Salary, Benefits
  - PartTime has: HourlyRate, MaxHours
  
- **Account** → SavingsAccount, CheckingAccount
  - Savings has: InterestRate
  - Checking has: OverdraftLimit
  
- **Vehicle** → Car, Truck, Motorcycle

### Generalization
- **EN:** Bottom-up approach - combine sub-entities into super-entity.  
- **VN:** Khái quát hóa - gộp từ cụ thể lên tổng quát.

**Examples:**
- Car + Truck + Motorcycle → **Vehicle**
  - All have: VehicleID, Color, Model
  
- Secretary + Technician + Engineer → **Employee**
  - All have: EmployeeID, Name, Salary

### Constraints in Specialization

#### Disjoint vs Overlapping
- **Disjoint (d):** Entity belongs to only ONE subclass
  - Example: **Person** → Student OR Teacher (cannot be both)
  - VN: Chỉ thuộc 1 nhóm, không thể thuộc cả 2
  
- **Overlapping (o):** Entity can belong to MULTIPLE subclasses
  - Example: **Person** → Student AND PartTimeEmployee (can be both)
  - VN: Có thể thuộc nhiều nhóm cùng lúc

#### Total vs Partial
- **Total:** Every superclass entity MUST belong to at least one subclass
  - Example: Every Employee must be either FullTime or PartTime
  - VN: Bắt buộc phải thuộc ít nhất 1 nhóm con
  
- **Partial:** Superclass entity MAY or MAY NOT belong to subclass
  - Example: A Vehicle may or may not be categorized as Truck/Car
  - VN: Có thể không thuộc nhóm con nào

---

## 🔹 Integrity Constraints

### Domain Constraint
- **EN:** Values must be valid for the attribute's domain.  
- **VN:** Giá trị phải thuộc đúng kiểu dữ liệu và phạm vi cho phép.

- **Example:**
  - Age must be INT and > 0 and < 150
  - Gender must be 'M' or 'F'
  - Email must follow email format (xxx@xxx.xxx)
  - GPA must be DECIMAL between 0.0 and 4.0
  - VN: Ràng buộc về kiểu dữ liệu và giá trị hợp lệ

### Entity Integrity
- **Rule:** Primary Key CANNOT be NULL
- **VN:** Khóa chính không được để trống

- **Example:**
  - StudentID (PK) → ✅ "S001", ❌ NULL
  - OrderID (PK) → ✅ 12345, ❌ NULL
  - If you try to insert a student without StudentID → **ERROR**

### Referential Integrity
- **Rule:** Foreign Key must refer to existing Primary Key (or be NULL if allowed)
- **VN:** Khóa ngoại phải trỏ tới khóa chính đã tồn tại

- **Examples:**

  - **Table: Department**
    | DeptID (PK) | DeptName |
    | :--- | :--- |
    | D01 | IT |
    | D02 | Marketing |

  - **Table: Employee**
    | EmpID (PK) | Name | DeptID (FK) | Status |
    | :--- | :--- | :--- | :--- |
    | E001 | John | D01 | ✅ Valid (D01 exists) |
    | E002 | Mary | D05 | ❌ ERROR (D05 doesn't exist) |
    | E003 | Peter | NULL | ✅ Valid (if NULL allowed) |

  - **VN Giải thích:** DeptID trong Employee phải tồn tại trong Department, nếu không sẽ lỗi

---

## 🔹 Relational Model Terms

### Relation
- **EN:** A table
- **VN:** Bảng quan hệ

### Tuple
- **EN:** A row/record
- **VN:** Một dòng/bản ghi
- Example: One student record is one tuple

### Attribute
- **EN:** A column/field
- **VN:** Một cột/thuộc tính
- Example: StudentID, StudentName are attributes

### Degree
- **EN:** Number of attributes (columns) in a relation
- **VN:** Số lượng cột trong bảng
- Example: Student(ID, Name, Email) has degree = 3

### Cardinality
- **EN:** Number of tuples (rows) in a relation
- **VN:** Số lượng dòng trong bảng
- Example: If Student table has 100 students, cardinality = 100

### Primary Key (PK)
- **EN:** Uniquely identifies each tuple
- **VN:** Khóa chính xác định duy nhất mỗi bản ghi
- **Properties:**
  - Unique (không trùng)
  - Not NULL (không được rỗng)
  - Stable (không thay đổi)
  - Minimal (tối giản)
- Example: StudentID in Student table

### Foreign Key (FK)
- **EN:** References primary key of another relation
- **VN:** Khóa ngoại tham chiếu đến khóa chính của bảng khác
- **Purpose:** Establish relationships between tables

- **Example:**

  - **Table: Student**
    | StudentID (PK) | Name | DeptID (FK) |
    | :--- | :--- | :--- |
    | S001 | John Doe | D01 |
    | S002 | Mary Jane | D02 |

### Candidate Key
- **EN:** Attributes that can uniquely identify tuple
- **VN:** Các thuộc tính có thể làm khóa chính
- Example: StudentID, Email both can be candidate keys
- One becomes PK, others become Alternate Keys

### Alternate Key
- **EN:** Candidate keys that are not chosen as PK
- **VN:** Các khóa dự phòng (không được chọn làm PK)
- Example: If StudentID is PK, then Email is Alternate Key

### Composite Key
- **EN:** Primary key made of 2+ attributes
- **VN:** Khóa chính gồm 2 hay nhiều thuộc tính
- Example: {StudentID, CourseID} in Enrollment table

### Super Key
- **EN:** Any combination of attributes that can uniquely identify tuple
- **VN:** Bất kỳ tổ hợp thuộc tính nào có thể xác định duy nhất
- Example: {StudentID}, {StudentID, Name}, {StudentID, Email} are all super keys
- Candidate Key is minimal Super Key

---

## 🔹 Normalization (1NF → 2NF → 3NF)

### Why Normalize?
- **Reduce redundancy** (giảm trùng lặp dữ liệu)
- **Avoid update anomalies** (tránh lỗi khi cập nhật)
- **Maintain consistency** (duy trì tính nhất quán)
- **Save storage space** (tiết kiệm bộ nhớ)

### Update Anomalies (Vấn đề nếu KHÔNG chuẩn hóa)

#### 1. Insertion Anomaly
- **EN:** Cannot insert data without other unrelated data
- **VN:** Không thể thêm dữ liệu nếu thiếu thông tin không liên quan

- **Example:**
  - **Bad design - Student with embedded Department info:**
    | StudentID | Name | DeptID | DeptName | DeptLocation |
    | :--- | :--- | :--- | :--- | :--- |
    | S001 | John | D01 | IT | Building A |

  - **❌ Problem:** Cannot add new Department (D03 - Finance) if no student enrolled yet!

  - **✅ Solution:** Separate Department table

---

#### 2. Update Anomaly
- **EN:** Must update multiple rows for one change
- **VN:** Phải cập nhật nhiều dòng cho 1 thay đổi

- **Example:**
  - **Table: Student**
    | StudentID | Name | DeptName | DeptLocation |
    | :--- | :--- | :--- | :--- |
    | S001 | John | IT | Building A |
    | S002 | Mary | IT | Building A |
    | S003 | Peter | IT | Building A |

  - **❌ Problem:** If IT dept moves to Building B, must update 3 rows! Risk of inconsistency if miss one.

  - **✅ Solution:** Store DeptLocation in separate Department table (update once)

---

#### 3. Deletion Anomaly
- **EN:** Deleting data causes loss of other unrelated data
- **VN:** Xóa dữ liệu này làm mất luôn dữ liệu khác

- **Example:**
  - **Table: Student**
    | StudentID | Name | CourseID | CourseName | InstructorName |
    | :--- | :--- | :--- | :--- | :--- |
    | S001 | John | C101 | Database | Dr. Smith |

  - **❌ Problem:** If S001 drops C101, we lose information about course C101 and Dr. Smith!

  - **✅ Solution:** Separate Student, Course, and Instructor tables

---

## 🔹 Dependency Concepts (Khái niệm phụ thuộc)

### Functional Dependency (FD)
- **Definition:** A → B means "A determines B"
- **VN:** A xác định B, biết A thì biết được B

- **Examples:**
  - StudentID → StudentName (biết mã SV thì biết tên SV)
  - Email → UserName (biết email thì biết username)
  - OrderID → OrderDate (biết mã đơn hàng thì biết ngày đặt)

### Full Functional Dependency
- **EN:** Attribute depends on the WHOLE composite key
- **VN:** Phụ thuộc vào TOÀN BỘ khóa, không chỉ một phần

- **Example:**
  - {StudentID, CourseID} → Grade ✅ (Grade depends on both)
  - {OrderID, ProductID} → Quantity ✅ (Quantity depends on both)

### Partial Dependency
- **EN:** Attribute depends on ONLY PART of composite key
- **VN:** Chỉ phụ thuộc MỘT PHẦN khóa
- **⚠️ Violation of 2NF**

**Example:**
- {StudentID, CourseID} → StudentName ❌ 
  - StudentName only depends on StudentID, not CourseID
  - This is partial dependency!

### Transitive Dependency
- **EN:** A → B → C (C depends on A through B)
- **VN:** Phụ thuộc bắc cầu
- **⚠️ Violation of 3NF**

**Example:**
- StudentID → DeptID → DeptName ❌
  - StudentID determines DeptID
  - DeptID determines DeptName
  - So DeptName transitively depends on StudentID

---

## 🔹 Normalization Examples with Sample Data

### 📋 Original Unnormalized Table (0NF)
- **Table: StudentCourse**
  
  | StudentID | StudentName | StudentEmail | CourseID | CourseName | Instructor | Grade | DeptID | DeptName | DeptLocation |
  | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
  | S001 | John Doe | john@email.com | C101 | Database | Dr. Smith | A | D01 | IT | Building A |
  | S001 | John Doe | john@email.com | C102 | Java | Dr. Jones | B+ | D01 | IT | Building A |
  | S002 | Mary Jane | mary@email.com | C101 | Database | Dr. Smith | A- | D02 | Marketing | Building B |
  | S002 | Mary Jane | mary@email.com | C103 | Python | Dr. Lee | B | D02 | Marketing | Building B |

- **Problems (Vấn đề):**
  - ❌ **Redundancy:** StudentName, DeptName repeated many times
  - ❌ **Update anomaly:** If John changes email, must update multiple rows
  - ❌ **Delete anomaly:** If S002 drops all courses, we lose Mary's info
  - ❌ **Insert anomaly:** Cannot add new student without enrolling in a course

---

### 1️⃣ 1NF — First Normal Form

#### Rules
- **All values must be atomic** (không được có list/array trong 1 cell)
- **No repeating groups** (không có nhóm lặp lại)
- **Each column must have unique name**
- **Order of rows doesn't matter**

#### ❌ Violation Example
- **Table: Student**
  | StudentID | StudentName | Skills |
  | :--- | :--- | :--- |
  | S001 | John Doe | HTML, CSS, JS |
  | S002 | Mary Jane | Python, Java |
- **Problem:** Skills column has multiple values (not atomic)

#### ✅ Fixed to 1NF
- **Option 1: Separate rows**
  - **Table: Student**
    | StudentID | StudentName | Skill |
    | :--- | :--- | :--- |
    | S001 | John Doe | HTML |
    | S001 | John Doe | CSS |
    | S001 | John Doe | JS |
    | S002 | Mary Jane | Python |
    | S002 | Mary Jane | Java |

- **Option 2: Separate table**
  - **Table: Student**
    | StudentID | StudentName |
    | :--- | :--- |
    | S001 | John Doe |
    | S002 | Mary Jane |

  - **Table: Skill**
    | StudentID | Skill |
    | :--- | :--- |
    | S001 | HTML |
    | S001 | CSS |
    | S002 | Python |
  - **VN Giải thích:** Mỗi cell chỉ chứa 1 giá trị duy nhất, không được chứa list

---

### 2️⃣ 2NF — Second Normal Form

#### Rules
- Must be in 1NF
- **No partial dependency** (không có phụ thuộc từng phần)
- Non-key attributes must depend on THE WHOLE primary key

#### ❌ Not in 2NF
- **Table: Enrollment**
  | StudentID (PK) | CourseID (PK) | StudentName | StudentEmail | CourseName | Instructor | Grade |
  | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
  | S001 | C101 | John Doe | john@email.com | Database | Dr. Smith | A |
  | S001 | C102 | John Doe | john@email.com | Java | Dr. Jones | B+ |
  | S002 | C101 | Mary Jane | mary@email.com | Database | Dr. Smith | A- |

- **Composite PK:** {StudentID, CourseID}

- **Partial Dependencies (Problems):**
  - StudentID → StudentName ❌ (StudentName only depends on StudentID)
  - StudentID → StudentEmail ❌ (StudentEmail only depends on StudentID)
  - CourseID → CourseName ❌ (CourseName only depends on CourseID)
  - CourseID → Instructor ❌ (Instructor only depends on CourseID)

- **Full Dependency (OK):**
  - {StudentID, CourseID} → Grade ✅ (Grade depends on BOTH)

#### ✅ Fixed to 2NF
- **Split into 3 tables:**

- **Table: Student**
  | StudentID (PK) | StudentName | StudentEmail |
  | :--- | :--- | :--- |
  | S001 | John Doe | john@email.com |
  | S002 | Mary Jane | mary@email.com |

- **Table: Course**
  | CourseID (PK) | CourseName | Instructor |
  | :--- | :--- | :--- |
  | C101 | Database | Dr. Smith |
  | C102 | Java | Dr. Jones |
  | C103 | Python | Dr. Lee |

- **Table: Enrollment**
  | StudentID (PK, FK) | CourseID (PK, FK) | Grade |
  | :--- | :--- | :--- |
  | S001 | C101 | A |
  | S001 | C102 | B+ |
  | S002 | C101 | A- |
  | S002 | C103 | B |

- **VN Giải thích:** Tách các thuộc tính chỉ phụ thuộc 1 phần khóa ra thành bảng riêng

---

### 3️⃣ 3NF — Third Normal Form

#### Rules
- Must be in 2NF
- **No transitive dependency** (không có phụ thuộc bắc cầu)
- Non-key attributes must depend ONLY on primary key (not on other non-key attributes)

#### ❌ Not in 3NF
- **Table: Employee**
  | EmpID (PK) | EmpName | DeptID | DeptName | DeptLocation |
  | :--- | :--- | :--- | :--- | :--- |
  | E001 | John Doe | D01 | IT | Building A |
  | E002 | Mary Jane | D02 | Marketing | Building B |
  | E003 | Peter Lee | D01 | IT | Building A |

- **Dependencies:**
  - EmpID → DeptID ✅ (direct)
  - DeptID → DeptName ✅ (direct)
  - DeptID → DeptLocation ✅ (direct)

- **Transitive Dependencies (Problems):**
  - EmpID → DeptID → DeptName ❌ (DeptName depends on EmpID through DeptID)
  - EmpID → DeptID → DeptLocation ❌ (DeptLocation depends on EmpID through DeptID)
  - **VN:** DeptName và DeptLocation phụ thuộc vào EmpID thông qua DeptID (phụ thuộc bắc cầu)

#### ✅ Fixed to 3NF
- **Table: Employee**
  | EmpID (PK) | EmpName | DeptID (FK) |
  | :--- | :--- | :--- |
  | E001 | John Doe | D01 |
  | E002 | Mary Jane | D02 |
  | E003 | Peter Lee | D01 |

- **Table: Department**
  | DeptID (PK) | DeptName | DeptLocation |
  | :--- | :--- | :--- |
  | D01 | IT | Building A |
  | D02 | Marketing | Building B |

- **VN Giải thích:** Tách các thuộc tính phụ thuộc bắc cầu ra bảng riêng. Bây giờ DeptName và DeptLocation chỉ phụ thuộc trực tiếp vào DeptID.

---

### 📝 Complete Normalization Example

#### Starting with Unnormalized Data
- **Table: Order**
  | OrderID | OrderDate | CustomerName | CustomerPhone | ProductID | ProductName | Price | Quantity | SupplierName |
  | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
  | O001 | 2024-01-15 | John Doe | 0912345678 | P101 | Laptop | 1000 | 2 | HP Inc |
  | O001 | 2024-01-15 | John Doe | 0912345678 | P102 | Mouse | 20 | 3 | Logitech |
  | O002 | 2024-01-16 | Mary Jane | 0987654321 | P101 | Laptop | 1000 | 1 | HP Inc |

#### After 1NF
- **VN:** Already in 1NF (all atomic values)

#### After 2NF
- **Table: Order**
  | OrderID (PK) | OrderDate | CustomerName | CustomerPhone |
  | :--- | :--- | :--- | :--- |
  | O001 | 2024-01-15 | John Doe | 0912345678 |
  | O002 | 2024-01-16 | Mary Jane | 0987654321 |

- **Table: OrderDetail**
  | OrderID (PK, FK) | ProductID (PK, FK) | Quantity | ProductInfo* |
  | :--- | :--- | :--- | :--- |
  | O001 | P101 | 2 | (Laptop, 1000, HP Inc) |
  | O001 | P102 | 3 | (Mouse, 20, Logitech) |
  | O002 | P101 | 1 | (Laptop, 1000, HP Inc) |
  *(Note: ProductInfo still has transitive dependency)*

#### After 3NF
- **Table: Customer**
  | CustomerID (PK) | CustomerName | CustomerPhone |
  | :--- | :--- | :--- |
  | C001 | John Doe | 0912345678 |
  | C002 | Mary Jane | 0987654321 |

- **Table: Order**
  | OrderID (PK) | OrderDate | CustomerID (FK) |
  | :--- | :--- | :--- |
  | O001 | 2024-01-15 | C001 |
  | O002 | 2024-01-16 | C002 |

- **Table: Product**
  | ProductID (PK) | ProductName | Price | SupplierID (FK) |
  | :--- | :--- | :--- | :--- |
  | P101 | Laptop | 1000 | SUP001 |
  | P102 | Mouse | 20 | SUP002 |

- **Table: Supplier**
  | SupplierID (PK) | SupplierName |
  | :--- | :--- |
  | SUP001 | HP Inc |
  | SUP002 | Logitech |

- **Table: OrderDetail**
  | OrderID (PK, FK) | ProductID (PK, FK) | Quantity |
  | :--- | :--- | :--- |
  | O001 | P101 | 2 |
  | O001 | P102 | 3 |
  | O002 | P101 | 1 |

- **VN Giải thích:**
  - 2NF: Tách các thuộc tính chỉ phụ thuộc 1 phần composite key
  - 3NF: Tách SupplierName vì nó phụ thuộc bắc cầu (ProductID → SupplierName)

---

### 🎯 Quick Check: Is it in 3NF?
- **Ask these questions:**
  - ✅ All values atomic? → 1NF
  - ✅ No partial dependency? → 2NF
  - ✅ No transitive dependency? → 3NF
- **VN:** Kiểm tra tuần tự từ 1NF → 2NF → 3NF

---

## 🔹 Database Design Process

### 1. Database Planning
- Define scope and objectives
- **VN:** Xác định phạm vi và mục tiêu

### 2. System Definition
- High-level description of needed system
- **VN:** Mô tả tổng quan hệ thống cần thiết

### 3. Requirement Collection & Analysis
- Interview users
- Collect business rules
- **Example questions:**
  - What information needs to be stored?
  - Who will use the system?
  - What reports are needed?
  - What are the business rules?
- **VN:** Thu thập yêu cầu từ người dùng và quy tắc nghiệp vụ

### 4. Conceptual Design (ER Modeling)

#### Step 1: Build conceptual model
- **Identify entity types**
  - Example: Student, Course, Instructor, Department
  - VN: Tìm các thực thể (danh từ quan trọng)

- **Identify relationship types**
  - Example: Student enrolls in Course, Instructor teaches Course
  - VN: Tìm mối quan hệ (động từ liên kết)

- **Identify & assign attributes**
  - Student: StudentID, Name, Email, BirthDate
  - Course: CourseID, CourseName, Credits
  - VN: Xác định thuộc tính cho mỗi thực thể

- **Determine attribute domains**
  - StudentID: VARCHAR(10)
  - BirthDate: DATE
  - Credits: INT (1-5)
  - VN: Xác định kiểu dữ liệu và miền giá trị

- **Identify candidate key, primary key, alternate key**
  - Candidate keys: StudentID, Email
  - Choose StudentID as PK
  - Email becomes Alternate Key

- **Use enhanced concepts (optional)**
  - Specialization: Student → UnderGrad, Graduate
  - VN: Sử dụng kế thừa nếu cần

- **Check redundancy**
  - Remove duplicate data
  - Ensure no unnecessary relationships

- **Validate with user transactions**
  - Can the model support: "Enroll student in course"?
  - Can the model support: "List all students in a course"?

- **Review with user**
  - Confirm the model matches business requirements

#### 📝 Complete Example
- **Scenario:** Build a Library Management System

- **Entities identified:**
  - Book (BookID, Title, ISBN, PublishYear, Category)
  - Author (AuthorID, AuthorName, Email, Country)
  - Member (MemberID, MemberName, Phone, JoinDate)
  - Loan (LoanID, LoanDate, DueDate, ReturnDate)

- **Relationships:**
  - Author writes Book (M:N) → Create AuthorBook table
  - Member borrows Book (M:N through Loan) → Loan is associative entity
  - Book belongs to Category (1:N)

- **VN:** Từ yêu cầu nghiệp vụ, xác định các thực thể, thuộc tính và mối quan hệ

---

### 5. Logical Design

#### Step 2: Build logical data model
- **Convert ERD → relations (tables)**
  - Entity → Table
  - Attributes → Columns
  - PK remains PK
  - Relationships → FK or junction table

- **Normalize relations**
  - Apply 1NF, 2NF, 3NF rules
  - Split tables if needed
  - VN: Chuẩn hóa các bảng

- **Validate with user transactions**
  - Test if model supports all required operations
  - Check query performance

- **Check integrity constraints**
  - Ensure all PKs are defined
  - Ensure all FKs reference valid PKs
  - Set NOT NULL, UNIQUE constraints

- **Review with users**
  - Confirm table structure makes sense

- **Merge logical models (optional)**
  - If multiple designers, combine their models

- **Check for future growth**
  - Can system handle more data?
  - Can new features be added easily?

#### 📝 Example: Convert ERD to Logical Model
- **From Conceptual (ERD):**
  - Entity: STUDENT with attributes (StudentID, Name, Email)
  - Entity: COURSE with attributes (CourseID, CourseName, Credits)
  - Relationship: ENROLLMENT (M:N) with Grade attribute

- **To Logical (Tables):**
  - **STUDENT**
    - StudentID (PK) VARCHAR(10)
    - Name VARCHAR(100) NOT NULL
    - Email VARCHAR(100) UNIQUE
  - **COURSE**
    - CourseID (PK) VARCHAR(10)
    - CourseName VARCHAR(100) NOT NULL
    - Credits INT CHECK(Credits >= 1 AND Credits <= 5)
  - **ENROLLMENT** (Junction table for M:N)
    - StudentID (PK, FK) VARCHAR(10) REFERENCES STUDENT(StudentID)
    - CourseID (PK, FK) VARCHAR(10) REFERENCES COURSE(CourseID)
    - Grade CHAR(2)
    - EnrollDate DATE DEFAULT CURRENT_DATE

- **VN:** Chuyển từ sơ đồ ER sang các bảng cụ thể với ràng buộc

---

### 6. Physical Design

#### Step 3: Translate logical → physical model
- Design base tables
- Design derived data
- Design constraints

#### Step 4: File organization & indexing
- Analyze transactions
- Choose file organizations
- Choose indexes
- Estimate disk space

#### Step 5–8
- Design user views
- Design security
- Introduce controlled redundancy (optional)
- Monitor & tune the operational system

---

## 🔹 Key Terms for Multiple Choice Questions

### NULL Value
- **EN:** Represents unknown or missing data
- **VN:** Đại diện cho dữ liệu chưa biết hoặc không có
- **Important:** NULL ≠ 0, NULL ≠ empty string ""
- PK cannot be NULL (Entity Integrity)

### Schema vs Instance
- **Schema (EN):** Structure/blueprint of database (doesn't change often)
  - **VN:** Cấu trúc của CSDL
  - Example: Student(StudentID, Name, Email)

- **Instance (EN):** Actual data at a specific time (changes frequently)
  - **VN:** Dữ liệu thực tế tại một thời điểm
  - Example: Specific students in table right now

### Data Independence
- **Logical Data Independence:** Change logical schema without affecting external views
  - VN: Thay đổi cấu trúc logic mà không ảnh hưởng ứng dụng

- **Physical Data Independence:** Change storage structure without affecting logical schema
  - VN: Thay đổi cách lưu trữ vật lý mà không ảnh hưởng logic

### ACID Properties (Transaction)
- **Atomicity:** All or nothing (toàn bộ hoặc không)
- **Consistency:** Database remains in valid state (duy trì tính hợp lệ)
- **Isolation:** Transactions don't interfere (các giao dịch độc lập)
- **Durability:** Changes are permanent (thay đổi vĩnh viễn)

### Participation Constraints
- **Total Participation (double line):** Every entity must participate
  - Example: Every Employee MUST work in a Department
  - VN: Bắt buộc tham gia

- **Partial Participation (single line):** Entity may or may not participate
  - Example: A Department MAY have Employees (or be empty)
  - VN: Tùy chọn tham gia

### Recursive Relationship
- **EN:** Relationship between entity and itself
- **VN:** Mối quan hệ giữa thực thể với chính nó
- **Example:**
  - Employee manages Employee (Manager-Subordinate)
  - Person marries Person (Spouse)
  - Course is prerequisite for Course

### Associative Entity (Bridge Entity)
- **EN:** Entity that represents a M:N relationship with additional attributes
- **VN:** Thực thể đại diện cho quan hệ N:N có thêm thuộc tính
- **Example:**
  - ENROLLMENT (Student-Course with Grade, EnrollDate)
  - ASSIGNMENT (Employee-Project with Role, Hours)

### Cardinality vs Participation
- **Cardinality:** Maximum number (1:1, 1:N, M:N)
  - **VN:** Số lượng tối đa

- **Participation/Optionality:** Minimum number (0 or 1)
  - **VN:** Số lượng tối thiểu
  - **| (one)** = Mandatory (minimum 1)
  - **O (zero)** = Optional (minimum 0)

### Example of Both
- **Employee |————O< Department**
  - One employee works in EXACTLY one department (mandatory 1:1)
  - One department has ZERO or MORE employees (optional 1:N)

---

## 🔹 Common MCQ Topics Summary

### ✅ You Should Know

#### ER Concepts
- Strong vs Weak Entity
- Entity Type vs Entity Instance
- Attribute types (simple/composite, single/multi-valued, stored/derived)
- Identifying attributes (candidate key, primary key, alternate key)
- Relationship degree (unary, binary, ternary)
- Cardinality (1:1, 1:N, M:N)
- Optionality (mandatory vs optional)
- Recursive relationships
- Associative entities

#### Enhanced ER
- Specialization vs Generalization
- Disjoint vs Overlapping
- Total vs Partial participation

#### Relational Model
- Relation, Tuple, Attribute, Degree, Cardinality
- Super key, Candidate key, Primary key, Alternate key, Foreign key
- Composite key

#### Integrity Constraints
- Domain constraint
- Entity integrity (PK ≠ NULL)
- Referential integrity (FK → PK)

#### Normalization
- Purpose of normalization
- Insertion/Update/Deletion anomalies
- Functional dependency (FD)
- Full FD vs Partial FD vs Transitive FD
- 1NF rules (atomic values, no repeating groups)
- 2NF rules (1NF + no partial dependency)
- 3NF rules (2NF + no transitive dependency)
- How to convert unnormalized → 3NF

#### Database Design
- Conceptual vs Logical vs Physical design
- Steps in ER modeling
- Steps in logical design
- Converting ERD to tables

#### General
- Data vs Information
- DBMS vs RDBMS
- Schema vs Instance
- NULL value
- Data independence
- ACID properties (basic understanding)

---

## 🎯 Exam Tips (Mẹo thi)

### For ERD Questions
- Identify entities (nouns) - Tìm danh từ
- Identify relationships (verbs) - Tìm động từ
- Determine cardinality - Xác định số lượng
- Check optionality - Kiểm tra bắt buộc/tùy chọn
- Add attributes - Thêm thuộc tính
- Choose primary keys - Chọn khóa chính
- For M:N, create junction table - N:N thì tạo bảng trung gian

### For Normalization Questions
- Check 1NF first - Kiểm tra nguyên tử trước
- If composite PK exists, check for partial dependency → 2NF
  - Nếu có khóa tổng hợp, kiểm tra phụ thuộc từng phần
- Check for transitive dependency → 3NF
  - Kiểm tra phụ thuộc bắc cầu
- Draw arrows to show dependencies
  - Vẽ mũi tên để thể hiện phụ thuộc
- Split tables to remove violations
  - Tách bảng để loại bỏ vi phạm

### For True/False
- Read carefully! Small words matter (all, some, must, may)
- NULL ≠ 0 (this often appears!)
- PK cannot be NULL (always true)
- FK can be NULL (if allowed)

### For Fill-in-the-Blank
- Know exact terms: Foreign Key, Primary Key, Candidate Key
- Know normalization forms: 1NF, 2NF, 3NF
- Know constraint types: Domain, Entity, Referential

---

## 📚 Practice Questions (Tự kiểm tra)

### Question 1
- **Question:** Which normal form eliminates partial dependency?
- **Answer:** 2NF

### Question 2
- **Question:** Can a primary key contain NULL values?
- **Answer:** No (Entity Integrity)

### Question 3
- **Question:** What is the degree of a relation with 5 attributes?
- **Answer:** 5

### Question 4
- **Question:** If StudentID → DeptID and DeptID → DeptName, what type of dependency is StudentID → DeptName?
- **Answer:** Transitive Dependency

### Question 5
- **Question:** What table structure is needed for M:N relationship?
- **Answer:** Junction/Bridge/Associative table

### Question 6
- **Question:** Can a foreign key be NULL?
- **Answer:** Yes, if allowed (depends on optionality)

### Question 7
- **Question:** What does RDBMS stand for?
- **Answer:** Relational Database Management System

### Question 8
- **Question:** Which entity depends on strong entity for identification?
- **Answer:** Weak Entity

### Question 9
- **Question:** What symbol represents optional participation?
- **Answer:** O (circle)

### Question 10
- **Question:** A table with composite values violates which normal form?
- **Answer:** 1NF

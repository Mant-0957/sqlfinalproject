#  SQL Final Project – College Management System

## Project Overview

**SQL Final Project** is a relational database project designed to manage and analyze college academic information using **MySQL**.

The project creates a complete **College Management System database** containing departments, students, faculty, courses, enrollments, attendance, and grades.

It demonstrates practical SQL concepts including **database creation, table relationships, primary keys, foreign keys, data insertion, data manipulation, joins, subqueries, aggregate functions, conditional logic, string functions, date functions, and analytical queries**.

The complete SQL script is available in:

 **[finalsqlproject.sql](finalsqlproject.sql)**

---

## Objectives

The main objectives of this project are:

* Create a structured relational college database.
* Manage student and faculty information.
* Store department and course details.
* Track student course enrollments.
* Manage student attendance records.
* Store and analyze student grades.
* Practice SQL CRUD operations.
* Use relationships between multiple tables.
* Analyze student attendance and academic performance.
* Extract meaningful information using SQL queries.

---

## Technologies & Tools

| Technology            | Purpose                       |
| --------------------- | ----------------------------- |
|  MySQL             | Database management           |
|  SQL                | Database queries and analysis |
|  GitHub             | Project version control       |
|  MySQL Workbench | SQL development environment   |

---

##  Database Structure

The database is named:

```sql
finalsql
```

The project contains **7 main tables**:

### 1. Departments

Stores information about college departments.

```text
department_id
department_name
```

### 2. Students

Stores student personal and academic information.

```text
student_id
name
dob
gender
email
phone_number
address
admission_date
department_id
```

### 3. Faculty

Stores faculty information and their department relationships.

```text
faculty_id
name
email
phone_number
department_id
experience_years
```

### 4. Courses

Stores courses and their assigned faculty.

```text
course_id
course_name
faculty_id
```

### 5. Enrollments

Stores student course enrollment information.

```text
enrollment_id
student_id
course_id
enrollment_date
```

### 6. Attendance

Stores student attendance records.

```text
attendance_id
student_id
course_id
attendance_date
status
```

### 7. Grades

Stores marks obtained by students in courses.

```text
grade_id
student_id
course_id
marks_obtained
```

---

## Database Relationships

The database uses **Primary Keys** and **Foreign Keys** to maintain relationships between tables.

```text
Departments
     │
     ├────────────── Students
     │                    │
     │                    ├──── Enrollments ──── Courses
     │                    │
     │                    ├──── Attendance
     │                    │
     │                    └──── Grades
     │
     └────────────── Faculty
                          │
                          └──── Courses
```

### Main Relationships

* One department can have multiple students.
* One department can have multiple faculty members.
* Faculty members can teach multiple courses.
* Students can enroll in multiple courses.
* Students have attendance records.
* Students have grade records.

---

## SQL Concepts Demonstrated

This project covers several important SQL concepts.

### Database & Table Creation

```sql
CREATE DATABASE
CREATE TABLE
USE
```

### Constraints

```sql
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
```

### Data Manipulation

```sql
INSERT
UPDATE
DELETE
```
### Data Retrieval

```sql
SELECT
WHERE
ORDER BY
```

###Joins

The project demonstrates:

```sql
INNER JOIN
LEFT JOIN
```

These are used to combine information from multiple tables.

---

## Aggregate Functions

The project uses aggregate functions for analysis:

```sql
COUNT()
AVG()
```

These are used to calculate:

* Total students
* Average attendance
* Student counts by department
* Average marks

---

## Advanced SQL Concepts

The project also demonstrates:

* Subqueries
* `GROUP BY`
* `HAVING`
* `CASE`
* `IFNULL()`
* `TIMESTAMPDIFF()`
* `DATE_FORMAT()`
* `UPPER()`
* `TRIM()`
* Conditional aggregation
* Nested queries

---

## Analysis Performed

The SQL queries answer practical college-management questions such as:

### Student Analysis

* Retrieve students from a particular department.
* Sort students alphabetically.
* Count students in each department.
* Find students without course enrollments.

### Attendance Analysis

* Calculate individual attendance percentages.
* Find students with attendance below 75%.
* Calculate average attendance.
* Classify students as:

  * Regular
  * Irregular
  * Defaulter

### Academic Performance

Students are classified based on marks:

```text
Marks > 90       → Excellent
Marks 75–90      → Good
Marks < 75       → Needs Improvement
```

### Faculty Analysis

The project identifies:

* Faculty members without assigned courses.
* Courses taught by experienced faculty.
* Faculty experience information.

---

## CRUD Operations

The project demonstrates all major CRUD operations.

### Create

```sql
INSERT INTO
```

### Read

```sql
SELECT
```

### Update

```sql
UPDATE
```

### Delete

```sql
DELETE
```

For example:

```sql
UPDATE students
SET phone_number = '8487636736'
WHERE student_id = 1;
```

---

##  Example SQL Query

### Find Students from Computer Science

```sql
SELECT s.*
FROM students s
JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';
```

### Calculate Attendance Percentage

```sql
SELECT student_id,
       (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0
       / COUNT(*)) AS attendance_percentage
FROM attendance
GROUP BY student_id;
```

---

##  Project Structure

```text
sqlfinalproject/
│
├── finalsqlproject.sql
└── README.md
```


The script will:

```text
Create Database
      ↓
Create Tables
      ↓
Define Relationships
      ↓
Insert Data
      ↓
Update/Delete Records
      ↓
Run Analytical Queries
      ↓
Generate Results
```

---

##  Key Learning Outcomes

Through this project, I practiced:

* Relational database design
* SQL syntax and query writing
* Primary and foreign keys
* Database normalization concepts
* CRUD operations
* Joins
* Subqueries
* Aggregate functions
* Conditional logic
* Data filtering
* Grouping and sorting
* Date and string functions
* Business-oriented data analysis
* Academic database management

---

##  Project Workflow

```text
Database Creation
        ↓
Table Design
        ↓
Primary & Foreign Keys
        ↓
Data Insertion
        ↓
Data Manipulation
        ↓
Data Retrieval
        ↓
Joins & Subqueries
        ↓
Aggregation & Analysis
        ↓
Insights
```

---

##  Author

**Mant Sherasiya**

🎓 B.Tech Computer Science & Engineering
 Aspiring Data Scientist | Data Analyst | ML Enthusiast

### Skills

`SQL` `Python` `Excel` `Power BI` `Statistics` `Pandas` `NumPy` `Matplotlib` `Seaborn` `Machine Learning`

---

##  Project Repository

**GitHub:**
https://github.com/Mant-0957/sqlfinalproject

---

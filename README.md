SQL Final Project

Project Overview---
This project contains a complete SQL database design and implementation for a student management system. It includes database tables for students, departments, faculty, courses, enrollments, attendance, and grades. The project also provides sample data and SQL queries to demonstrate core database concepts.

The main goal of this project is to show practical use of SQL concepts such as table creation, primary keys, foreign keys, data insertion, joins, aggregate functions, and subqueries.

Database Schema--

The database consists of the following tables:

students
Stores student information such as name, date of birth, contact details, and address.

departments
Contains the list of academic departments.

faculty
Stores faculty details and links them to departments.

courses
Contains course information and the faculty assigned to each course.

enrollments
Represents which students are enrolled in which courses.

attendance
Stores attendance records for students in different courses.

grades
Stores marks obtained by students in each course.

All tables are connected using foreign key relationships to maintain data integrity.

Getting Started

Requirements

Any SQL database system such as
MySQL
MariaDB
PostgreSQL with minor syntax changes

How to Run

1 Clone the repository

git clone https://github.com/Mant-0957/sqlfinalproject.git

2 Open your SQL database tool

3 Run the file finalsqlproject.sql

This will
Create all tables
Insert sample data
Apply foreign key constraints
Run example queries

Sample Queries Included

The project includes queries to

View student details
Check attendance records
Calculate attendance percentage per student
Join students with courses and faculty
Calculate average marks per student
Filter attendance using date ranges

These queries demonstrate joins, aggregate functions, case statements, and subqueries.

Skills Demonstrated

Relational database design
Primary key and foreign key implementation
Data insertion following foreign key rules
SQL joins and aggregations
Grouping and filtering data

This project is suitable for academic submission or as a basic SQL portfolio project.

Future Improvements

Add stored procedures
Create views for reporting
Add triggers
Connect with a front end application

Author

Created by Mant-0957 as a SQL Final Project

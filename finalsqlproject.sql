create database finalsql;

use finalsql;

create table departments (
    department_id int primary key,
    department_name varchar(50) not null
);

create table students (
    student_id int primary key,
    name varchar(100),
    dob date,
    gender varchar(10),
    email varchar(100),
    phone_number varchar(15),
    address varchar(255),
    admission_date date,
    department_id int,
    foreign key (department_id) references departments(department_id)
);

create table faculty (
    faculty_id int primary key,
    name varchar(100),
    email varchar(100),
    phone_number varchar(15),
    department_id int,
    experience_years int,
    foreign key (department_id) references departments(department_id)
);

create table courses (
    course_id int primary key,
    course_name varchar(100),
    faculty_id int,
    foreign key (faculty_id) references faculty(faculty_id)
);

create table enrollments (
    enrollment_id int primary key,
    student_id int,
    course_id int,
    enrollment_date date,
    unique (student_id, course_id),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

create table attendance (
    attendance_id int primary key,
    student_id int,
    course_id int,
    attendance_date date,
    status varchar(10),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

create table grades (
    grade_id int primary key,
    student_id int,
    course_id int,
    marks_obtained int,
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

insert into departments values
(1,'Computer Science '),
(2,'Information Technology'),
(3,'Mechanical'),
(4,'Civil');

insert into faculty values
(1,'Dr. Rajesh Kumar','rajesh@college.com','9000000001',1,8),
(2,'Ms. Neha Sharma','neha@college.com','9000000002',2,6),
(3,'Mr. Amit Verma','amit@college.com','9000000003',1,3),
(4,'Dr. Pooja Mehta','pooja@college.com','9000000004',3,10);

insert into courses values
(101,'Database Management Systems',1),
(102,'Operating Systems',3),
(103,'Computer Networks',1),
(104,'Software Engineering',2),
(105,'Thermodynamics',4);

insert into students values
(1,'Amit Sharma','2002-05-10','Male','amit@gmail.com','9999999991','Delhi','2021-07-01',1),
(2,'Priya Patel','2001-08-15','Female','priya@gmail.com','9999999992','Ahmedabad','2020-07-01',1),
(3,'Rahul Verma','2002-02-20','Male',null,'9999999993','Mumbai','2021-07-01',2),
(4,'Sneha Singh','2001-11-05','Female','sneha@gmail.com','9999999994','Pune','2020-07-01',3),
(5,'Karan Mehta','2002-03-12','Male','karan@gmail.com','9999999995','Surat','2021-07-01',1),
(6,'Anjali Desai','2001-09-18','Female','anjali@gmail.com','9999999996','Vadodara','2020-07-01',4);

insert into enrollments values
(1,1,101,'2021-07-10'),
(2,1,102,'2021-07-10'),
(3,2,101,'2020-07-12'),
(4,2,103,'2020-07-12'),
(5,3,104,'2021-07-15'),
(6,4,105,'2020-07-20'),
(7,5,101,'2021-07-18');

insert into attendance values
(1,1,101,'2023-01-01','Present'),
(2,1,101,'2023-01-02','Absent'),
(3,1,101,'2023-01-03','Present'),
(4,2,101,'2023-01-01','Present'),
(5,2,101,'2023-01-02','Present'),
(6,2,101,'2023-01-03','Present'),
(7,3,104,'2023-01-01','Absent'),
(8,3,104,'2023-01-02','Absent'),
(9,3,104,'2023-01-03','Absent'),
(10,4,105,'2023-01-01','Present'),
(11,4,105,'2023-01-02','Late'),
(12,5,101,'2023-01-01','Present');

update students
set phone_number = '8487636736'
where student_id = 1;

delete from students
where student_id = 6;

select s.*
from students s
join departments d on s.department_id = d.department_id
where d.department_name = 'Computer Science';



select student_id,
(count(case when status='Present' then 1 end) / count(*)) * 100 as attendance_percentage
from attendance
group by student_id
having attendance_percentage < 75;

select g.student_id
from grades g
join attendance a on g.student_id = a.student_id
group by g.student_id
having avg(g.marks_obtained) < 40
and (count(case when a.status='Present' then 1 end) / count(*)) * 100 < 50;

select *
from faculty
where faculty_id not in (select faculty_id from courses);

select * from students
order by name;

select department_id, count(*) as total_students
from students
group by department_id;



SELECT AVG(attendance_percentage) AS average_attendance
FROM (
    SELECT 
        student_id,
        (COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*)) AS attendance_percentage
    FROM attendance
    GROUP BY student_id
) AS student_attendance;


select s.name, d.department_name
from students s
inner join departments d on s.department_id = d.department_id;

select s.*
from students s
left join enrollments e on s.student_id = e.student_id
where e.student_id is null;



select *
from courses
where faculty_id in (
    select faculty_id
    from faculty
    where experience_years >= 5
);



select student_id,
timestampdiff(year, admission_date, curdate()) as years_since_admission
from students;

select date_format(attendance_date,'%d-%m-%Y') from attendance;

select upper(name) from faculty;

select trim(name) from students;

select ifnull(email,'Email Not Provided') from students;

select student_id,
case
    when marks_obtained > 90 then 'Excellent'
    when marks_obtained between 75 and 90 then 'Good'
    else 'Needs Improvement'
end as performance
from grades;

select student_id,
case
    when attendance_percentage > 80 then 'Regular'
    when attendance_percentage between 50 and 80 then 'Irregular'
    else 'Defaulter'
end as attendance_status
from (
    select student_id,
    (count(case when status='Present' then 1 end) / count(*)) * 100 as attendance_percentage
    from attendance
    group by student_id
) t;

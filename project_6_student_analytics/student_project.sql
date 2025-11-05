-- ==========================================================
-- PHASE 1: TABLE CREATION AND DATA INSERTION
-- ==========================================================
CREATE SCHEMA IF NOT EXISTS student_db;
USE student_db;

-- Drop tables if they exist to start fresh
DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Students;

-- 1. Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- 2. Create Grades Table
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    final_mark INT,
    pass_fail VARCHAR(4),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 3. Create Attendance Table
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    attendance_percent INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert 10 Student records
INSERT INTO Students (student_name, email) VALUES
('Alice Smith', 'alice@email.com'),
('Bob Johnson', 'bob@email.com'),
('Charlie Lee', 'charlee@email.com'),
('David Brown', 'david@email.com'),
('Emily White', 'emily@email.com'),
('Frank Green', 'frank@email.com'),
('Grace Hall', 'grace@email.com'),
('Henry King', 'henry@email.com'),
('Ivy Scott', 'ivy@email.com'),
('Jack Adams', 'jack@email.com');

-- Insert 10 Grades
INSERT INTO Grades (student_id, final_mark, pass_fail) VALUES
(1, 85, 'Pass'), (2, 45, 'Fail'), (3, 72, 'Pass'), (4, 38, 'Fail'),
(5, 92, 'Pass'), (6, 65, 'Pass'), (7, 49, 'Fail'), (8, 58, 'Pass'),
(9, 78, 'Pass'), (10, 22, 'Fail');

-- Insert 10 Attendance records
INSERT INTO Attendance (student_id, attendance_percent) VALUES
(1, 92), (2, 60), (3, 85), (4, 55), (5, 98), (6, 75),
(7, 62), (8, 70), (9, 88), (10, 30);

-- ==========================================================
-- PHASE 2: SQL ANALYSIS
-- ==========================================================
SELECT
    s.student_name,
    a.attendance_percent,
    g.final_mark,
    g.pass_fail
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
JOIN Attendance a ON s.student_id = a.student_id;

-- Query 2: Correlation between attendance and marks (Full Manual Formula)
SELECT
    (AVG(a.attendance_percent * g.final_mark) - (AVG(a.attendance_percent) * AVG(g.final_mark))) /
    (SQRT(AVG(a.attendance_percent * a.attendance_percent) - AVG(a.attendance_percent) * AVG(a.attendance_percent)) * SQRT(AVG(g.final_mark * g.final_mark) - AVG(g.final_mark) * AVG(g.final_mark)))
    AS correlation_coefficient
FROM Grades g
JOIN Attendance a ON g.student_id = a.student_id;

-- Query 3: Transaction Demo (COMMIT)
START TRANSACTION;
-- Update Alice's email
UPDATE Students SET email = 'alice.smith@newemail.com' WHERE student_id = 1;
COMMIT;
-- This change is now permanent.

-- Query 4: Transaction Demo (ROLLBACK)
START TRANSACTION;
-- Try to delete a student
DELETE FROM Students WHERE student_id = 2; -- Deletes Bob Johnson
-- Now, undo the delete
ROLLBACK;
-- This change is now undone. Bob is safe.

-- Verification Step: Check if student 2 still exists
SELECT * FROM Students;
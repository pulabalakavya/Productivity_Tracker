CREATE DATABASE productivity_tracker;
USE productivity_tracker;
CREATE TABLE employees(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
role VARCHAR(100),
join_date date
);

CREATE TABLE tasks(
task_id INT PRIMARY KEY AUTO_INCREMENT,
task_name VARCHAR(200),
difficulty_level INT CHECK(difficulty_level BETWEEN 1 AND 5)
);

CREATE TABLE daily_work_log(
log_id INT PRIMARY KEY AUTO_INCREMENT,
employee_id INT,
task_id INT,
hours_spent DECIMAL(4,2),
work_date DATE,
productivity_score INT CHECK(productivity_score BETWEEN 1 AND 10),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
FOREIGN KEY (task_id) REFERENCES tasks(task_id)
);

INSERT INTO employees (name, role, join_date) VALUES
('Kavya', 'Full Stack Developer', '2024-11-20'),
('Manju', 'Data Analyst', '2024-09-02'),
('Jalani', 'HR Executive', '2024-11-15'),
('Supriya', 'Data Analyst', '2024-05-20'),
('Unnitha', 'Project Manager', '2024-02-10'),
('Akhila', 'Full Stack Developer', '2024-01-09'),
('Sanjay', 'Backend Developer', '2024-11-01'),
('Manish', 'Frontend Dev', '2024-10-20'),
('Meena', 'Intern', '2024-12-03'),
('Rahul', 'Intern', '2024-03-09'),
('Anil', 'Tester', '2024-06-08'),
('Laxmi', 'Developer', '2024-04-20'),
('Sai', 'Support Engineer', '2024-08-02');

INSERT INTO tasks (task_name, difficulty_level) VALUES
('Bug Fixing', 3),
('UI Development', 4),
('Backend API Development', 5),
('Testing Module A', 2),
('Requirement Analysis', 3),
('Data Cleaning', 2),
('Creating Dashboard', 4),
('Server Setup', 5),
('Code Review', 2),
('Documentation', 1),
('Database Optimization', 5),
('Integration Testing', 4),
('Support Issues', 2),
('Automated Testing Scripts', 4);

INSERT INTO daily_work_log (employee_id, task_id, hours_spent, work_date, productivity_score) VALUES
(1, 3, 6.5, '2024-05-01', 8),
(2, 4, 5.0, '2024-05-01', 7),
(3, 6, 4.5, '2024-05-01', 9),
(1, 1, 7.0, '2024-05-02', 8),
(4, 10, 3.0, '2024-05-01', 6),
(5, 2, 6.0, '2024-05-02', 8),
(6, 14, 8.5, '2024-05-03', 7),
(7, 11, 7.5, '2024-05-03', 9),
(8, 7, 6.0, '2024-05-02', 8),
(9, 9, 5.5, '2024-05-02', 7),
(10, 12, 2.5, '2024-05-02', 6),
(3, 13, 7.0, '2024-05-03', 9),
(2, 4, 6.0, '2024-05-03', 8),
(5, 3, 7.5, '2024-05-03', 8),
(7, 11, 8.0, '2024-05-04', 9),
(1, 1, 9.0, '2024-05-04', 7),
(8, 7, 7.5, '2024-05-04', 8),
(9, 8, 6.0, '2024-05-04', 7),
(4, 10, 3.0, '2024-05-04', 6),
(6, 14, 7.0, '2024-05-04', 7);
SELECT * FROM employees;
SELECT * FROM tasks;
SELECT * FROM daily_work_log;

UPDATE employees
SET role = 'Senior Developer'
WHERE employee_id = 4;

UPDATE tasks
SET difficulty_level = 5
WHERE task_id = 2;

DELETE FROM employees
WHERE employee_id = 15;

DELETE FROM tasks
WHERE task_id = 15;

DELETE FROM daily_work_log
WHERE employee_id = 13;

SELECT e.name, SUM(d.hours_spent) AS total_hours
FROM daily_work_log d
JOIN employees e ON d.employee_id = e.employee_id
GROUP BY e.name;

SELECT e.name, AVG(d.productivity_score) AS avg_productivity
FROM daily_work_log d
JOIN employees e ON d.employee_id = e.employee_id
GROUP BY e.name;

SELECT e.name, AVG(d.productivity_score) AS avg_score
FROM daily_work_log d
JOIN employees e ON d.employee_id = e.employee_id
GROUP BY e.name
ORDER BY avg_score DESC
LIMIT 5;

SELECT t.task_name, t.difficulty_level, AVG(d.productivity_score) AS avg_score
FROM tasks t
JOIN daily_work_log d ON t.task_id = d.task_id
GROUP BY t.task_name, t.difficulty_level
ORDER BY t.difficulty_level DESC;

SELECT e.name AS Employee, t.task_name AS Task, d.hours_spent, d.work_date, d.productivity_score
FROM daily_work_log d
JOIN employees e ON d.employee_id = e.employee_id
JOIN tasks t ON d.task_id = t.task_id;

SHOW DATABASES;











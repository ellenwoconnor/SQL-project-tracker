PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Students (
first_name VARCHAR(30),
last_name VARCHAR(30),
github VARCHAR(30) PRIMARY KEY
);
INSERT INTO "Students" VALUES('Jane','Hacker','jhacks');
INSERT INTO "Students" VALUES('Sarah','Developer','sdevelops');
CREATE TABLE Projects (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHAR(30),
description TEXT,
max_grade INTEGER);
INSERT INTO "Projects" VALUES(1,'Markov','Tweets generated from Markov chains',50);
INSERT INTO "Projects" VALUES(2,'Blockly','Programmatic Logic Puzzle Game',10);
INSERT INTO "Projects" VALUES(3,'Markov','Tweets generated from Markov chains',50);
CREATE TABLE Grades (
id INTEGER PRIMARY KEY AUTOINCREMENT,
student_github VARCHAR(30),
project_title VARCHAR(30),
grade INTEGER);
INSERT INTO "Grades" VALUES(1,'jhacks','Markov',10);
INSERT INTO "Grades" VALUES(2,'jhacks','Blockly',2);
INSERT INTO "Grades" VALUES(3,'sdevelops','Blockly',100);
INSERT INTO "Grades" VALUES(4,'sdevelops','Markov',50);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('Projects',3);
INSERT INTO "sqlite_sequence" VALUES('Grades',4);
CREATE VIEW ReportCardView AS
SELECT Students.first_name,
       Students.last_name,
       Projects.title,
       Projects.max_grade,
       Grades.grade
FROM Students
     JOIN Grades ON (Students.github = Grades.student_github)
     JOIN Projects ON (Projects.title = Grades.project_title);
COMMIT;

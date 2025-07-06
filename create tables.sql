create database club_dbms;
use club_dbms;

CREATE TABLE CLUB(
	club_id INT PRIMARY KEY,
    club_name VARCHAR(100) UNIQUE NOT NULL,
    faculty_incharge VARCHAR(100),
    description TEXT,
    club_type varchar(100) CHECK (club_type IN ('Technical', 'Cultural', 'Sports', 'Literary', 'Social', 'Other'))
);


CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    branch VARCHAR(10),
    year INT CHECK (year BETWEEN 1 AND 4),
    email VARCHAR(100) UNIQUE,
    cgpa DECIMAL(3,2) CHECK (cgpa BETWEEN 0.00 AND 10.00)
);

CREATE TABLE Membership (
    student_id INT,
    club_id INT,
    role VARCHAR(50),
    joined_on DATE,
    PRIMARY KEY (student_id, club_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    club_id INT,
    event_name VARCHAR(100),
    event_date DATE,
    venue VARCHAR(100),
    description TEXT,
    FOREIGN KEY (club_id) REFERENCES Club(club_id)
);

CREATE TABLE Attendance (
    event_id INT,
    student_id INT,
    status BOOLEAN,
    PRIMARY KEY (event_id, student_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE JoinLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    joined_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER log_membership_insert
AFTER INSERT ON Membership
FOR EACH ROW
INSERT INTO JoinLog(student_id) VALUES (NEW.student_id);


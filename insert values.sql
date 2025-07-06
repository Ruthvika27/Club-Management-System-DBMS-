INSERT INTO Club (club_id, club_name, faculty_incharge, description, club_type) VALUES
(1, 'SDC', 'Dr. Sharma', 'Technical coding club', 'TECHNICAL'),
(2, 'DND', 'Dr. Meena', 'Cultural dance & drama club', 'CULTURAL'),
(3, 'Sports', 'Coach Arjun', 'Outdoor sports and games', 'SPORTS');

-- select * from club;


INSERT INTO Student (student_id, name, branch, year, email, cgpa) VALUES
(101, 'Ananya R', 'CSE', 2, 'ananya@nitw.com', 9.2),
(102, 'Ravi M', 'ECE', 3, 'ravi@nitw.com', 8.4),
(103, 'Priya K', 'EEE', 1, 'priya@nitw.com', 9.0),
(104, 'Aman T', 'MECH', 4, 'aman@nitw.com', 7.8),
(105, 'Sneha D', 'CSE', 3, 'sneha@nitw.com', 8.9);

select * from student;

INSERT INTO Membership (student_id, club_id, role, joined_on) VALUES
(101, 1, 'Member', '2023-08-01'),
(102, 1, 'Core', '2023-07-15'),
(103, 2, 'Member', '2024-01-10'),
(104, 3, 'Captain', '2022-08-05'),
(105, 1, 'Member', '2023-09-12'),
(105, 2, 'Member', '2024-02-01');
INSERT INTO Membership (student_id, club_id, role, joined_on) VALUES (102, 2, 'Member', '2024-02-01');


INSERT INTO Event (event_id, club_id, event_name, event_date, venue, description) VALUES
(201, 1, 'Hackathon 5.0', '2024-10-15', 'Lab 4', '24-hour coding event'),
(202, 2, 'Annual Drama Night', '2024-11-20', 'Auditorium', 'Stage performances'),
(203, 3, 'Sports Day', '2024-12-05', 'Main Ground', 'Track and field events'),
(204, 1, 'Coding Bootcamp', '2024-08-20', 'Online', 'DSA and CP training');

select * from event;

INSERT INTO Attendance (event_id, student_id, status) VALUES
(201, 101, 1),
(201, 102, 1),
(202, 103, 1),
(202, 105, 1),
(203, 104, 1),
(203, 101, 0),
(204, 101, 1),
(204, 102, 1),
(204, 103, 0),
(204, 105, 0);

select * from attendance;

select S.name, M.count
from student S join (select student_id, count(club_id) as count
from membership
group by student_id ) M on S.student_id=M.student_id
where M.count>1
order by M.count desc;

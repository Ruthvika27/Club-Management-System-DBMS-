-- QUERIES

-- 1. SELECT STUDENTS WHO ARE IN MULTIPLE CLUBS ALONG WITH THEIR CLUB COUNT. PRINT THE ROWS MY DESCENDING CLUB COUNT.
SELECT S.name, COUNT(M.club_id) AS num_clubs
FROM Student S
JOIN Membership M ON S.student_id = M.student_id
GROUP BY S.student_id
HAVING COUNT(M.club_id) > 1
ORDER BY num_clubs DESC;

-- 2. students Who Attended More Than 1 Event. ORDER BY DESC OF COUNT.

SELECT S.name, COUNT(A.event_id) AS event_count
FROM Student S
JOIN Attendance A ON S.student_id = A.student_id
WHERE A.status = 1
GROUP BY S.student_id
HAVING COUNT(A.event_id) > 1
ORDER BY event_count DESC;

-- 3. Average CGPA of Students in Each Club.

SELECT C.club_name, round(avg(S.cgpa), 2) as avg_cgpa
FROM Club C
JOIN Membership M ON C.club_id = M.club_id
JOIN Student S ON M.student_id = S.student_id
GROUP BY C.club_id;

-- 4. list all the events along with their club names.

SELECT E.event_name, E.event_date, C.club_name
FROM Event E
JOIN Club C ON E.club_id = C.club_id
ORDER BY E.event_date DESC;

-- 5. print the clubs that have conduceted more than one event.

SELECT C.club_name, COUNT(E.event_id) AS total_events
FROM Club C
JOIN Event E ON C.club_id = E.club_id
GROUP BY C.club_id
HAVING COUNT(E.event_id) > 1;

-- 6. list all the students who didn't attend the event with event id 204

SELECT S.name
FROM Student S
WHERE S.student_id NOT IN (
    SELECT A.student_id
    FROM Attendance A
    WHERE A.event_id = 204 AND A.status = 1
);

-- 7. print the attendance of each event.

SELECT E.event_name, COUNT(A.student_id) AS total_attendees
FROM Event E
JOIN Attendance A ON E.event_id = A.event_id
WHERE A.status = 1
GROUP BY E.event_id;

-- 8. print all the members and their role of SDC club.

SELECT S.name, M.role
FROM Student S
JOIN Membership M ON S.student_id = M.student_id
JOIN Club C ON M.club_id = C.club_id
WHERE C.club_name = 'SDC';

-- 9. print the list of events attended by each student

SELECT S.name, GROUP_CONCAT(E.event_name SEPARATOR ', ') AS events_attended
FROM Student S
JOIN Attendance A ON S.student_id = A.student_id
JOIN Event E ON A.event_id = E.event_id
WHERE A.status = 1
GROUP BY S.student_id;

-- 10. print top 2 clubs based on their member count.

SELECT C.club_name, COUNT(M.student_id) AS member_count
FROM Club C
JOIN Membership M ON C.club_id = M.club_id
GROUP BY C.club_id
ORDER BY member_count DESC
LIMIT 2;










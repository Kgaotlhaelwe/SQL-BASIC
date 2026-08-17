/******************************************************************
    SELECT, WHERE AND ORDER BY
******************************************************************/

-- Display all students
SELECT *
FROM Students;

-- Select specific columns
SELECT StudentName, Age
FROM Students;

-- Equal to
SELECT *
FROM Students
WHERE Age = 20;

-- Greater than
SELECT *
FROM Students
WHERE Age > 20;

-- Greater than or equal to
SELECT *
FROM Students
WHERE Age >= 20;

-- Not equal
SELECT *
FROM Students
WHERE Age <> 20;

-- BETWEEN
SELECT *
FROM Students
WHERE Age BETWEEN 20 AND 25;

-- IN
SELECT *
FROM Students
WHERE Age IN (20, 21, 22);

-- LIKE
SELECT *
FROM Students
WHERE StudentName LIKE 'J%';

-- Names ending with n
SELECT *
FROM Students
WHERE StudentName LIKE '%n';

-- ORDER BY ascending
SELECT *
FROM Students
ORDER BY StudentName ASC;

-- ORDER BY descending
SELECT *
FROM Students
ORDER BY Age DESC;
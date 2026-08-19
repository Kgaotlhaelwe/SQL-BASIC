SELECT COUNT(*)
FROM Students;
SELECT AVG(Age)
FROM Students;

SELECT MIN(Age)
FROM Students;

SELECT MAX(Age)
FROM Students;

SELECT SUM(Mark)
FROM Registrations

SELECT
    CourseID,
    COUNT(*) AS NumberOfStudents
FROM Registrations
GROUP BY CourseID;

SELECT COUNT(DISTINCT Age)
FROM Students;

SELECT
    CourseID,
    AVG(Mark) AS AverageMark
FROM Registrations
GROUP BY CourseID
HAVING AVG(Mark) >= 60;

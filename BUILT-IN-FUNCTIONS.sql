SELECT CAST(25 AS VARCHAR(10));

SELECT CONVERT(VARCHAR(20), GETDATE(), 103);SELECT
    StudentName,
    IIF(Age >= 18, 'Adult', 'Minor') AS Category
FROM Students;
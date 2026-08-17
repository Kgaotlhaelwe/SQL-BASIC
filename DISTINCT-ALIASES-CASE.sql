/******************************************************************
    DISTINCT
******************************************************************/

SELECT DISTINCT Age
FROM Students;


/******************************************************************
    COLUMN ALIASES
******************************************************************/

SELECT
    StudentName AS Name,
    Age AS StudentAge
FROM Students;


/******************************************************************
    TABLE ALIASES
******************************************************************/

SELECT
    s.StudentName,
    s.Age
FROM Students AS s;


/******************************************************************
    CASE
******************************************************************/

SELECT
    StudentName,
    Age,

    CASE
        WHEN Age >= 25 THEN 'Adult'
        WHEN Age >= 20 THEN 'Young Adult'
        ELSE 'Under 20'
    END AS AgeGroup

FROM Students;
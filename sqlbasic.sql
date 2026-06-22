/******************************************************************
    MYSQL NOTES: DDL & DML COMMANDS
    Author: CodeTribe

    SQL = Structured Query Language

    DDL (Data Definition Language)
    - Used to create and modify database structures

    DML (Data Manipulation Language)
    - Used to work with the data inside tables
******************************************************************/

/******************************************************************
    SECTION 1: DDL (DATA DEFINITION LANGUAGE)
******************************************************************/

-- Create a new database
CREATE DATABASE CodetribeRegistrationDB;

-- Select the database to work with
USE CodetribeRegistrationDB;


/******************************************************************
    CREATE TABLE
    Used to create a new table.
******************************************************************/

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,      -- Unique student number
    StudentName VARCHAR(250),       -- Student name
    Age INT                         -- Student age
);


/******************************************************************
    SHOW TABLES
    Displays all tables in the current database.
******************************************************************/

SHOW TABLES;


/******************************************************************
    DESCRIBE TABLE
    Shows the structure of the table.
******************************************************************/

DESCRIBE Students;

-- Short version
DESC Students;


/******************************************************************
    ALTER TABLE
    Used to modify an existing table.
******************************************************************/

-- Add a new column called Gender
ALTER TABLE Students
ADD Gender VARCHAR(50);


/******************************************************************
    DML (DATA MANIPULATION LANGUAGE)
******************************************************************/

/******************************************************************
    INSERT
    Used to add records into a table.
******************************************************************/

INSERT INTO Students
(StudentID, StudentName, Age, Gender)
VALUES
(1, 'John', 20, 'Male'),
(2, 'Sarah', 21, 'Female'),
(3, 'Peter', 22, 'Male'),
(4, 'Shaan Shaan', 20, 'Female');


/******************************************************************
    SELECT
    Used to retrieve data from a table.
******************************************************************/

-- Display all columns and records
SELECT * FROM Students;

-- Display specific columns
SELECT StudentName, Age
FROM Students;

-- Display students older than 20
SELECT *
FROM Students
WHERE Age > 20;


/******************************************************************
    UPDATE
    Used to modify existing records.
******************************************************************/

-- Update Peter's age
UPDATE Students
SET Age = 23
WHERE StudentID = 3;

-- Verify the update
SELECT * FROM Students;


/******************************************************************
    DELETE
    Used to remove records from a table.
******************************************************************/

-- Delete Sarah's record
DELETE FROM Students
WHERE StudentID = 2;

-- Verify the deletion
SELECT * FROM Students;


/******************************************************************
    MORE ALTER TABLE EXAMPLES
******************************************************************/

-- Change the size of StudentName column
ALTER TABLE Students
MODIFY StudentName VARCHAR(500);

-- Remove the Gender column
ALTER TABLE Students
DROP COLUMN Gender;


/******************************************************************
    TRUNCATE TABLE
    Removes all records but keeps the table structure.
******************************************************************/

TRUNCATE TABLE Students;


/******************************************************************
    RENAME TABLE
    Changes the table name.
******************************************************************/

RENAME TABLE Students TO Learners;


/******************************************************************
    DROP TABLE
    Permanently removes the table and all data.
******************************************************************/

-- DROP TABLE Learners;


/******************************************************************
    DROP DATABASE
    Permanently removes the database.
******************************************************************/

-- DROP DATABASE CodetribeRegistrationDB;


/******************************************************************
    SUMMARY

    DDL COMMANDS
    ------------
    CREATE DATABASE
    CREATE TABLE
    ALTER TABLE
    RENAME TABLE
    TRUNCATE TABLE
    DROP TABLE
    DROP DATABASE

    DML COMMANDS
    ------------
    INSERT
    SELECT
    UPDATE
    DELETE

    REMEMBER:

    DDL = Defines the database structure.

    DML = Manipulates the data stored in the database.
******************************************************************/
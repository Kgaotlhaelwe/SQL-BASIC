/******************************************************************
    SQL NOTES: TABLE RELATIONSHIPS AND JOINS

    Topics covered:
    - Primary Keys
    - Foreign Keys
    - Table Relationships
    - INNER JOIN
    - LEFT JOIN
    - RIGHT JOIN
    - SELF JOIN
    - Table Aliases

    IMPORTANT:
    A JOIN is used when data is stored in more than one table
    and we want to combine related information.
******************************************************************/


/******************************************************************
    SECTION 1: CREATE THE COURSES TABLE
******************************************************************/

CREATE TABLE Courses (

    CourseID INT PRIMARY KEY,
    -- CourseID uniquely identifies each course.
    -- PRIMARY KEY means:
    -- 1. The value must be unique.
    -- 2. The value cannot be NULL.

    CourseName VARCHAR(100)
    -- Stores the name of the course.
    -- VARCHAR is used for text.
    -- Maximum length is 100 characters.
);


/******************************************************************
    SECTION 2: CREATE THE REGISTRATIONS TABLE
******************************************************************/

CREATE TABLE Registrations (

    RegistrationID INT PRIMARY KEY,
    -- Unique number for each registration.
    -- Every registration must have a different RegistrationID.

    StudentID INT,
    -- Stores the ID of the student who registered.
    -- This value will be linked to the Students table.

    CourseID INT,
    -- Stores the ID of the course selected by the student.
    -- This value will be linked to the Courses table.

    Mark DECIMAL(5,2),
    -- Stores the student's mark.
    --
    -- DECIMAL(5,2) means:
    -- 5 digits can be stored in total.
    -- 2 digits can appear after the decimal point.
    --
    -- Example:
    -- 75.50
    -- 100.00


    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID),

    -- StudentID is a FOREIGN KEY.
    --
    -- A FOREIGN KEY creates a relationship between two tables.
    --
    -- In this case:
    --
    -- Registrations.StudentID
    --        ↓
    -- Students.StudentID
    --
    -- This means a registration must refer to a student
    -- that exists in the Students table.


    FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID)

    -- CourseID is also a FOREIGN KEY.
    --
    -- It connects:
    --
    -- Registrations.CourseID
    --        ↓
    -- Courses.CourseID
);


/******************************************************************
    UNDERSTANDING THE RELATIONSHIP

    Students
    --------
    StudentID
    StudentName
    Age


    Courses
    -------
    CourseID
    CourseName


    Registrations
    -------------
    RegistrationID
    StudentID
    CourseID
    Mark


    Registrations acts as the connection between Students
    and Courses.

    Example:

    Students
    --------------------------------
    StudentID      StudentName
    1              John
    2              Sarah


    Courses
    --------------------------------
    CourseID       CourseName
    101            Python
    102            Databases


    Registrations
    -----------------------------------------------
    RegistrationID   StudentID   CourseID   Mark
    1                1           101        80
    2                2           102        75


    Registration 1 means:

    StudentID 1 = John
    CourseID 101 = Python

    Therefore:

    John is registered for Python and received 80.
******************************************************************/


/******************************************************************
    SECTION 3: INNER JOIN

    INNER JOIN returns ONLY records that have matching values
    in both tables.

    If there is no matching record, that row will not be displayed.
******************************************************************/

SELECT
    s.StudentName,
    -- StudentName comes from the Students table.

    c.CourseName,
    -- CourseName comes from the Courses table.

    r.Mark
    -- Mark comes from the Registrations table.

FROM Registrations AS r

-- "AS r" creates a table alias.
--
-- Instead of writing:
--
-- Registrations.Mark
--
-- we can write:
--
-- r.Mark
--
-- Table aliases make queries shorter and easier to read.


INNER JOIN Students AS s
    ON r.StudentID = s.StudentID

-- INNER JOIN connects Registrations to Students.
--
-- SQL compares:
--
-- Registrations.StudentID
--
-- with:
--
-- Students.StudentID
--
-- Example:
--
-- Registrations.StudentID = 1
-- Students.StudentID      = 1
--
-- Because they match, SQL combines the records.


INNER JOIN Courses AS c
    ON r.CourseID = c.CourseID;

-- This second INNER JOIN connects the registration
-- to the course.
--
-- SQL compares:
--
-- Registrations.CourseID
--
-- with:
--
-- Courses.CourseID


/******************************************************************
    EXPECTED OUTPUT

    StudentName      CourseName       Mark
    ---------------------------------------
    John             Python           80.00
    Sarah            Databases        75.00


    IMPORTANT:

    INNER JOIN means:

    "Only show records where a match exists."
******************************************************************/


/******************************************************************
    SECTION 4: LEFT JOIN

    LEFT JOIN returns:

    - ALL records from the LEFT table.
    - Matching records from the RIGHT table.

    If there is no matching record in the right table,
    SQL displays NULL.
******************************************************************/

SELECT
    s.StudentName,
    r.Mark

FROM Students AS s

-- Students is the LEFT table because it appears before LEFT JOIN.


LEFT JOIN Registrations AS r
    ON s.StudentID = r.StudentID;


/******************************************************************
    EXAMPLE

    Students
    -----------------------
    StudentID   StudentName
    1           John
    2           Sarah
    3           Peter


    Registrations
    -----------------------
    StudentID   Mark
    1           80
    2           75


    LEFT JOIN result:

    StudentName      Mark
    ----------------------
    John             80
    Sarah            75
    Peter            NULL


    Peter still appears because Students is the LEFT table.

    He has no registration, therefore the value from
    Registrations is NULL.


    IMPORTANT:

    LEFT JOIN means:

    "Show everything from the left table,
     even when there is no matching record."
******************************************************************/


/******************************************************************
    SECTION 5: RIGHT JOIN

    RIGHT JOIN is the opposite of LEFT JOIN.

    It returns:

    - ALL records from the RIGHT table.
    - Matching records from the LEFT table.
******************************************************************/

SELECT
    s.StudentName,
    r.Mark

FROM Students AS s

RIGHT JOIN Registrations AS r
    ON s.StudentID = r.StudentID;


/******************************************************************
    In this query:

    LEFT TABLE:
    Students


    RIGHT TABLE:
    Registrations


    RIGHT JOIN means every Registration record must be displayed.

    If a matching student exists, StudentName will be displayed.


    IMPORTANT:

    RIGHT JOIN means:

    "Show everything from the right table,
     even if there is no matching record on the left."


    NOTE:

    If FOREIGN KEY rules are correctly enforced,
    there would normally not be a Registration with an invalid
    StudentID.

    Therefore RIGHT JOIN is sometimes less useful in this example,
    but it is important to understand the concept.
******************************************************************/


/******************************************************************
    INNER JOIN vs LEFT JOIN vs RIGHT JOIN

    INNER JOIN
    ----------
    Only matching records.


    LEFT JOIN
    ---------
    Everything from the LEFT table
    + matching records from the RIGHT table.


    RIGHT JOIN
    ----------
    Everything from the RIGHT table
    + matching records from the LEFT table.
******************************************************************/


/******************************************************************
    SECTION 6: SELF JOIN

    A SELF JOIN happens when a table is joined to itself.

    Why would we join a table to itself?

    One common example is Employees and Managers.

    Both employees and managers are employees.

    Therefore we do not necessarily need a separate Managers table.

    Instead, ManagerID can point to another EmployeeID
    inside the same table.
******************************************************************/


CREATE TABLE Employees (

    EmployeeID INT PRIMARY KEY,
    -- Unique number for each employee.

    EmployeeName VARCHAR(100),
    -- Employee's name.

    ManagerID INT
    -- Stores the EmployeeID of the employee's manager.
);


/******************************************************************
    EXAMPLE DATA

    EmployeeID     EmployeeName       ManagerID
    ------------------------------------------------
    1              Sarah              NULL
    2              John               1
    3              Peter              1
    4              Mary               2


    This means:

    Sarah
    -----
    ManagerID = NULL
    Sarah has no manager.


    John
    ----
    ManagerID = 1
    Employee 1 is Sarah.
    Therefore Sarah manages John.


    Peter
    -----
    ManagerID = 1
    Sarah also manages Peter.


    Mary
    ----
    ManagerID = 2
    Employee 2 is John.
    Therefore John manages Mary.
******************************************************************/


/******************************************************************
    SELF JOIN QUERY
******************************************************************/

SELECT

    e.EmployeeName AS Employee,
    -- "e" represents an employee.

    m.EmployeeName AS Manager
    -- "m" represents another record from the SAME Employees table.
    -- In this case that record represents the manager.

FROM Employees AS e

LEFT JOIN Employees AS m
    ON e.ManagerID = m.EmployeeID;


/******************************************************************
    IMPORTANT:

    Notice that Employees appears TWICE:

    Employees AS e
    Employees AS m

    They are the same physical table.

    The aliases allow us to treat the table as if it has
    two different roles.


    e = Employee

    m = Manager
******************************************************************/


/******************************************************************
    HOW THE SELF JOIN WORKS

    Consider John:

    EmployeeID = 2
    EmployeeName = John
    ManagerID = 1


    SQL looks for:

    e.ManagerID = m.EmployeeID


    Therefore:

    1 = 1


    EmployeeID 1 belongs to Sarah.

    SQL therefore produces:

    Employee        Manager
    -----------------------
    John            Sarah
******************************************************************/


/******************************************************************
    EXPECTED OUTPUT

    Employee        Manager
    ---------------------------
    Sarah           NULL
    John            Sarah
    Peter           Sarah
    Mary            John


    We use LEFT JOIN instead of INNER JOIN because the highest-level
    manager may not have another manager.

    Sarah has ManagerID = NULL.

    LEFT JOIN allows Sarah to still appear in the results.
******************************************************************/


/******************************************************************
    SECTION 7: TABLE ALIASES

    Aliases give tables temporary short names.

    Example:
******************************************************************/

SELECT
    s.StudentName
FROM Students AS s;


/******************************************************************
    Students = actual table name

    s = temporary alias


    Instead of writing:

    Students.StudentName

    we write:

    s.StudentName


    This becomes especially useful when working with multiple tables.
******************************************************************/


/******************************************************************
    SECTION 8: COLUMN ALIASES

    Column aliases change the heading displayed in the result.
******************************************************************/

SELECT
    StudentName AS 'Student Name',
    Age AS 'Student Age'
FROM Students;


/******************************************************************
    The database column remains:

    StudentName

    But the result heading becomes:

    Student Name


    Aliases do NOT permanently rename the database column.
******************************************************************/


/******************************************************************
    SECTION 9: PRIMARY KEY

    A PRIMARY KEY identifies each record uniquely.

    Example:

    StudentID INT PRIMARY KEY


    Valid:

    StudentID
    ---------
    1
    2
    3
    4


    Invalid:

    StudentID
    ---------
    1
    1       <-- duplicate
    2


    A PRIMARY KEY:

    - Cannot contain duplicate values.
    - Cannot contain NULL.
    - Normally identifies one specific record.
******************************************************************/


/******************************************************************
    SECTION 10: FOREIGN KEY

    A FOREIGN KEY links one table to another.

    Example:

    Registrations.StudentID
               |
               |
               v
    Students.StudentID


    The parent table is:

    Students


    The child table is:

    Registrations


    Students can exist without Registrations.

    But a valid Registration should reference an existing Student.
******************************************************************/


/******************************************************************
    SECTION 11: ONE-TO-MANY RELATIONSHIP

    One student can have MANY registrations.

    Example:

    Students:

    StudentID      StudentName
    1              John


    Registrations:

    RegistrationID   StudentID   CourseID
    1                1           101
    2                1           102
    3                1           103


    John appears once in Students.

    But John's StudentID can appear many times in Registrations.


    Therefore:

    Students 1 -------- MANY Registrations
******************************************************************/


/******************************************************************
    SECTION 12: MANY-TO-MANY RELATIONSHIP

    Students and Courses have a MANY-TO-MANY relationship.

    One student can register for many courses.

    One course can contain many students.


    We solve this using the Registrations table.


                   Registrations
                  /             \
                 /               \
                /                 \
           Students              Courses


    Students
       1
       |
       | MANY
       |
    Registrations
       |
       | MANY
       |
       1
    Courses


    Registrations is sometimes called:

    - Junction table
    - Bridge table
    - Associative table
******************************************************************/


/******************************************************************
    QUICK SUMMARY
******************************************************************

    PRIMARY KEY
    -----------
    Uniquely identifies a record.


    FOREIGN KEY
    -----------
    Creates a relationship with another table.


    INNER JOIN
    ----------
    Returns matching records only.


    LEFT JOIN
    ---------
    Returns all records from the left table
    and matching records from the right table.


    RIGHT JOIN
    ----------
    Returns all records from the right table
    and matching records from the left table.


    SELF JOIN
    ---------
    Joins a table to itself.


    TABLE ALIAS
    -----------
    Gives a table a temporary short name.

    Example:

    Students AS s


    COLUMN ALIAS
    ------------
    Gives a result column a different heading.

    Example:

    StudentName AS 'Student Name'


    ONE-TO-MANY
    -----------
    One record relates to many records.

    Example:

    One Student -> Many Registrations


    MANY-TO-MANY
    ------------
    Many records relate to many other records.

    Example:

    Students <-> Courses

    A junction table such as Registrations is used between them.
******************************************************************/
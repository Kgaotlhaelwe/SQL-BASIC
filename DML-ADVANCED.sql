MERGE INTO Students AS Target
USING NewStudents AS Source
ON Target.StudentID = Source.StudentID

WHEN MATCHED THEN
    UPDATE SET
        Target.StudentName = Source.StudentName,
        Target.Age = Source.Age

WHEN NOT MATCHED THEN
    INSERT (StudentID, StudentName, Age)
    VALUES (
        Source.StudentID,
        Source.StudentName,
        Source.Age
    );
-- q1--
/*SELECT s.Name, s.SSN, COUNT(DISTINCT e.CourseNumber, e.Quarter) AS NumCourses
FROM Student s
LEFT JOIN Enrollment e ON s.SSN = e.SSN
GROUP BY s.Name, s.SSN; */

-- q2--
-- SELECT s.Name, s.SSN, COUNT(DISTINCT e.CourseNumber) AS NumCourses
-- FROM Student s
-- LEFT JOIN Enrollment e ON s.SSN = e.SSN
-- GROUP BY s.Name, s.SSN;	

-- q3
-- SELECT s.Name, s.SSN, COUNT(DISTINCT e.CourseNumber, e.Quarter) AS NumCompletedCourses
-- FROM Student s
-- JOIN Enrollment e ON s.SSN = e.SSN
-- WHERE e.Grade IS NOT NULL
-- GROUP BY s.Name, s.SSN;

-- q4
-- SELECT s.Name, s.SSN, COUNT(DISTINCT e.CourseNumber, e.Quarter) AS NumCompletedCourses
-- FROM Student s
-- JOIN Enrollment e ON s.SSN = e.SSN
-- WHERE e.Grade IS NOT NULL AND e.Grade >= 'C'
-- GROUP BY s.Name, s.SSN;
-- q5
-- SELECT CourseTitle, CourseNumber
-- FROM Course
-- WHERE PrerequisiteCourseNumber IS NULL;

-- q6
-- SELECT s.Name, s.SSN
-- FROM Student s
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM Enrollment e
--     WHERE e.SSN = s.SSN AND (e.Grade IS NULL OR e.Grade <> 'A')
-- );

-- q7
-- SELECT s.Name, s.SSN, e.CourseNumber
-- FROM Student s
-- JOIN Enrollment e ON s.SSN = e.SSN
-- WHERE e.CourseNumber IN (
--     SELECT CourseNumber
--     FROM Enrollment
--     GROUP BY CourseNumber
--     HAVING COUNT(*) >= 3
-- )
-- GROUP BY s.Name, s.SSN, e.CourseNumber
-- HAVING COUNT(*) >= 3;

-- q8
-- SELECT s.Name, s.SSN, q.Quarter, COUNT(DISTINCT e.CourseNumber) AS NumCourses
-- FROM Student s
-- JOIN Enrollment e ON s.SSN = e.SSN
-- JOIN Section sec ON e.CourseNumber = sec.CourseNumber AND e.Quarter = sec.Quarter
-- JOIN (
--     SELECT DISTINCT Quarter
--     FROM Section
-- ) q ON e.Quarter = q.Quarter
-- GROUP BY s.Name, s.SSN, q.Quarter;

-- q9
-- SELECT s.Name, s.SSN
-- FROM Student s
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM Enrollment e1 JOIN Enrollment e2 ON e1.SSN = e2.SSN AND e1.CourseNumber = e2.CourseNumber AND e1.Quarter <> e2.Quarter
--     WHERE e1.SSN = s.SSN
-- );

-- q10
-- SELECT s.Name, s.SSN, COUNT(DISTINCT e.CourseNumber) AS NumTakenCourses, COUNT(DISTINCT CASE WHEN e.Grade IS NOT NULL THEN e.CourseNumber END) AS NumCompletedCourses
-- FROM Student s
-- LEFT JOIN Enrollment e ON s.SSN = e.SSN
-- GROUP BY s.Name, s.SSN;

-- q11  NOT WORKING
-- SELECT c1.CourseNumber, c1.Title, c2.CourseNumber, c2.Title
-- FROM Course c1, Course c2
-- WHERE c1.PrerequisiteCourseNumber = c2.PrerequisiteCourseNumber 
-- AND c1.CourseNumber <> c2.CourseNumber;

-- q12
-- SELECT s.Name, s.SSN
-- FROM Student s
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM Enrollment e
--     WHERE e.SSN = s.SSN AND (e.Grade IS NULL OR e.Grade <> 'A')
-- ) AND NOT EXISTS (
--     SELECT *
--     FROM Enrollment e
--     WHERE e.SSN = s.SSN AND e.Grade IS NULL
-- );


-- q13
-- SELECT s.Name, s.SSN
-- FROM Student s
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM Enrollment e
--     WHERE e.SSN = s.SSN AND e.Grade = 'A'
-- );


-- q14
-- SELECT s.Name, s.Major
-- FROM Student s
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM Enrollment e JOIN Section sec ON e.CourseNumber = sec.CourseNumber AND e.Quarter = sec.Quarter
--     WHERE e.SSN = s.SSN AND (sec.DayTime NOT LIKE 'M%' OR sec.DayTime NOT LIKE 'W%') AND CAST(SUBSTRING_INDEX(sec.DayTime, '-', -1) AS UNSIGNED) < 12
-- ) AND EXISTS (
--     SELECT *
--     FROM Enrollment e JOIN Section sec ON e.CourseNumber = sec.CourseNumber AND e.Quarter = sec.Quarter
--     WHERE e.SSN = s.SSN AND (sec.DayTime LIKE 'M%' OR sec.DayTime LIKE 'W%') AND CAST(SUBSTRING_INDEX(sec.DayTime, '-', -1) AS UNSIGNED) >= 12
-- );


-- q15 NOT WORKING
-- SELECT s.Name, s.Major
-- FROM Student s
-- WHERE NOT EXISTS (
--     SELECT c.CourseNumber
--     FROM Course c
--     WHERE c.DayTime LIKE 'MW %'
--         AND c.DayTime NOT LIKE '%AM'
--         AND NOT EXISTS (
--             SELECT e.CourseNumber
--             FROM Enrollment e
--             WHERE e.SSN = s.SSN AND e.CourseNumber = c.CourseNumber
--         )
-- )


-- q16 not working
-- SELECT s.Name, s.Major
-- FROM Student s
-- WHERE NOT EXISTS (
--     SELECT c.CourseNumber
--     FROM Course c
--     WHERE c.DayTime LIKE 'MW %'
--         AND c.DayTime NOT LIKE '%AM'
--         AND EXISTS (
--             SELECT e.CourseNumber
--             FROM Enrollment e
--             WHERE e.SSN = s.SSN AND e.CourseNumber = c.CourseNumber
--         )
-- )

-- q17
-- SELECT e.CourseNumber, e.Quarter
-- FROM Enrollment e
-- GROUP BY e.CourseNumber, e.Quarter
-- HAVING COUNT(*) = (
--     SELECT MAX(cnt)
--     FROM (
--         SELECT COUNT(*) as cnt
--         FROM Enrollment
--         GROUP BY CourseNumber, Quarter
--     ) as t
-- )

-- q18
-- SELECT c.CourseNumber, c.CourseTitle
-- FROM Course c
-- WHERE c.CourseNumber IN (
--     SELECT e.CourseNumber
--     FROM Enrollment e
--     GROUP BY e.CourseNumber
--     HAVING COUNT(*) = (
--         SELECT MAX(cnt)
--         FROM (
--             SELECT COUNT(*) as cnt
--             FROM Enrollment
--             GROUP BY CourseNumber
--         ) as t
--     )
-- )

-- q19
-- SELECT s.Name, s.Major, SUM(c.NumberUnits) as TotalUnits 
-- FROM Student s 
-- JOIN Enrollment e ON s.SSN = e.SSN 
-- JOIN Course c ON e.CourseNumber = c.CourseNumber 
-- WHERE e.Grade IS NOT NULL 
-- GROUP BY s.SSN 
-- ORDER BY TotalUnits DESC 
-- LIMIT 1;

-- q20
-- SELECT c1.CourseTitle, c1.CourseNumber, COUNT(c2.CourseNumber) as NumCourses 
-- FROM Course c1 
-- JOIN Course c2 ON c1.CourseNumber = c2.PrerequisiteCourseNumber 
-- GROUP BY c1.CourseNumber 
-- ORDER BY NumCourses DESC 
-- LIMIT 1;







# 4350-Lab2
SQL Lab
Questions to be answered 

Given the following relational database schema:
Student = (SSN, Name, Major)
Course = ( CourseNumber, PrerequisiteCourseNumber, Course Title, NumberUnits)
Section = ( CourseNumber, Quarter, RoomNumber, DayTime), where DayTime is of the
form MW 1:0-2:00PM.
Enrollment = (SSN,CourseNumber, Quarter, Grade)// Grade is either Null or a letter
grade.
Express the following queries using appropriate SQL statements with a minimum number
of operations:
1. List the name, SSN and the number of courses the student has taken (courses
with the same CourseNumber taken in different quarters are counted as different
courses).
2. Answer #1 assuming courses with the same CourseNumber taken in different
quarters are considered as one course.
3. List the name, SSN and number of courses the student has taken and completed
, i.e. received a letter grade (courses with the same CourseNumber taken in
different quarters are counted as different courses).
4. List the name, SSN and number of courses the student has taken and completed
with a letter grade C or better (courses with the same CourseNumber taken in
different quarters are counted as different courses).
5. List the Course Title and CourseNumber which does not have any prerequisite.
6. List the name of every student and SSN who earned an A in all courses he or she
has completed, i.e. every grade is either Null or an A)
7. List the name of every student, SSN and the CourseNumber who has taken the
course at least three times.
8. List the name of every student, SSN, every quarter, and the number of courses he
or she has taken in the listed quarter.
9. List the name of every student and SSN who has not taken any course more than
once.
10. List the name, SSN , the number of courses the student has taken, and the number
of courses completed(courses with the same CourseNumber taken in different
quarters are counted as different courses).
11. List every two CourseNumber and their titles which have the same prerequisites.
12. List the name of every student and SSN who has completed all the courses he/she
has taken and earned an A in each course, i.e. every grade is an A and no NULL
value
13. List the name of every student and SSN who earned no A in any course.
14. List the name and major of every student who has only taken courses that meet
MW afternoon (12 or after).
15. List the name and major of every student who has taken all the courses that meet
MW afternoon.
16. List the name and major of every student who has not taken any course that meets
MW afternoon.
17. List every CoursaeNumber and Quarter which has the highest enrollment.
18. List every CourseNumber and CourseTitle which has the highest enrollment
based on all quarters.
19. List the name and major of every student who has completed the highest number
of units.
20. List every Course tile which is a prerequisite for the largest number of courses.

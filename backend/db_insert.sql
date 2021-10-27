delete from Cycle_student;
delete from Cycle;
delete from Attendance;
delete from Schedule;
delete from Cycle_type;
delete from Student;

INSERT INTO Schedule(id, name) VALUES (1, 'Sabados 13:00-19:15');
INSERT INTO Schedule(id, name) VALUES (2, 'Regular 7:15-8:45');
INSERT INTO Schedule(id, name) VALUES (3, 'Regular 9:00-10:30');
INSERT INTO Schedule(id, name) VALUES (4, 'Regular 10:45-12:15');
INSERT INTO Schedule(id, name) VALUES (5, 'Regular 12:30-14:00');
INSERT INTO Schedule(id, name) VALUES (6, 'Regular 14:15-15:45');

INSERT INTO Cycle_type(id, name) VALUES (1, 'A0.01');
INSERT INTO Cycle_type(id, name) VALUES (2, 'A0.02');
INSERT INTO Cycle_type(id, name) VALUES (3, 'A0.03');
INSERT INTO Cycle_type(id, name) VALUES (4, 'A0.04');
INSERT INTO Cycle_type(id, name) VALUES (5, 'A0.05');
INSERT INTO Cycle_type(id, name) VALUES (6, 'A1.06');
INSERT INTO Cycle_type(id, name) VALUES (7, 'A1.07');
INSERT INTO Cycle_type(id, name) VALUES (8, 'A1.08');
INSERT INTO Cycle_type(id, name) VALUES (9, 'A1.09');
INSERT INTO Cycle_type(id, name) VALUES (10, 'A2.10');
INSERT INTO Cycle_type(id, name) VALUES (11, 'A2.11');
INSERT INTO Cycle_type(id, name) VALUES (12, 'A2.12');
INSERT INTO Cycle_type(id, name) VALUES (13, 'A2.13');
INSERT INTO Cycle_type(id, name) VALUES (14, 'A2.14');
INSERT INTO Cycle_type(id, name) VALUES (15, 'B1.01');
INSERT INTO Cycle_type(id, name) VALUES (16, 'B1.02');
INSERT INTO Cycle_type(id, name) VALUES (17, 'B1.03');
INSERT INTO Cycle_type(id, name) VALUES (18, 'B1.04');
INSERT INTO Cycle_type(id, name) VALUES (19, 'B1.05');
INSERT INTO Cycle_type(id, name) VALUES (20, 'B2.06');
INSERT INTO Cycle_type(id, name) VALUES (21, 'B2.07');
INSERT INTO Cycle_type(id, name) VALUES (22, 'B2.08');
INSERT INTO Cycle_type(id, name) VALUES (23, 'B2.09');
INSERT INTO Cycle_type(id, name) VALUES (24, 'B2.10');

INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (1, 'Enero', 1, 1, 0, '2021-01-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (2, 'Febrero', 2, 2, 0, '2021-02-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (3, 'Marzo', 3, 3, 0, '2021-02-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (4, 'Abril', 2, 4, 0, '2021-04-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (5, 'Mayo', 3, 5, 0, '2021-05-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (6, 'Octubre', 6, 6, 1, '2021-10-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (7, 'Octubre', 4, 7, 1, '2021-10-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (8, 'Octubre', 5, 8, 1, '2021-10-02');
INSERT INTO Cycle(id, name, id_schedule, id_type, active, date) VALUES (9, 'Junio', 5, 8, 0, '2021-10-02');


INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (1, 'Ronny', 'Coleman', '01245', '2000-01-01', 'Student');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (2, 'Buky', 'Garay', '01245', '2000-01-01', 'Ing.');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (3, 'Walter', 'Mamani', '01245', '2000-01-01', 'PhD');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (4, 'Vico', 'Mamani', '01246', '2000-01-01', 'PhD');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (5, 'Miguel', 'Mamani', '01247', '2000-01-01', 'PhD');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (6, 'Carlos', 'Machego', '01248', '2000-01-01', 'Student');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (7, 'Tonny', 'Blades', '01249', '2000-01-01', 'Ing.');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (8, 'Aldo', 'Mamani', '01250', '2000-01-01', 'PhD');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (9, 'Freddy', 'Mercuri', '01251', '2000-01-01', 'PhD');
INSERT INTO Student(id, first_name, last_name, code, dob, ocupation) 
VALUES (10, 'Miguel', 'Quispe', '01252', '2000-01-01', 'PhD');

INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (1, 7, 1, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (2, 7, 2, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (3, 7, 3, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (4, 7, 4, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (5, 7, 5, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (6, 7, 6, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (7, 7, 7, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (8, 7, 8, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (9, 7, 9, 1);
INSERT INTO Cycle_student(id, id_cycle, id_student, current) VALUES (10, 7, 10, 1);



INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 1, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 1, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 1, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 1, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 1, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 1, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 2, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 2, 0);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 2, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 2, 0);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 2, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 2, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 3, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 3, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 3, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 3, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 3, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 3, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 4, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 4, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 4, 0);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 4, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 4, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 4, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 5, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 5, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 5, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 5, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 5, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 5, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 6, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 6, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 6, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 6, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 6, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 6, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 7, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 7, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 7, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 7, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 7, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 7, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 8, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 8, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 8, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 8, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 8, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 8, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 9, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 9, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 9, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 9, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 9, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 9, 1);

INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-25', 10, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-26', 10, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-27', 10, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-28', 10, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-29', 10, 1);
INSERT INTO Attendance(date_a, id_student, attend) VALUES ('2021-10-30', 10, 1);
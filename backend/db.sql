CREATE TABLE `Student` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `dni` varchar(255),
  `code` varchar(255),
  `dob` date,
  `cell_phone` varchar(255),
  `ocupation` varchar(255)
);

CREATE TABLE `Schedule` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)  
);


CREATE TABLE `Cycle_type` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Cycle` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `schedule` varchar(255),
  `active` int,
  `date` date,
  `id_schedule` int,
  `id_type` int
);

CREATE TABLE `Cycle_student` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_student` int,
  `id_cycle` int,
  `current` int
);

CREATE TABLE `Teacher` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `dni` varchar(255)
);

CREATE TABLE `Cycle_teacher` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_cycle` int,
  `id_teacher` int,
  `current` int
);

CREATE TABLE `Attendance` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `date_a` date,
  `id_student` int,
  `attend` int
);

CREATE TABLE `Participation` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `date_p` date,
  `id_student` int,
  `points` int
);

CREATE TABLE `Homework_type` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(255)
);

CREATE TABLE `Homework` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(255),
  `skill` varchar(255),
  `date_h` date,
  `unit` varchar(255),
  `id_type` int,
  `has_rubric` int
);

CREATE TABLE `Homework_student` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_student` int,
  `id_homework` int,
  `grade` int
);

CREATE TABLE `Rubric` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `description` varchar(255)
);

CREATE TABLE `Homework_rubric` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_rubric` int,
  `id_homework` int,
  `point` int
);

ALTER TABLE `Cycle_student` ADD FOREIGN KEY (`id_student`) REFERENCES `Student` (`id`);

ALTER TABLE `Cycle_student` ADD FOREIGN KEY (`id_cycle`) REFERENCES `Cycle` (`id`);

ALTER TABLE `Cycle_teacher` ADD FOREIGN KEY (`id_teacher`) REFERENCES `Teacher` (`id`);

ALTER TABLE `Cycle_teacher` ADD FOREIGN KEY (`id_cycle`) REFERENCES `Cycle` (`id`);

ALTER TABLE `Attendance` ADD FOREIGN KEY (`id_student`) REFERENCES `Student` (`id`);

ALTER TABLE `Participation` ADD FOREIGN KEY (`id_student`) REFERENCES `Student` (`id`);

ALTER TABLE `Homework` ADD FOREIGN KEY (`id_type`) REFERENCES `Homework_type` (`id`);

ALTER TABLE `Homework_student` ADD FOREIGN KEY (`id_student`) REFERENCES `Student` (`id`);

ALTER TABLE `Homework_student` ADD FOREIGN KEY (`id_homework`) REFERENCES `Homework` (`id`);

ALTER TABLE `Homework_rubric` ADD FOREIGN KEY (`id_rubric`) REFERENCES `Rubric` (`id`);

ALTER TABLE `Homework_rubric` ADD FOREIGN KEY (`id_homework`) REFERENCES `Homework` (`id`);

ALTER TABLE `Cycle` ADD FOREIGN KEY (`id_schedule`) REFERENCES `Schedule` (`id`);
ALTER TABLE `Cycle` ADD FOREIGN KEY (`id_type`) REFERENCES `Cycle_type` (`id`);
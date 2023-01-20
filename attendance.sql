drop database attendance;
create database attendance;
use attendance;
CREATE TABLE `teacher` (
  `teacher_name` varchar(50) NOT NULL,
  `teacher_id` varchar(20) NOT NULL,
  `teacher_password` varchar(30) NOT NULL,
  PRIMARY KEY (`teacher_id`)
);

CREATE TABLE `subject` (
  `subject_name` varchar(50) NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  PRIMARY KEY (`subject_id`)
);

CREATE TABLE `section` (
  `section_name` varchar(50) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  PRIMARY KEY (`section_id`)
);

CREATE TABLE `student` (
  `student_name` varchar(50) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`,`section_id`),
  FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) on update cascade on delete cascade
);

CREATE TABLE `coordinator` (
  `teacher_id` varchar(20) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  PRIMARY KEY (`section_id`),
  FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) on update cascade on delete cascade,
  FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) on update cascade on delete cascade
);

CREATE TABLE `teacher_section_subject` (
  `teacher_id` varchar(20) NOT NULL,
  `section_id` varchar(20) NOT NULL,
  `subject_id` varchar(20) NOT NULL,
  PRIMARY KEY (`teacher_id`,`section_id`,`subject_id`),
  FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) on update cascade on delete cascade,
  FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) on update cascade on delete cascade,
  FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) on update cascade on delete cascade 
);

CREATE TABLE `mark` (
  `teacher_id` varchar(20) not NULL,
  `section_id` varchar(20) not NULL,
  `subject_id` varchar(20) not NULL,
  `student_id` varchar(20) not NULL,
  `attendance` varchar(10) NOT NULL,
  `date_of_attendance` date NOT NULL,
  FOREIGN KEY (`teacher_id`, `section_id`, `subject_id`) REFERENCES `teacher_section_subject` (`teacher_id`, `section_id`, `subject_id`) on update cascade on delete cascade,
  FOREIGN KEY (`student_id`, `section_id`) REFERENCES `student` (`student_id`, `section_id`) on update cascade on delete cascade
);

-- INSERT INTO `teacher` VALUES ('divya kumawat','t1','*'),('swati ','t2','*'),('poorva','t3','*'),('sonal','t4','*');
-- INSERT INTO `subject` VALUES ('computer network','cn'),('civil','cv'),('database','db'),('machine learning','ml'),('xml','xml');
-- INSERT INTO `section` VALUES ('computer','csa'),('computer','csb'),('civil','cva'),('civil','cvb'),('mechanical','mca'),('mechanical','mcb');
-- INSERT INTO `student` VALUES ('student0','200','csa'),('student1','201','csa'),('student2','202','csa'),('student3','203','csa'),('student4','204','csa'),('student5','205','csa'),('student6','206','csa'),('student7','207','csa'),('student8','208','csa'),('student9','209','csa'),('student10','210','csa'),('student11','211','csa'),('student12','212','csa');
-- INSERT INTO `teacher_section_subject` VALUES ('t1','csa','cn'),('t2','csa','cv'),('t3','csb','db'),('t4','csb','ml'),('t1','cva','xml'),('t2','cva','cn'),('t3','cvb','cv'),('t4','cvb','db'),('t1','mca','ml'),('t2','mca','xml'),('t1','mcb','cv'),('t3','mcb','cn'),('t4','mcb','cv');
-- INSERT INTO `mark` VALUES ('t1','csa','cn','90','p','2021-04-16');

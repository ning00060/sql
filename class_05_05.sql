CREATE DATABASE mydb2;
use mydb2;

create table tb_student(
	student_id int auto_increment primary key,
    student_name varchar(100) not null
);

create table tb_class(
	class_id int auto_increment,
    class_name varchar(100) not null,
    teacher varchar(20) not null,
    primary key(class_id)
);

-- 학생과 수업 테이블 N:M 관계가 형성 된다.
-- 중간 테이블 설계 ( 수강등록 테이블)

create table tb_registration(
	student_id int ,
    class_id int,
    registration_date date,
    
    primary key(student_id,class_id),
    foreign key(student_id) references tb_student(student_id),
    foreign key(class_id) references tb_class(class_id)
);

desc tb_registration;

insert into tb_student(student_name)values
('이순신'),('강감찬'),('홍길동');

select *
from tb_student;

insert into tb_class(class_name,teacher)values
('국어','이상혁'),('수학','정지훈'),('영어','허수');

select *
from tb_class;

insert into tb_registration(student_id,class_id,registration_date)values
(1,1,'2024-04-03'),(2,2,'2024-05-03'),(3,3,'2024-06-03');

desc tb_registration;
select *
from tb_registration;
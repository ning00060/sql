CREATE database mydb;

use mydb;

-- 테이블 생성
create table student(
	student_id int,
    name varchar(50) not null,
    grade int not null,
    major varchar(5) not null
);
select * from student;

desc student;

-- 과목 테이블 생성
create table subject(
	subject_id int,
    subject_name varchar(50) not null,
    credit int not null,
    department varchar(5),
    professor char(50) not null
    );
    
select * from subject;

-- 이미 생성된 테이블에 기본키를 추가하는 방법
alter table student add primary key(student_id);

desc student;

-- 사전 기반 지식( 데이터가 들어가 있는 상태에서 빈 값이 포함 되어 있다면
-- 기본키를 추가할 수 없다. 즉 ,NULL 값이 있어서는 안됨.

alter table subject add primary key(subject_id);
desc subject;

-- 주문
-- order
-- row --> id: pk
-- 고객 주문 내용 - 문자
-- 상품 이름
-- 상품 가격
-- 수량

-- 예약어는 기본적으로 테이블 이름을 선점할 수 없다.
-- 하지만 강제적으로 `` 작은 따옴표를 사용해서 테이블 이름이라고 명시 할 수 있다.
create table `order`(
	id int primary key,
    customer_order varchar(50),
    product_name varchar(20) not null,
    quantity int not null,
    order_date date not null
);

insert into `order` values(1,'빠른배송','신라면',2,'2024-05-30');
insert into `order` values(2,'느린배송','신라면',3,'20240530');

-- 오류 발생되는 상황 보기
insert into `order` values(3,'아주느린배송','신라면',4,'2024530');

-- 1년은 12개월-> 13불가능
insert into `order` values(4,'너무느린배송','신라면',4,'20241330');

-- 도전 과제 : 위 형식에 맞는 insert 를 진행 하세요
desc `order`;

insert into `order`(id,price,customer_order,product_name,quantity,order_date) values(15,20000,"ㅇㄴㅇㄴ","양념",5,20240530);
select * from `order`;

/*
employee 테이블을 생성하며, id, name, age, department 네 개의 열(column)을 포함.
name 는 null 값이 들어갈 수 없습니다. 
id 열은 기본키(Primary Key)로 설정. 
데이터 타입은 직접 결정하세요.
*/
create table employee(
	id int primary key,
	name varchar(20) not null,
	age int , 
    department varchar(50) 
    );

/*
<aside>
**customer 테이블 생성**
  1. id, name, email, address 네 개의 열을 포함
    - name, address 는 null 값이 있으면 안됨. 
  2. id 열은 기본키(Primary Key)로 설정
  3. 데이터 타입은 직접 선정
</aside>
*/
create table customer(
id int primary key,
name varchar(20) not null,
email varchar(50),
address varchar(5) not null
);
select * 
from employee,customer;

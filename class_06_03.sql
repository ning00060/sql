
-- 테이블 복사 (구조만 복사)
create table dept_emp_copy
as select * from dept_emp
where 1=0;

select * from dept_emp_copy;
desc dept_emp_copy;

create table employees_copy
as select * from employees;

select * from employees_copy;
----------
select * from dept_emp_copy;
delete from dept_emp_copy;
insert into dept_emp_copy(emp_no,dept_no,from_date,to_date)
select emp_no,dept_no,from_date,to_date
	from dept_emp
    where emp_no>20001;
    insert into dept_emp_copy(dept_name)
select dept_name from departments;
    
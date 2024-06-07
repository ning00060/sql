use employees;

-- emplyess 
-- 의미 있는 결과 집합을 만들자 (크로스 조인 사용 x)
-- 단, INNER JOIN, LEFT JOIN , RIGHT JOIN 사용해 쿼리문 만들기

select *
from employees;
desc employees;

select *
from dept_emp;

desc  departments;
desc dept_emp;
desc dept_manager;

-- dept_emp 와 employees 테이블 에 모든 데이터를 조회하는데 emp_no를 기준으로 조인시키시오
-- 단(employees의 birth_date가 '05'를 포함하고,성별은 '남성'이며 ,emp_no는 2만 이상일경우)
select *
from dept_emp as d
join employees as e
on d.emp_no=e.emp_no
where e.birth_date like '%05%' and e.gender='M';

-- dept_manager 테이블의 from_date,to_date가 1990년대 의 모든데이터 조회.
select *
from dept_manager
where from_date like '199%' and to_date like '199%';

-- titles, salaries 테이블에 대하여 from_date를 기준으로 조인해서 titles의 데이터만 조회.
select t.*
from titles as t
join salaries as s
on t.from_date=s.from_date;


select t.emp_no,t.title as tt,tt='Senior Engineer'count
from titles as t
join salaries as s
on t.from_date=s.from_date;

/*
문제 1 - 사원 이름과 부서 이름, 부서 번호 출력
문제 2 - 부서 번호과 부서 이름, 매니저 넘버를 출력
문제 3 - 직원 넘버와 이름을 출력
*/
select *
from employees;
select *
from dept_emp;
select *
from departments;

select dept_name,last_name,dept_no
from employees
join dept_emp join departments on dept_emp.dept_no=departments.dept_no
on employees.emp_no=dept_emp.emp_no;
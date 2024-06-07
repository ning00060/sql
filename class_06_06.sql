
select * from dept_emp;

select * ,count(emp_no) as '부서별 직원수'
from dept_emp
group by dept_no;

select * from employees;

-- First_name 에 끝 3글자 까지만 결과집으로 출력하세요
-- GPT 물어 금지 ,구글링 해결
select substring(name,2,2) as '이름' from employee;
select substring(first_name,4,3),first_name as '이름' from employees;
select right(upper(first_name),3) as '이름' from employees;

-- 문제1. salaries테이블의 salary(연봉)을 월급으로 나누고(환율1365)
-- dept_name, dept_no, emp_no, from_date,to_date 조회하시오(조인필요)
-- 단 (from,to _date)는 salary의 테이블, 월급은 100,000,0 이상부터 나머지는 테이블 관계 X
select s.emp_no,substring((s.salary/12*1365),1,10) as '월급(년)',
		de.dept_no,de.dept_name,s.from_date,s.to_date
from salaries as s
left join dept_emp as e
on s.emp_no=e.emp_no
left join departments as de
on e.dept_no=de.dept_no
where substring((s.salary/12*1365),1,10)>1000000;



-- 퇴직자
select s.emp_no,sum(s.salary)*1365 as '임금총액' , case when year(e.from_date)>1970 then (year(e.to_date)-year(e.from_date)+1) else null end as '근속년수',e.from_date,e.to_date
from salaries as s
left join dept_emp as e
on s.emp_no=e.emp_no
inner join departments as de
on e.dept_no=de.dept_no
where (case when year(e.to_date)<8070 
	then (year(e.to_date)-year(e.from_date)) else null end )is not null
group by s.emp_no;

select *
from salaries;

select s.*, case when year(e.from_date)>1970 then (year(e.to_date)-year(e.from_date)+1) else null end as '근속년수'
from salaries as s
left outer join dept_emp as e
on s.emp_no=e.emp_no
left outer join departments as de
on e.dept_no=de.dept_no
where (case when year(e.from_date)>1970 
	then (year(e.to_date)-year(e.from_date)) else null end )is not null;
    
    
    
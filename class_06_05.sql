-- 집계 함수 문제
-- 문제 1 : 모든직원에 평균 급여를 계산하세요

-- 단! 주의!! avg() 평균 합계와 다른컬럼을 적는다면 관계가 없는
-- 데이터 결과 집합이다
select avg(salary) from employee;
select avg(salary),name,id from employee;


select * from employee;

-- 각 부셔별로 직원 수를 세고, 부서별 급여의 합을 계산하세요
-- 부서별, 부서별직원수, 부서별급여의 합계 금액
-- 그룹화 시켜야 한다.
select department, count(*) as '직원수',sum(salary) as'급여'
from  employee
group by department;

-- 문자열 함수 문제
-- 문제3 : 모든지구언에 이름을 대문자로 변환하고 ,이름 앞에 'Mr/Ms' 를 추가하세요.

select concat('Mr/Ms',upper(name)) as '이름' 
from employee;

-- 문제 4: 직원 이름에서 첫 2글자만 추출 하세요
select substring(name,1,2) as '이름' from employee;

-- 문제 5: 직원 이름에서 끝 2글자만 추출 하세요
select substring(name,2,2) as '이름' from employee;
select right(upper(name),2) as '이름' from employee;

-- 논리  및 조건 함수 문제
-- 문제 5: 각 직원에 대한 급여가 3백만원 이상이면 'High','Low' 라고 표시
-- 'High', 'Low' 라고 표시하세요
select name, salary,
 case when salary>=3000000 then 'High' else 'Low' end as '평가'
 from employee;
 
 -- 날짜 및 시간 함수 문제
 -- 문제 6 : 오늘 날짜를 반환 하세요.
 
 select current_date() as today;
 select '안녕반가워' as a;
 
 -- 문제 7 : 각 직원이 고용된 날로부터 몇 년이 지났는지 계산하세요
 select * from employee;
 select name,hire_date,
 (year(current_date()) -year(hire_date) ) +1 as '년차'
 from employee;
 
 -- 문제 8 : 각 직원의 고용 월을 반환 하세요.
 select name, extract(month from hire_date) as hire_month
 from employee;
 
 -- 문제 9 :각 직원에 급여를 문자열 형태로 표시하세요
 select name,cast(salary as char) as salary_text
 from employee;
 
 -- 문제 10 : 문자열로 저장된 날짜 '2024-06-07'를 
 -- date 타입으로 변환 하세요
 select cast('2025-06-07' as DATE) as date;
 
 select * from employees;
 
-- 문제 1 매니저들의 최고 급여를 추출하세요.
 select max(s.salary),m.emp_no,d.dept_name
 from dept_manager as m
 join salaries  as s
 on m.emp_no=s.emp_no
 join  departments as d
 on m.dept_no=d.dept_no
 where d.dept_no='d006';

-- 문제 2 퇴사자와 재직자를 구분 하며 퇴사자의 경우 재지년수를 출력하세요(출력예시 = first_name, last_name, 근무상태(재직중 or 퇴사자경우 근무연수))
select e.first_name,e.last_name,case when year(d.to_date)>9000 then '재직중' else year(d.to_date)-year(d.from_date)+1 end as'근무상태'
from dept_emp as d
join employees as e
on d.emp_no=e.emp_no;


select *
from departments;



-- 강인한 2조
-- 문제 1 : 직원의 이름, 근무연수, 부서를 출력하시오.
-- 단 , 직원의 이름은 퍼스트네임, 라스트네임을 합쳐쳐서 표에 나타내고 근무연수는 35년 이상 직원의 직원들만 포함시키시오. 
-- 문제 2 부서 이름과 그 부서에 현재근무하는 직원에 정보를 출력 하세요 
select e.first_name,e.last_name,d.dept_name,year(de.to_date)-year(de.from_date),concat(e.first_name,concat('+',e.last_name)) as name
from dept_emp as de
join employees as e
on de.emp_no=e.emp_no
join departments as d
on de.dept_no=d.dept_no
where year(de.to_date)-year(de.from_date)>=35;

select d.dept_name,e.*,de.to_date
from dept_emp as de
join employees as e
on de.emp_no=e.emp_no
join departments as d
on de.dept_no=d.dept_no;


-- 4조
-- 1. 회사 CEO가 근속 20년이 넘은 직원들을 대상으로 14일의 안식 휴가와 감사패를 
--    지급하기로 결정했습니다. 해당하는 직원들의 근속 년수와 풀네임을(한 컬럼) 출력하시오.
-- 2. 재직 중인 사람의 이름과 년차수를 출력 하세요

select case when year(de.to_date)>=9000 then 
	concat(year(de.to_date)-year(de.from_date) ,concat(",",e.first_name ,concat('+',e.last_name))) end   as '한컬럼'
from dept_emp as de
join employees as e
on de.emp_no=e.emp_no
join departments as d
on de.dept_no=d.dept_no
where year(de.to_date)-year(de.from_date)>=20;


-- 문제 1  first_name의 두 번째 알파벳이 a인 직원의 평균연봉을 구하세요.

-- 표시 예시(title, '직원수' ,avg)

select avg(s.salary)
from dept_emp as de
join employees as e
on de.emp_no=e.emp_no
join salaries as s
on e.emp_no=s.emp_no
where e.first_name like '_a%';

-- 문제 2 각 부서별 직원의 수와 평균 연봉을 구하세요.
-- 중복값이 나올가능성은?
select d.dept_name,count(s.emp_no),avg(s.salary)
from dept_emp as de
join salaries as s
on de.emp_no=s.emp_no
join departments as d
on de.dept_no=d.dept_no
group by d.dept_name ;

select *
from salaries;

-- 1. 마케팅부 30년차 근로자들 중 연봉이 80000 이상이면 O 아니면 X로 표기하세요.
--    이름(first_name + last_name), 년차, 연봉, 체크(O,X) 로 표시
-- 2. 현재 근무중인 근로자들의 직급(title)별 평균연봉을 나타내세요
--    직급, 평균연봉(소수점 제외) 로 표시


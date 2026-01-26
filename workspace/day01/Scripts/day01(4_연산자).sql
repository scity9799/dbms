--4번 : 연산자

-- 피연산자 자리에 어떤 타입의 값이 오는지
-- 연산자가 어떻게 동작하는지
-- 연산의 결과가 어떤 타입의 값인지

-- 오라클 자료형 : 문자형(CHAR, VARCHAR2), 숫자형(NUMBER), 날짜(DATE, TIMESTAMP)

-- (1) 연결연산자
-- a || b : a와 b를 연결해준다

SELECT 10, 20, 10 || 20
FROM dual;

SELECT 'a', 'b', 'a' || 'b'
FROM dual;

--employees 테이블에서 이름과 성을 연결해서 이름이라는 별칭으로 조회
SELECT first_name 이름, last_name 성, first_name || ' ' || last_name 풀네임
FROM employees;

-- employees 테이블에서 날짜타입의 값 확인
SELECT * FROM employees;
SELECT hire_date, hire_date || ' 안녕'
FROM employees;

-- [실습] 사원의 이름과 메일 주소를 출력하기
-- 이 때 사원의 이름과 성이 띄어쓰기로 이어져 이름이라는 컬럼명으로 있고
-- 메일 주소는 사원메일주소@korea.com으로 메일 주소 라는 컬럼명이 있다
SELECT first_name || ' ' || last_name 이름, email || '@korea.com' "메일 주소"
--2) first_name과 last_name을 연결해서 이름이라는 별칭, email에 korea.com 연결해서 조회하겠다
FROM employees; --1) employees 테이블에서

-- (2) 산술연산자
-- 숫자와 숫자
SELECT employee_id, employee_id + 10, employee_id -10, employee_id * 10, employee_id / 10 
FROM employees;

-- 날짜와 숫자 => 날짜타입(~일 후, ~일 전으로 나온다)
SELECT hire_date, hire_date + 10, hire_date - 10-- hire_date * 10, hire_date / 10
FROM employees;

-- 날짜와 날짜 => 숫자타입(며칠이 지났는지 결과로 나온다)
SELECT hire_date, sysdate, sysdate - hire_date
from employees;

-- 날짜 + 날짜 오류발생
-- 날짜와 숫자의 연산에서 기본적으로 숫자는 일 수를 의미하기 때문에 시간, 분 단위로 연산하고 싶다면
-- 일(24h)로 환산해야한다
SELECT sysdate, sysdate + 0.5, sysdate - 0.5
FROM dual;
--1시간 	1/24
--12시간 	12/24
--30분		30/60/24

--현재시간, 12시간 전, 12시간 후, 1시간 후, 30분 후
SELECT sysdate 현재시간, sysdate - 0.5 "12시간 전", sysdate + 0.5 "12시간 후", sysdate + 1/24 "1시간 후", sysdate + 30/60/24 "30분 후"
FROM dual;
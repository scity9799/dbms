1-- 1번 : 주석과 employees 테이블

-- 한줄 주석 : 컴퓨터가 해석하지 않는다
-- 실행시키지 않고 설명을 작성할 때 사용한다

/* employees 테이블
 * 107개의 행과 11개의 컬럼으로 이루어져있다
 * 107명의 직원 데이터를 저장해 놓은 연습용 테이블
 * 
 * 11개의 컬럼
 * EMPLOYEE_ID	직원ID
 * FIRST_NAME	이름
 * LAST_NAME	성
 * EMAIL		이메일
 * PHONE_NUMBER	전화번호
 * HIRE_DATE	입사일
 * JOB_ID		직무ID
 * SALARY		급여
 * COMMISSION_PCT	커미션 비율
 * MENAGER_ID	상사직원의 ID
 * DEPARTMENT_ID	부서 ID
 */

-- SELECT 컬럼명 FROM 테이블명;
-- 해당 테이블에서 특정 컬럼을 선택해서 조회하겠다는 의미
-- 컬럼명 자리에 *를 쓰면 모든 컬럼을 의미
SELECT *		-- 2) 모든 컬럼을 조회하겠다
FROM EMPLOYEES; -- 1) EMPLOYEES 테이블에서

-- HR.테이블명을 작성하는 이유는 여러 계정의 같은 이름의 테이블이름이 존재할 수 있기 때문이다
-- 안써도 같은게 나오는 이유는 지금 로그인한 계정의 테이블의 우선순위가 높기 때문에 일반적으로 계정명은 생략이 가능하다
SELECT first_name FROM employees;
SELECT first_name FROM hr.employees;

-- 아래 2개의 결과는 다르다
-- SELECT 뒤에 작성된 컬럼명대로  Result 테이블에 표시된다
-- 컬럼 조회시 순서가 중요하다
SELECT first_name, last_name
FROM employees;

SELECT LAST_NAME, FIRST_NAME --2) LAST_NAME, FIRST_NAME 컬럼을 조회하겠다
FROM EMPLOYEES; --1) employees 테이블에서

-- 정렬해서 조회하기
/*
 * SELECT 컬럼명
 * FROM 테이블명
 * ORDER BY 컬럼명; [ASC or DESC]
 * ASC : 오름차순정렬(기본값)
 * DESC : 내림차순정렬
 */

-- EMPLOYEES 테이블에서 전체 회원을 조회하기
SELECT *
FROM EMPLOYEES;
-- employees 테이블에서 사원의 이름(first_name), 성(last_name), 급여(salary)를 급여 낮은 순서부터(오름차순) 조회하기
SELECT first_name, last_name, salary --2) first_name, last_name, salary 컬럼을 조회
FROM employees --1) employees 테이블에서
ORDER BY salary; --3) salary 컬름을 오름차순 정렬해서

-- ORDER BY에서 ASC나 DESC를 쓰지 않으면 기본 오름차순(ASC) 정렬
-- 오름차순 정렬 Ascending(ASC) : 앞글자 3글자만 따서 ASC로 사용
-- 내림차순 정렬 Descending(DESC) : 앞글자 4글자만 따서 DESC로 사용

-- 문자의 정렬(first_name) asc로 정렬 시
--		desc 정렬 시 z -> a 순서대로 정렬
SELECT first_name
FROM employees
ORDER BY first_name DESC;

-- 날짜의 정렬(hire_date)
-- ASC 정렬 시 예전 날짜부터 최신 날짜 순으로 정렬, DESC 정렬 시 최신 날짜부터 과거 날짜 순으로 정렬
SELECT  hire_date
FROM employees
ORDER BY hire_date ASC;

-- ORDER BY절의 컬럼명은 조회하는 컬럼명과 반드시 일치하지 않아도 가능하다
-- 단, 해당 테이블에 있는 컬럼이어야만 한다
SELECT EMPLOYEE_ID 	 --2) employees_id 컬럼을 조회
FROM EMPLOYEES 		 --1) employees 테이블에서
ORDER BY SALARY ASC; --3) salary 오름차순 정렬로

-- 2개의 정렬기준
-- 첫번째 작성한 컬럼의 값을 기준으로 잡아 정렬하고 해당 컬럼의 값이 동일하다면 2차적으로
-- 그 다음 컬럼값을 기준으로 정렬한다

-- employees 테이블에서 first_name, salary, job_id 컬럼 조회하는데
-- salary 기준으로 내림차순 정렬, first_name 기준 오름차순 정렬
SELECT first_name, salary, job_id
FROM employees
ORDER BY salary DESC, first_name ASC;
-- 0번 : review

-- SQL 연산자 / 조건절 연습문제
-- 테이블 : EMPLOYEES

-- 힌트 
-- 총 보상 : NVL, NVL2, COALESCE 함수 사용
-- 급여컬럼명 * 12 + (급여컬럼 * commission_pct * 12)

SELECT * FROM hr.employees;

-- 1번: 모든 직원의 이름(이름+성), 급여, 커미션, 커미션 포함 연봉을 총보상으로 출력 (NULL은 0 처리)
SELECT first_name || ' ' || last_name 직원이름, salary 급여, nvl(commission_pct, 0) 커미션, 
salary * 12 + (SALARY  * nvl(COMMISSION_PCT,0) *12) 총보상
FROM hr.employees;

-- 1번 nvl2 풀이
SELECT first_name || ' ' || last_name 직원이름, salary 급여, nvl(commission_pct, 0) 커미션, 
salary * 12 + salary * 12 * nvl2(commission_pct, commission_pct, 0) 총보상
FROM hr.employees;

-- 2번: 직원번호와 이메일을 연결해 직원번호_이메일로 출력 (직원번호, 이메일, 급여 조회)
SELECT employee_id 직원번호, employee_id || '_' || email 직원번호_이메일, salary 급여
FROM hr.employees;

-- 3번: 급여가 7000 초과인 직원의 직원번호, 이름, 급여, 입사일 조회
-- 조건 : 급여 > 7000
SELECT EMPLOYEE_ID 직원번호, first_name || ' ' || last_name 이름, salary 급여, hire_date 입사일
FROM hr.EMPLOYEES
WHERE salary > 7000;

-- 4번: 부서번호가 50번 또는 80번이 아닌 직원의 직원번호, 이름, 급여, 입사일 조회
-- 조건1 : 부서번호 != 50 and 부서번호 != 80
SELECT EMPLOYEE_id 직원번호, first_name || ' ' || last_name 이름, salary 급여, hire_date 입사일, DEPARTMENT_ID 
FROM hr.EMPLOYEES
WHERE NOT(DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 80);

-- 5번: 급여가 4000 이상 7500 이하인 직원의 직원번호, 이름, 급여, 입사일 조회
-- 조건: 급여 >= 4000 and 급여 <= 7500
SELECT EMPLOYEE_id 직원번호, first_name || ' ' || last_name 이름, salary 급여, hire_date 입사일
FROM hr.EMPLOYEES
WHERE SALARY >= 4000 AND SALARY <= 7500;

-- 6번: 직무ID가 IT_PROG, SA_REP, SA_MAN인 직원의 직원번호, 이름, 급여, 입사일, 직무ID 조회
-- 조건 : 직무id = IT_PROG, SA_REP, SA_MAN
SELECT EMPLOYEE_id 직원번호, first_name || ' ' || last_name 이름, salary 급여, hire_date 입사일, JOB_ID 직무ID
FROM hr.EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP', 'SA_MAN');

-- 7번: 커미션을 받는 직원(commission_pct NOT NULL)의 직원번호, 이름, 급여, 입사일 조회
-- 조건 : 커미션 IS NOT NULL
SELECT EMPLOYEE_id 직원번호, first_name || ' ' || last_name 이름, salary 급여, hire_date 입사일, COMMISSION_PCT 
FROM hr.EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 8번: 이름에 D와 e가 모두 포함된 직원의 이름, 급여 조회
-- 조건 : FIRST_NAME LIKE '%D%' AND FIRST_NAME LIKE '%e%''
SELECT EMPLOYEE_id 직원번호, first_name 이름, salary 급여
FROM hr.EMPLOYEES
WHERE first_name LIKE '%D%' AND FIRST_NAME LIKE '%e%';
--WHERE first_name LIKE '%D%e%'; 이것도 가능

-- 9번: 직무ID가 IT_PROG가 아닌 직원의 직원번호, 이름, 급여, 입사일 조회
-- 조건 : 직무ID != 'IT_PROG'
SELECT EMPLOYEE_id 직원번호, first_name || ' ' || last_name 이름, salary 급여, hire_date 입사일, JOB_ID 직무ID
FROM hr.EMPLOYEES
WHERE JOB_ID != 'IT_PROG';

-- 10번: 급여가 5000 이상인 직원의 모든 정보 조회
-- 조건 : 급여 >= 5000
SELECT * FROM hr.EMPLOYEES
WHERE SALARY >= 5000;

-- 11번: 부서번호가 30번인 직원의 이름과 입사일 조회
-- 조건 : 부서번호 = 30
SELECT FIRST_NAME 이름, HIRE_DATE 입사일
FROM hr.EMPLOYEES
WHERE DEPARTMENT_ID = 30;

-- 12번: 성이 Smith인 직원의 이름과 급여 조회
-- 조건 : LAST_NAME = Smith
SELECT first_name 이름, salary 급여
FROM hr.employees
WHERE last_name = 'Smith';

-- 13번: 급여가 3000 미만이거나 10000 이상인 직원의 이름과 급여 조회
-- 조건 : salary < 3000 or salary >= 10000
SELECT first_name 이름, salary 급여
FROM hr.employees
WHERE salary < 3000 or salary >= 10000;

-- 14번: 이름이 A로 시작하는 직원의 이름+성을 직원명, 이메일+koreait.com을 이메일로 출력
-- 조건 : first_name LIKE 'A%'
SELECT first_name || ' ' || last_name 직원명, EMAIL || '@koreait.com' 이메일
FROM hr.EMPLOYEES
WHERE first_name LIKE 'A%';

-- 15번: 성에 o 포함 + 이름 4글자인 직원의 이름, 성, 부서번호 조회
-- 조건 : LAST_NAME LIKE '%o%' and first_name like '____'
SELECT first_name 이름, last_name 성, department_id 부서번호
FROM hr.EMPLOYEES
WHERE LAST_NAME LIKE '%o%' and first_name like '____';

-- 16번: 이름이 J로 시작하고 성이 n으로 끝나는 직원의 이름, 성 조회
-- 조건 : FIRST_NAME LIKE 'J%' AND LAST_NAME LIKE '%n'
SELECT FIRST_NAME 이름, LAST_NAME 성
FROM hr.EMPLOYEES
WHERE FIRST_NAME LIKE 'J%' AND LAST_NAME LIKE '%n';


-- [실습]
--쇼핑몰 회원 테이블 TBL_SHOP_USER를 생성하려고 한다.
--
--회원번호(USER_ID)는 기본키이다.
--회원이름(USER_NAME)은 필수 입력이다.
--회원이메일(EMAIL)은 중복되면 안 된다.
--성별(GENDER)은 'M' 또는 'F'만 허용한다.
--상태(STATUS)는 'Y','N'만 가능하며 기본값은 'Y'이다.
--가입일(JOIN_DATE)은 기본값으로 현재 날짜를 저장한다.

-- 사용하는 제약조건 : PRIMARY KEY, NN, UK, CHK, DEFAULT

CREATE TABLE TBL_SHOP_USER(
	USER_ID NUMBER ,
	USER_NAME VARCHAR2(30) NOT NULL,
	EMAIL VARCHAR2(30) ,
	GENDER CHAR(1) ,
	STATUS CHAR(1) DEFAULT 'Y' ,
	JOIN_DATE DATE DEFAULT SYSDATE,
	CONSTRAINT PK_SHOP_USER PRIMARY KEY(USER_ID),
	CONSTRAINT UN_EMAIL UNIQUE(EMAIL),
	CONSTRAINT CHK_GENDER CHECK(GENDER IN ('M', 'F')),
	CONSTRAINT CHK_STATUS CHECK (STATUS IN ('Y', 'N'))
);

SELECT * FROM TBL_SHOP_USER;

-- 정상데이터
INSERT INTO tbl_shop_user
values(1, '홍길동', 'hong@test.com', 'M', 'Y', sysdate);

-- PK 중복
INSERT INTO	TBL_SHOP_USER
--VALUES(1,'김철수', 'su@test.com', 'M', 'Y', sysdate);
-- 이름 NULL
--VALUES(2, NULL, 'KKK@test.com', 'M', 'Y', SYSDATE);





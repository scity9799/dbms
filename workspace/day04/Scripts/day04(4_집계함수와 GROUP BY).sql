-- 4번 : 집계함수와 GROUP BY

-- 집계함수의 결과는 행이 1개(단일행)
-- 기본적으로 NULL은 포함시키지 않는다!!

-- COUNT()
SELECT * FROM HR.EMPLOYEES;

-- 전체 직원수 확인
SELECT COUNT(*) FROM HR.EMPLOYEES; -- 단일행

-- 특정 부서 110번의 직원 수 확인
SELECT DISTINCT DEPARTMENT_ID
FROM HR.EMPLOYEES;

SELECT COUNT(*) AS "110번의 직원수"
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 110; -- 결과 2

SELECT *
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 110;

-- SUM() : 합계
-- 모든 직원의 급여 총합 계산
SELECT SUM(SALARY)
FROM HR.EMPLOYEES;

-- 부서별의 급여 총합 계산
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM HR.EMPLOYEES; -- 107행과 1행

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- AVG() : 평균
-- 전체 직원의 평균 급여
SELECT AVG(SALARY)
FROM HR.EMPLOYEES;

-- 부서별 평균 급여
SELECT DEPARTMENT_ID, AVG(SALARY) 부서별평균급여, SUM(SALARY) 부서별급여총합, COUNT(*) 직원수
		,SUM(SALARY) / COUNT(*)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- MAX(), MIN() : 최대값 최소값
SELECT MAX(SALARY), MIN(SALARY)
FROM HR.EMPLOYEES;

-- NULL값은 포함되지 않음 확인
SELECT COUNT(COMMISSION_PCT), COUNT (NVL(COMMISSION_PCT,0))
FROM HR.EMPLOYEES;

-- GROUP BY, HAVING
-- 평균 급여가 5000이상인 부서 조회
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM HR.EMPLOYEES
--WHERE AVG(SALARY) >= 5000 -- WHERE 절에는 집계함수 사용불가
GROUP BY DEPARTMENT_ID ;

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING AVG(SALARY) >= 5000; -- HAVING절에서 집계함수를 이용한 조건 처리

-- 작성순서 : SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY
-- 실행순서 : FROM -> WHERE -> GROUP BY -> HAVING -> SELECT-> ORDER BY


 	
- 부서별 급여 총합이 50000보다 작은 부서들만 내림차순으로 정렬
-- 1) 부서별 급여 총합 조회
SELECT DEPARTMENT_ID, SUM(SALARY) 	-- 3) 부서번호, 부서별 급여 합계
FROM HR.EMPLOYEES    				--1) HR.EMPLOYEES 테이블에서
GROUP BY DEPARTMENT_ID; 			--2) 부서번호로 그룹화

-- 2) 50000보다 작은 부서들 내림차순 정렬
SELECT DEPARTMENT_ID, SUM(SALARY) 	-- 4) 부서번호, 부서별 급여 합계
FROM HR.EMPLOYEES     				--1) HR.EMPLOYEES 테이블에서
GROUP BY DEPARTMENT_ID 				--2) 부서번호로 그룹화
HAVING SUM(SALARY) < 50000 			-- 3) 급여총합이 50000보다 작은
ORDER BY SUM(SALARY) DESC;   		-- 5) 내림차순 정렬

CREATE TABLE TBL_STU_G(
   STU_ID NUMBER,
   STU_NAME VARCHAR2(100) NOT NULL,
   STU_PHONE VARCHAR2(14),
   STU_AGE NUMBER,
   STU_DEPT VARCHAR2(100),
   CONSTRAINT PK_STU_G PRIMARY KEY(STU_ID)
);

SELECT * FROM TBL_STU_G;

INSERT INTO TBL_STU_G
--VALUES (1, '조승우', '8901-8888', 30, '교육학과');
--VALUES (2, '이동욱', '9012-9999', 30, '컴퓨터 공학과');
--VALUES (3, '김소현', '9876-1234', 20, '방송연예과');
--VALUES (4, '김남길', '5050-1222', 26, '컴퓨터 공학과');
--VALUES (5, '강하늘', '5111-5151', 22, '방송연예과');
--VALUES (6, '공유', '5050-5151', 30, '컴퓨터 공학과');
--VALUES (7, '이종혁', '1213-2222', 34, '방송연예과');
--VALUES (8, '박은빈', '1213-2222', 20, '방송연예과');

-- 1) 학과 종류 조회
SELECT DISTINCT stu_dept
FROM tbl_stu_g

-- 2) 각 학과별 학생 수 조회
SELECT stu_dept 학과, count(*) 학생수
FROM tbl_stu_g
GROUP BY stu_dept;

-- 3) 각 학과별 평균 나이 조회
-- round(컬럼값, 소수점 몇자리까지)
SELECT stu_dept 학과, round(avg(stu_age),2) 평균나이 -- round(컬럼값, 2) 소수점 셋째자리에서 반올림
FROM tbl_stu_g
GROUP BY stu_dept;

-- 4) 학과별로 26살 이상인 학생 전체 컬럼 조회(이름, 핸드폰번호, 나이, 학과로 별칭 붙여서)
SELECT stu_name 이름, stu_phone 핸드폰번호, stu_age 나이, stu_dept 학과
FROM tbl_stu_g
WHERE stu_age >= 26;

-- 학생수를 구한다
SELECT stu_dept 학과, count(*) 학생수
FROM tbl_stu_g
WHERE stu_age >= 26
GROUP BY stu_dept;

-- 5) 학생 이름이 김으로 시작하거나 이로 시작하는 학생들의 학과별 학생수 조회
SELECT stu_dept 학과, count(*) 학생수
FROM tbl_stu_g
WHERE stu_name LIKE '김%' OR stu_name LIKE '이%'
GROUP BY stu_dept;

-- 6) 컴퓨터 공학과의 학생 중 25살 이상인 학생 수 조회
SELECT count(*) AS "25살 이상인 학생 수"
FROM tbl_stu_g
WHERE stu_dept = '컴퓨터 공학과' AND stu_age >= 25;

-- ROWNUM
SELECT ROWNUM, E. * FROM HR.EMPLOYEES e ;

SELECT ROWNUM, SALARY FROM HR.EMPLOYEES;

-- EMPLOYEES 테이블에서 SALARY 내림차순으로 조회
SELECT ROWNUM, SALARY	-- 2 컬럼을 조회한다
FROM HR.EMPLOYEES		-- 1 테이블에서
ORDER BY SALARY DESC;	-- 3 급여 내림차순으로

SELECT ROWNUM, E2.SALARY 
FROM(SELECT * FROM HR.EMPLOYEES E ORDER BY SALARY DESC) E2;

-- 1위부터 5위까지
SELECT ROWNUM, E2.SALARY
FROM(SELECT * FROM HR.EMPLOYEES e ORDER BY e.SALARY DESC) E2
WHERE ROWNUM BETWEEN 1 AND 5;

SELECT ROWNUM, E2.SALARY
FROM(SELECT * FROM HR.EMPLOYEES e ORDER BY e.SALARY DESC) E2
WHERE ROWNUM BETWEEN 1 AND 10;

SELECT ROWNUM, E2. *
FROM(SELECT ROWNUM AS RN, E. *
	FROM(SELECT SALARY 
		FROM HR.EMPLOYEES 
		ORDER BY SALARY DESC)E) E2
WHERE RN BETWEEN 6 AND 10;

-- ROWNUM은 반드시 1부터 시작해야한다
-- 정렬 전에 붙는 번호 -> 서브쿼리로 정렬을 먼저 해야한다

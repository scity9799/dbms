-- 5번 : 연산자

-- (3) 관계연산자(비교연산자) (>, <, >=, <=, =, !=, <>)
-- (4) 논리연산자(AND, OR, NOT)

/*
 * select [distinct] 컬럼명 [as 별칭]
 * from 테이블명
 * where 조건식 -- 관계연산자/논리연산자(행을 필터링)
 * order by 정렬할기준컬럼명 [asc | desc];
 * 
 * 실행순서 : from -> where -> select -> order by
 * 작성순서 : select -> from -> where -> order by
 */

-- 직원의 이름, 성, 급여 조회하기
SELECT first_name 이름, last_name 성, salary 급여
FROM employees
WHERE SALARY >= 10000
ORDER BY 급여;

-- 이름이 David인 사람의 이름과 급여만 조회하기
SELECT first_name, salary
FROM employees
WHERE first_name = 'David';
-- SQL은 기본적으로 대소문자를 구분하지 않지만 값(데이터)으로 들어갈 때는 대소문자를 구분한다!!

-- (4) 논리연산자(AND, OR, NOT)
-- 피연산자 자리에 조건이 온다
-- 여러개의 조건을 연결할 때 사용한다

-- employees 테이블에서 부서(department_id)번호가 영업부서(80)이면서 급여가 10000이상인 직원들의
-- 이름, 성, 급여, 부서ID를 급여 오름차순으로 조회
SELECT first_name 이름, last_name 성, salary 급여, department_id 부서ID
FROM EMPLOYEES
WHERE salary >= 10000 AND department_id = 80
ORDER BY 급여;
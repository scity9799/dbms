-- 1번 : 연산자
-- (1) SQL 연산자

-- BETWEEN a AND b : a이상 b이하인 조건 => 범위내에 포함되면 참

-- employees 테이블에서 salary가 10000이상 12000이하인 직원의
-- first_name, last_name, salary를 salary 오름차순으로 조회

SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000 -- salary >= 10000 AND salary <= 12000
ORDER BY salary;
-- 결과 11행

-- IN(a, b, c) : a 또는 b 또는 c 인 조건 => a, b, c 중 하나라도 포함되면 참

SELECT first_name, last_name, salary
FROM employees
WHERE salary IN(10000, 11000, 12000) -- salary = 10000 or salary = 11000 or salary = 12000
ORDER BY salary;
-- 결과 8행

-- LIKE : 문자조건, 패턴을 만들 때 사용한다
-- % : ~ 아무거나 _ : 자리수
SELECT first_name
FROM employees;

SELECT first_name
FROM employees
--WHERE first_name LIKE '%n'; -- first_name이 n으로 끝나는 직원이름조회(결과 : 20행)
--WHERE first_name LIKE 'k%'; -- first_name이 k로 시작하는 직원이름조회(결과 : 0행)
-- 데이터 값은 대소문자를 구분한다
--WHERE first_name LIKE 'K%'; -- first_name이 K로 시작하는 직원이름조회(결과 : 7행)
--WHERE first_name LIKE '%en%'; -- first_name에 en이 포함되는 직원이름조회(결과 : 14행)
--WHERE first_name LIKE '%e%n%'; -- first_name에 e와 n이 포함되는 직원이름조회(결과 : 21행)
--WHERE first_name LIKE '%e_n%'; -- first_name에 e와 n사이에 한글자 더있는 직원이름조회(결과 : 5행)
WHERE first_name LIKE '____e';	--first_name에 e앞에 4글자가 있는 직원이름조회(결과 : 4행)

-- null : 데이터가 없음을 나타내는 값
-- null 연산하면 결과는 null 이다
SELECT NULL, 10, NULL + 10 - 10, NULL * 10, NULL / 10
FROM dual;

--1번. 다음 물음에 간단히 서술하시오.
--(1) PRIMARY KEY의 특징을 2가지 이상 작성하시오.
--중복 불가, null 불가
--(2) SELECT문의 실행 순서를 순서대로 작성하시오.
--from - where - select - group by - having - order by
--(3) 다음 중 이행적 함수 종속의 예를 1개 작성하시오. (형식: A → B → C)
-- 
--(4) 컬럼에 저장될 수 있는 값의 범위, 형식, 타입을 제한해서 허용된 값만 입력되도록 하는 무결성은 (          )무결성이다.
--도메인
--(5) 테이블이 정규화되지 않았을 때 발생하는 데이터 오류 현상을 (        )이라고 하고 종류로는 (                 )가 있다. (※모든 종류를 다 써야 함)
--이상현상, 삭제이상, 갱신이상, 삽입이상
--(6) 아래 sql문의 실행순서대로 해석을 쓰시오.
--
--SELECT MAJOR, AVG(SCORE)
--FROM TBL_STUDENT			
--GROUP BY MAJOR
--HAVING AVG(SCORE) >= 80
--ORDER BY AVG(SCORE) DESC;
-- 
-- tbl_student 테이블에서 major 컬럼으로 그룹화해 avg(score)이 80이상만 조회해서 내림차순으로 정렬하고 major와 avg(score)을 출력한다.
--
--2번. 다음 요구사항을 분석하여 모델링 후 테이블 생성까지 수행하시오.
--[요구사항] 
--
--한 병원에서 환자와 진료 정보를 관리하려고 한다.
--
--환자 정보	
--환자번호
--
--이름
--
--주민번호
--전화번호
--주소
--의사 정보	
--의사번호
--이름
--진료과
--진료 정보	
--진료번호
--진료일
--진단내용
-- 
--
--조건
--
--한 명의 환자는 여러 번 진료를 받을 수 있다.
--한 명의 의사는 여러 환자를 진료할 수 있다.
--환자와 의사는 진료를 통해 연결된다.
-- 
--[문제]
--(1) 요구사항 분석
--필요한 엔티티, 속성, 관계를 서술하시오.
-- 엔티티는 환자와 환자 정보, 의사정보로 만든다
-- 
--환자 정보는 환자번호, 이름, 주민번호, 전화번호, 주소로 구성됨.
--의사 정보는 의사번호, 이름, 진료과로 구성.
--진료 정보는 진료번호, 진료일, 진단내용으로 구성.
--
-- 관계
-- 환자정보 1 : N 진료정보 M : 1 의사정보
--
--(2) 개념적 설계
-- 
-- 엔티티 : 환자정보, 의사정보, 진료정보
-- 환자정보 속성 : 환자번호, 이름, 주민번호, 전화번호, 주소
-- 의사 정보 속성 : 의사번호, 이름, 진료과
-- 진료 정보 속성 : 진료번호, 진료일, 진단내용
--
--(3) 논리적설계
--
-- 환자
-- 환자번호 숫자 PK
-- 이름 문자
-- 주민번호 문자
-- 전화번호 문자
-- 주소 문자
-- 의사번호 숫자 FK
-- 
-- 의사
-- 의사번호 숫자 PK
-- 이름 문자
-- 진료과 문자
-- 
-- 진료정보
-- 진료번호 숫자 PK
-- 진료일 날짜
-- 진단내용 문자
-- 의사번호 숫자 FK
-- 환자번호 숫자 FK
--
--(4) 물리적 설계
--
-- TBL_DOCTOR
-- DOCTOR_NUMBER NUMBER	PRIMARY KEY
---------------------------------------
-- DOCTOR_NAME VARCHAR2(50) NOT NULL
-- DCTOR_CATEGORY VARCHAR2(50) NOT NULL

-- TBL_PATIENT
-- PATIENT_NUMBER NUMBER	PRIMARY KEY
----------------------------------------
-- PATIENT_NAME VARCHAR2(50) NOT NULL
-- PATIENT_ID VARCHAR2(50) NOT NULL
-- PATIENT_PHONE VARCHAR2(50) NOT NULL
-- PATIENT_ADDRESS VARCHAR2(50) NOT NULL
-- DOCTOR_NUMBER NUMBER FOREIGN KEY

-- TBL_DOCS
-- DOCS_NUMBER NUMBER PRIMARY KEY
-----------------------------------
-- DOCS_DATE DATE NOT NULL
-- DOCS_LIST VARCHAR2(100) NOT NULL
-- DOCTOR_NUMBER NUMBER FOREIGN KEY
-- PATIENT_NUMBER NUMBER FOREIGN KEY

--(5) 구현
CREATE TABLE TBL_DOCTOR(
DOCTOR_NUMBER NUMBER,
DOCTOR_NAME VARCHAR2(50),
DCTOR_CATEGORY VARCHAR2(50),
CONSTRAINT PK_DOCTOR PRIMARY KEY(DOCTOR_NUMBER)
);

CREATE TABLE TBL_PATIENT(
PATIENT_NUMBER NUMBER,
PATIENT_NAME VARCHAR2(50) NOT NULL,
 PATIENT_ID VARCHAR2(50) NOT NULL,
 PATIENT_PHONE VARCHAR2(50) NOT NULL,
 PATIENT_ADDRESS VARCHAR2(50) NOT NULL,
 DOCTOR_NUMBER NUMBER,
 CONSTRAINT PK_PATIENT PRIMARY KEY(PATIENT_NUMBER),
 CONSTRAINT FK_DOCTOR FOREIGN KEY(DOCTOR_NUMBER) REFERENCES TBL_DOCTOR(DOCTOR_NUMBER)
);

CREATE TABLE TBL_DOCS(
 DOCS_NUMBER NUMBER,
 DOCS_DATE DATE NOT NULL,
 DOCS_LIST VARCHAR2(100) NOT NULL,
 DOCTOR_NUMBER NUMBER,
 PATIENT_NUMBER NUMBER,
 CONSTRAINT PK_DOCS PRIMARY KEY(DOCS_NUMBER),
 CONSTRAINT FK_DOCS FOREIGN KEY(DOCTOR_NUMBER) REFERENCES TBL_DOCTOR(DOCTOR_NUMBER),
 CONSTRAINT FK_DOSC FOREIGN KEY(PATIENT_NUMBER) REFERENCES TBL_PATIENT(PATIENT_NUMBER)
);
--(6) 구현한 모든 테이블에 각 행을 2개씩 추가 후 각 테이블 전체 조회

INSERT INTO TBL_DOCTOR
--VALUES(1, '의사1', '외과');
VALUES(2, '의사2', '내과');

INSERT INTO TBL_PATIENT
--VALUES(1, '짱구', '050909-0000000', '010-0000-0000', '강남구', 1);
VALUES(2, '짱아', '080901-0000000', '010-1111-0000', '강남구', 2);
 
INSERT INTO TBL_DOCS
--VALUES(1, SYSDATE, '정상', 1, 2);
VALUES(2, SYSDATE, '정상', 2, 2);
 
SELECT * FROM TBL_DOCTOR;
SELECT * FROM TBL_PATIENT;
SELECT * FROM TBL_DOCS;

--3번. 다음 테이블이 있을 때 아래 조건에 맞는 sql문을 작성하시오.
--[TBL_STU]
--
--컬럼명	타입	설명
--STU_ID	숫자	학번(PK)
--STU_NAME	문자(50)	이름
--STU_AGE	숫자	나이
--STU_MAJOR	문자(50)	학과
--STU_SCORE	숫자	점수

CREATE TABLE TBL_STU(
STU_ID NUMBER,
STU_NAME VARCHAR2(50),
STU_AGE NUMBER,
STU_MAJOR VARCHAR2(50),
STU_SCORE NUMBER
);
--[학생 데이터]
--
--(1, '김철수', 20, '컴퓨터', 85)
--(2, '이영희', 22, '인공지능', 90)
--(3, '박민수', 21, '컴퓨터', 70)
--(4, '최지은', 23, '정보보안', 95)
--(5, '홍길동', 20, '컴퓨터', 88)
--(6, '김유리', 22, '인공지능', 60)
--(7, '장민호', 24, '정보보안', 75)
--(8, '신짱구', 21, '컴퓨터', 92)
INSERT INTO TBL_STU
VALUES(1, '김철수', 20, '컴퓨터', 85);
values(2, '이영희', 22, '인공지능', 90);
values(3, '박민수', 21, '컴퓨터', 70);
values(4, '최지은', 23, '정보보안', 95);
values(5, '홍길동', 20, '컴퓨터', 88);
values(6, '김유리', 22, '인공지능', 60);
values(7, '장민호', 24, '정보보안', 75);
values(8, '신짱구', 21, '컴퓨터', 92);
--
--[문제]
--(1) 모든 학생 정보 조회
SELECT * FROM tbl_stu;
--(2) 나이가 22세 이상인 학생 조회
select stu_name, stu_age
FROM tbl_stu
WHERE stu_age >= 22;
--(3) 컴퓨터학과 학생을 점수 내림차순으로 조회
SELECT stu_name, stu_major, stu_score
FROM tbl_stu
WHERE stu_score DESC;
--(4) 학과별 학생 수 조회 (GROUP BY)
SELECT stu_major, count(*)
FROM tbl_stu
GROUP BY stu_major;
--(5) 학과별 평균 점수 조회
SELECT stu_major, stu_avg
FROM tbl_stu

--(6) 평균 점수가 80점 이상인 학과 조회 (HAVING 사용)
--(7) 학과별 최고 점수 조회
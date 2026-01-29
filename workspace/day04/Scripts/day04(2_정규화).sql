-- 2번 : 정규화

-- 학생 정보 테이블(정규화 되지 않은 일반 테이블)
/*
 * 학번(Stu_id)   이름(stu_name) 전공(stu_major) 과목코드(stu_course_code) 과목명(stu_course_name)
 * 001         홍길동         컴공            cs101               데이터베이스
 * 001         홍길동         컴공            cs202               알고리즘
 * 002         김철수         경영학         bus202               경영이론
 * 
 * */

-- 학생 정보 테이블 생성
CREATE TABLE TBL_STU(
	STU_ID NUMBER,
	STU_NAME VARCHAR2(100),
	STU_MAJOR VARCHAR2(100),
	STU_COURSE_CODE VARCHAR2(100),
	STU_COURSE_NAME VARCHAR2(100)
);

-- 테이블 만든 후 반드시 테이블 조회
SELECT * FROM TBL_STU;

-- PK 제약조건 추가
ALTER TABLE TBL_STU
ADD CONSTRAINT PK_STU PRIMARY KEY(STU_ID);

-- 데이터 삽입
INSERT INTO TBL_STU
--VALUES(001, '홍길동', '컴퓨터 공학', 'CS101', '데이터베이스');
VALUES(002, '김철수', '경영학', 'BUS202', '경영이론');

-- 데이터 삽입 후 반드시 테이블 조회
SELECT * FROM TBL_STU;

-- 특정 학번의 학생 정보 조회(학번2)
SELECT * FROM TBL_STU
WHERE STU_ID = 2;

-- 특정 과목명에 해당하는 학생정보조회(과목명 데이터베이스)
SELECT * FROM TBL_STU
WHERE STU_COURSE_NAME = '데이터베이스';

-- 학번2인 학생의 전공을 데이터 사이언스로 변경
UPDATE TBL_STU
SET STU_MAJOR = '데이터 사이언스'
WHERE STU_ID = 2;

-- 컬럼 추가 STU_ADDRESS VARCHAR2(100)
ALTER TABLE TBL_STU
ADD STU_ADDRESS VARCHAR2(100);

SELECT * FROM TBL_STU;

-- 컬럼 추가 한 뒤에는 컬럼값 수정으로 진행해야함
--INSERT INTO TBL_STU(STU_ADDRESS)
--VALUES('서울시 강남구 역삼동, 12345');

-- 컬럼값 수정
UPDATE TBL_STU
SET STU_ADDRESS = '서울시 강남구 역삼동, 12345'
WHERE STU_ID = 1;

INSERT INTO TBL_STU
VALUES(3, '홍길동', '컴퓨터 공학', 'CS202', '알고리즘', '서울시 강남구 역삼동, 12345');

-- [1NF] 원자값 제거, 반복 제거
-- 학생정보테이블 : 학번 PK, 이름, 전공, 주소, 우편번호
--DROP TABLE TBL_STU_1NF;
--DROP TABLE TBL_SUBJECT_1NF;
CREATE TABLE TBL_STU_1NF(
	STU_ID NUMBER,
	STU_NAME VARCHAR2(100),
	STU_MAJOR VARCHAR2(100),
	STU_ADDRESS VARCHAR2(100),
	STU_ADDRESS_COD VARCHAR(5),
	CONSTRAINT PK_STU_1NF PRIMARY KEY(STU_ID)
);

SELECT * FROM TBL_STU_1NF;

-- 과목 테이블 : 과목번호, 과목코드, 과목명
CREATE TABLE TBL_SUBJECT_1NF(
   SUBJECT_ID NUMBER,
   SUBJECT_CODE VARCHAR2(10),
   SUBJECT_NAME VARCHAR2(100),
   CONSTRAINT PK_SUBJECT_1NF PRIMARY KEY(SUBJECT_ID)
);

SELECT * FROM TBL_SUBJECT_1NF;

INSERT INTO TBL_STU_1NF 
--VALUES(1, '홍길동', '컴퓨터 공학','서울시 강남구 역삼동', 12345	);
VALUES(2, '김철수', '데이터 사이언스','서울시 송파구 잠실동', 23456	);

INSERT INTO TBL_SUBJECT_1NF 
--VALUES(1,'CS101','데이터베이스');
--VALUES(2,'BUS202','경영이론');
VALUES(3,'CS202','알고리즘');

SELECT * FROM TBL_STU_1NF;
SELECT * FROM TBL_SUBJECT_1NF;

-- 학생 테이블과 과목 테이블이 분리되었으므로 FK관계 생각해야한다
-- 학생 테이블 기준 : 한 명의 학생은 여러 과목을 수강할 수 있다
-- 과목 테이블 기준 : 하나의 과목은 여러 학생ㅇ ㅣ들을 수 있다
-- 다 대 다 관계 => 중간 테이블이 필요하다

-- 수강 테이블 TBL_ENROLL_2NF
-- 학번(FK), 과목번호(FK) => PK
CREATE TABLE TBL_ENROLL_2NF(
	STU_ID NUMBER,
	SUBJECT_ID NUMBER,
	CONSTRAINT PK_ENROLL PRIMARY KEY (STU_ID, SUBJECT_ID),
	CONSTRAINT FK_ENROLL FOREIGN KEY (STU_ID) REFERENCES TBL_STU_1NF (STU_ID),
	CONSTRAINT FK_ENROLL_SUBJECT FOREIGN KEY(SUBJECT_ID) REFERENCES TBL_SUBJECT_1NF (SUBJECT_ID)
);

SELECT * FROM TBL_ENROLL_2NF;

INSERT INTO TBL_ENROLL_2NF 
--VALUES(1,1);
--VALUES(1,2);
VALUES(2,1);

-- 2차 정규화(부분 종속 제거)
-- 조합키를 가진 테이블에서 일부키에만 종속되는 컬럼이 있을 경우 분리
-- 현재는 이미 중간테이블로 분리했기 때문에 2차정규화까지 완료된 상태!!

-- TBL_ENROLL_2NF는 복합키만 있고 다른 종속되는 컬럼이 없음
-- TBL_ENROLL_1NF, TBL_SUBJECT_1NF는 단일 PK 기준으로 종속 문제 없음
-- PK가 아닌 다른 컬럼에 종속되는 컬럼이 존재시 제거해야한다

SELECT * FROM TBL_STU_1NF;

-- 학생정보테이블과 주소테이블 분리
CREATE TABLE TBL_ADDRESS_3NF(
	ADDRESS_CODE NUMBER,
	ADDRESS_ADDR VARCHAR2(100),
	CONSTRAINT PK_ADDRESS_3NF PRIMARY KEY(ADDRESS_CODE)
);

CREATE TABLE TBL_STU_3NF(
	STU_ID NUMBER,
	STU_NAME VARCHAR2(100),
	STU_MAJOR VARCHAR2(100),
	STU_ADDRESS_CODE NUMBER,
	STU_ADDRESS_DETAIL VARCHAR2(100),
	CONSTRAINT PK_STU_3NF PRIMARY KEY(STU_ID),
	CONSTRAINT FK_STU_ADDRESS FOREIGN KEY(STU_ADDRESS_CODE) REFERENCES TBL_ADDRESS_3NF(ADDRESS_CODE)
);

SELECT * FROM TBL_STU_3NF;s

-- 전체구조
-- 학생테이블
-- 주소테이블
-- 과목테이블
-- 수강테이블
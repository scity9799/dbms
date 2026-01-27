-- 2번 : DML(데이터 조적어) 기초

-- 테이블 생성(DDL)
CREATE TABLE tbl_member(
--	컬럼명	자료형(용량) -용량 생략가능
	member_id NUMBER, 
	member_name varchar2(100),
	member_age number(3)
);

-- DML 연습
SELECT * FROM tbl_member;

-- 데이터 추가
--INSERT INTO 테이블명(컬럼명1, 컬럼명2) values(값1, 값2);
--INSERT INTO 테이블명 values(값1, 값2, 값3);
INSERT INTO TBL_MEMBER
values(1, '짱구', 5);
INSERT INTO tbl_member(member_id, member_name)
values(2, '유리');
INSERT INTO TBL_MEMBER 
VALUES(3, '철수', null);
SELECT * FROM tbl_member;
INSERT INTO TBL_MEMBER 
VALUES(4, '철수', null);
SELECT * FROM tbl_member;
--ORDER BY member_id;

SELECT*
FROM tbl_member
WHERE member_name = '짱구';

--데이터 삭제
DELETE FROM tbl_member;

SELECT * FROM TBL_MEMBER;

DELETE FROM TBL_MEMBER 
WHERE member_id = 4;

-- 나이가 null인 행만 삭제
DELETE FROM TBL_MEMBER 
WHERE member_age IS NULL;

-- 추가 짱구, 철수, 유리, 훈이 4명 회원 추가
INSERT INTO TBL_MEMBER 
--values(2, '철수', 5);
--values(3, '유리', 5);
values(4,'훈이', 5);
SELECT * FROM TBL_MEMBER
ORDER BY member_id;

-- 수정
-- update 테이블명 set 컬럼명 = 변경할 값 [where 조건];
-- member_id 1인 값을 20으로 변경
UPDATE TBL_MEMBER
SET member_id = 20
WHERE member_id = 1;

SELECT * FROM TBL_MEMBER;

-- 짱구 20
-- 철수 21
UPDATE tbl_member
SET member_id = 21
where member_id = 2;

SELECT * FROM TBL_MEMBER;
-- 유리 22
UPDATE tbl_member
SET member_id = 22
where member_id = 3;

SELECT * FROM TBL_MEMBER;
-- 훈이 23
UPDATE tbl_member
SET member_id = 23
where member_id = 4;

SELECT * FROM TBL_MEMBER ORDER BY MEMBER_ID ;

-- 두번째 테이블 생성(TBL_STUDENT)
CREATE TABLE tbl_student(
-- 컬럼명 자료형(용량)
	student_number NUMBER,
	student_name varchar2(100),
	student_math NUMBER,
	student_eng NUMBER,
	student_kor NUMBER,
	student_grade varchar2(100)
);

SELECT * FROM tbl_student;

INSERT INTO tbl_student(student_number, student_name, student_math, student_eng, student_kor)
--values(1, '짱구', 90,90,90);
--values(2,'철수',100,80,100);
--values(3,'유리',70,25,55);
--values(4,'훈이',40,100,70);
--values(5,'맹구',70,77,89);

SELECT * FROM tbl_student;
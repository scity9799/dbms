-- 3번 : 관계를 맺은 테이블의 DML

SELECT * FROM tbl_phone;
SELECT * FROM tbl_case;

-- 관계를 맺은 테이블이 있을 때 자식 테이블의 값은 부모테이블의 값을 참조하기 때문에
-- 항상 부모 테이블에 데이터가 먼저 들어가야한다
-- PHONE 테이블이 부모이므로 PHONE에 먼저 데이터를 넣어야한다

INSERT INTO TBL_PHONE
--VALUES(10, 'white', '1', 100, to_date('2026-01-29', 'yyyy-mm-dd'), NULL);
--VALUES(20, 'black', '1', 120, to_date('2026-01-29', 'yyyy-mm-dd'), null);
values(30, 'black', '1', 130, sysdate-10, null);

INSERT INTO TBL_CASE 
--VALUES (1, '투명', 5000, 1); -- TBL_PHONE 테이블에 1이라는 값이 없기 때문에 오류 발생
--VALUES(1, '투명', 50, 10);
--VALUES(2, '빨강', 50, 10);
--VALUES(3, '초록', 50, 10);
VALUES(4, '보라', 50, 20);

SELECT * FROM TBL_PHONE;
SELECT * FROM TBL_CASE;

-- 부모 테이블의 값을 수정하기
-- 자식 테이블에서 FK로 참조하고 있는 값이 아니라면 수정가능하지만 참조하고 있는 값인 경우 수정이 불가능하다
-- PHONE_COLOR 컬럼은 참조하고 있는 컬럼이 아니므로 수정가능
UPDATE TBL_PHONE
SET PHONE_COLOR ='blue'
WHERE phone_number = 10;

-- PHONE_NUMBER는 참조하고 있는 컬럼이기 때문에 수정 불가능(오류발생)
-- 단, 자식테이블에서 참조하고 있지 않은 값이면 가능
UPDATE TBL_PHONE
SET PHONE_NUMBER = 100
WHERE phone_number = 10;

-- 부모의 값을 변경할 때 자식에서 참조중인 값이라면 
-- 자식 테이블의 값을 먼저 수정하여 해당 값을 참조하지 않도록 수정해야한다
--1) 자식 테이블에서 참조중인 값을 다른 값으로 변경한다(부모테이블에 존재하는 값이어야한다)
UPDATE TBL_CASE
SET PHONE_NUMBER = 30
WHERE PHONE_NUMBER = 20;

SELECT * FROM TBL_CASE;

UPDATE TBL_PHONE
SET PHONE_NUMBER = 200
WHERE PHONE_NUMBER = 20;

--2) 자식 테이블에서 참조중인 값을 NULL로 변경한다(정말 급한게 아니라면 비추천)
UPDATE TBL_CASE 
SET PHONE_NUMBER = NULL
WHERE PHONE_NUMBER = 10;

SELECT * FROM TBL_CASE;
SELECT * FROM TBL_PHONE;

UPDATE TBL_PHONE 
SET PHONE_NUMBER = 100 
WHERE PHONE_NUMBER = 10;

UPDATE TBL_CASE
SET PHONE_NUMBER = 100
WHERE PHONE_NUMBER IS NULL;

-- 시퀀스
CREATE SEQUENCE SEQ_TEST;

SELECT * FROM TBL_BOOK;
SELECT * FROM TBL_MEMBER;

-- 테이블 데이터 모두 삭제하기
DELETE FROM TBL_BOOK;
DELETE FROM TBL_MEMBER;

-- 시퀀스 생성
CREATE SEQUENCE SEQ_BOOK;
CREATE SEQUENCE SEQ_MEMBER;

-- 시퀀스를 사용하여 데이터 넣기
SELECT SEQ_MEMBER.CURRVAL FROM DUAL;

INSERT INTO TBL_MEMBER
--VALUES(SEQ_MEMBER.NEXTVAL, '짱구', 20, '010-1234-1234', '서울시');
--VALUES(SEQ_MEMBER.NEXTVAL, '철수', 21, '010-1111-2222', '경기도');
--VALUES(SEQ_MEMBER.NEXTVAL, '훈이', 25, '010-2222-2222', '서울시');
VALUES(SEQ_MEMBER.NEXTVAL, '유리', 21, '010-3333-3333', '경기도');

SELECT * FROM TBL_MEMBER ORDER BY MEMBER_NUMBER;

SELECT SEQ_MEMBER.NEXTVAL
FROM DUAL;

-- CURRVAL 현재값을 확인
-- NEXTVAL 다음값을 가져올 때

-- 시퀀스 삭제
DROP SEQUENCE SEQ_MEMBER;
DROP SEQUENCE SEQ_BOOK;

CREATE SEQUENCE SEQ_BOOK
START WITH 100
INCREMENT BY 10
MINVALUE 100
MAXVALUE 130
CYCLE CACHE 2;

-- SQL Error [4013] [22023]: ORA-04013: number to CACHE must be less than one cycle
-- 시퀀스가 한바퀴 도는 범위보다 CACHE 저장하려는 개수가 더 많아서 오류 CACHE(20) > 전체범위(4)
-- 오라클은 CYCLE + CACHE 사용할 때 한바퀴 동안 절대 꼬이지 않게 값이 커야되는데 범위가 너무 작으면 아예 거부됨
-- CACHE < cycle size

CREATE SEQUENCE SEQ_BOOK NOCYCLE NOCACHE;

INSERT INTO TBL_BOOK
--VALUES(SEQ_BOOK.NEXTVAL, '셜록', '추리', 1);
--VALUES(SEQ_BOOK.NEXTVAL, 'DBMS 완전정복', 'IT', 1);
--VALUES(SEQ_BOOK.NEXTVAL, '인문학개론', '인문학', NULL);
--VALUES(SEQ_BOOK.NEXTVAL, '인생', '인문학', 2);
VALUES(SEQ_BOOK.NEXTVAL, 'JAVA의 정석', 'IT', 2);
-- 시퀀스의 최대값을 넘어서 더이상 번호를 만들 수 없다

SELECT * FROM TBL_BOOK;




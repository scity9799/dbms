/* PLAYER 테이블에서 WEIGHT가 70이상이고 80이하인 선수 검색 */
SELECT WEIGHT 몸무게
FROM PLAYER 
WHERE WEIGHT BETWEEN 70 AND 80;

/* PLAYER 테이블에서 TEAM_ID가 'K03'이고 HEIGHT가 180 미만인 선수 검색 */
SELECT team_id, height
FROM PLAYER
WHERE TEAM_ID ='K03'AND HEIGHT < 180;
/* PLAYER 테이블에서 TEAM_ID가 'K06'이고 NICKNAME이 '제리'인 선수 검색 */
SELECT team_id, nickname
FROM player
WHERE TEAM_ID = 'K06' AND NICKNAME = '제리';
/* PLAYER 테이블에서 HEIGHT가 170이상이고 WEIGHT가 80이상인 선수 이름 검색 */
SELECT player_name, height, weight
FROM PLAYER
WHERE HEIGHT >= 170 AND WEIGHT >= 80;
/* STADIUM 테이블에서 SEAT_COUNT가 30000초과이고 41000이하인 경기장 검색 */
SELECT * FROM STADIUM;
SELECT seat_count, stadium_name
FROM STADIUM
WHERE SEAT_COUNT > 30000 AND SEAT_COUNT <= 41000;
/* PLAYER 테이블에서 TEAM_ID가 'K02'이거나 'K07'이고 포지션은 'MF'인 선수 검색 */
SELECT * FROM PLAYER;
SELECT team_id, POSITION
FROM PLAYER
WHERE TEAM_ID IN ('K02', 'K07') AND POSITION = 'MF';
/*
 * PLAYER 테이블에서 POSITION이 NULL인 선수 검색
 */
SELECT POSITION
FROM PLAYER
WHERE "POSITION" IS NULL; 
/*
 * PLAYER 테이블에서 NICKNAME이 NULL인 선수를 '없음'으로 변경하여 조회하기
 */
SELECT NVL(NICKNAME,'없음')
FROM PLAYER;


/*
 * PLAYER 테이블에서 POSITION이 NULL인 선수를 '미정'으로 변경 후 검색
 */
SELECT NVL("POSITION",'미정')
FROM PLAYER;


/*
 * PLAYER 테이블에서 NATION이 등록되어 있으면 '등록', 아니면 '미등록'으로 검색
 */


SELECT PLAYER_NAME, NVL2(NATION,'등록','미등록')
FROM PLAYER;
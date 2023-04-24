
-- 테이블(Entity 엔터티) 생성
-- 성적정보 저장 테이블


CREATE TABLE tbl_score (
	name VARCHAR2(4) NOT NULL,
	kor NUMBER(3) NOT NULL CHECK(kor > 0 AND kor <= 100),
	eng NUMBER(3) NOT NULL CHECK(eng > 0 AND eng <= 100),
	math NUMBER(3) NOT NULL CHECK(math > 0 AND math <= 100),
	total NUMBER(3) NULL,
	average NUMBER(5, 2),
	grade CHAR(1),
	stu_num NUMBER(6),
	-- PK 거는법
	CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num)
);

-- 테이블 생성 후 PK 적용하기
ALTER TABLE tbl-score
ADD CONSTRAINT pk_stu_num
PRIMARY KEY (stu_num);


ALTER TABLE
	TBL_SCORE 
	DROP COLUMN sci;

-- 테이블 복사 (tb_emp)
-- CTAS
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

SELECT * FROM TB_EMP_COPY;

-- drop table
DROP TABLE TB_EMP_CORY;

-- truncate table 
-- 구조는 냅두고 내부 데이터만 전체 삭제
TRUNCATE TABLE tb_emp_copy;

-- 예시테이블
CREATE TABLE goods (
id 	NUMBER(6) PRIMARY KEY,
g_name VARCHAR(10) NOT NULL,
price NUMBER(10) DEFAULT 1000,
reg_date DATE
);

SELECT * FROM goods;

-- INSERT 
INSERT INTO goods
	(id, g_name, price, reg_date)
VALUES (1, '선풍기','120000',SYSDATE);

INSERT INTO goods
	(id, g_name, reg_date)
VALUES (2, '에어컨',SYSDATE);

INSERT INTO goods
	(id, g_name, price)
VALUES (3, '후리',500);

-- 컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야 함/ 사용 X 
INSERT INTO goods
VALUES (4, '하하',10000, SYSDATE);


INSERT INTO goods
	(g_name, id, price)
VALUES 
	('후리1', 5, 500),
	('후리2', 6, 1000),
	('후리3', 7, 1500)
	;
	
-- 수정 UPDATE
-- WHERE 절이 없으면 모든 데이터가 수정
UPDATE goods
SET g_name = '냉장고'
WHERE id = 3;

UPDATE goods
SET g_name = '콜라', price = 3000
WHERE id = 2;

-- 행을 삭제 DELETE 
DELETE FROM goods
WHERE id = 3 ;

SELECT * FROM goods;

-- 모든 행 삭제 
DELETE FROM goods;


SELECT 
	CERTI_CD
	, CERTI_NM 
	, ISSUE_INSTI_NM 
FROM TB_CERTI;


SELECT  
	ISSUE_INSTI_NM
	, CERTI_NM 
	, CERTI_CD
FROM TB_CERTI;


-- 중복 제거 distinct
SELECT DISTINCT 
	ISSUE_INSTI_NM
FROM TB_CERTI;


-- 모든 컬럼 조회
-- 실무에서는 사용하지 마세요
SELECT 
*
FROM TB_CERTI; 

-- 열에 별칭 부여 ( alias)
SELECT
		EMP_NM AS "사원이름",
		ADDR AS "사원의 거주지 주소"
FROM TB_EMP;

-- 문자열 연결하기
SELECT 
	CERTI_NM || '(' || ISSUE_INSTI_NM || ')' AS "자격증 정보"
FROM TB_CERTI
;

















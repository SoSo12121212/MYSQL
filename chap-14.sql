
-- DDL 정의어
CREATE DATABASE IF NOT EXISTS 세계학사;

USE 세계학사;

CREATE TABLE 학과
    (학과번호 CHAR(2)
      ,학과명 VARCHAR(20)
     ,학과장명 VARCHAR(20)
    );

INSERT INTO 학과 VALUES
      ('AA', '컴퓨터공학과', '배경민')
      ,('BB', '소트트웨어학과', '김남준')
      ,('CC', '디자인융합학과', '박선영');

SELECT * FROM 학과;


CREATE TABLE 학생(
  학번  CHAR(5)
 ,이름  VARCHAR(20)
 ,생일  DATE                  -- 2000-03-10
 ,연락처 VARCHAR(20)
 ,학과번호 CHAR(2)             -- 외래키 
);

DESC 학생;

INSERT INTO 학생   -- (컬럼1, 컬럼2)
VALUES('S0001', '이윤구', '2020-01-30', '010-1111-4444', 'AA')
      ,('S0001', '이승은', '2021-02-23', NULL, 'AA')
      ,('S0003', '백재용', '2018-03-31', '01077778888', 'DD');

SELECT * FROM 학생;

-- 데이블의 구조와 데이터를 복사하기
CREATE TABLE 휴학생 AS
SELECT *
FROM 학생;

SELECT * FROM 휴학생;
DROP TABLE 휴학생;
-- 구조만 복사하기
CREATE TABLE 휴학생 
SELECT *
FROM 학생;
WHERE 1=2;             -- 항상 FALSE이다.


-- 계산된 결과를 저장하기
CREATE TABLE 회원 (
  아이디 VARCHAR(20) PRIMARY KEY
 ,회원명 VARCHAR(20)
 ,키    INT
 ,몸무게 INT 
 ,체질량지수 DECIMAL(4,1) AS (몸무게/POWER(키/100,2)) STORED
);
-- POWER(밑,지수) 밑을 지수만큼 거듭제곱
-- STORED 테이블에 실제 저장
DESC 회원;
INSERT INTO 회원(아이디, 회원명, 키, 몸무게)
VALUES ('ARANG', '김아람', 170, 55);

SELECT * FROM 회원;

-- 테이블, 뷰 , 인덱스 속성 변경
-- ALTER

ALTER TABLE 학생 ADD 성별 CHAR(1);
DESC 학생;
ALTER TABLE 학생 CHANGE COLUMN 연락처 휴대폰번호 VARCHAR(20);
ALTER TABLE 학생 DROP COLUMN 성별;
ALTER TABLE 학생 RENAME 졸업생;

SELECT * FROM 졸업생;
DROP TABLE 졸업생;


DROP TABLE 학과;

-- 제약조건
CREATE TABLE 학과(
힉과번호  CHAR(2) PRIMARY KEY
,학과명 VARCHAR(20) NOT NULL
,학과장명 VARCHAR(20)
);
DESC 학과;


INSERT INTO 학과
VALUES ('01', '영어영문과', '데이비드교수'); -- UNIQUE

INSERT INTO 학과
VALUES (NULL, '영어영문과', '데이비드교수') -- NOT NULL

INSERT INTO 학과
VALUES ('01', NULL, '홍교수'); -- NOT NULL

INSERT INTO 학과
VALUES ('02', '수학과', '홍교수'); -- UNIQUE


SELECT * FROM 학과;

-- Ch10.sql

-- 조인: 2개 이상의 테이블을 조회하여 하나의 결과를 반환
-- ANSI SQL 문법을 사용하여, DBMS마다 SQL 호환이 가능하다.
-- 조인의 종류
  -- 크로스 조인
  -- Inner 조인
  -- Outer 조인
  -- 셀프   조인
  
USE 세계무역;

-- 크로스 조인: 테이블 A와 테이블 B의 모든 행의 조합
SELECT COUNT(*)
FROM 부서;

SELECT COUNT(*)
FROM 사원;

SELECT COUNT(*)
FROM 부서
CROSS JOIN 사원;   -- 40

SELECT * FROM 부서
CROSS JOIN 사원;

-- 사원 테이블과 부서 테이블을 크로스 조인하여 '배재용' 사원에 대한 정보를 보이시오.
SELECT 부서.부서번호,부서명, 이름, 사원.부서번호 FROM 부서
CROSS JOIN 사원
WHERE 이름='배재용'

-- Non-ANSI 조인
SELECT 부서.부서번호,부서명, 이름, 사원.부서번호 
FROM 부서,사원
WHERE 이름='배재용';

-- 내부 조인
-- ANSI SQL 조인
SELECT 사원번호, 직위, 사원.부서번호, 부서명 FROM 사원
INNER JOIN 부서
ON 사원.부서번호=부서.부서번호
WHERE 이름='이소미';

-- NON-ANSI SQL 조인
SELECT 사원번호, 직위, 사원.부서번호, 부서명 FROM 사원, 부서
WHERE 사원.부서번호=부서.부서번호 AND 이름='이소미';

-- 고객 회사들이 주문한 주문건수를 주문건수가 많은 순서대로 보이시오. 
   -- 이때 고객 회사의 정보로는 고객번호, 담당자명, 고객회사명을 보이시오.

SELECT 고객.고객번호, 담당자명, 고객회사명, COUNT(*) AS 주문건수 FROM 고객
INNER JOIN 주문
ON 고객.고객번호=주문.고객번호
GROUP BY 고객.고객번호 , 담당자명, 고객회사명
ORDER BY COUNT(*) DESC;

-- 바이퀴 조인 : 비등가조인


SELECT * FROM 사원
WHERE 부서번호='A4';

-- OUTER JOIN 조건(등가,비등가)에 맞지 않는 행도 결과값으로 나옴
SELECT 부서명,사원.*
FROM 사원
INNER JOIN 부서
ON 사원.부서번호=부서.부서번호;

-- 사원 테이블에 홍보부 부서번호가 없다.
-- 사원 테이블에 정수진 부서번호가 없다.

-- 사원 테이블에서 부서번호가 NULL인 행도 출력한다.
SELECT 부서명, 사원.*
FROM 사원
LEFT OUTER JOIN 부서
ON 사원.부서번호=부서.부서번호;




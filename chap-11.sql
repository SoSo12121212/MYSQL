-- 단일행 서브쿼리
-- 최고 마일리지를 보유한 고객의 정보를 구하시오.
-- 최고 마일리지를 구하기
--

USE 세계무역;

SELECT MAX(마일리지)
FROM 고객;

SELECT *
FROM 고객
WHERE 마일리지=128790;

SELECT *
FROM 고객
WHERE 마일리지= (SELECT MAX(마일리지)
FROM 고객 ); -- 최대 마일리지

-- 주문번호 'H0250'인 고객의 고객회사명, 담당자명을 출력하시오.
SELECT 고객회사명,담당자명
FROM 고객
WHERE 고객번호='H0250';

-- 주문 테이블에서 고객번호를 찾고 해당 고객들의 주문만 필터링
SELECT COUNT(*) AS 주문건수 
FROM 주문
WHERE 고객번호 IN (SELECT 고객번호
            FROM 고객
            WHERE 도시='부산광역시'
            );

-- ANY :  마일리지 > 부산마일리지 OR ... OR ... OR                    
SELECT 담당자명, 고객회사명, 마일리지
FROM 고객
WHERE 마일리지 > ANY( SELECT 마일리지 FROM 고객
                      WHERE 도시 = '부산광역시' ); 


-- 하나라도 맞으면 TRUE
SELECT 담당자명, 고객회사명, 마일리지
FROM 고객
WHERE 고객번호 ='TTMBO';
-- LIDBO LLIWE NGOHU RICPE TTMBO
-- 2819   806   7795  1177  7329


-- ALL : AND ... AND ... AND

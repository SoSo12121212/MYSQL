
--GROUP BY 절 - 특정 컬럼에 대한 집계를 할 때
USE 세계무역;
SELECT 도시
      ,COUNT(*) AS '도시별 고객수'
      ,AVG(마일리지) AS '도시별 평균마일리지'
FROM 고객
GROUP BY 도시;

SELECT 도시
      ,COUNT(*) AS '도시별 고객수'
      ,AVG(마일리지) AS '도시별 평균마일리지'
FROM 고객
GROUP BY 1;

-- 두 개 이상의 컬럼에 대한 집계
SELECT 담당자직위
      ,도시
      ,COUNT(*) AS 고객수
      ,AVG(마일리지) AS 평균마일리지
FROM 고객
GROUP BY 1,2;

-- HAVING 절 
SELECT 도시 
      ,COUNT(*) AS 고객수
FROM 고객
GROUP BY 도시


-- 확인문제
SELECT * FROM 고객;
SELECT 담당자직위
      ,MAX(마일리지) AS `최대 마일리지`
FROM 고객
    WHERE 도시 LIKE '%광역시'
GROUP BY 담당자직위;
-- 연습문제

-- 1. 다음 조건에 따라 고객 테이블에서 고객회사명과 전화번호를 다른 형태로 보이도록 함수를 사용해봅시다. 
-- 고객회사명2와 전화번호2를 만드는 조건은 아래와 같습니다.
-- 조건
-- 1. 고객회사명2 : 기존 고객회사명 중 앞의 두 자리를 *로 변환한다.
-- 2. 전화번호2 : 기존 전화번호의 (xxx)xxx-xxxx 형식을 xxx-xxx-xxxx형식으로 변환한다.

  USE 세계무역;
  SELECT * FROM 고객;
  SELECT 고객회사명, 
        CONCAT('**', SUBSTRING(고객회사명, 3)) AS '고객회사명2', 
        전화번호 ,REPLACE(REPLACE(전화번호, '(' , ''), ')' ,'-') AS '전화번호2'
        FROM 고객 WHERE  고객회사명 IS NOT NULL AND 전화번호 IS NOT NULL;
       
  
-- 2. 다음 조건에 따라 주문 세부 테이블의 모든 컬럼과 주문금액, 할인금액, 실제 주문금액을 보이시오. 
-- 이때 모든 금액은 1의 단위에서 버림을 하고 10원 단위까지 보이시오.
-- 조건
-- 1. 주문금액: 주문수량 * 단가
-- 2. 할인금액 : 주문수량 * 단가 * 할인율
-- 3. 실주문금액 : 주문금액 - 할인금액
  
SELECT *  ,주문수량*단가 AS 주문금액
,TRUNCATE(주문수량*단가*할인율, -1) AS 할인금액   -- 일의 자리에서 버림
, (주문수량*단가)- TRUNCATE(주문수량*단가*할인율, -1) AS 실주문금액 
FROM 주문세부; 
  

  
-- 3. 사원 테이블에서 전체 사원의 이름, 생일, 만나이, 입사일, 입사일수, 
-- 입사한 지 500일 후의 날짜를 보이시오.
SELECT 이름,생일,TIMESTAMPDIFF(YEAR,생일, CURDATE()) AS 만나이, 
       입사일,DATEDIFF(CURDATE(),입사일) AS 입사일수
,ADDDATE(입사일, 500) AS 500일후
FROM 사원;


-- 4. 고객 테이블에서 도시 컬럼의 데이터를 다음 조건에 따라 '대도시'와 '도시'로 구분하고, 
-- 마일리지 점수에 따라서 'VVIP', 'VIP', '일반 고객'으로 구분하시오.
-- 조건
-- 1. 도시 구분: '특별시'나 '광역시'는 '대도시'로, 그 나머지 도시는 '도시'로 구분한다.
-- 2. 마일리지 구분 : 마일리지가 100,000점 이상이면 'VVIP고객', 10,000점 이상이면 'VIP고객', 그 나머지는 '일반고객'으로 구분한다.

SELECT 담당자명, 고객회사명, 도시
       ,IF(도시 LIKE '%특별시' OR 도시 LIKE '%광역시', '대도시', '도시') AS `도시 구분`
       ,마일리지
       ,CASE WHEN 마일리지 >=100000 THEN 'VVIP 고객'
             WHEN 마일리지 >=10000 THEN 'VIP 고객'
             ELSE '일반고객'
             END AS `마일리지 구분` FROM 고객;
-- 5. 주문 테이블에서 주문번호, 고객번호, 주문일 및 주문년도, 분기, 
-- 월, 일, 요일, 한글요일을 보이시오.

SELECT 주문번호,고객번호, 주문일, YEAR(주문일) AS 주문년도,
QUARTER(주문일) AS 주문분기, 
MONTH(주문일) AS 주문월,
DAY(주문일) AS 주문일,
WEEKDAY(주문일) AS 주문요일,
CASE WEEKDAY(주문일) WHEN 0 THEN '월요일'
                   WHEN 1 THEN '화요일'
                   WHEN 2 THEN '수요일'
                   WHEN 3 THEN '목요일'
                   WHEN 4 THEN '금요일'
                   WHEN 5 THEN '토요일'
                   ELSE '일요일'
END AS 한글요일
FROM 주문;

SELECT * FROM 주문;
SELECT * FROM 고객;
 

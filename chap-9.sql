
-- 실전문제
USE 세계무역;
-- 1. 주문세부 테이블에서 주문수량합과 주문금액합을 보이시오.

SELECT *
FROM 주문세부;

DESC 주문세부; -- 테이블의 구조 출력
-- 주문번호 + 제품번호 2개 기본키로 동작함. 복합키라고 한다.

SELECT SUM(주문수량) AS 주문수량합
	 ,SUM(단가 * 주문수량) AS 주문금액합
FROM 주문세부;

-- 2. 주문세부 테이블에서 주문번호별로 주문된 제품번호의 목록과 주문금액합을 보이시오.
--  주문번호는 주문 건당 하나씩 발급됨.

SELECT 주문번호,제품번호
FROM 주문세부
GROUP BY 주문번호,제품번호
ORDER BY 주문번호;

SELECT 주문번호, 
		제품번호,
		COUNT(*),
		SUM(단가*주문수량) AS 주문금액합
FROM 주문세부
WHERE
GROUP BY 주문번호, 제품번호
HAVING
ORDER BY 주문번호;

-- 3. 주문 테이블에서 2021년 주문내역에 대해서 고객번호별로 주문건수를 보이된, 
--     주문건수가 많은 상위 3건의 고객의 정보만 보이시오.
SELECT 고객번호,
	COUNT(*) AS 주문건수
FROM 주문
WHERE YEAR(주문일) = 2021
GROUP BY 고객번호
ORDER BY 주문건수 DESC
LIMIT 3;

-- 4. 사원 테이블에서 직위별로 사원수와 사원이름목록을 보이시오.
SELECT 직위, COUNT(직위), 이름
FROM 사원
GROUP BY 직위, 이름
ORDER BY 직위;
-- GROUP_CONCAT() : 여러행의 문자열을 결합해줌.
SELECT 직위, COUNT(직위), GROUP_CONCAT(이름 SEPARATOR ', ')
FROM 사원
GROUP BY 직위
ORDER BY 직위;


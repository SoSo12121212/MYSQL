-- 제품 테이블에서 세계무역이 취급하는 제품 중에서 ‘주스’ 제품에 대한 모든 정보를 검색하시오.

USE 세계무역;
SELECT *FROM 제품;
SELECT 제품번호, 제품명, 포장단위, 단가,재고  FROM 제품 WHERE 제품명 LIKE '%주스%';

-- 제품 테이블에서 단가가 5,000원 이상 10,000원 이하인 ‘주스’제품에는 무엇이 있는지 검색하시오.
SELECT 제품번호,제품명, 포장단위, 단가,재고 FROM 제품 WHERE 제품명 LIKE '%주스%' AND 단가>=5000 AND 단가 <=10000;

-- 제품 테이블에서 제품번호가 1,2,4,7,11,20인 제품의 모든 정보를 보이시오.
SELECT 제품번호, 제품명, 포장단위, 단가,재고 FROM 제품 WHERE 제품번호 IN ('1', '2', '4', '7', '11', '2O');

-- 제품 테이블에서 재고금액이 높은 상위 10개 제품에 대해 제품번호, 제품명, 단가, 재고, 재고금액(단가 * 재고)을 보이시오.
SELECT 제품번호, 제품명, 포장단위, 단가,재고 ,( 단가*재고) AS 재고금액 FROM 제품 ORDER BY 재고금액 DESC 
LIMIT 10;


-- LEFT () , RIGHT() , SUBSTR(), SUBSTRING()_INDEX()
SELECT LEFT ('SQL 완전정복' ,3 )

SELECT RIGHT('SQL 완전정복' , 4)

SELECT SUBSTR('SQL 완전정복', 2,5)

SELECT SUBSTRING_INDEX('서울시 동작구 흑석로',' ', 2)

SELECT SUBSTRING_INDEX('서울시 동작구 흑석로', ' ', -2)



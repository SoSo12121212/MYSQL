SELECT 고객번호
      ,담당자명
      ,마일리지
      ,도시
FROM  고객
WHERE 도시 = '부산광역시'
UNION 
SELECT 고객번호 
      ,담당자명
      ,마일리지
      ,도시
FROM   고객
WHERE 마일리지 <1000
ORDER BY 1;

UDDATE 고객
SET 지역 =NULL
WHERE 지역= '';

-- IS NULL : 값이 NULL 이면 TRUE 아니면 FALSE를 반환하는 연산자
UPDATE 고객
SET 지역=''
WHERE 지역 IS NULL;

SELECT * FROM 고객
WHERE 지역 IS NULL;

-- IN : ~ 중에 하나가 있으면 TRUE (여러 개의 OR를 대체)
SELECT 고객번호
      ,담당자명
      ,담당자직위
FROM   고객
WHERE  담당자직위 ='영엽 과장'
OR     담당자직위='마케팅 과장';

-- BETWEEN AND : ~이상 ~ 이하 범위를 지정할 때 
SELECT 고객번호
      ,담당자명
      ,담당자직위
FROM   고객
WHERE  마일리지 >=100000
AND    마일리지 <=200000;

-- LIKE : 특정 문자열이 문자열에 포함되는지 확인
SELECT FROM 고객
WHERE 도시 LIKE '%광역시'
AND (고객번호 LIKE '_C%' OR 고객번호 LIKE '__C%');
-- 내장 함수
SELECT CHAR_LENGTH('HELLO')  -- 글자 길이
       ,LENGTH('HELLO')
       
-- 문자열 연결
SELECT CONCAT('DREAMS', 'COME', 'TRUE')       

-- 구분자를 이용한 문자열 연결
-- with Separator의 약자
   SELECT CONCAT_WS('-','DREAM','COME','TRUE' )

   
   SELECT TRIM(' I LIKE SQL ');
   SELECT REPLACE('010.1234.5678', '.', '-')
   
   SELECT REPEAT('*', 5)
   
   -- ELT
   SELECT ELT(2,'SQL' , 'JAVA', 'C')
   
   SELECT FIELD('JAVA','SQL', 'JAVA' ,'C' )
         ,FIND_IN_SET('JAVA', 'SQL,JAVA,C')
         ,INSTR('네 인생을 살아라','인생')
         
         
         
  -- 현재 날짜 시간 가져오기
  SELECT NOW(),SYSDATE();
  -- 현재 날짜 가져오기
  SELECT CURDATE();
  
  -- 날짜 간격 구하기
  SELECT NOW()
        ,DATEDIFF('2025-12-25', NOW())  -- 자정 기준
        ,TIMESTAMPDIFF(DAY, NOW(),'2025-5-5 10:00');
  

  SELECT NOW()
         ,DATEDIFF('2025-5-5 10:00', NOW() )
 
 -- 지정한 날짜를 기준으로 더한 날짜 구하기
  SELECT NOW( )
        ,ADDDATE(NOW( ),50);
        
  -- null 체크 함수
  SELECT IFNULL(NULL, 0); -- 1항이 NULL이 아니면 1항을 반환
                          -- 1항이 NULL이면 2항을 반환
  
  SELECT NULLIF(12*10, 120) -- 1항과 2항이 같으면 NULL을 반환
  SELECT NULLIF(12*10, 1200) -- 1항과 2항이 같지 않으면, 1항을 반환
  
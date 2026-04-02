-- 별칭 (Alias) 
-- 컬럼명이나 테이블명에 별칭을 붙여서 결과를 읽기 쉽게 만듭니다. 

use school;

select
 * 
from student; 

select
 student_id as 학번,
 name       as 이름 
from student; 

-- AS 생략 가능 
select s.student_id 학번, s.name 이름 from student s;

use shop; 
-- 계산 결과에도 별칭 
select name, price, price * 0.967 as 할인가격 from product;






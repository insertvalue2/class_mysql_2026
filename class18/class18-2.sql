use sns; 

-- 전체 게시글 수 
select count(*) as 게시글수 from post; 
select count(id) as 게시글수 from post; 

select * from like_log; 
select count(*) as 총좋아요수 from like_log;

-- 평균 조회수 
select avg(view_count) as 평균조회수 from post; 
select round(avg(view_count), 2) as 평균조회수 from post; 

-- 최대/최소 
select MAX(view_count) from post;
select MIN(view_count) from post;

-- 한번에 쿼리에서 최대 조회수 수 최소 조회수 수를 출력해보자. 
select
	max(view_count) as 최대조회수, 
    min(view_count) as 최소조회수 
from post;     



-- 문자열 함수 
-- CONCAT, UPPER, LOWER  (기본 가공) 
-- select nickname + ("a@naver.com") from user; 
select concat(nickname,'(', email, ')') as 회원정보 from user; 
select upper(email) as 대문자이메일 FROM user; 
select lower(email) as 소문자이메일 FROM user; 

-- substring, locate
-- LOCATE(찾을문자, 원본문자열) : 특정 문자가 시작되는 '위치'를 숫자로 반환 한다. 
-- SUBSTRING(원본문자열, 시작위치, 가져올길이)  : 원본문자열에서 정해진 범위만큼 잘라냅니다. 

select '안녕반가워';
-- mysql 에서 글자 순번은 서수적 표현을 사용한다 즉, 첫번째 글자, 두번째 글자로 사용 됨. 
select locate('@', 'abc@com');
select substring('abc@com', 1, 2);

-- 응용 (chulsoo.kim@gmail.com) --> (chulsoo.kim)
select * from user; 
select email, substring(email, 1, locate('@', email) - 1) as subemail from user; 


-- LENGTH vs CHAR_LENGTH
-- LENGTH(문자열): 문자열에 바이트 수를 반환한다. : MYSQL 한글 한글자는 UTF-8 (3바이트) 
-- CHAR_LENGTH(문자열) : 문자열에  글자 수 반환한다 (한글 사용시 권장) 

select "HI", LENGTH("HI") as 글자길이;
select "자바", LENGTH("자바") as 글자길이;

select "HI", CHAR_LENGTH("HI") as 글자길이;
select "자바", CHAR_LENGTH("자바") as 글자길이;


-- 조건 함수 
-- 조회수에 따라서 인기 등급 표시 

select title, view_count from post; 
-- 50보다면 '인기글' <-- 만약 30보다 크가면 '주목글' 

select
 title, 
 view_count,
 CASE 
	WHEN view_count >= 50 THEN  '인기글'
    WHEN view_count >= 30 THEN  '주목글'
    ELSE '일반글'
 END AS 인기등급  
 from post
 order by view_count DESC;


-- 날짜 함수 
-- 오늘 날짜 
select curdate() as 오늘;
select CURRENT_DATE as 오늘;

-- DATEDIFF : 날짜 차이 계산 
-- 가입 후 경과 일수 
select * from user; 

select
	nickname, 
    created_at, 
    datediff(current_date, "2025-04-02") as 가입일수 
from user;     


-- 가입 년도 / 월 추출 
select
 nickname, 
 YEAR(created_at) as 가입연도, 
 MONTH(created_at) as 가입월 
from user; 





-- 형 변환 함수 
select 
	title, 
    view_count
from post; 

-- MySQL 에서 VARCHAR 는 변환 불가 , CHAR 변환 가능 
select 
	title, 
    concat( cast(view_count as char), '회') as 조회수 
from post; 

select 
	title, 
    concat(view_count, '회') as 조회수 
from post; 


 









































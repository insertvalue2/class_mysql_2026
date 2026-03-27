-- DCL(Data Control Language) - 권한을 관리한다

-- 사용자 생성 (사람, 시스템에게 줄 수 있다) 
create user 'user1'@'localhost' identified by 'passowrd123';
-- localhost <--- 내 컴퓨터 안에서 접근하는 계정 
-- 외부 IP 에서 접근하게 하려면 ?? 찾아서 완성 해야 함. 

-- 조회 권한 부여 
grant SELECT on school.student to 'user1'@'localhost';

-- 권한 회수 
revoke select on school.student FROM 'user1'@'localhost'; 


-- 도전 문제 
-- 외부 사용자가 사용할 계정을 생성하고 조회 권한만 주고 접속 확인(계정을 받은 사람)  
-- IP 주소 확인 

-- 풀이 

-- 1. 로컬 접속 계정와 별개로 외부 접속용 계정 모두 만들어 줘야 한다. 필요없다면 로컬은 생성안해도 됨. 

create user 'tenco'@'localhost' identified by 'asd1234!';
create user 'tenco'@'%' identified by 'asd1234!';  -- 모든 IP 허용 

-- 2. 권한 부여 select, insert .. 추가 가능 하다. 모든 권한 부여 (ALL PRIVILEGES) 
grant all privileges on school.* to 'tenco'@'localhost';      -- *.*  RDBMS 안에 모든 db 모든 테이블
grant all privileges on school.* to 'tenco'@'%';

-- 권한 확인 
show grants for 'tenco'@'localhost';
show grants for 'tenco'@'%';

-- 참고, 추가된 권한이 바로 적용 안될 수 도 있음 
flush privileges;  -- 바로 적용 

-- 3. 권한 회수 
revoke ALL privileges on school.* from 'tenco'@'localhost';
revoke ALL privileges on school.* from 'tenco'@'%';

























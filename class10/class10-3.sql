use shop;
show tables; 

-- member 회원가입 
-- orders 테일 1번 회원이 주문한 목록 데이터가 있다고 가정 
-- 두 테이블에 FK 관계일 때  member 테이블에 접근해서 1번 회원을 삭제할 수 있을까요? 

select * from member; 
select * from orders; 
insert into orders(member_id, total_price) values (1, 10000);

-- FK 위반 why? orders 테이블에 member id 인 1번 데이터가 존재 하기 때문에 
-- member 테이블에 1번 회원을 삭제하면 하면 orders 테이블에 member_id 1 은 무의미한 데이터가 된다. 
delete from member where id = 1;
-- 2번은 바로 삭제 가능한가?  
delete from member where id = 2; 

-- 결론 orders 테이블에 존재하는 member_id 의 값 1을 먼저 삭제하고 member 테이블에 pk 인 1번 회원을 삭제할 수 있다. 
-- orders 테이블에 데이터 삭제 
delete from orders where member_id = 1; 


-- 현재　ｏｒｄｅｒｓ　테이블에　걸린　정확한　ＦＫ　이름을　확인　（명령문，ＧＵＩ　확인）　　
show create table orders;


-- 기존의　제약　조건을　삭제합니다．　
-- [단계 1] 기존의 제약 조건을 삭제합니다. 　
-- (보통 자동 생성된 이름은 orders_ibfk_1 같은 형태입니다.)
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;

-- [단계 2] CASCADE 옵션을 추가하여 제약 조건을 추후 새로 정의할 수 있습니다. 
-- 기존에는 테이블 생성시 키 제약을 추가 했다면 테이블 생성 후에도 키를 변경 수정 삭제 가능합니다. 
alter table orders 
add constraint fk_orders_member
foreign key(member_id) references member(id)
on delete cascade   -- 부모 삭제시 자식도 삭제 됨
on update cascade;   -- 부모 pk 수정 시 FK도 수정  



-- 테스트 
select * from member;
select * from orders;


insert into member(email, name) values ('hong@test.com', '홍길동');
insert into member(email, name) values ('kim@test.com', '김영희');

insert into orders(member_id, total_price) values (4, 10000);

-- 연쇄 수정 확인 
update member set id = 99 where id = 4;

-- 연쇄 삭제 확인 
delete from member where id = 99;





































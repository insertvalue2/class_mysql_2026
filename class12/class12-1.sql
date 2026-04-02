
-- DDL 

select * from product; 
-- product 테이블에 is_deleted 컬럼을 추가 (소프트 삭제용) 
alter table product add column is_deleted boolean default false;

select * from orders;
alter table orders add index idx_created_at (created_at);
show index from orders;


-- DML 
select * from member;
select * from member where grade = 'VIP';

select * from orders;
select * from orders where status = '배송중';

select * from product;
select * from product where stock < 50;

select * from product where category_id = 4;
select * from category;


-- update 연습 (반드시 실수를 하지 말자) 

-- 김영희 등급을 GOLD로 업그레이드  
select * from member where name = '김영희';
update member
set grade = 'GOLD'
where name = '김영희';

-- 주문 상태 변경 (결제대기 --> 결제완료) 
select * from orders where id = 6;

update orders
set status = '결제완료'
where id = 6; 


-- 상품 재고 감소(구매시 처리 되어 야 함) 
select * from product;

update product
set stock = stock - 1
where id = 1; 

 -- 3.3 할인된 금액으로 수정 
update product
set price = price * 0.967
where id = 1; 


-- delete (소프트 삭제) 
select * from product; 

update product 
set is_deleted = true
where id = 1; 

-- 삭제되지 않은 상품만 조회 
select * from product where is_deleted = false; 

-- -- 


select * from member;
-- 유니크 키 추가 , 안되는 이유 확인, 처리 
alter table member add constraint uk_email unique (email);
-- 또는 짧은 구문으로도 생성 가능 
alter table member add unique (email);

delete from member where email = 'hong@test.com';
delete from orders where member_id = 1; 

select * from member; 
select * from orders; 

-- UNIQUE  위반 
insert into member (email, name) values ('hong@test.com', '홍길동2');

-- FK 위반 
insert into orders(member_id, total_price) values (999, 5000);

-- Not Null 위반 
insert into product(category_id, price, stock) values (1, 500, 10);
























































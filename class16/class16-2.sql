use shop;

-- 데이터 확인 
select * from orders;
select * from product;

-- 주문 처리시 동시에 일어나야 하는 작업 
-- 1. orders 테이블에 주문 insert 
-- 2. order_item 테이블에 주문 상세 insert 
-- 3. product 테이블에 재로(stock) 감소 update 처리 

-- 트랜잭션 시작 
start transaction;

-- 1. 주문 생성 
insert into orders(member_id, total_price, status)
values(1, 1200000.00, '결제완료');

-- 2. 주문 상세 추가 
-- 방금 생성된 주문의 id 확인 
select LAST_INSERT_ID(); 

insert into order_item(order_id, product_id, quantity, price)
values(8, 1, 1, 1200000.00);

-- 3. 재고 감소 
update product 
set stock = stock - 1 
where id = 1; 

-- 모두 성공  (물리적인 저장소에 데이터 영구히 저장)
commit;










-- 트랜잭션 종료 (commit, rollback)




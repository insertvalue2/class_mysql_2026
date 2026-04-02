use shop; 

select * from orders; 
select * from product;

start transaction; 

-- 1. 주문 생성 
insert into orders (member_id, total_price, status) 
values (1, 1200000.00, '결제완료');

-- 2. 주문 상세 추가 id = 10 가정 
insert into order_item (order_id, product_id, quantity, price)
values (10, 1, 1, 1200000.00); 


-- 3. 재고 감소 
update product 
set stock = stock - 1 
where id = 1; 


-- 실패로 처리 
rollback; -- (기존에 수행 되었던 쿼리를 다시 시작점으로 초기화 처리) 


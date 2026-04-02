select * from product where id = 3; 
select * from order_item;

-- 트랜잭션 시작 
start transaction; 

-- 1. 주문 생성 
insert into orders (member_id, total_price, status) 
values (2, 2600000.00, '결제완료');

-- 2. 주문 상세 생성 
insert into order_item (order_id, product_id, quantity, price)
values (last_insert_id(), 3, 2, 2600000.00); 

-- 3. 재고 감소 
update product 
set stock = stock - 1 
where id = 3; 


-- 트랜잭션 종료 (commit) 
commit;
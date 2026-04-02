create database demo2; 

-- 테이블 생성 시 인덱스를 추가하는 벙법 
create table product(
	id int primary key auto_increment,
    category_id int not null, 
    name varchar(100) not null, 
    price decimal(10, 2) not null, 
    stock int default 0, 
    index idx_category (category_id),
    index idx_name (name)
);

select * from product; 
desc product; 

-- 테이블 생성 이후에 인덱스를 추가 하는 방법 
alter table product add INDEX idx_price (price);

-- 또는 create 사용해 됨 
create index idx_price on product (price);

-- 인덱스를 확인 하는 방법 
show index from product; 

-- 인덱스를 삭제 하는 방법 
drop index idx_price ON product; 


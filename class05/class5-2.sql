-- DML (데이터를 다룬다) 

select * from student; 

-- 데이터 추가 (insert) 
insert into student(student_id, name, grade, major, phone)
values(1001, '김철수', 2, '컴퓨터공학', '010-1234-1234');

insert into student(student_id, name, grade, major, phone)
values(1002, '이영희', 3, '경영학', '010-2222-2222'),
      (1003, '박민준', 1, '전자공학', '010-3333-3333');

-- 데이터 조회 (SELECT) 
select * from student;
-- 조건절 추가 하기 
select name, major, grade from student where grade = 2;

-- 데이터 수정 (UPDATE) (주의 - 조건절이 없으면 전체 수정이 됨 난리남!) 
update student set grade = 3; 

-- 데이터 삭제 (DELETE) (주의 - 조건절이 없으면 전체 삭제 됨 난리남!) 
delete from student where student_id = 1003;
delete from student;












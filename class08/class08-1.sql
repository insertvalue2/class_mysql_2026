use school;

-- 특정 컬럼만 조회
SELECT name, major FROM student;

-- WHERE 절 추가 
select * from student where name = '김철수';

-- 별칭 (AS) 사용
select student_id as 학번 , name as 이름 from student;

-- mysql 에서도 역시 연산자를 사용할 수 있다. 

select * from student where not name = '김철수';


select * from student where grade between 1 and 2;

select * from student where name in ('이영희', '최지아', '티모');

select * from student where name like '김%';

select * from student where name like '김%';

select * from student where major like '%학';

select * from student where major like '컴%';

select * from student where  major like '%퓨%';


--  null  컬럼에 null 값을 찾을 때는 = 는 사용하면 결과가 안나온다. 주의! 
select * from student where phone = null; 

select * from student where phone is null; 

select * from student where phone is not null; 













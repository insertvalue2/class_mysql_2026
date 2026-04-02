use school;

-- 학번 1001 학생의 학년을 3으로 수정 
select * from student where student_id = 1001;

update student
set grade = 3
where student_id = 1001;

-- 여러 컬럼 동시 수정 
-- 1004 학번에 grade = 3, phone = 010-7777-7777 
select * from student where student_id = 1004;

update student
set grade = 3, phone = '010-7777-7777'
where student_id = 1004;

-- 수강 테이블  
select * from enrollment; 
select * from subject; 
-- 수강 취소는 삭제로 처리 함. enrollment 테이에서의 의미. 

-- 삭제 쿼리 
delete from enrollment 
where enrollment_id = 8; 

select * from enrollment;

delete from enrollment 
where student_id = 1004;


select * from student where major = '경영학'; 

update student 
set grade = grade + 1 
where major = '경영학'

























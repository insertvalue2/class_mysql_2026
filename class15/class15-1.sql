-- 결과 확인
SELECT * FROM student;
SELECT * FROM subject;
SELECT * FROM enrollment;

-- INNER JOIN : 매칭되는 데이터만 
-- 두 테이블에 모두에 매칭되는 행만 결합 합니다. 조건이 맞지 않으면 결과에서 제외됩니다. 

-- 학생 이름 + 수강한 과목명 + 점수 

select 
	s.name as 학생이름, 
    su.subject_name as 과목명, 
    e.score
from enrollment as e
inner join student as s ON e.student_id = s.student_id
inner join subject as su on  e.subject_id = su.subject_id;


select * from student;

insert into student(student_id, name, grade, major) 
values(10, '티모', 3, '몰라');

-- LEFT JOIN (왼쪽 테이블 전체 포함) 
-- 왼쪽 테이블의 모든 행을 모합합니다 
-- 오른쪽 테이블에 매칭 데이터가 없으면 NULL로 채웁니다. 

-- 모든 학생을 조회, 수강 기록이 없는 학생도 포함, 과목명도 포함 
select 
	s.name as 학생이름, 
    su.subject_name as 과목명, 
    e.score as 점수 
from student s 
left join enrollment e on s.student_id = e.student_id
left join subject su on e.subject_id = su.subject_id;


-- RIGHT JOIN : 오른쪽 테이블 기준으로 모든 행을 포함합니다. 

select
	s.name as 학생이름, 
    su.subject_name as 과목명, 
    e.score as 점수 
from student s 
right join enrollment e on s.student_id = e.student_id
right join subject su on e.subject_id = su.subject_id;
-- student -> enrollment --> subject 순서로 오른쪽으로 밀어가면 RIGHT JOIN 을 걸면 
-- 기준이 되는 subject 의 모든 행이 보존됩니다. 

insert into subject(subject_id, subject_name, credit, professor) 
values (105, '과학', 3, '정교수');

-- 위 RIGHT JOIN 쿼리와 동일한 결과를 LEFT JOIN 으로 표현해 보자. 
select
	s.name as 학생이름, 
    su.subject_name as 과목명, 
    e.score as 점수 
from subject su 
left join enrollment e on su.subject_id = e.subject_id 
left join student s on e.student_id = s.student_id;

-- subejct 를 기준(왼쪽)에 두고 LEFT JOIN 으로 연결하는 것이 더 직관적이다. 
-- RIGHT JOIN 은 기준 테이블 오른쪽에 있어 가독성이 떨어지므로 
-- 실무에서는 LEFT JOIN 으로 방향을 통일하는 것을 권장한다. 

drop database sns;

create database sns; 
use sns;

-- user 테이블 생성 
create table user(
	id int primary key auto_increment, 
    nickname varchar(50) not null unique, 
    email varchar(100) not null unique, 
    created_at datetime default current_timestamp
);

-- 게시글 테이블 
create table post(
	id int primary key auto_increment, 
    user_id int not null, 
    title varchar(200) not null, 
    content text, 
    view_count int default 0, 
    created_at datetime default current_timestamp,
    foreign key(user_id) references user(id)
);

-- 댓글 테이블 
create table comment(
	id int primary key auto_increment, 
    content text not null, 
    user_id int not null, 
    post_id int not null, 
    created_at datetime default current_timestamp, 
    foreign key(user_id) references user(id), 
    foreign key(post_id) references post(id)
);

-- 좋아요 테이블 
create table like_log(
	id int primary key auto_increment, 
    user_id int not null, 
    post_id int not null, 
	created_at datetime default current_timestamp, 
    -- 한 사용자가 같은 게시글에는 좋아요 한번만 할 수 있게 해야 한다. 
	unique(post_id, user_id), 
    foreign key(post_id) references post(id), 
    foreign key(user_id) references user(id)
);



INSERT INTO user (nickname, email) VALUES 
('김철수', 'chulsoo.kim@gmail.com'),
('이영희', 'younghee99@naver.com'),
('박지성', 'js.park@daum.net'),
('최유진', 'yujin_choi@kakao.com'),
('정민준', 'mj_jeong@outlook.com');


INSERT INTO post (user_id, title, content, view_count) VALUES 
(1, '오늘 날씨가 정말 좋네요', '산책하기 딱 좋은 날씨입니다. 다들 뭐하시나요?', 15),
(2, 'SQL 공부 시작했습니다!', '생각보다 재미있는데 foreign key 개념이 어렵네요.', 42),
(3, '자바스크립트 비동기 처리 정리', 'Promise와 Async/Await에 대해 정리해 보았습니다...', 120),
(1, '맛집 추천 받아요', '서울 강남역 근처에 점심 먹기 좋은 곳 있을까요?', 8),
(4, '데이터베이스 설계 시 유의사항', '인덱스 설정과 정규화는 매우 중요한 요소입니다.', 200);


INSERT INTO comment (content, user_id, post_id) VALUES 
('동감입니다! 저도 방금 공원 다녀왔어요.', 2, 1),
('열공하세요! 궁금한 건 언제든 물어보세요.', 3, 2),
('포스팅 너무 잘 읽었습니다. 큰 도움이 되었어요!', 4, 3),
('강남역 5번 출구 앞 돈까스집 추천합니다.', 5, 4),
('정규화는 정말 끝이 없는 것 같아요.', 1, 5),
('혹시 반정규화에 대해서도 다뤄주실 수 있나요?', 2, 5);

INSERT INTO like_log (user_id, post_id) VALUES 
(2, 1), -- 이영희가 김철수의 글에 좋아요
(3, 1), -- 박지성이 김철수의 글에 좋아요
(1, 2), -- 김철수가 이영희의 글에 좋아요
(4, 3), -- 최유진이 박지성의 글에 좋아요
(5, 3), -- 정민준이 박지성의 글에 좋아요
(2, 5), -- 이영희가 정민준의 글에 좋아요
(3, 5); -- 박지성이 정민준의 글에 좋아요




















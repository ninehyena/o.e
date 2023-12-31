select * from tab;
drop table oe_cmt;
drop table oe_review;
drop table oe_schedule;
drop table oe_application_list;
drop table oe_lesson_detail;
drop table oe_lesson;
drop table oe_member;
drop table oe_notice;
drop table oe_board;

drop sequence oe_lesson_seq;
drop sequence oe_cmt_seq;
drop sequence oe_review_seq;
drop sequence oe_notice_seq;
drop sequence oe_board_seq;


-- 회원 테이블
create table oe_member(
    m_id varchar2(12 char) primary key,
    m_pw varchar2(12 char) not null,
    m_lesson varchar2(15 char) not null,		-- 강습: lesson 과 교습: not_lesson
    m_nickname varchar2(30 char) not null,
    m_phone varchar2(13 char) not null,
    m_email varchar2(100 char) not null,
    m_addr1 varchar2(20 char) not null,
    m_addr2 varchar2(50 char) not null,
    m_addr3 varchar2(40 char) not null
);

select * from oe_member;
delete from OE_MEMBER where m_id='qwe12'
select * from OE_APPLICATION_LIST where a_status = 1 or a_status = 0

-- 관리자 계정
insert into oe_member values('admin', '1234', '관리자', '관리자', '00', 'projectoe72@gmail.com', '00', '00', '00');

-- 레슨 테이블
create table oe_lesson(
	l_num number primary key,					-- 레슨 번호
	l_type varchar2(5 char) not null,			-- 취미 / 준비
	l_category varchar2(20 char) not null,		-- 음악 카테고리
	l_teacher_id varchar2(12 char) not null,	-- 회원T에서 FK 받아오기
	l_level varchar2(5 char) not null,			-- 레슨 레벨 
	l_regdate date default sysdate not null,		-- 등록일
	constraint fk_id foreign key(l_teacher_id)
		references oe_member(m_id)
		on delete cascade
);

create sequence oe_lesson_seq;
select * from oe_lesson;
select * from OE_SCHEDULE;
select * from OE_LESSON_DETAIL;

-- 레슨 상세 테이블
create table oe_lesson_detail(
	l_num number primary key,					-- 레슨 번호 oe_lesson의 l_num 참조
	l_location varchar2(100 char) not null,		-- 레슨 지역
	l_room varchar2(50 char) not null,					-- 레슨 장소 (연습실 없으면 null)
	l_photo varchar2(255 char) not null,					-- 프로필 사진
	l_level_of_education1 varchar2(30 char),	-- 학력 (고등학교)
	l_level_of_education2 varchar2(30 char),	-- 학력 (대학교)
	l_major varchar2(30 char),					-- 전공 (대학교)
	l_career1 varchar2(30 char),				-- 이력 1
	l_career2 varchar2(30 char),				-- 이력 2
	l_career3 varchar2(30 char),				-- 이력 3
	l_content varchar2(500 char) not null,		-- 레슨 내용
	l_pay number not null,						-- 레슨 비용
	l_day varchar2(50 char) not null,			-- 레슨 요일 (체크박스)
	l_student number default 0,					-- 수강생 수
	constraint fk_num foreign key(l_num)
		references oe_lesson(l_num)
		on delete cascade
);

select * from oe_lesson_detail;
update OE_LESSON_DETAIL set l_photo = 'common.jpg';

-- 신청 목록
create table oe_application_list(
	l_num number not null,					-- 레슨 테이블의 레슨 번호
	a_id varchar2(12 char) not null,				-- 회원 테이블의 회원 아이디 (수강생)
	a_status number default 0 not null,		-- 레슨 상태
	a_date date default sysdate not null, 	-- 레슨 신청일
	constraint a_fk_id foreign key(a_id)
		references oe_member(m_id)
		on delete cascade,
	constraint a_fk_num foreign key(l_num)
		references oe_lesson(l_num)
		on delete cascade	
);

select * from oe_application_list;

-- 댓글 테이블
create table oe_cmt(
	c_num number primary key,
	l_num number not null,
	c_id varchar2(12 char) not null,
	c_content varchar2(200 char) not null,
	c_regdate date default sysdate not null,
	c_indent number default 0,
	c_ansnum number default 0,
	constraint cmt_no foreign key(l_num)
		references oe_lesson(l_num)
		on delete cascade,
	constraint cmt_id foreign key(c_id)
		references oe_member(m_id)
		on delete cascade
);

create sequence oe_cmt_seq;
select * from oe_cmt;

-- 리뷰
create table oe_review(
	r_num number primary key,
	l_num number not null, 			-- 레슨 테이블의 레슨 번호
	a_id varchar2(12 char) not null,		-- 회원 테이블의 회원 아이디 (수강생)
	r_star number not null,			-- 별점
	r_level number not null,		-- 수업 수준 0:쉬웠어요 1: 딱 맞아요 2: 어려워요
	r_recommend number not null,	-- 0: 비추천 1: 추천
	r_content varchar2(200 char) not null,	-- 내용
	r_regdate date default sysdate not null,
	constraint r_fk_num foreign key(l_num)
		references oe_lesson(l_num)
		on delete cascade,
	constraint r_fk_id foreign key(a_id)
		references oe_member(m_id)
		on delete cascade
);

create sequence oe_review_seq;
select * from oe_review;

-- 공지사항
CREATE TABLE oe_notice (
    n_no         NUMBER(10, 0) PRIMARY KEY,
    n_title      VARCHAR2(200 char) NOT NULL,
    n_content    VARCHAR2(2000 char) NOT NULL,
    n_regdate    DATE DEFAULT sysdate NOT NULL,
    n_updatedate DATE DEFAULT sysdate
);

create sequence oe_notice_seq;

-- 정보 게시판
CREATE TABLE oe_board (
    b_no         NUMBER(10, 0) PRIMARY KEY,
    b_category   VARCHAR2(50 char) NOT NULL,
    b_title      VARCHAR2(200 char) NOT NULL,
    b_content    VARCHAR2(4000 char),
    b_poster 	 VARCHAR2(500 char),
    b_regdate    DATE DEFAULT sysdate NOT NULL,
    b_updatedate DATE DEFAULT sysdate
);

create sequence oe_board_seq;
select * from oe_board;

-- 레슨 일정 
create table oe_schedule(
	m_id varchar2(12 char) not null,
	a_id varchar2(12 char) not null,
	s_title varchar2(50 char) not null,
	s_start date not null,
	s_end date not null,
	constraint fk_s_id foreign key(m_id)
		references oe_member(m_id)
		on delete cascade,
	constraint fk_s_id2 foreign key(a_id)
		references oe_member(m_id)
		on delete cascade
);
------------------------------------------------------------------------------------------
-- 샘플 데이터
insert into oe_member values('user1', '1234', 'not_lesson', '유저1', '01011111111', '1@naver.com', '우편번호', '1', '2');
insert into oe_member values('user2', '1234', 'not_lesson', '유저2', '01022222222', '2@naver.com', '우편번호', '1', '2');
insert into oe_member values('user3', '1234', 'not_lesson', '유저3', '01033333333', '3@naver.com', '우편번호', '1', '2');
insert into oe_member values('user4', '1234', 'not_lesson', '유저4', '01044444444', '4@naver.com', '우편번호', '1', '2');
insert into oe_member values('user5', '1234', 'not_lesson', '유저5', '01055555555', '5@naver.com', '우편번호', '1', '2');
insert into oe_member values('user6', '1234', 'not_lesson', '유저6', '01060606060', '16@naver.com', '우편번호', '1', '2');
insert into oe_member values('user7', '1234', 'not_lesson', '유저7', '01070707070', '17@naver.com', '우편번호', '1', '2');
insert into oe_member values('user8', '1234', 'not_lesson', '유저8', '01080808080', '18@naver.com', '우편번호', '1', '2');
insert into oe_member values('user9', '1234', 'not_lesson', '유저9', '01009099090', '19@naver.com', '우편번호', '1', '2');
insert into oe_member values('user10', '1234', 'not_lesson', '유저10', '01088775566', '20@naver.com', '우편번호', '1', '2');

insert into oe_member values('test1', '1234', 'lesson', '테스트1', '01066666666', '6@naver.com', '우편번호', '1', '2');
insert into oe_member values('test2', '1234', 'lesson', '테스트2', '01077777777', '7@naver.com', '우편번호', '1', '2');
insert into oe_member values('test3', '1234', 'lesson', '테스트3', '01088888888', '8@naver.com', '우편번호', '1', '2');
insert into oe_member values('test4', '1234', 'lesson', '테스트4', '01099999999', '9@naver.com', '우편번호', '1', '2');
insert into oe_member values('test5', '1234', 'lesson', '테스트5', '01012345678', '10@naver.com', '우편번호', '1', '2');
insert into oe_member values('test6', '1234', 'lesson', '테스트6', '01098765432', '11@naver.com', '우편번호', '1', '2');
insert into oe_member values('test7', '1234', 'lesson', '테스트7', '01012341234', '12@naver.com', '우편번호', '1', '2');
insert into oe_member values('test8', '1234', 'lesson', '테스트8', '01045674567', '13@naver.com', '우편번호', '1', '2');
insert into oe_member values('test9', '1234', 'lesson', '테스트9', '01098989898', '14@naver.com', '우편번호', '1', '2');
insert into oe_member values('test10', '1234', 'lesson', '테스트10', '01012302574', '15@naver.com', '우편번호', '1', '2');
insert into oe_member values('test11', '1234', 'lesson', '테스트11', '01098765436', '21@naver.com', '우편번호', '1', '2');
insert into oe_member values('test12', '1234', 'lesson', '테스트12', '01012341237', '22@naver.com', '우편번호', '1', '2');
insert into oe_member values('test13', '1234', 'lesson', '테스트13', '01045674561', '23@naver.com', '우편번호', '1', '2');
insert into oe_member values('test14', '1234', 'lesson', '테스트14', '01098989894', '24@naver.com', '우편번호', '1', '2');
insert into oe_member values('test15', '1234', 'lesson', '테스트15', '01012302578', '25@naver.com', '우편번호', '1', '2');

insert into OE_LESSON values(oe_lesson_seq.nextval, '준비', '통기타', 'test1', '고급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '통기타', 'test2', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '준비', '드럼', 'test3', '고급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '베이스', 'test4', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '준비', '베이스', 'test5', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '하프', 'test6', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '준비', '작곡', 'test7', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '바이올린', 'test8', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '준비', '일렉기타', 'test9', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '피아노', 'test10', '중급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '하프', 'test11', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '준비', '작곡', 'test12', '중급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '준비', '바이올린', 'test13', '고급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '일렉기타', 'test14', '초급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '피아노', 'test15', '중급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '피아노', 'test15', '중급', sysdate);
insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '피아노', 'test1', '중급', sysdate);

select * from oe_lesson;

insert into OE_LESSON_DETAIL values(1, '성남 분당구', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '통기타 수업', 10000, '토요일', 0);
insert into OE_LESSON_DETAIL values(2, '서울 성북구', '기타', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '통기타 수업', 15000, '토요일, 일요일', 0);
insert into OE_LESSON_DETAIL values(3, '서울 마포구', '기타', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '드럼 수업', 20000, '조율 가능', 0);
insert into OE_LESSON_DETAIL values(4, '경기 구리시 수택동', '연습실 대관', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '베이스 수업', 30000, '수요일, 금요일', 0);
insert into OE_LESSON_DETAIL values(5, '서울 용산구', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '베이스 수업', 50000, '조율 가능', 0);
insert into OE_LESSON_DETAIL values(6, '서울 동대문구', '연습실 대관', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '하프 수업', 25000, '화요일', 0);
insert into OE_LESSON_DETAIL values(7, '경기 부천시 원미동', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '작곡 수업', 20000, '월요일, 목요일', 0);
insert into OE_LESSON_DETAIL values(8, '경기 하남시 망월동', '연습실 대관', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '바이올린 수업', 18000, '토요일', 0);
insert into OE_LESSON_DETAIL values(9, '서울 송파구', '기타', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '일렉기타 수업', 15000, '조율 가능', 0);
insert into OE_LESSON_DETAIL values(10, '서울 송파구', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '피아노 수업', 20000, '조율 가능', 0);
insert into OE_LESSON_DETAIL values(11, '서울 강남구', '연습실 대관', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '하프 수업', 25000, '화요일', 0);
insert into OE_LESSON_DETAIL values(12, '서울 강남구', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '작곡 수업', 20000, '월요일, 목요일', 0);
insert into OE_LESSON_DETAIL values(13, '서울 성북구', '연습실 대관', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '바이올린 수업', 18000, '토요일', 0);
insert into OE_LESSON_DETAIL values(14, '서울 용산구', '기타', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '일렉기타 수업', 15000, '조율 가능', 0);
insert into OE_LESSON_DETAIL values(15, '서울 송파구', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '피아노 수업', 20000, '조율 가능', 0);
insert into OE_LESSON_DETAIL values(16, '서울 송파구', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '피아노 수업', 25000, '조율 가능', 0);
insert into OE_LESSON_DETAIL values(17, '서울 송파구', '개인 연습실', 'common.jpg', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '실용음악과', 'ㅊㅊ학원 강사', null, null, '피아노 수업', 65000, '조율 가능', 0);

insert into OE_APPLICATION_LIST values(61, 'user1', 0, sysdate);
insert into OE_APPLICATION_LIST values(61, 'user10', 0, sysdate);
insert into OE_APPLICATION_LIST values(61, 'user5', 0, sysdate);
insert into OE_APPLICATION_LIST values(61, 'user3', 0, sysdate);
insert into OE_APPLICATION_LIST values(62, 'user2', 0, sysdate);
insert into OE_APPLICATION_LIST values(63, 'user3', 0, sysdate);
insert into OE_APPLICATION_LIST values(64, 'user9', 0, sysdate);
insert into OE_APPLICATION_LIST values(65, 'user8', 0, sysdate);
insert into OE_APPLICATION_LIST values(66, 'user7', 0, sysdate);
insert into OE_APPLICATION_LIST values(66, 'user6', 0, sysdate);
insert into OE_APPLICATION_LIST values(67, 'user6', 0, sysdate);
insert into OE_APPLICATION_LIST values(67, 'user7', 0, sysdate);
insert into OE_APPLICATION_LIST values(67, 'user1', 0, sysdate);
insert into OE_APPLICATION_LIST values(67, 'user2', 0, sysdate);
insert into OE_APPLICATION_LIST values(67, 'user3', 0, sysdate);

select * from OE_APPLICATION_LIST;

-------------------------------------------------------------------------------
-- 쿼리문
select *
from oe_lesson a, oe_lesson_detail b
where a.l_num = b.l_num
order by l_regdate desc;

select count(*) from oe_lesson a, oe_lesson_detail b where a.l_num = b.l_num;
select a.l_num, a.l_type, a.l_category, a.l_teacher_id, a.l_level
from oe_lesson a, oe_lesson_detail b ;
	
select rownum, a.*
from oe_lesson a, oe_lesson_detail b 
where  a.l_num = b.l_num
order by a.l_num desc;

delete from oe_lesson where l_num = 26;
delete from oe_lesson_detail where l_num = 26;
--------------------------------------------------------------------------------
select * from ( 
	select rownum as rn, d.*
	from ( select rownum, a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*, c.a_id, c.a_status, c.a_date
			from oe_lesson a, oe_lesson_detail b, oe_application_list c
			where a.l_num = b.l_num
			and a.l_num = c.l_num
			and (a.l_teacher_id = 'aaaa' or c.a_id = 'aaaa')
			order by b.l_num desc
	) d
);

select * from ( 
	select rownum as rn, d.*
	from ( select rownum, a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*
			from oe_lesson a, oe_lesson_detail b
			where a.l_num = b.l_num
			and a.l_teacher_id = 'aaaa'
			order by b.l_num desc
	) d
);

select * from OE_LESSON_DETAIL;


select a.l_num, count(a.l_num)
from oe_lesson a inner join oe_application_list b on a.l_num = b.l_num
where a.l_teacher_id = 'aaaa' 
and b.a_status = 0
group by a.l_num;

select a.l_num, count(a.l_num)
from oe_lesson a inner join oe_application_list b on a.l_num = b.l_num
where a.l_teacher_id = 'aaaa' 
group by a.l_num;

select * from oe_lesson a, oe_lesson_detail b where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num;
select * from oe_application_list;

select rownum, a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.* 
from oe_lesson a, oe_lesson_detail b
where a.l_num = b.l_num
and a.l_teacher_id = 'aaaa'
order by b.l_num desc;
--------------------------------------------------------------------
select * 
from oe_lesson a, oe_lesson_detail b, 
(select c.l_num as l_num, count(c.l_num)
from oe_lesson c inner join oe_application_list d on c.l_num = d.l_num
where c.l_teacher_id = 'aaaa' 
group by c.l_num) subquery1
where a.l_teacher_id = 'aaaa' 
and a.l_num = b.l_num
and a.l_num = subquery1.l_num
order by a.l_num desc;

select c.l_num, count(c.l_num)
from oe_lesson c inner join oe_application_list d on c.l_num = d.l_num
where c.l_teacher_id = 'aaaa' 
group by c.l_num;

--
select * from ( 
					select rownum as rn, e.*
					from ( select rownum , a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*, subquery1.cnt
							from oe_lesson a, oe_lesson_detail b, 
								(select d.l_num as l_num, count(d.l_num) as cnt
								from oe_lesson c inner join oe_application_list d on c.l_num = d.l_num
								where c.l_teacher_id = 'aaaa' and d.a_status = 0
								group by d.l_num) subquery1
							where a.l_teacher_id = 'aaaa' 
							and a.l_num = b.l_num
							and a.l_num = subquery1.l_num
							order by a.l_num desc
					) e
				
			) where rn >= 1 and rn <= 5;
			
-- getMyList2 수정 전
select * from ( 
					select rownum as rn, e.*
					from ( select rownum , a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*, subquery1.cnt
							from oe_lesson a, oe_lesson_detail b, 
								(select d.l_num as l_num, count(d.l_num) as cnt
								from oe_lesson c inner join oe_application_list d on c.l_num = d.l_num
								where c.l_teacher_id = #{m_id} and d.a_status = 0
								group by d.l_num) subquery1
							where a.l_teacher_id = #{m_id} 
							and a.l_num = b.l_num
							and a.l_num = subquery1.l_num
							order by a.l_num desc
					) e
			) where rn >= #{start} and rn <= #{end}
-- 수정 후
select rownum , a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*, nvl((select count(d.l_num) 
from oe_lesson c inner join oe_application_list d on c.l_num = d.l_num
where c.l_teacher_id = 'aaaa' and d.a_status = 0
group by d.l_num), 0) as cnt
from oe_lesson a, oe_lesson_detail b
where a.l_teacher_id = 'aaaa' 
and a.l_num = b.l_num
order by a.l_num desc;

select rownum as rn, e.*
from ( select rownum , a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*, subquery1.cnt
		from oe_lesson a, oe_lesson_detail b, 
			(select d.l_num as l_num, nvl(count(d.l_num), 0) as cnt
			from oe_lesson c inner join oe_application_list d on c.l_num = d.l_num
			where c.l_teacher_id = 'aaaa' and d.a_status = 0
			group by d.l_num) subquery1
		where a.l_teacher_id = 'aaaa'
		and a.l_num = b.l_num
		and a.l_num = subquery1.l_num
		order by a.l_num desc
) e

--------------------------------------------------------------------------------
select * from oe_lesson;
select * from oe_lesson_detail;
select * from oe_application_list;

select *
from oe_application_list
where l_num = #{l_num} and a_status = 0
		
select a.l_num, b.l_num, a.l_type, a.l_category, a.l_level, b.a_id, b.a_status, b.a_date
from oe_lesson a, oe_application_list b
where a.l_num = b.l_num and b.l_num = 60;

select count(*)
from oe_lesson a, oe_application_list b
where a.l_num = b.l_num and a.l_num = 61;

select * from ( 
	select rownum as rn, c.*
	from ( select rownum, a.l_type, a.l_category, a.l_level, b.*
	from oe_lesson a, oe_application_list b
	where a.l_num = b.l_num and a.l_num = 61
	) c
);

select * from ( 
					select rownum as rn, c.*
					from ( select rownum, a.l_type, a.l_category, a.l_level, b.*
					from oe_lesson a, oe_application_list b
					where a.l_num = b.l_num and a.l_num = 61
					order by b.a_date desc
					) c
				) where rn >= 1 and rn <= 5;
				
select rownum as rn, c.*
					from ( select rownum, a.l_type, a.l_category, a.l_level, b.*
					from oe_lesson a, oe_application_list b
					where a.l_num = b.l_num and a.l_num = 61
					order by b.a_date desc
					) c
					
--------------------------
select * from ( 
select rownum as rn, b.*
from ( select rownum, a.*
from oe_review a
where l_num = 61
order by r_regdate desc
) b
) where rn >= 1 and rn <= 1;
--------------------------
select * from oe_review;
insert into oe_review values(oe_review_seq.nextval, 61, 'user1', 3, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user2', 1, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user3', 4, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user4', 3, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user5', 2, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user6', 1, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user7', 4, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user8', 2, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 61, 'user9', 5, 0, 1, 'test', sysdate);

insert into oe_review values(oe_review_seq.nextval, 60, 'user5', 2, 0, 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 60, 'user6', 1, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 60, 'user7', 4, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 60, 'user8', 2, 'test', sysdate);
insert into oe_review values(oe_review_seq.nextval, 60, 'user9', 5, 'test', sysdate);

select rownum as rn, c.*, (select e.cnt
from (select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt 
		from oe_lesson a, OE_APPLICATION_LIST b 
		where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num 
		group by b.l_num, b.a_status 
		order by b.l_num desc
		) e
		where e.a_status = 0) as cnt
from ( select rownum , a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*
		from oe_lesson a, oe_lesson_detail b
		where a.l_teacher_id = 'aaaa'
		and a.l_num = b.l_num
		order by a.l_num desc
) c

select * from OE_APPLICATION_LIST;
select b.l_num, b.a_status, count(b.a_status) from oe_lesson a, OE_APPLICATION_LIST b where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num group by b.l_num, b.a_status order by b.l_num desc
select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt from oe_lesson a, OE_APPLICATION_LIST b where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num group by b.l_num, b.a_status order by b.l_num desc

select *
from (select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt from oe_lesson a, OE_APPLICATION_LIST b where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num group by b.l_num, b.a_status order by b.l_num desc
) c
where c.a_status = 0

select e.l_num, e.cnt
from (select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt 
		from oe_lesson a, OE_APPLICATION_LIST b 
		where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num  and b.a_status = 0
		group by b.l_num, b.a_status 
		order by b.l_num desc
		where b.a_status = 0
		) e
		where e.a_status = 0

select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt 
from oe_lesson a, OE_APPLICATION_LIST b 
where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num  and b.a_status = 0
group by b.l_num, b.a_status 
order by b.l_num desc

select rownum as rn, c.*
from ( select a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*
		from oe_lesson a, oe_lesson_detail b
		where a.l_teacher_id = 'aaaa'
		and a.l_num = b.l_num
		order by a.l_num desc
) c

-- 20230720 getMyLesson2
select rownum as rn, z.*
from (select rownum, nvl(x.cnt, 0) cnt, y.*
from (select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt 
from oe_lesson a, OE_APPLICATION_LIST b 
where a.l_teacher_id = 'aaaa' and a.l_num = b.l_num  and b.a_status = 0
group by b.l_num, b.a_status 
order by b.l_num desc) x right outer join (select a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*
		from oe_lesson a, oe_lesson_detail b
		where a.l_teacher_id = 'aaaa'
		and a.l_num = b.l_num
		order by a.l_num desc
) y on x.l_num = y.l_num) z

delete from oe_lesson
where l_num not in (select a.l_num from oe_lesson a, oe_lesson_detail b where a.l_num = b.l_num);
select * from oe_lesson;

select count(r_level)
from oe_review
where l_num = 83 and r_level = 1

select rownum as rn, d.*
from ( select rownum, a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*, c.a_id, c.a_status, c.a_date
		from oe_lesson a, oe_lesson_detail b, oe_application_list c
		where a.l_num = b.l_num
		and a.l_num = c.l_num
		and c.a_id = 'user1'
		order by b.l_num desc
) d

select rownum as rn, d.* from(
select rownum, x.m_phone, y.*
from oe_member x, (
select a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*, c.a_id, c.a_status, c.a_date
from oe_lesson a, oe_lesson_detail b, oe_application_list c
where a.l_num = b.l_num
and a.l_num = c.l_num
and c.a_id = 'user1'
order by b.l_num desc
) y
where x.m_id = y.l_teacher_id) d;


select rownum, h.m_phone, i.* 
from(
	select nvl(x.cnt, 0) cnt, y.*
	from (select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt 
	from oe_lesson a, OE_APPLICATION_LIST b 
	where a.l_teacher_id = 'test1' and a.l_num = b.l_num  and b.a_status = 0
	group by b.l_num, b.a_status 
	order by b.l_num desc) x right outer join (select a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*
			from oe_lesson a, oe_lesson_detail b
			where a.l_teacher_id = 'test1'
			and a.l_num = b.l_num
			order by a.l_num desc
	) y on x.l_num = y.l_num ) i, oe_member h, oe_application_list j
where j.a_id = h.m_id;

select * from oe_lesson;

select rownum as rn, c.*
from ( select rownum, a.l_type, a.l_category, a.l_level, b.*
from oe_lesson a, oe_application_list b
where a.l_num = b.l_num and a.l_num = 41 and b.a_id is not null
order by b.a_date desc
) c

select rownum, a.l_type, a.l_category, a.l_level, b.*, c.m_phone
from oe_lesson a, oe_application_list b, oe_member c
where a.l_num = b.l_num and a.l_num = 41 and b.a_id is not null and b.a_id = c.m_id
order by b.a_date desc

select * from ( 
	select rownum as rn, c.*
	from ( select rownum, a.l_type, a.l_category, a.l_level, b.*
	from oe_lesson a, oe_application_list b
	where a.l_num = b.l_num and a.l_num = 41 and b.a_id is not null
	order by b.a_date desc
	) c
) where rn >= 1 and rn <= 5
				
select * from ( 
	select rownum as rn, d.*
	from ( select rownum, a.l_type, a.l_category, a.l_level, b.*, c.m_phone
			from oe_lesson a, oe_application_list b, oe_member c
			where a.l_num = b.l_num and a.l_num = 41 and b.a_id is not null and b.a_id = c.m_id
			order by b.a_date desc
	) d
) where rn >= 1 and rn <= 5


-- 음악 카테고리 별 수강생 수
select a.l_category, SUM(b.l_student) AS cnt
from OE_LESSON a, OE_LESSON_DETAIL b
where a.l_num = b.l_num
group by a.l_category
order by SUM(b.l_student) desc;

select rownum as rn, d.*
from ( select rownum, a.l_category, SUM(b.l_student) AS "수강생 수"
from OE_LESSON a, OE_LESSON_DETAIL b
where a.l_num = b.l_num
group by a.l_category
order by SUM(b.l_student) desc
) d

-- 레슨 인기순
select to_date(to_char(sysdate - 6, 'DD'), 'DD') from dual;
select to_date(to_char(sysdate, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS') from dual;

-- 레슨별 신청자 주간 통계
select a.*, b.l_pay, c.cnt 
from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
from OE_APPLICATION_LIST
where a_date > to_date(to_char(sysdate - 6, 'DD'), 'DD') and a_date <= to_date(to_char(sysdate, 'DD'), 'DD')
group by l_num
order by count(*) desc) c
where a.l_num = b.l_num
and a.l_num = c.l_num;

select * from ( 
select rownum as rn, d.*
from ( select rownum, a.*, b.l_pay, c.cnt 
		from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
		from OE_APPLICATION_LIST
		where a_date > to_date(to_char(sysdate - 6, 'DD'), 'DD') and a_date <= to_date(to_char(sysdate, 'DD'), 'DD')
			group by l_num
			order by count(*) desc) c
			where a.l_num = b.l_num
			and a.l_num = c.l_num
			order by c.cnt desc
	) d
) where rn >= 1 and rn <= 6

select * from oe_lesson
select * from OE_LESSON_DETAIL
select * from OE_APPLICATION_LIST

select l_num, count(l_num)
from OE_APPLICATION_LIST
where a_date > to_date(to_char(sysdate - 6, 'DD'), 'DD') and a_date <= to_date(to_char(sysdate, 'DD'), 'DD')
group by l_num
order by count(l_num) desc

select * from ( 
	select rownum as rn, d.*
	from ( select rownum, a.l_num, a.l_type, a.l_category, a.l_teacher_id, a.l_level, b.l_pay, b.l_student, c.cnt 
			from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
			from OE_APPLICATION_LIST
			where a_date > to_date(to_char(sysdate - 6, 'DD'), 'DD') and a_date <= to_date(to_char(sysdate, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS')
			group by l_num
			order by count(*) desc) c
			where a.l_num = b.l_num
			and a.l_num = c.l_num
	) d
) where rn >= 1 and rn <= 6

select * from ( 
	select d.*
	from ( select a.l_num, a.l_type, a.l_category, a.l_teacher_id, a.l_level, b.l_pay, b.l_student, c.cnt 
			from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
			from OE_APPLICATION_LIST
			where a_date > to_date(to_char(sysdate - 6, 'DD'), 'DD') and a_date <= to_date(to_char(sysdate, 'DD'), 'DD')
			group by l_num
			order by count(*) desc) c
			where a.l_num = b.l_num
			and a.l_num = c.l_num
	) d

select rownum, d.*
from ( select a.l_num, a.l_type, a.l_category, a.l_teacher_id, a.l_level, b.l_pay, b.l_student, c.cnt 
		from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
												from OE_APPLICATION_LIST
												where a_date > to_date(to_char(sysdate - 6, 'DD'), 'DD') and a_date <= to_date(to_char(sysdate, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS')
												group by l_num
												order by count(*) desc) c
		where a.l_num = b.l_num
		and a.l_num = c.l_num
		order by c.cnt desc) d
		where rownum >= 1 and rownum <= 6

-- 회원 중 수강 중인 수업이 없는 회원
select a.*, b.*
from oe_member a, oe_application_list b
where a.m_id = b.a_id

select *
from oe_member
where m_id not in (select a.m_id
from oe_member a, oe_application_list b
where a.m_id = b.a_id
and (b.a_status = 1 or b.a_status = 0))
and m_lesson = 'not_lesson'
and m_id = 'user1'

-- 누적 레슨 진행 횟수
select sum(l_student)
from oe_lesson_detail;

-- 리뷰 갯수
select count(*)
from oe_review

select count(*) from oe_review
where r_recommend = 1

-- 레슨 갯수
select count(*)
from oe_lesson

-- 레슨 추천 쿼리
select a.l_teacher_id, a.l_category, b.*
from oe_lesson a, oe_lesson_detail b
where a.l_num = b.l_num
and b.l_location like '%경기%'
and a.l_type like '%취미%'
and a.l_category like '%바이올린%'
and a.l_level like '%초급%'
and b.l_pay > 10000 and b.l_pay < 50000
and b.l_day like '%월요일, 목요일%';

select rownum as rn, c.*
					from ( 
select a.l_teacher_id, a.l_category, b.*
from oe_lesson a, oe_lesson_detail b
where a.l_num = b.l_num
and b.l_location like '%서울%'
and a.l_type like '%취미%'
and a.l_category like '%%'
and a.l_level like '%중급%'
and b.l_pay > 10000 and b.l_pay < 50000
and b.l_day like '%조율 가능%'
and a.l_num in (select l_num from OE_LESSON where l_num not in (
select l_num
from OE_APPLICATION_LIST
where a_id = 'user3')) )c

select * from ( 
select rownum as rn, c.*
from ( select rownum, a.l_teacher_id, a.l_category, b.*
		from oe_lesson a, oe_lesson_detail b
		where a.l_num = b.l_num
		and b.l_location like '%서울%'
		and a.l_type like '%취미%'
		and a.l_category like '%%'
		and a.l_level like '%중급%'
		and b.l_pay> 10000 and b.l_pay < 50000
		and b.l_day like '%조율 가능%'
		)c
		where c.l_num in (select l_num 
		from OE_LESSON 
		where l_num not in (
			select l_num
			from OE_APPLICATION_LIST
			where a_id = 'user3'))
		) where rn >= 1 and rn <=3

select l_num from OE_LESSON where l_num not in (
select l_num
from OE_APPLICATION_LIST
where a_id = 'user3')

select * from oe_lesson_detail
select * from OE_APPLICATION_LIST

select count(*) 
from oe_review
where r_recommend = 1;

select count(*)
from oe_lesson a, OE_APPLICATION_LIST b
where a.l_num = b.l_num
and a.l_teacher_id = 'test1'
and b.a_status = 0;

select count(m_id)
from oe_member
where m_id in (select l_teacher_id from oe_lesson where l_teacher_id = 'test8')

select count(*)
from oe_lesson a, oe_lesson_detail b 
where b.l_location like '%서울%'
and a.l_num = b.l_num

select * from ( 
					select rownum as rn, z.*
					from (select rownum, nvl(x.cnt, 0) cnt, y.*
					from (select b.l_num l_num, b.a_status a_status, count(b.a_status) cnt 
					from oe_lesson a, OE_APPLICATION_LIST b 
					where a.l_teacher_id = 'test8' and a.l_num = b.l_num  and b.a_status = 0
					group by b.l_num, b.a_status 
					order by b.l_num desc) x right outer join (select a.l_type, a.l_category, a.l_teacher_id, a.l_level, a.l_regdate, b.*
							from oe_lesson a, oe_lesson_detail b
							where a.l_teacher_id = 'test8'
							and a.l_num = b.l_num
							order by a.l_num desc
					) y on x.l_num = y.l_num order by y.l_num desc) z
			) where rn >= 1 and rn <= 5
			
select * from oe_member where m_id = 'test8' and m_pw = '1234'
SELECT sum(oe_lesson_detail.l_student)
		FROM oe_lesson 
		JOIN oe_lesson_detail 
			ON oe_lesson.l_num = oe_lesson_detail.l_num
		WHERE oe_lesson.l_teacher_id = 'test8'
		
		SELECT oe_lesson_detail.l_student
		FROM oe_lesson 
		JOIN oe_lesson_detail 
			ON oe_lesson.l_num = oe_lesson_detail.l_num
		WHERE oe_lesson.l_teacher_id = 'test8'
		
select * from oe_review;

select l_student from oe_lesson_detail where l_num = 22;

select round(avg(r_star),1)
from oe_review
where l_num = 22
group by l_num;



select * from oe_schedule;
delete from oe_schedule;
drop table oe_schedule;


select to_date(to_char(sysdate - 6, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS') from dual;
select to_date(to_char(sysdate, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS') from dual;


select rownum, d.*
from ( select a.l_num, a.l_type, a.l_category, a.l_teacher_id, a.l_level, b.l_pay, b.l_student, c.cnt 
		from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
												from OE_APPLICATION_LIST
												where a_date > to_date(to_char(sysdate - 6, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS') and a_date <= to_date(to_char(sysdate, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS')
												group by l_num
												order by count(*) desc) c
		where a.l_num = b.l_num
		and a.l_num = c.l_num
		order by c.cnt desc) d
		where rownum >= 1 and rownum <= 6;

select * from OE_APPLICATION_LIST;		
select * from OE_LESSON where l_teacher_id = 'test8';	

select c.a_id, b.l_num, b.l_category
from oe_member a, OE_LESSON b, OE_APPLICATION_LIST c
where b.l_teacher_id = 'test8'
and a.m_id = c.a_id
and b.l_num = c.l_num
and c.a_status = 1;

select c.a_id, b.l_category
from OE_LESSON b, OE_APPLICATION_LIST c
where b.l_teacher_id = 'test8'
and b.l_num = c.l_num
and c.a_status = 1;

SELECT sum(oe_lesson_detail.l_student)
		FROM oe_lesson 
		JOIN oe_lesson_detail 
			ON oe_lesson.l_num = oe_lesson_detail.l_num
		WHERE oe_lesson.l_teacher_id = 'test8';
		
select * from OE_SCHEDULE;
select * from OE_SCHEDULE where a_id = 'user9';

SELECT l_teacher_id, sum(oe_lesson_detail.l_student) as cnt
FROM oe_lesson 
JOIN oe_lesson_detail 
	ON oe_lesson.l_num = oe_lesson_detail.l_num
group by l_teacher_id;

select * from OE_LESSON_DETAIL;

select *
from OE_LESSON a
inner join OE_LESSON_DETAIL b on a.l_num = b.l_num
inner join oe_member c on a.l_teacher_id = c.m_id;

select a.*, b.m_nickname
from oe_lesson a
inner join oe_member b on a.l_teacher_id = b.m_id
where a.l_num = '17'

-- top6 레슨 강사 닉네임 추가
select rownum, d.*, e.m_nickname
from ( select a.l_num, a.l_type, a.l_category, a.l_teacher_id, a.l_level, b.l_pay, b.l_student, c.cnt 
		from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
												from OE_APPLICATION_LIST
												where a_date > to_date(to_char(sysdate - 6, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS') and a_date <= to_date(to_char(sysdate, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS')
												group by l_num
												order by count(*) desc) c
		where a.l_num = b.l_num
		and a.l_num = c.l_num
		order by c.cnt desc) d inner join oe_member e on d.l_teacher_id = e.m_id
		where rownum >= 1 and rownum <= 6;
		
select rownum as rn, c.*
from ( select a.*, b.m_nickname
		from oe_cmt a left outer join oe_member b on a.c_id = b.m_id
		where l_num = '2'
		order by c_ansnum
	)c ; 
	
	select * from oe_cmt;
	
select c.a_id, b.l_category, a.m_nickname
		from oe_member a, OE_LESSON b, OE_APPLICATION_LIST c
		where b.l_teacher_id = 'test8'
		and b.l_num = c.l_num
		and a.m_id = c.a_id
		and c.a_status = 1
		
select rownum, d.*, e.m_nickname
				from ( select a.l_num, a.l_type, a.l_category, a.l_teacher_id, a.l_level, b.l_pay, b.l_student, c.cnt 
						from oe_lesson a, oe_lesson_detail b, (select l_num, count(*) as cnt
																from OE_APPLICATION_LIST
																where a_date > to_date(to_char(sysdate - 6, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS') and a_date <= to_date(to_char(sysdate, 'YYYYMMDDHH24MISS'), 'YYYYMMDDHH24MISS')
																group by l_num
																order by count(*) desc) c
						where a.l_num = b.l_num
						and a.l_num = c.l_num
						order by c.cnt desc) d inner join oe_member e on d.l_teacher_id = e.m_id
						where rownum >= 1 and rownum <= 6;
select * from oe_member;	
select * from oe_lesson a, oe_lesson_detail b where a.l_num = b.l_num;
select * from oe_review;
select * from OE_SCHEDULE;
delete from OE_SCHEDULE where a_id = 'user2'
select * from oe_application_list where l_num = 15;

select * from oe_cmt;
delete from oe_cmt where l_num = 15;

update oe_lesson_detail set l_pay = 30000 where l_num = 17;
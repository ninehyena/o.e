-- 회원 테이블
create table oe_member(
    m_id varchar2(12) primary key,
    m_pw varchar2(12) not null,
    m_lesson varchar2(15) not null,		-- 강습: lesson 과 교습: not_lesso
    m_nickname varchar2(15) not null,
    m_phone number(13) not null,
    m_email varchar2(100) not null,
    m_addr1 varchar2(20) not null,
    m_addr2 varchar2(20) not null,
    m_addr3 varchar2(40) not null
);

-- 레슨 테이블
create table oe_lesson(
	l_num number primary key,					-- 레슨 번호
	l_type varchar2(5 char) not null,			-- 취미 / 준비
	l_category varchar2(20 char) not null,		-- 음악 카테고리
	l_teacher_id varchar2(20 char) not null,	-- 회원T에서 FK 받아오기
	l_content varchar2(100 char) not null,
	l_location varchar2(100 char) not null
);

create table oe_lesson(
	l_num number primary key,					-- 레슨 번호
	l_type varchar2(5 char) not null,			-- 취미 / 준비
	l_category varchar2(20 char) not null,		-- 음악 카테고리
	l_teacher_id varchar2(20 char) not null,	-- 회원T에서 FK 받아오기
	l_level varchar2(5 char) not null,			-- 레슨 레벨 
	l_regdate date default sysdate not null		-- 등록일
);

create sequence oe_lesson_seq;

insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '베이스', 'TEST', '초급');
select * from OE_LESSON;
select oe_lesson_seq.CURRVAL from oe_lesson;
select oe_lesson_seq.nextval from dual;

drop table oe_lesson;
drop sequence oe_lesson_seq;


create table oe_lesson_detail(
	l_num number primary key,					-- 레슨 번호 oe_lesson의 l_num 참조
	l_location varchar2(100 char) not null,		-- 레슨 지역
	l_room varchar2(50 char),					-- 레슨 장소 (연습실 없으면 null)
	l_level_of_education1 varchar2(30 char),	-- 학력 (고등학교)
	l_level_of_education2 varchar2(30 char),	-- 학력 (대학교)
	l_major varchar2(30 char),					-- 전공 (대학교)
	l_career1 varchar2(30 char),				-- 이력 1
	l_career2 varchar2(30 char),				-- 이력 2
	l_career3 varchar2(30 char),				-- 이력 3
	l_content varchar2(100 char) not null,		-- 레슨 내용
	l_pay number not null,						-- 레슨 비용
	l_day varchar2(50 char) not null			-- 레슨 요일 (체크박스)
);

select * from OE_LESSON_DETAIL;

select *
from oe_lesson a, oe_lesson_detail b
where a.l_num = b.l_num
order by l_regdate desc;

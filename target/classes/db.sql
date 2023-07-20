-- 회원 테이블
create table oe_member(
    m_id varchar2(12) primary key,
    m_pw varchar2(12) not null,
    m_lesson varchar2(15) not null,		-- 강습: lesson 과 교습: not_lesson
    m_nickname varchar2(15) not null,
    m_phone number(13) not null,
    m_email varchar2(100) not null,
    m_addr1 varchar2(20) not null,
    m_addr2 varchar2(50) not null,
    m_addr3 varchar2(40) not null
);

select * from oe_member;
drop table oe_member;

insert into oe_member values('user1', '1234', 'not_lesson', '유저1', 01011111111, '1@naver.com', '우편번호', '1', '2');
insert into oe_member values('user2', '1234', 'not_lesson', '유저2', 01011111111, '1@naver.com', '우편번호', '1', '2');
insert into oe_member values('user3', '1234', 'not_lesson', '유저3', 01011111111, '1@naver.com', '우편번호', '1', '2');
insert into oe_member values('user4', '1234', 'not_lesson', '유저4', 01011111111, '1@naver.com', '우편번호', '1', '2');
insert into oe_member values('user5', '1234', 'not_lesson', '유저5', 01011111111, '1@naver.com', '우편번호', '1', '2');


-- 레슨 테이블
create table oe_lesson(
	l_num number primary key,					-- 레슨 번호
	l_type varchar2(5 char) not null,			-- 취미 / 준비
	l_category varchar2(20 char) not null,		-- 음악 카테고리
	l_teacher_id varchar2(20 char) not null,	-- 회원T에서 FK 받아오기
	l_level varchar2(5 char) not null,			-- 레슨 레벨 
	l_regdate date default sysdate not null		-- 등록일
);

create sequence oe_lesson_seq;

insert into OE_LESSON values(oe_lesson_seq.nextval, '취미', '통기타', 'TEST', '초급', sysdate);
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
	l_day varchar2(50 char) not null,			-- 레슨 요일 (체크박스)
	l_student number default 0					-- 수강생 수
);

insert into OE_LESSON_DETAIL values(23, '서울 강남구', '개인 연습실', 'ㅍㅍ고등학교', 'ㄱㄱ대학교', '작곡과', 'ㅊㅊ학원 베이스 강사', null, null, '베이스 수업', 100, '토요일');
alter table oe_lesson_detail add l_student number default 0;
select * from OE_LESSON_DETAIL;

-- 신청 목록
create table oe_application_list(
	l_num number not null,					-- 레슨 테이블의 레슨 번호
	a_id varchar2(12 char) not null,				-- 회원 테이블의 회원 아이디 (수강생)
	a_status number default 0 not null,		-- 레슨 상태
	a_date date default sysdate not null	-- 레슨 신청일
);

select * from oe_application_list;
drop table oe_application_list;
update oe_application_list set a_status = 2 where a_id = 'user1';

-- 리뷰
create table oe_review(
	r_num number primary key,
	l_num number not null, 			-- 레슨 테이블의 레슨 번호
	a_id varchar2(12 char) not null,		-- 회원 테이블의 회원 아이디 (수강생)
	r_star number not null,			-- 별점
	r_content varchar2(200 char) not null,	-- 내용
	r_regdate date default sysdate
);

create table oe_review(
	r_num number primary key,
	l_num number not null, 			-- 레슨 테이블의 레슨 번호
	a_id varchar2(12 char) not null,		-- 회원 테이블의 회원 아이디 (수강생)
	r_star number not null,			-- 별점
	r_level number not null,		-- 수업 수준 0:쉬웠어요 1: 딱 맞아요 2: 어려워요
	r_recommend number not null,	-- 0: 비추천 1: 추천
	r_content varchar2(200 char) not null,	-- 내용
	r_regdate date default sysdate
);

create sequence oe_review_seq;
select * from oe_review;
drop table oe_review;
-------------------------------------------------------------------------------
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
								(select c.l_num as l_num, count(c.l_num) as cnt
								from oe_lesson c inner join oe_application_list d on c.l_num = d.l_num
								where c.l_teacher_id = 'aaaa' and d.a_status = 0
								group by c.l_num) subquery1
							where a.l_teacher_id = 'aaaa' 
							and a.l_num = b.l_num
							and a.l_num = subquery1.l_num
							order by a.l_num desc
					) e
				) where rn >= #{start} and rn <= #{end}

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

select l_num, avg(r_star)
from oe_review
where l_num = 61
group by l_num;



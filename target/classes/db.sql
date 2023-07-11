-- 채소 정보
create table oe_vegetable(
	v_num number primary key,
	v_name varchar2(20) not null,
	v_gram number not null,
	v_kcal number(5,2),
	v_carbohydrate number(5,2),
	v_natrium number(5,2),
	v_sugar number(5,2)
);

create sequence oe_vegatable_seq;

insert into OE_VEGETABLE values(oe_vegatable_seq.nextval, '토마토', 100, 30.38, 5.22, 3.79, 5.42);
insert into OE_VEGETABLE values(oe_vegatable_seq.nextval, '오이', 100, 19.7, 2.8, 0, 2.58);
insert into OE_VEGETABLE values(oe_vegatable_seq.nextval, '당근', 70, 25.9, 6.02, 21, 0);
insert into OE_VEGETABLE values(oe_vegatable_seq.nextval, '양상추', 35, 6.3, 1.61, 0.7, 0);
insert into OE_VEGETABLE values(oe_vegatable_seq.nextval, '감자', 130, 81.9, 18.07, 27.3, 0);

select * from oe_vegetable;

drop table oe_vegetable;

-- 영양소 권장 섭취량


-- 영양소 상한 섭취량


-- 레시피 정보
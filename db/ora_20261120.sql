drop table board;

drop table board2;

drop table stuscore;


create table board(
bno number(4) primary key,
id varchar2(50) not null,
btitle varchar2(1000),
bcontent clob,
bgroup number(4),
bstep number(4) default 0,
bindent number(4)default 0,
bhit number(4) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

select * from employees;

-- select board_seq.nextval from employees;

-- nextval 1씩 증가
-- currval 현재 시퀀스 번호가 몇번인지 알려줌.
select board_seq.nextval from dual;
select board_seq.currval from dual;


select * from board;
insert into board values(
board_seq.nextval,'aaa','게시글제목','게시글내용',board_seq.currval,0,0,0,sysdate,'1,jpg'
);

insert into board (bno,id,btitle,bcontent,bgroup,bfile) values(
board_seq.nextval,'bbb','게시글제목2','게시글내용2',board_seq.currval,'1,jpg'
);

-- select, insert, update, delete / commit , rollbacd

rollback;
select * from board;

-- 테이블구성, 테이블데이터 모두 복사
create table board2 as select * from board;

--
create table board3 as select * from board where 1=2;

drop table board;
drop table board2;
drop table board3;

create table board (
bno number(4) primary key,
id varchar2(100) not null,
btitle varchar2(1000),
bcontent clob,
bgroup number(10) ,
bstep number(10) default 0,
bindent number(10) default 0,
bhit number(10) default 0,
bdate date default sysdate,
bfile varchar2(100)
);

select * from board;

create table board2 as select * from board;
create table board3 as select * from board where 1=2;

create table stuscore(
no number(10) primary key,
name varchar2(100),
school varchar2(100),
rank number(10),
height number(10),
kor number(10),
eng number(10),
math number(10),
specialty varchar2(100)
);

select * from stuscore;

create table students (
sno number(4),
name varchar2(100),
school varchar2(50),
rank number(4),
height number(10),
kor number(10),
eng number(10),
math number(10),
sw varchar2(100) default 0
);

drop table students;

select * from students;

create table gallery(
gno number(12) primary key,
galContentId number(10),
galContentTypeId number(10),
galTitle varchar2(100),
galWebImageUrl varchar2(200),
galCreatedtime varchar2(100),
galModifiedtime varchar2(100),
galPhotographyMonth varchar2(10),
galPhotographyLocation varchar2(100),
galPhotographer varchar2(50),
galSearchKeyword varchar2(1000)
);
drop table gallery;

select * from gallery;

select * from stuscore;

select * from stuscore order by rank,height asc,kor desc;

-- 숫자함수
-- 절대값
select abs(-10) from dual;
-- round() : 반올림
-- ceil() : 올림
-- floor() : 버림
-- trunc() : 자르기
select 100/6 from dual;
-- 소수점 자리수
select round(100/6,2) from dual; -- 16.67
-- floor , ceil 소수점 첫째자리에서 계산
select round(1978,-1) from dual; -- 1980

select floor(100/6) from dual; -- 16
select ceil(100/3) from dual; -- 34

select * from stuscore;

select round(kor,-1) from stuscore;
select kor,trunc(kor,-1) ,round(kor,-1) from stuscore;

-- select trunc(bdate,1) from board; 에러

select mod(22,2) from dual; -- 0
select mod(23,2) from dual; -- 1

-- stuscore 홀수학생만 출력하시오

select * from stuscore where mod(rank,2)=1;
select * from stuscore where rank=1 or rank=3;
select * from stuscore where rank in(1,3);

-- 형변환 : number , varchar2 , char , clob , date
-- last_day 
select sysdate-1,sysdate,sysdate+1 from dual; -- 26/11/19	26/11/20	26/11/21
select sysdate-365,sysdate,last_day(sysdate+365) from dual; -- 25/11/20	26/11/20	27/11/30

select * from member;

-- 명령어를 조합해서 사용가능
select mdate as 가입일,round(sysdate-mdate,2) from member;

-- to_char 날짜형태 바꿀수있음 yyyy-mm-dd , yyyy/mm/dd 등등
select mdate,to_char(mdate,'yyyy-mm-dd') from member;

-- round() : 반올림
select mdate , round(mdate,'month') from member; -- 26/01/13	26/01/01   , 25/10/27	25/11/01 
select mdate , round(mdate,'year') from member;

-- 날짜형태
select mdate,to_char(mdate,'yyyy-mm-dd hh:mi:ss') from member;

insert into board3 values(
1,'aaa','게시글 제목','게시글내용',1,0,0,0,sysdate,'1.jpg'
);

select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board3;


-- 날짜 : 숫자함수 - round , trunc
-- 월기준 : month , mon,mm
-- 년도기준 : year , yyyy
select mdate,last_day(mdate),trunc(mdate,'month'),round(mdate,'mm') from member;
select mdate,last_day(mdate),trunc(mdate,'year'),round(mdate,'year') from member;

select * from board3;
select mdate,trunc(mdate,'yyyy') from member;
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board3; -- 1시
select bdate,to_char(bdate,'yyyy-mm-dd hh24:mi:ss') from board3; -- 13시

-- 요일기준 - trunc: 해당기간 일요일날짜로 변경 ,round : 수요일 기준으로 반올림
-- hh,mi,ss 기준으로 trunc , round 사용가능
select mdate,trunc(mdate,'day') from member;
select sysdate,trunc(sysdate,'day'),round(sysdate,'day')from dual; -- 수요일기준 전 일요일, 다음일요일

-- months_between 날짜사이 개월수 확인가능
select mdate,sysdate,months_between(sysdate,mdate) from member;

select mdate,sysdate,trunc(months_between(sysdate,mdate)) from member where months_between(sysdate,mdate)<=6;

--add_months : 개월추가
select mdate,add_months (mdate,3) from member;
select mdate,add_months (mdate,6) from member;
-- 1년후 첫째일을 출력 , 마지막일을 출력하시오.
select mdate,add_months(mdate,12),trunc(add_months(mdate,12),'mm'),last_day(add_months(mdate,12)) from member;

select trunc(sysdate,'day'),sysdate,round(sysdate,'day') from dual;

-- 다가오는 요일의 날짜를 리턴
select next_day(sysdate,'금요일') from dual;
select next_day(sysdate,'수요일') from dual;

select next_day(next_day(sysdate,'일요일'),'일요일') from dual;

-- 날짜와 날짜의 사이 계산
select (sysdate-(sysdate-1)) from dual;

select sysdate-mdate from member;

-- trunc(): 1일자를 알려줌
-- round() : 15일 기준으로 이전에 1일 , 이후 다음달 1일
-- last_day: 마지막 날짜를 알려줌.

-- varchar2 타입
-- 에러 select '2026-11-20'+1 from dual;
select to_date('2026-11-20')+1 from dual; -- 2026/11/21
select to_date('20261120')+1 from dual; -- 26/11/21
select to_date('galcreatedtime') from gallery;
select galcreatedtime from gallery; -- 20251231142804

-- substr함수
-- substr 함수를 사용해서 날짜부분만 추출후, 날짜타입으로 변경

select substr(galcreatedtime,1,8) from gallery; -- 20251231
select to_date(substr(galcreatedtime,1,8)) from gallery; --  25/12/31
select substr('abcdefg',3,2) from dual; -- cd
select galcreatedtime from gallery;
-- 그달에 1일을 출력하시오
select trunc(to_date(substr(galcreatedtime,1,8)),'mm') from gallery; -- 
select last_day(to_date(substr(galcreatedtime,1,8))) from gallery; -- 


select bdate from board3;
-- 2026-11-20 12:34:12 day
-- yyyy-mm-dd hh:mi:ss day,dy
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') from board3; -- 1시
select to_char(bdate,'yyyy-mm-dd hh:mi:ss day') from board3; -- 2026-11-20 12:17:55 금요일
select to_char(bdate,'yyyy-mm-dd hh:mi:ss dy') from board3; -- 2026-11-20 12:17:55 금

insert into board3 values(
2,'aaa','222게시글','222내용',2,0,0,0,sysdate,'2.jpg'
);

commit;
select * from board3;

select to_char(bdate,'yyyy/mm/dd hh24:mi:ss day') from board3;

select * from member;

-- 가입일이 7월인 사람만 출력하시오.

select to_char(mdate,'mm') from member;
select * from member where to_char(mdate,'mm')=07;

select * from employees;
--1900 년대 입사한 사람을 출력하시오.
-- 2000 년대 입사한 사람을 출력하시오.
select hire_date from employees;

select to_char(hire_date,'yyyy/mm/dd') from employees;
select * from employees where substr(to_char(hire_date,'yyyy'),0,2)='20';
select * from employees where substr(to_char(hire_date,'yyyy'),0,2)='19';

-- kor 40점대(40~49) 60점대(60~69) 80점대(80~89) 에 있는 학생을 출력하시오

select * from stuscore;

select * from stuscore where (kor>=40 and kor<=49)or (kor>=60 and kor<=69)or(kor>=80 and kor<=89);
select * from stuscore where (kor between 40 and 49)or(kor between 60 and 69)or(kor between 80 and 89);
select kor,trunc(kor,-1) from stuscore where trunc(kor,-1)=40 or trunc(kor,-1)=60 or trunc(kor,-1)=80 ;
select kor,trunc(kor,-1) from stuscore where trunc(kor,-1) in (40,60,80);
--select * from stuscore where kor between 60 and 69;
--select * from stuscore where kor between 80 and 89;
--select * from stuscore where kor>=60 and kor<=69;
--select * from stuscore where kor>=80 and kor<=89;
--or(kor>=60 or kor<=69)or(kor>=80 or kor<=89);

-- 시간
select bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss day') from board3 ;
select bdate,to_char(bdate,'yyyy-mm-dd pm hh') from board3;

-- 날짜 타입 -> 문자타입 / 날짜형태를 변경해서 출력
-- 숫자 타입 -> 문자타입
-- 자리수 :'999,999,999,999' 자리가 있으면 자리출력, 없으면 빈공백
-- '000,000,000,000' 있으면 자리출력 , 없으면 0으로 채워줌
-- L : 원화표시 , 영문버전 $ , 일본어버전 엔화표시
-- .00 : 소수점 표시
select * from kor_loan_status;
select to_char(salary*1425*12*10,'999,999,999,999') as ysalary from employees; --     444,600,000
select to_char(salary*1425*12*10,'009,999,999,999') as ysalary from employees; --  000,444,600,000
select to_char(salary*1425*12*10,'L009,999,999,999') as ysalary from employees; -- ￦000,444,600,000
select to_char(salary*1425*12*10,'L009,999,999,999.00') as ysalary from employees; -- ￦000,444,600,000.00

-- loan_jan_amt * 1천만원 단위임
-- 천만원을 곱해서 자리수를 표시하시오
select * from kor_loan_status;
select to_char(loan_jan_amt*10000000,'L999,999,999,999,999') as lja from kor_loan_status;

-- 날짜 문자로 변환 형태를 변경
-- 숫자 문자로 변환 : 천단위,원화표시
-- 숫자 날짜로 변환

select to_date(20261120,'yyyymmdd') from dual;
select to_date('20261120','yyyymmdd') from dual;

select * from gallery;

select to_date(galphotographymonth,'yyyymm') from gallery;

update gallery set galphotographymonth2=to_date(galphotographymonth,'yyyymm');

commit;
desc gallery;
select * from gallery;
alter table gallery modify galphotographymonth date; --에러

alter table gallery add(galphotographymonth2 date);

select * from gallery;

update gallery set galphotographymonth2 = to_date(galphotographymonth);

select * from gallery;

commit;

-- 컬럼 삭제
alter table gallery drop column galphotographymonth;
-- 컬럼 추가
alter table gallery add(galphotographymonth2 date);

--컬럼이름 변경
alter table gallery rename column galphotographymonth2 to galphotographymonth;

-- 컬럼순서변경
alter table gallery modify galphotographymonth INVISIBLE;
alter table gallery modify GALSEARCHKEYWORD INVISIBLE;
alter table gallery modify galphotographymonth INVISIBLE;
alter table gallery modify GALSEARCHKEYWORD VISIBLE;
alter table gallery modify galphotographymonth VISIBLE;
alter table gallery modify GALPHOTOGRAPHER INVISIBLE;
alter table gallery modify GALPHOTOGRAPHER VISIBLE;
desc gallery;

commit;
desc gallery;

-- galphotographymonth : varchar 타입 -> -- 날짜타입으로 변경하려니 데이터가 변경하려는타입과 형태가 다름.


drop table gallery;

create table gallery(
gno number(12) primary key,
galContentId number(10),
galContentTypeId number(10),
galTitle varchar2(100),
galWebImageUrl varchar2(200),
galCreatedtime varchar2(100),
galModifiedtime varchar2(100),
galPhotographyMonth varchar2(10),
galPhotographyLocation varchar2(100),
galPhotographer varchar2(50),
galSearchKeyword varchar2(1000)
);
drop table gallery;

select to_date(galPhotographyMonth,'yyyy-mm') from gallery;
update gallery set galPhotographyMonth = to_date(galPhotographyMonth,'yyyy-mm');
commit;

select galPhotographyMonth from gallery;

alter table gallery modify (galPhotographyMonth date);

alter table gallery add(galPhotographyMonth2 date);
-- galPhotographyMonth2 : date 타입

update gallery set galPhotographyMonth2 = galPhotographyMonth;

alter table gallery drop column galPhotographyMonth;

alter table gallery rename column galPhotographyMonth2 to galPhotographyMonth;

desc gallery;

select * from gallery;

select to_date(galcreatedtime,'yyyymmddhh24miss') from gallery;

alter table gallery add(galcreatedtime2 date);

update gallery set GALCREATEDTIME2 = to_date(galcreatedtime,'yyyymmddhh24miss');

commit;

alter table gallery drop column galcreatedtime;

desc gallery;

select * from gallery;

alter table gallery modify GALMODIFIEDTIME INVISIBLE;
alter table gallery modify GALPHOTOGRAPHYLOCATION INVISIBLE;
alter table gallery modify GALPHOTOGRAPHER INVISIBLE;
alter table gallery modify GALSEARCHKEYWORD INVISIBLE;

alter table gallery modify GALMODIFIEDTIME VISIBLE;
alter table gallery modify GALPHOTOGRAPHYLOCATION VISIBLE;
alter table gallery modify GALPHOTOGRAPHER VISIBLE;
alter table gallery modify GALSEARCHKEYWORD VISIBLE;

desc gallery;

alter table gallery
rename column GALCREATEDTIME2 to GALCREATEDTIME;

desc gallery;

select '20261120',to_date('20261120') from dual;



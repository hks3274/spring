show tables;

create table board2 (
	idx int not null auto_increment,		  /*게시글의 고유번호*/
	mid varchar(20) not null,        			/*게시글 올린이 아이디*/
	nickName varchar(20) not null,        /*게시글 올린이 닉네임*/
	title varchar(100) not null,					/*게시글 제목*/
	content text not null,								/*글 내용*/	
	readNum int default 0,								/*글 조회수*/
	hostIp varchar(40) not null,   				/*글 올린이의 IP*/
	openSw char(2) default 'OK', 					/*게시글 공개 여부(OK:공개, NO:비공개)*/
	wDate datetime default now(),					/*글쓴 날짜*/
	good int default 0,										/*'좋아요' 클릭 횟수 누적*/
	complaint char(2) default 'NO',				/*신고글 유무(신고당한글:OK,정상글:NO)*/
	primary key(idx),											/*기본키 : 고유번호*/
	foreign key(mid) references member2(mid) 
);
drop table board2;
desc board2;

insert into board2 values (default,'admin','관리맨','게시판 서비스를 시작합니다.','즐거운 게시판생활이 되세요.',default,'192.168.50.20',default,default,default,default);


/* 댓글 달기 */
create table boardReply2(
	idx 			int not null auto_increment, 	/*댓글 고유번호*/
	boardIdx 	int not null,									/*원본글(부모글)의 고유번호-외래키로 지정*/ 
	re_step		int not null,									/*레벨(re_step)에 따른 들여쓰기(계층번호) : 부모댓글의 re_step은 0이다. 대댓글의 경우는 부모re__step+1로 처리한다.*/
	re_order	int not null,									/*댓글의 순서 결정. 부모 댓글 1 대댓글의 경우 부모댓글보다 큰댓글은 re_order+1처리하고 자신의 부모댓글의 re_order보다 +1한다.*/
	mid				varchar(20) not null, 				/*댓글 올린이의 아이디*/
	nickName	varchar(20) not null, 				/*댓글 올린이의 닉네임*/
	wDate			datetime default now(),				/*댓글 올린 날짜/시간*/
	hostIp		varchar(50) not null,					/*댓글 올린 PC의 고유 IP*/
	content 	text not null,								/*댓글 내용*/
	primary key(idx),
	foreign key(boardIdx) references board2(idx)
	on update cascade 
	on delete restrict
);

	/*ref				int not null,								/*공지글을 처리할거면 사용(공지글- ref=0)*/*/

drop table boardReply2;
desc boardReply2;

insert into boardReply2 values (default, 24, 'hkd1234', '홍장군', default, '192.168.50.51', '정말 재밌어요^^');
insert into boardReply2 values (default, 25, 'dtom1234', '디톰', default, '192.168.50.51', '허허 재밌구먼');
insert into boardReply2 values (default, 20, 'ctom1234', '씨톰맨', default, '192.168.50.51', '멋진글입니다...');



select * from boardReply2;


select * from board2;
select * from board2 where idx = 9;  /* 현재글 */
select idx,title from board2 where idx > 9 order by idx limit 1;  /* 다음글 */
select idx,title from board2 where idx < 9 order by idx desc limit 1;  /* 이전글 */

-- 시간으로 비교해서 필드에 값 저장하기
select *, timestampdiff(hour, wDate, now()) as hour_diff from board2;


-- 날짜로 비교해서 필드에 값 저장하기
select *, datediff(wDate, now()) as date_diff from board2;

-- 관리자는 모든글 보여주고, 일반사용자는 비공개글(openSw='NO')과 신고글(complaint='OK')은 볼수없다. 단, 자신이 작성한 글은 볼수 있다.
select count(*) as cnt from board2;
select count(*) as cnt from board2 where openSW = 'OK' and complaint = 'NO';
select count(*) as cnt from board2 where openSW = 'OK' and complaint = 'NO';
select count(*) as cnt from board2 where mid = 'hkd1234';
select * from board2 where openSW = 'OK' and complaint = 'NO';
select * from board2 where mid = 'hkd1234';
select * from board2 where openSW = 'OK' and complaint = 'NO' union select * from board2 where mid = 'hkd1234';
select * from board2 where openSW = 'OK' and complaint = 'NO' union all select * from board2 where mid = 'hkd1234';

select count(*) as cnt from board2 where openSW = 'OK' and complaint = 'NO' union select count(*) as cnt from board2 where mid = 'hkd1234';
select sum(a.cnt) from (select count(*) as cnt from board2 where openSW = 'OK' and complaint = 'NO' union select count(*) as cnt from board2 where mid = 'hkd1234') as a;

select sum(a.cnt) from (select count(*) as cnt from board2 where openSW = 'OK' and complaint = 'NO' union select count(*) as cnt from board2 where mid = 'hkd1234' and (openSW = 'NO' or complaint = 'OK')) as a;

/*댓글 수 연습*/
select * from board2 order by idx desc;
select * from boardReply2 order by boardIdx, idx desc;

-- 부모글 (24)의 댓글만 출력 
select * from boardReply2 where boardIdx = 24;
select boardIdx, count(*) as replyCnt from boardReply2 where boardIdx = 24;
select * from board where idx=24;
select *,(select count(*) from boardReply2 where boardIdx = 24) as replyCnt from board2 where idx=24;
select *,(select count(*) from boardReply2 where boardIdx = b.idx) as replyCnt from board2 b where idx=24;




/*view / index 파일 출력*/

select * from board2 where mid="admin";

create view adminView as select * from board2 where mid="admin";

select * from adminView;

show tables;

show full tables in javaclass where table_type like 'view';

drop view adminView;

desc board2;

create index nickNameIndex on board2(nickName);

show index from board2;

alter table board2 drop index nickNameIndex;







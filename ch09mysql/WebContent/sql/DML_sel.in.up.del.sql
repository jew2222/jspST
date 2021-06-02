
--DML 데이터 조작어

--조회, 검색

select * from T;

SELECT col, col2 ,col3 
FROM T 
WHERE id = 
		ORDER BY col2 DESC --내림차 , 오름차는 ASC
		ORDER BY col2 DESC, col3 ASC --앞 정렬 후 뒷정렬

select @v , @v       --변수 값 조회


-- 삽입
insert into T (col, col2, col3) values ('값',값,값);
insert into T values(,,,,,,,,); --전체 컬럼 갯수와 형태에 맞춘 값
insert into T(col,col2,col3) select col1,col2,col3 from T2
insert into T values(,,,,,,,,),(,,,,,,,,),(,,,,,,,,)(,,,,,,,,),(,,,,,,,,) ; ---여러행 


insert into student (id, name, passwd) values ('kkk','nnn',1234),;;


-- 수정

update alter
update T set col="값" WHERE col2 = '값3'
--제거


delete from T;

/*주석
 * v는  변수 
 * T는 테이블명
 */*/
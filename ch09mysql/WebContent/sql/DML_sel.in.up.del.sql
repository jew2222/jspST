
--DML ������ ���۾�

--��ȸ, �˻�

select * from T;

SELECT col, col2 ,col3 
FROM T 
WHERE id = 
		ORDER BY col2 DESC --������ , �������� ASC
		ORDER BY col2 DESC, col3 ASC --�� ���� �� ������

select @v , @v       --���� �� ��ȸ


-- ����
insert into T (col, col2, col3) values ('��',��,��);
insert into T values(,,,,,,,,); --��ü �÷� ������ ���¿� ���� ��
insert into T(col,col2,col3) select col1,col2,col3 from T2
insert into T values(,,,,,,,,),(,,,,,,,,),(,,,,,,,,)(,,,,,,,,),(,,,,,,,,) ; ---������ 


insert into student (id, name, passwd) values ('kkk','nnn',1234),;;


-- ����

update alter
update T set col="��" WHERE col2 = '��3'
--����


delete from T;

/*�ּ�
 * v��  ���� 
 * T�� ���̺��
 */*/
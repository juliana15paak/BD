MERGE INTO tb3 AS dest
USING (SELECT rm FROM tb2A UNION ALL SELECT rm FROM tb2B) AS src ON dest.rm = src.rm
	WHEN NOT MATCHED BY TARGET AND EXISTS (
		SELECT 1 FROM tbAluno WHERE rm = src.rm AND statusAluno = 'APROVADO'
	)
	THEN INSERT (rm) VALUES (src.rm);
	
select * from tbAluno
select * from tb3

SELECT * FROM tb2A a
JOIN tbAluno al ON a.rm = al.rm
WHERE al.statusAluno = 'APROVADO'

SELECT * FROM tb2B b
JOIN tbAluno al ON b.rm = al.rm
WHERE al.statusAluno = 'APROVADO'

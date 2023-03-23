USE bdEscola

--Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem
SELECT nomeAluno, nomeCurso
FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso =  tbCurso.codCurso

--Apresentar a quantidade de alunos matriculados por nome do curso
SELECT COUNT (codMatricula) AS 'Quantidade de alunos matriculados', nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso =  tbCurso.codCurso
	GROUP BY nomeCurso

--Apresentar a quantidade de alunos matriculados por nome da turma
SELECT COUNT (codMatricula) AS 'Quantidade de aluno matriculados', nomeTurma
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	GROUP BY nomeTurma

--Apresentar a quantidade de alunos que fizeram matricula em maio de 2016
SELECT COUNT (codMatricula) AS 'Quantidade de alunos que se matricularam', dataMatricula
	FROM tbMatricula
	WHERE MONTH (dataMatricula) = 5 AND YEAR (dataMatricula) = 2016
	GROUP BY dataMatricula

--Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
SELECT nomeAluno, nomeTurma, nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	ORDER BY nomeAluno

--*Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT nomeCurso, horarioTurma
	CONVERT(VARCHAR(12), horarioTurma, 114)
	FROM tbTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso

--**Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(codAluno) AS 'Quantidade de alunos matriculados', naturalidadeAluno, nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE codCurso = 1
	GROUP BY naturalidadeAluno
	
--*Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
SELECT nomeAluno, dataMatricula
	CONVERT (VARCHAR(10), dataMatricula, 103)
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
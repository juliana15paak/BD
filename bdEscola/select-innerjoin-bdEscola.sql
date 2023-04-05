USE bdEscola

--1) Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem
SELECT nomeAluno, nomeCurso
FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso =  tbCurso.codCurso

--2) Apresentar a quantidade de alunos matriculados por nome do curso
SELECT COUNT (codMatricula) AS 'Quantidade de alunos matriculados', nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso =  tbCurso.codCurso
	GROUP BY nomeCurso

--3) Apresentar a quantidade de alunos matriculados por nome da turma
SELECT COUNT (codMatricula) AS 'Quantidade de aluno matriculados', nomeTurma
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	GROUP BY nomeTurma

--4) Apresentar a quantidade de alunos que fizeram matricula em maio de 2016
SELECT COUNT (codMatricula) AS 'Quantidade de alunos que se matricularam', dataMatricula
	FROM tbMatricula
	WHERE MONTH (dataMatricula) = 5 AND YEAR (dataMatricula) = 2016
	GROUP BY dataMatricula

--5) Apresentar o nome dos alunos em ordem alfab�tica ao lado do nome das turmas e os nomes dos cursos em que est�o matriculados
SELECT nomeAluno, nomeTurma, nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	ORDER BY nomeAluno

--6) Apresentar o nome dos cursos e os hor�rios em que eles s�o oferecidos
SELECT nomeCurso,
	CONVERT(VARCHAR(12), horarioTurma, 114) AS 'Hor�rio'
	FROM tbTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso

--7) Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(codMatricula) AS 'Quantidade de alunos matriculados', naturalidadeAluno, nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE nomeCurso = 'Ingl�s'
	GROUP BY naturalidadeAluno, nomeCurso
	
--8) *Apresentar o nome dos alunos ao lado da data de matr�cula no formato dd/mm/aaaa
SELECT nomeAluno,
	CONVERT (VARCHAR(10), dataMatricula, 103) AS 'Data da matr�cula'
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno

--9) Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de ingl�s
SELECT nomeAluno, nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE nomeAluno LIKE 'A%'

--10) Apresentar a quantidade de matr�culas feitas no ano de 2016
SELECT COUNT (codMatricula) AS 'Quantidade de matr�culas em 2016'
	FROM tbMatricula
	WHERE YEAR (dataMatricula) = 2016

--11) Apresentar a quantidade de matr�culas por nome do curso
SELECT COUNT(codMatricula) AS 'Quantidade de matr�culas', nomeCurso
	FROM tbMatricula
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY nomeCurso

--12) Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00
SELECT COUNT(codMatricula) AS 'Quantidade de alunos', nomeCurso AS 'Cursos que custam mais de R$300,00'
	FROM tbMatricula
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE valorCurso>=300
	GROUP BY nomeCurso

--13) Apresentar os nomes dos alunos que fazem o curso de alem�o
SELECT nomeAluno, nomeCurso
	FROM tbMatricula
	INNER JOIN tbAluno
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE nomeCurso = 'Alem�o'
	GROUP BY nomeCurso, nomeAluno
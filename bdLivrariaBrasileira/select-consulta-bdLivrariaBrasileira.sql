USE bdLivrariaBrasileira

--a) O total de livros que come�am com a letra P
SELECT COUNT (codLivro) AS 'Total de livros que iniciam com a letra P' FROM tbLivro
WHERE nomeLivro LIKE 'P%'

--b) O maior n�mero de p�ginas entre todos os livros
SELECT MAX (numPaginas) AS 'Maior n�mero de p�ginas' FROM tbLivro
 
--c) O menor n�mero de p�ginas entre todos os livros
SELECT MIN (numPaginas) AS 'Menor n�mero de p�ginas' FROM tbLivro

--d) A m�dia de p�ginas entre todos os livros
SELECT AVG (numPaginas) AS 'M�dia de n�mero de p�ginas' FROM tbLivro

--e) A soma do n�mero de p�ginas dos livros de editora c�digo 01
SELECT SUM (numPaginas) AS 'Soma do n�mero de p�ginas da editora 1' FROM tbLivro
WHERE codEditora = 1

--f) A soma dos n�meros de p�ginas dos livros que come�am com a letra A
SELECT SUM (numPaginas) AS 'Soma do n�mero de p�ginas dos livros que iniciam com a letra A' FROM tbLivro
WHERE nomeLivro LIKE 'A%'

--g) A m�dia dos n�meros de p�ginas dos livros que sejam do autor c�digo 03
SELECT AVG (numPaginas) AS 'M�dia do n�mero de p�ginas dos livros do autor 3' FROM tbLivro
WHERE codAutor = 3

--h) A quantidade de livros da editora de c�digo 04
SELECT COUNT (codLivro) AS 'Total de livros' FROM tbLivro
WHERE codEditora = 4

--i) A m�dia do n�mero de p�ginas dos livros que tenham a palavra �estrela� em seu nome
SELECT AVG (numPaginas) AS 'M�dia de p�ginas dos livros com a palavra "estrela"' FROM tbLivro
WHERE nomeLivro LIKE '%estrela%'

--j) A quantidade de livros que tenham a palavra �poema� em seu nome
SELECT COUNT (codLivro) AS 'Total de livros com a palavra "poema"' FROM tbLivro
WHERE nomeLivro LIKE '%poema%'

--k) A quantidade de livros agrupado pelo nome do g�nero
SELECT COUNT (codLivro) AS 'Quantidade de livros', nomeGenero FROM tbLivro
	INNER JOIN tbGenero
	ON tbLivro.codGenero = tbGenero.codGenero
	GROUP BY nomeGenero

--l) A soma das p�ginas agrupada pelo nome do autor
SELECT SUM (numPaginas) AS 'Soma das p�ginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY nomeAutor

--m) A m�dia de p�ginas agrupada pelo nome do autor em ordem alfab�tica (de A a Z)
SELECT AVG (numPaginas) AS 'M�dia de p�ginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY nomeAutor
	ORDER BY nomeAutor desc

--n) A quantidade de livros agrupada pelo nome da editora em ordem alfab�tica inversa (de Z a A)
SELECT COUNT (codLivro) AS 'Quantidade de livros', nomeEditora FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.codEditora = tbEditora.codEditora
	GROUP BY nomeEditora
	ORDER BY nomeEditora desc

--o) A soma de p�ginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra �C�
SELECT SUM (numPaginas) AS 'Soma de p�ginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor LIKE 'C%'
	GROUP BY nomeAutor

--p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja �Machado de Assis� ou �Cora Coralina� ou �Graciliano Ramos� ou �Clarice Lispector�
SELECT COUNT (codLivro) AS 'Quantidade de livros', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor = 'Machado de Assis' or nomeAutor = 'Cora Coralina' or nomeAutor = 'Graciliano Ramos' or nomeAutor = 'Clarice Lispector'
	GROUP BY nomeAutor

--q) A soma das p�ginas dos livros agrupadas pelo nome da editora cujo n�mero de p�ginas esteja entre 200 e 500 (inclusive)
SELECT SUM (numPaginas) AS 'Soma d�s p�ginas', nomeEditora FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.codEditora = tbEditora.codEditora
	WHERE numPaginas BETWEEN 200 AND 500
	GROUP BY nomeEditora

--r) O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT nomeLivro, nomeEditora, nomeAutor FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor

--s) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for �Cia das Letras�
SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeEditora = 'Companhia das Letras'

--t) O nome dos livros ao lado dos nomes dos autores, somente dos livros que n�o forem do autor ��rico Ver�ssimo�
SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor NOT LIKE '�rico Ver�ssimo'

--u) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles autores que n�o tem livros cadastrados
SELECT nomeAutor, nomeLivro FROM tbLivro
	RIGHT JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor

--v) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles livros que n�o tem autores cadastrados
SELECT nomeAutor, nomeLivro FROM tbLivro
	LEFT JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor

--w) O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou n�o livro publicado, e indiferente do livro pertencer a algum autor
SELECT nomeAutor, nomeLivro FROM tbLivro
	FULL JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor

--x) A editora �tica ir� publicar todos os t�tulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora �tica.
SELECT nomeLivro, nomeEditora FROM tbLivro
	CROSS JOIN tbEditora
	WHERE nomeEditora = '�tica'

--y) Somente os nomes dos autores que n�o tem livros cadastrados
SELECT nomeAutor FROM tbLivro
	RIGHT JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeLivro IS NULL

--z) Os nomes dos g�neros que n�o possuem nenhum livro cadastrado
SELECT nomeGenero FROM tbLivro
	RIGHT JOIN tbGenero
	ON tbLivro.codGenero = tbGenero.codGenero
	WHERE nomeLivro IS NULL
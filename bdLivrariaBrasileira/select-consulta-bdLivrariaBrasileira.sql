USE bdLivrariaBrasileira

--a) O total de livros que começam com a letra P
SELECT COUNT (codLivro) AS 'Total de livros que iniciam com a letra P' FROM tbLivro
WHERE nomeLivro LIKE 'P%'

--b) O maior número de páginas entre todos os livros
SELECT MAX (numPaginas) AS 'Maior número de páginas' FROM tbLivro
 
--c) O menor número de páginas entre todos os livros
SELECT MIN (numPaginas) AS 'Menor número de páginas' FROM tbLivro

--d) A média de páginas entre todos os livros
SELECT AVG (numPaginas) AS 'Média de número de páginas' FROM tbLivro

--e) A soma do número de páginas dos livros de editora código 01
SELECT SUM (numPaginas) AS 'Soma do número de páginas da editora 1' FROM tbLivro
WHERE codEditora = 1

--f) A soma dos números de páginas dos livros que começam com a letra A
SELECT SUM (numPaginas) AS 'Soma do número de páginas dos livros que iniciam com a letra A' FROM tbLivro
WHERE nomeLivro LIKE 'A%'

--g) A média dos números de páginas dos livros que sejam do autor código 03
SELECT AVG (numPaginas) AS 'Média do número de páginas dos livros do autor 3' FROM tbLivro
WHERE codAutor = 3

--h) A quantidade de livros da editora de código 04
SELECT COUNT (codLivro) AS 'Total de livros' FROM tbLivro
WHERE codEditora = 4

--i) A média do número de páginas dos livros que tenham a palavra “estrela” em seu nome
SELECT AVG (numPaginas) AS 'Média de páginas dos livros com a palavra "estrela"' FROM tbLivro
WHERE nomeLivro LIKE '%estrela%'

--j) A quantidade de livros que tenham a palavra “poema” em seu nome
SELECT COUNT (codLivro) AS 'Total de livros com a palavra "poema"' FROM tbLivro
WHERE nomeLivro LIKE '%poema%'

--k) A quantidade de livros agrupado pelo nome do gênero
SELECT COUNT (codLivro) AS 'Quantidade de livros', nomeGenero FROM tbLivro
	INNER JOIN tbGenero
	ON tbLivro.codGenero = tbGenero.codGenero
	GROUP BY nomeGenero

--l) A soma das páginas agrupada pelo nome do autor
SELECT SUM (numPaginas) AS 'Soma das páginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY nomeAutor

--m) A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)
SELECT AVG (numPaginas) AS 'Média de páginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY nomeAutor
	ORDER BY nomeAutor desc

--n) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)
SELECT COUNT (codLivro) AS 'Quantidade de livros', nomeEditora FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.codEditora = tbEditora.codEditora
	GROUP BY nomeEditora
	ORDER BY nomeEditora desc

--o) A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C”
SELECT SUM (numPaginas) AS 'Soma de páginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor LIKE 'C%'
	GROUP BY nomeAutor

--p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”
SELECT COUNT (codLivro) AS 'Quantidade de livros', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor = 'Machado de Assis' or nomeAutor = 'Cora Coralina' or nomeAutor = 'Graciliano Ramos' or nomeAutor = 'Clarice Lispector'
	GROUP BY nomeAutor

--q) A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500 (inclusive)
SELECT SUM (numPaginas) AS 'Soma dás páginas', nomeEditora FROM tbLivro
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

--s) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras”
SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeEditora = 'Companhia das Letras'

--t) O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”
SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeAutor NOT LIKE 'Érico Veríssimo'

--u) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles autores que não tem livros cadastrados
SELECT nomeAutor, nomeLivro FROM tbLivro
	RIGHT JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor

--v) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles livros que não tem autores cadastrados
SELECT nomeAutor, nomeLivro FROM tbLivro
	LEFT JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor

--w) O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e indiferente do livro pertencer a algum autor
SELECT nomeAutor, nomeLivro FROM tbLivro
	FULL JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor

--x) A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática.
SELECT nomeLivro, nomeEditora FROM tbLivro
	CROSS JOIN tbEditora
	WHERE nomeEditora = 'Ática'

--y) Somente os nomes dos autores que não tem livros cadastrados
SELECT nomeAutor FROM tbLivro
	RIGHT JOIN tbAutor
	ON tbLivro.codAutor = tbAutor.codAutor
	WHERE nomeLivro IS NULL

--z) Os nomes dos gêneros que não possuem nenhum livro cadastrado
SELECT nomeGenero FROM tbLivro
	RIGHT JOIN tbGenero
	ON tbLivro.codGenero = tbGenero.codGenero
	WHERE nomeLivro IS NULL
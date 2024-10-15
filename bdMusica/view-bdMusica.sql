CREATE VIEW vwMusica AS
	SELECT COUNT(idMusica) AS 'quantidade de música', nomeAutor FROM tbAutoria
	INNER JOIN tbAutor
	ON tbAutoria.idAutor = tbAutor.idAutor
	GROUP BY nomeAutor

SELECT * FROM vwMusica

CREATE VIEW vwMaiorCompositor AS 
	SELECT nomeAutor, [quantidade de música] AS 'maior quantidade de musicas' FROM vwMusica
	WHERE [quantidade de música] = (SELECT MAX([quantidade de música]) FROM vwMusica)

SELECT * FROM vwMaiorCompositor

CREATE VIEW vwAutoria AS
	SELECT nomeMusica, nomeAutor, dataComposicao FROM tbAutoria
	INNER JOIN tbAutor
	ON tbAutoria.idAutor = tbAutor.idAutor
	INNER JOIN tbMusica
	ON tbAutoria.idMusica = tbMusica.idMusica
	WHERE MONTH(dataComposicao)=5 AND YEAR(dataComposicao)=2023

SELECT * FROM vwAutoria

CREATE VIEW vwMusicaLonga AS
	SELECT nomeMusica, MAX(duracaoMusica) AS 'musica de maior duracao' FROM tbMusica
	GROUP BY nomeMusica

SELECT * FROM vwMusicaLonga

CREATE VIEW vwGrana AS
	SELECT nomeAutor, MAX(valorDireitoAutoral) AS 'Maior fatura' FROM tbAutoria
	INNER JOIN tbAutor
	ON tbAutoria.idAutor = tbAutor.idAutor
	INNER JOIN tbMusica
	ON tbAutoria.idMusica = tbMusica.idMusica
	GROUP BY nomeAutor

SELECT * FROM vwGrana
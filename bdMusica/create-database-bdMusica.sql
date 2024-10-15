CREATE DATABASE bdMusica
USE bdMusica
GO

CREATE TABLE tbAutor(
	idAutor INT PRIMARY KEY IDENTITY(1,1)
	,nomeAutor VARCHAR(40) NOT NULL
)
CREATE TABLE tbMusica(
	idMusica INT PRIMARY KEY IDENTITY(1,1)
	,nomeMusica VARCHAR (40) NOT NULL
	,duracaoMusica VARCHAR(30) NOT NULL
	,dataComposicao SMALLDATETIME NOT NULL
	,valorDireitoAutoral smallMONEY NOT NULL
)
CREATE TABLE tbAutoria(
	idAutoria INT PRIMARY KEY IDENTITY(1,1)
	,idAutor INT FOREIGN KEY REFERENCES tbAutor(idAutor)
	,idMusica INT FOREIGN KEY REFERENCES tbMusica(idMusica)
)
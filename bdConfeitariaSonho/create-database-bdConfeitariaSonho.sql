CREATE DATABASE bdConfeitariaSonho

--DROP DATABASE bdConfeitariaSonho
GO

USE bdConfeitariaSonho
go

CREATE TABLE tbCategoriaProduto(
	codCategoriaProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeCategoriaProduto VARCHAR (50) NOT NULL
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeProduto VARCHAR (50) NOT NULL
	,precoKiloProduto SMALLMONEY NOT NULL
	,codCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto(codCategoriaProduto)
)

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (60) NOT NULL
	,dataNascimentoCliente SMALLDATETIME NOT NULL
	,ruaCliente VARCHAR (50) NOT NULL
	,numCasaCliente INT NOT NULL
	,cepCliente VARCHAR (20) NOT NULL
	,bairroCliente VARCHAR (50) NOT NULL
	,cidadeCliente VARCHAR (50) NOT NULL
	,estadoCliente VARCHAR (50) NOT NULL
	,cpfCliente CHAR (11) NOT NULL
	,sexoCliente VARCHAR (20) NOT NULL
	)

CREATE TABLE tbEncomenda(
	codEncomenda INT PRIMARY KEY IDENTITY(1,1)
	,dataEncomenda SMALLDATETIME NOT NULL
	,valorTotalEncomenda SMALLMONEY NOT NULL
	,dataEntregaEncomenda SMALLDATETIME NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
)

CREATE TABLE tbItensEncomenda(
	codItensEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,quantidadeKilos DECIMAL NOT NULL
	,subTotal SMALLMONEY NOT NULL
	,codEncomenda INT FOREIGN KEY REFERENCES tbEncomenda (codEncomenda)
	,codProduto  INT FOREIGN KEY REFERENCES tbProduto (codProduto)
)
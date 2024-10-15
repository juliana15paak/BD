CREATE DATABASE bdVeiculo
	USE bdVeiculo
	go

CREATE TABLE tbMotorista(

	codMotorista INT PRIMARY KEY IDENTITY (1,1)
	,nomeMotorista VARCHAR(50) NOT NULL
	,cpfMotorista CHAR(14) NOT NULL
	,pontuacaoAcumulada TINYINT NOT NULL
	,situacao VARCHAR(15)
)

CREATE TABLE tbVeiculo(
	
	codVeiculo INT PRIMARY KEY IDENTITY (1,1)
	,placaVeiculo CHAR (7) NOT NULL
	,renavam CHAR (10) NOT NULL
	,anoFabricacao INT NOT NULL
	,codMotorista INT FOREIGN KEY REFERENCES tbMotorista (codMotorista)
)
CREATE TABLE tbMulta(
	
	CodMulta INT PRIMARY KEY IDENTITY (1,1)
	,dataMulta SMALLDATETIME NOT NULL
	,numPontos TINYINT NOT NULL
	,codVeiculo INT FOREIGN KEY REFERENCES tbVeiculo (codVeiculo)
)

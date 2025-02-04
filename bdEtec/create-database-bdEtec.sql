CREATE DATABASE bdEtec
USE bdEtec
GO

CREATE TABLE tbAluno(
	rm INT PRIMARY KEY 
	,nomeAluno VARCHAR(40) NOT NULL
	,statusAluno VARCHAR(9) 
)

CREATE TABLE tb2A(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,rm INT FOREIGN KEY REFERENCES tbAluno(rm)
)

CREATE TABLE tb2B(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,rm INT FOREIGN KEY REFERENCES tbAluno(rm)
)

CREATE TABLE tb3(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,rm INT FOREIGN KEY REFERENCES tbAluno(rm)
)
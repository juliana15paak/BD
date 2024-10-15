--a
CREATE PROCEDURE spInsertCategoriaProduto
	@nomeCategoriaProduto VARCHAR (50)
AS
	IF EXISTS (SELECT nomeCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCategoriaProduto)
	BEGIN
		PRINT('Categoria já cadastrada')
		END
	ELSE
	BEGIN
		INSERT INTO tbCategoriaProduto(nomeCategoriaProduto)
		VALUES (@nomeCategoriaProduto)
	END

EXEC spInsertCategoriaProduto 'Bolo Festa'
EXEC spInsertCategoriaProduto 'Bolo Simples'
EXEC spInsertCategoriaProduto 'Torta'
EXEC spInsertCategoriaProduto 'Salgado'

SELECT * FROM tbCategoriaProduto

--b
CREATE PROCEDURE spInsertProduto
	@nomeProduto VARCHAR (50)
	,@precoKiloProduto SMALLMONEY 
	,@codCategoriaProduto INT 
AS
	IF EXISTS (SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE codCategoriaProduto LIKE @codCategoriaProduto)
	BEGIN
		IF EXISTS (SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
		BEGIN
			PRINT('Produto já cadastrado')
		END
		ELSE
		BEGIN
			INSERT INTO tbProduto(nomeProduto, precoKiloProduto,codCategoriaProduto)
			VALUES (@nomeProduto,@precoKiloProduto,@codCategoriaProduto)
		END
	END
	ELSE
	BEGIN
		PRINT('Chave estrangeira inválida')
	END

EXEC spInsertProduto 'Bolo Floresta Negra', '42', '1'
EXEC spInsertProduto 'Bolo Prestígio', '43', '1'
EXEC spInsertProduto 'Bolo Nutella', '44', '1'
EXEC spInsertProduto 'Bolo Formigueigo', '17', '2'
EXEC spInsertProduto 'Bolo Cenoura', '19', '2'
EXEC spInsertProduto 'Torta de Palmito', '45', '3'
EXEC spInsertProduto 'Torta de frango e catupiry', '47', '3'
EXEC spInsertProduto 'Torta de escarola', '44', '3'
EXEC spInsertProduto 'Coxinha frango', '25', '4'
EXEC spInsertProduto 'Esfiha carne', '27', '4'
EXEC spInsertProduto 'Folhado queijo', '31', '4'
EXEC spInsertProduto 'Risoles de jaca', '29', '400'

SELECT * FROM tbProduto

--c
CREATE PROCEDURE spInsertCliente
	@nomeCliente VARCHAR(60)
	,@dataNascimentoCliente SMALLDATETIME
	,@ruaCliente VARCHAR(50)
	,@numCasaCLiente INT
	,@cepCliente VARCHAR(20)
	,@cpfCliente CHAR(11)
	,@bairroCliente VARCHAR(50)
	,@cidadeCliente VARCHAR(50)
	,@estadoCliente VARCHAR(50)
	,@sexoCLiente VARCHAR(20)
	
AS
	IF EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		PRINT('Cliente cpf '+@cpfCliente+' já cadastrado')
	END
	ELSE
		BEGIN
		IF (@bairroCliente LIKE 'Itaquera' OR @bairroCliente LIKE 'Guaianazes' OR @bairroCliente LIKE 'Guaianases') 
		BEGIN
			INSERT INTO tbCliente(nomeCliente,dataNascimentoCliente,ruaCliente,numCasaCliente,cepCliente,cpfCliente,bairroCliente,cidadeCliente,estadoCliente,sexoCliente)
			VALUES (@nomeCliente,@dataNascimentoCliente,@ruaCliente,@numCasaCliente,@cepCliente,@cpfCliente,@bairroCliente,@cidadeCliente,@estadoCliente,@sexoCliente)
		END
		ELSE
			BEGIN
				PRINT('Não foi possível cadastrar o cliente ' +@nomeCliente+ ' pois o bairro ' +@bairroCliente+ ' não é atendido pela confeitaria')
			END
		END

EXEC spInsertCliente 'Samira Fatah', '1990-05-05', 'Rua Aguapeí', '1000', '08.090-000', '22299988877', 'Guaianases', 'São Paulo', 'SP', 'F'
EXEC spInsertCliente 'Celia Nogueira', '1992-06-06', 'Rua Andes', '234', '08.456-090', '33355522266', 'Guaianases', 'São Paulo', 'SP', 'F'
EXEC spInsertCliente'Paulo Cesar Siqueira', '1984-04-04', 'Rua Castelo do Piauí', '232', '08.109-000', '11199966622', 'Itaquera', 'São Paulo', 'SP', 'M'
EXEC spInsertCliente 'Rodrigo Favaroni', '1991-09-04', 'Rua Sansão Castelo Branco', '10', '08.431-090', '22233344411', 'Guaianases', 'São Paulo', 'SP', 'M'
EXEC spInsertCliente 'Flávia Regina Brito', '1992-22-04', 'Rua Mariano Moro', '300', '08.200-123', '000', 'Ithhhhaquera', 'São Paulo', 'SP', 'F'

SELECT * FROM tbCliente

--d)
CREATE PROCEDURE spInsertEncomenda
	@dataEncomenda SMALLDATETIME
	,@valorTotalEncomenda SMALLMONEY
	,@dataEntregaEncomenda SMALLDATETIME
	,@cpfCliente CHAR(11)
AS
	DECLARE @codEncomenda VARCHAR(1)
	DECLARE @nomeCliente VARCHAR(60)
	DECLARE @codCliente INT
	
	IF EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		SET @codCliente = (SELECT codCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
		SET @codEncomenda = (SELECT codEncomenda FROM tbEncomenda WHERE codCliente LIKE @codCliente AND dataEntregaEncomenda LIKE @dataEntregaEncomenda)
		SET @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
		INSERT INTO tbEncomenda(dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
		VALUES (@dataEncomenda, @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda)
		PRINT ('Encomenda ' +@codEncomenda+ ' para o cliente ' +@nomeCliente+ ' efetuada com sucesso')
	END
	ELSE
	BEGIN
		PRINT('Não foi possível efetivar a encomenda pois o cliente ' +@nomeCliente+ ' não está cadastrado')
	END

EXEC spInsertEncomenda '2015-08-08', '450', '2015-15-08', '22299988877'
EXEC spInsertEncomenda '2015-10-10', '200', '2015-15-10', '33355522266'
EXEC spInsertEncomenda '2015-10-10', '150', '2015-10-12', '11199966622'
EXEC spInsertEncomenda '2015-06-10', '250', '2015-12-10', '22299988877'
EXEC spInsertEncomenda '2015-05-10', '150', '2015-12-10', '2223339'

SELECT * FROM tbEncomenda

--e
CREATE PROCEDURE spInsertItensEncomenda
	@codEncomenda INT
	,@codProduto INT
	,@quantidadeKilos DECIMAL
	,@subTotal SMALLMONEY
AS
	IF EXISTS (SELECT codEncomenda FROM tbEncomenda WHERE codEncomenda LIKE @codEncomenda)
	BEGIN
		IF EXISTS (SELECT codProduto FROM tbProduto WHERE codProduto LIKE @codProduto)
		BEGIN
			INSERT INTO tbItensEncomenda(codEncomenda,codProduto,quantidadeKilos,subTotal)
			VALUES (@codEncomenda,@codProduto,@quantidadeKilos,@subTotal)
		END
		ELSE
		BEGIN
			PRINT('Chave estrangeira inválida')
		END
	END
	ELSE
	BEGIN
		PRINT('Chave estrangeira inválida')
	END

EXEC spInsertItensEncomenda '1', '1','2.5','105'
EXEC spInsertItensEncomenda '1', '10','2.6','70'
EXEC spInsertItensEncomenda '1', '9','6','150'
EXEC spInsertItensEncomenda '1', '12','4.3','125'
EXEC spInsertItensEncomenda '2', '9','8','200'
EXEC spInsertItensEncomenda '3', '11','3.2','100'
EXEC spInsertItensEncomenda '3', '9','2','50'
EXEC spInsertItensEncomenda '4', '2','3.5','150'
EXEC spInsertItensEncomenda '4', '3','2.2','100'
EXEC spInsertItensEncomenda '500', '6','3.4','150'

SELECT * FROM tbItensEncomenda

--f) 1 (aumenta o preco do produto 1 em 10%)
Create PROCEDURE spAumentarPrecoProduto1
AS
	BEGIN
		UPDATE tbProduto set precoKiloProduto = (precoKiloProduto*1.1)WHERE codCategoriaProduto = 1
	END

EXEC spAumentarPrecoProduto1
SELECT * FROM tbProduto

--f) 2 (desconta o preco do produto 2 em 20%)
CREATE PROCEDURE spDescontoPrecoProduto2
	
AS
	BEGIN
	UPDATE tbProduto set precoKiloProduto = (precoKiloProduto*0.80)WHERE codCategoriaProduto = 2
	END

EXEC spDescontoPrecoProduto2 

SELECT * FROM tbProduto
--f)

CREATE PROCEDURE spAumentar25porcento
	
AS

	BEGIN
		UPDATE tbProduto set precoKiloProduto = (precoKiloProduto*1.25)WHERE codCategoriaProduto = 3
	END

EXEC spAumentar25porcento 
SELECT * FROM tbProduto

--f) 4 (aumenta o preco do produto 4 (exceto esfiha de carne) em 20%)
CREATE PROCEDURE spAumentarPrecoProduto4
AS
	
	BEGIN
		UPDATE tbProduto set precoKiloProduto = (precoKiloProduto*1.20)WHERE codCategoriaProduto = 4 AND nomeProduto != 'Esfiha carne'
	END

EXEC spAumentarPrecoProduto4

SELECT * FROM tbProduto

--g
CREATE PROCEDURE spDeleteCliente
	@cpfCliente CHAR(11)
AS
	DECLARE @nomeCliente VARCHAR(60)
	DECLARE @codCliente INT
	SET @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	SET @codCliente = (SELECT codCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)

	IF EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
	BEGIN
		IF EXISTS (SELECT codEncomenda FROM tbEncomenda WHERE codCliente LIKE @codCliente)
		BEGIN
			PRINT ('Impossível remover esse cliente pois o cliente' +@nomeCliente+ 'possui encomendas.')
		END
		ELSE
		BEGIN
			DELETE FROM tbCliente WHERE cpfCliente LIKE @cpfCliente
			PRINT ('Cliente ' +@nomeCliente+ 'removido com sucesso.')
		END
	END
	ELSE
	BEGIN
		PRINT('Cliente inexistente')
	END

EXEC spDeleteCliente '28877'
SELECT * FROM tbCliente

--h
CREATE PROCEDURE spDeleteItensEncomenda
	@codEncomenda INT
	,@codProduto INT
AS
	IF EXISTS (SELECT codProduto FROM tbProduto WHERE codProduto LIKE @codProduto)
	BEGIN
		IF EXISTS (SELECT codEncomenda FROM tbEncomenda WHERE codEncomenda LIKE @codEncomenda)
		BEGIN
			DECLARE @precoKiloProduto SMALLMONEY
			SET @precoKiloProduto = (SELECT precoKiloProduto FROM tbProduto WHERE codProduto LIKE @codProduto)
			UPDATE tbEncomenda SET valorTotalEncomenda -= @precoKiloProduto
			DELETE FROM tbItensEncomenda WHERE codEncomenda LIKE @codEncomenda AND codProduto LIKE @codProduto
		END
		ELSE
		BEGIN
			PRINT('Encomenda inexistente')
		END
	END
	ELSE
	BEGIN
		PRINT('Produto inexistente')
	END

EXEC spDeleteItensEncomenda '1', '9'

SELECT * FROM tbItensEncomenda

--i
CREATE PROCEDURE spDeleteEncomenda
	@cpfCliente CHAR(11)
	,@dataEntregaEncomenda SMALLDATETIME
AS
	DECLARE @codCliente INT
	SET @codCliente = (SELECT codCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
	DECLARE @codEncomenda INT
	SET @codEncomenda = (SELECT codEncomenda FROM tbEncomenda WHERE dataEntregaEncomenda = @dataEntregaEncomenda AND codCliente LIKE @codCliente)

	IF EXISTS (SELECT cpfCliente FROM tbCliente WHERE @cpfCliente LIKE cpfCliente)
	BEGIN
		IF EXISTS (SELECT @dataEntregaEncomenda FROM tbEncomenda WHERE @dataEntregaEncomenda LIKE dataEntregaEncomenda AND codCliente LIKE @codCliente)
		BEGIN
			DELETE FROM tbItensEncomenda WHERE codEncomenda LIKE @codEncomenda
			DELETE FROM tbEncomenda WHERE dataEntregaEncomenda LIKE @dataEntregaEncomenda AND codCliente LIKE @codCliente
		END
		ELSE
		BEGIN
			PRINT ('Não foi possível excluir pois não há encomenda com a data de entrega '+@dataEntregaEncomenda)
		END
	END
	ELSE
		PRINT ('Não foi possível excluir a encomenda pois o cliente de cpf '+@cpfCliente+' não está cadastrado.')
	
EXEC spDeleteEncomenda '22299988877', '2015-15-08'
SELECT *  FROM tbEncomenda

--j
CREATE PROCEDURE spListaEncomendaData
	@dataEntregaEncomenda SMALLDATETIME
AS
	IF EXISTS (SELECT dataEntregaEncomenda FROM tbEncomenda WHERE dataEntregaEncomenda LIKE @dataEntregaEncomenda)
	BEGIN
		SELECT codEncomenda FROM tbEncomenda WHERE dataEntregaEncomenda LIKE @dataEntregaEncomenda
		SELECT codItensEncomenda FROM tbItensEncomenda INNER JOIN tbEncomenda ON tbItensEncomenda.codEncomenda = tbEncomenda.codEncomenda WHERE dataEntregaEncomenda LIKE @dataEntregaEncomenda
	END
	ELSE
		PRINT ('Não há encomendas para essa data de entrega')

EXEC spListaEncomendaData '2015-15-10'
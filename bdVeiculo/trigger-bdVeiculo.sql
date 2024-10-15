CREATE TRIGGER atualizaPontos ON tbMulta AFTER INSERT
AS
	DECLARE @codMotorista INT, @codVeiculo INT, @numPontos TINYINT
	SET @codVeiculo = (SELECT codVeiculo FROM INSERTED)
	SELECT @numPontos = numPontos FROM inserted
	SET @codMotorista = (SELECT codMotorista FROM tbVeiculo WHERE codVeiculo = @codVeiculo)
	UPDATE tbMotorista
		SET pontuacaoAcumulada = pontuacaoAcumulada+@numPontos
		WHERE codMotorista = @codMotorista

INSERT INTO tbMulta (dataMulta, numPontos, codVeiculo)
VALUES
	(GETDATE(), 4, 1)

SELECT * FROM tbMotorista
SELECT * FROM tbMulta

CREATE TRIGGER tgSituacao ON tbMotorista AFTER INSERT 
AS
	DECLARE @codMotorista INT
	SET @codMotorista = (SELECT codMotorista FROM INSERTED)
	DECLARE @pontuacaoAcumulada INT
	SET @pontuacaoAcumulada = (SELECT pontuacaoAcumulada FROM INSERTED)
	IF (@pontuacaoAcumulada > 20)
	BEGIN
		UPDATE tbMotorista
			SET situacao = 'SUSPENSO'
			WHERE codMotorista = @codMotorista
			PRINT 'Situação alterada para suspenso'
	END
	ELSE
	BEGIN
		UPDATE tbMotorista
			SET situacao = 'ATIVO'
			WHERE codMotorista = @codMotorista
	END

INSERT INTO tbMotorista (nomeMotorista, cpfMotorista, pontuacaoAcumulada)
VALUES
	('Vitor', '332.123.433.23', 23)

SELECT * FROM tbMotorista

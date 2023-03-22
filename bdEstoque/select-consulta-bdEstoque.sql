USE bdEstoque

SELECT sum (valorTotalVenda) AS 'Soma das Vendas' FROM tbVenda
    WHERE MONTH(dataVenda) = 2 or MONTH(dataVenda) = 3 AND YEAR(dataVenda)= 2014 

SELECT sum(quantidadeProduto) AS 'Amaciantes' FROM tbProduto
	WHERE codProduto = 1 OR codProduto = 2

SELECT max(valorProduto) AS 'Produto mais caro' FROM tbProduto

SELECT avg(valorProduto) AS 'Pre�o m�dio dos produtos da Unilever' FROM tbProduto
	WHERE codFabricante = 1

SELECT avg(valorProduto) AS 'Valor m�dio amaciante' FROM tbProduto
	WHERE codProduto = 1 OR codProduto = 2

SELECT avg(quantidadeItensVenda) AS 'M�dia de itens por venda' FROM tbItensVenda
	
SELECT quantidadeProduto FROM tbProduto
	WHERE codFabricante NOT IN ('1')

SELECT sum(quantidadeProduto) AS 'Soma dos produtos com mais de 800 unidades' FROM tbProduto
	WHERE quantidadeProduto>800

SELECT avg(valorProduto) AS 'Pre�o m�dio dos produtos com mais 1000 unidades da Unilever' FROM tbProduto
	WHERE quantidadeProduto>=1000 AND codFabricante=1

SELECT avg(codVenda) AS 'M�dia de vendas em 2014' FROM tbVenda
	WHERE YEAR(dataVenda)=2014
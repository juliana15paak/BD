USE bdEstoque

SELECT codProduto, descricaoProduto, valorProduto, nomeFabricante
	FROM tbProduto
	 INNER JOIN tbFabricante
	 ON tbProduto.codFabricante = tbFabricante.codFabricante 

SELECT codProduto, descricaoProduto, valorProduto, nomeFornecedor 
	FROM tbProduto
	INNER JOIN tbFornecedor
	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor 

SELECT SUM (quantidadeProduto) AS 'Quantidade de Produto', nomeFabricante
	FROM tbProduto
	INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY nomeFabricante
	
SELECT valorTotalVenda, nomeCliente
	FROM tbVenda
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente

SELECT AVG (valorProduto) AS 'Média dos valores dos produtos', nomeFornecedor
	FROM tbProduto
	INNER JOIN tbFornecedor
	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY nomeFornecedor

SELECT SUM (valorTotalVenda) AS 'Valor total da venda', nomeCliente
	FROM tbVenda
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente
	GROUP BY nomeCliente
	ORDER BY nomeCliente

SELECT SUM (valorProduto) AS 'Soma do valor dos Produtos', nomeFabricante
	FROM tbProduto
	INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY nomeFabricante

SELECT AVG (valorProduto) AS 'Média dos valores dos Produtos', nomeFornecedor
	FROM tbProduto
	INNER JOIN tbFornecedor
	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY nomeFornecedor

SELECT SUM (subTotalItensVenda) AS 'Soma do valor total da venda', descricaoProduto
	FROM tbItensVenda
	INNER JOIN tbProduto
	ON tbItensVenda.codProduto = tbProduto.codProduto
	GROUP BY descricaoProduto

SELECT SUM (valorTotalVenda) AS 'Soma das vendas', nomeCliente, dataVenda
	FROM tbVenda
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente
	WHERE YEAR (dataVenda) = 2014 AND MONTH (dataVenda) = 2
	GROUP BY nomeCliente

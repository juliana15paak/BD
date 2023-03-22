use bdEstoque

select codProduto, descricaoProduto, valorProduto, nomeFabricante
	FROM tbProduto
	 INNER JOIN tbFabricante
	 ON tbProduto.codFabricante = tbFabricante.codFabricante 

select codProduto, descricaoProduto, valorProduto, nomeFornecedor 
	FROM tbProduto
	INNER JOIN tbFornecedor
	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor 

SELECT SUM quantidadeProduto
	FROM tbProduto
	GROUP BY nomeFabricante
	INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante

SELECT valorTotalVenda, nomeCliente
	FROM tbVenda
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente

SELECT AVG valorProduto
	FROM tbProduto
	GROUP BY nomeFornecedor
	INNER JOIN tbFornecedor
	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

SELECT SUM valotTotalVenda
	FROM tbVenda
	GROUP BY nomeCliente
	ORDER BY nomeCliente
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente

SELECT SUM valorProduto
	FROM tbProduto
	GROUP BY nomeFabricante
	INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante

SELECT AVG valorProduto
	FROM tbProduto
	GROUP BY nomeFornecedor
	INNER JOIN tbFornecedor
	ON tbProduto.codFornecedor = tbFornecedor.codFornrcedor

SELECT SUM valorTotalVenda 
	FROM tbVenda
	GROUP BY nomeProduto
	INNER JOIN tbProduto
	ON tbVenda.codProduto = tbProduto.codProduto

SELECT SUM valorTotalVenda
	FROM tbVenda
	GROUP BY nomeCliente
	WHERE YEAR (dataVenda) = 2014
	WHERE MONTH (dataVenda) = 2
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente
USE bdEstoque

SELECT sum (valorTotalVenda) AS 'Soma das Vendas' FROM tbVenda
    WHERE MONTH(dataVenda) = 2 or MONTH(dataVenda) = 3 AND YEAR(dataVenda)= 2014 

SELECT sum(quantidadeProduto) AS 'Amaciantes' FROM tbProduto
	WHERE codProduto = 1 OR codProduto = 2

SELECT max(valorProduto) AS 'Produto mais caro' FROM tbProduto

SELECT avg(valorProduto) AS 'Preço médio dos produtos da Unilever' FROM tbProduto
	WHERE codFabricante = 1

SELECT avg(valorProduto) AS 'Valor médio amaciante' FROM tbProduto
	WHERE codProduto = 1 OR codProduto = 2

SELECT avg(quantidadeItensVenda) AS 'Média de itens por venda' FROM tbItensVenda
	
SELECT quantidadeProduto FROM tbProduto
	WHERE codFabricante NOT IN ('1')

SELECT sum(quantidadeProduto) AS 'Soma dos produtos com mais de 800 unidades' FROM tbProduto
	WHERE quantidadeProduto>800

SELECT avg(valorProduto) AS 'Preço médio dos produtos com mais 1000 unidades da Unilever' FROM tbProduto
	WHERE quantidadeProduto>=1000 AND codFabricante=1

SELECT avg(codVenda) AS 'Média de vendas em 2014' FROM tbVenda
	WHERE YEAR(dataVenda)=2014
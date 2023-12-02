USE AdventureWorksDW2022;

--Total de Clientes distintos com vendas
SELECT 	
	FORMAT(COUNT(DISTINCT(CustomerKey)), 'N0', 'en-US') AS ClientesDistintos
FROM FactInternetSales;


--Distribução de Clientes por País/Região
SELECT 
	G.EnglishCountryRegionName AS RegionName
	,FORMAT(COUNT(DISTINCT(S.CustomerKey)), 'N0', 'en-US') AS ClientesDistintos
FROM FactInternetSales S
INNER JOIN DimCustomer C ON C.CustomerKey = S.CustomerKey
INNER JOIN DimGeography G ON G.GeographyKey = C.GeographyKey
GROUP BY G.EnglishCountryRegionName
ORDER BY ClientesDistintos DESC


--Top 5 produtos mais comprados pelos clientes
SELECT TOP 5 
	P.ModelName AS NomeProduto, 
	FORMAT(COUNT(*), 'N0', 'en-US')  AS QuantidadeComprada
FROM DimCustomer AS C
INNER JOIN FactInternetSales S ON C.CustomerKey= S.CustomerKey
INNER JOIN DimProduct AS P ON S.ProductKey = P.ProductKey
GROUP BY P.ModelName
ORDER BY QuantidadeComprada DESC;


-- Média de vendas por cliente
SELECT
	FORMAT(AVG(TotalVendas), 'C2', 'en-US') AS MediaVendas
FROM(
	SELECT 
		 C.CustomerKey
		,SUM(s.SalesAmount) AS TotalVendas
	FROM DimCustomer AS C
	INNER JOIN FactInternetSales S ON C.CustomerKey= S.CustomerKey
	GROUP BY C.CustomerKey
) VendasClientes

-- Ticket Médio, Min, Max
SELECT 
	 FORMAT(MIN(s.SalesAmount), 'C2', 'en-US') AS MenorTicket
	,FORMAT(AVG(s.SalesAmount), 'C2', 'en-US') AS TicketMédio
	,FORMAT(MAX(s.SalesAmount), 'C2', 'en-US') AS MaiorTicket
FROM FactInternetSales S 


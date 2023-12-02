USE AdventureWorksDW2022;

-- Verificar se a tabela temporária existe
IF OBJECT_ID('tempdb..#ClientesPrimeiraDataCompra') IS NOT NULL
BEGIN
    -- Se a tabela existir, Drop!
    DROP TABLE #ClientesPrimeiraDataCompra;
END;

-- Criar tabela temporária... #ClientesPrimeiraDataCompra
SELECT 	
	 DATEPART(YEAR , MIN(S.OrderDate)) AS Ano 
	,FORMAT(DATEPART(MONTH , MIN(S.OrderDate)), '00') AS Mes 	
	,S.CustomerKey AS ClienteID
	,G.EnglishCountryRegionName AS RegionName
	,MIN(S.OrderDate) AS PrimeiraDataCompra
INTO #ClientesPrimeiraDataCompra
FROM FactInternetSales S
INNER JOIN DimCustomer C ON C.CustomerKey = S.CustomerKey
INNER JOIN DimGeography G ON G.GeographyKey = C.GeographyKey
GROUP BY S.CustomerKey, G.EnglishCountryRegionName
HAVING DATEPART(YEAR , MIN(S.OrderDate)) BETWEEN 2011 AND 2013;

-- Agrupando dados
WITH NovosClientesPorRegiao(Regiao, Ano, NovosClientes, NovosClientes_LY, NovosClientesDeltaLY) AS 
(
SELECT
	   RegionName AS Regiao
	  ,Ano 
	  ,COUNT(ClienteID) AS NovosClientes
	  ,LAG(COUNT(ClienteID), 1) OVER(ORDER BY RegionName, Ano) AS NovosClientes_LY
	  ,CASE 
			WHEN LAG(COUNT(ClienteID), 1) OVER(ORDER BY RegionName, Ano) IS NULL THEN 0
			ELSE COUNT(ClienteID) - LAG(COUNT(ClienteID), 1) OVER(ORDER BY RegionName, Ano)
	  END AS NovosClientesDeltaLY
FROM #ClientesPrimeiraDataCompra
GROUP BY RegionName, Ano
)
SELECT
	 Regiao
	,Ano
	,NovosClientes
	,NovosClientes_LY
	,NovosClientesDeltaLY
	,FORMAT((CAST(NovosClientesDeltaLY AS DECIMAL) / CAST(NovosClientes_LY AS DECIMAL)), 'P0') AS NovosClientesDeltaLYPercent
FROM NovosClientesPorRegiao
WHERE Ano = 2013
ORDER BY NovosClientesDeltaLY DESC
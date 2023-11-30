USE AdventureWorksDW2022;

--Novos Clientes por Ano e Mes entre 2011 e 2013
-- Utilizando CTE e Window function
WITH ClientesPrimeiraDataCompra(Ano, Mes, ClienteID,PrimeiraDataCompra) AS 
(
	SELECT 	
		 DATEPART(YEAR , MIN(S.OrderDate)) AS Ano 
		,FORMAT(DATEPART(MONTH , MIN(S.OrderDate)), '00') AS Mes 	
		,S.CustomerKey AS ClienteID
		,MIN(S.OrderDate) AS PrimeiraDataCompra
	FROM FactInternetSales S
	INNER JOIN DimCustomer C ON C.CustomerKey = S.CustomerKey
	INNER JOIN DimGeography G ON G.GeographyKey = C.GeographyKey
	GROUP BY S.CustomerKey
	HAVING DATEPART(YEAR , MIN(S.OrderDate)) BETWEEN 2011 AND 2013
)
SELECT Ano 
	  ,Mes 	
	  ,COUNT(ClienteID) AS NovosClientes
	  ,LAG(COUNT(ClienteID), 12) OVER(ORDER BY Ano, Mes) AS NovosClientes_LY
	  ,CASE 
			WHEN LAG(COUNT(ClienteID), 12) OVER(ORDER BY Ano, Mes) IS NULL THEN 0
			ELSE COUNT(ClienteID) - LAG(COUNT(ClienteID), 12) OVER(ORDER BY Ano, Mes)
	  END AS NovosClientesDeltaLY
	 ,CASE
			WHEN LAG(COUNT(ClienteID), 12) OVER(ORDER BY Ano, Mes) IS NOT NULL THEN 
				(COUNT(ClienteID) - LAG(COUNT(ClienteID), 12) OVER(ORDER BY Ano, Mes))*100 / 
				LAG(COUNT(ClienteID), 12) OVER(ORDER BY Ano, Mes)
			ELSE 0
	  END AS NovosClientesDeltaLY_Percent
FROM ClientesPrimeiraDataCompra
GROUP BY Ano, Mes
ORDER BY Ano, Mes
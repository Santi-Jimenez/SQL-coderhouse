--SELECT StoreKey, COUNT(DISTINCT CustomerKey) FROM FactOnlineSales
--GROUP BY StoreKey


--Cuenta el total de empleados de marketing y production.
/*
SELECT DepartmentName, COUNT(*) FROM DimEmployee
WHERE MaritalStatus = 'S'
AND
DepartmentName IN ('Marketing','Production')
GROUP BY DepartmentName */

--Detalles de los productos con los precos mas alto de mayor a menor
/*
SELECT TOP 20ProductKey,ProductName,UnitCost 
FROM DimProduct
ORDER BY UnitCost DESC
*/

--Calcular promedio de unitcost
/*
SELECT StockTypeName, AVG(UnitCost) AS 'Promedio de costo unitario' FROM DimProduct
WHERE StockTypeName IN ('alto','bajo')
GROUP BY StockTypeName */

--Filtrar tabla agregada o resultante DONDE EL PROM ES MAYOR A 160
/*
SELECT StockTypeName, AVG(UnitCost) AS 'Promedio de costo unitario' FROM DimProduct
WHERE StockTypeName IN ('alto','bajo')
GROUP BY StockTypeName
HAVING AVG(UnitCost) > 160 */

--Consulta que cuente la cant de fabricante cuyo product pertenece a deluxe
SELECT COUNT(DISTINCT Manufacturer) AS 'Cantidad de Fabricantes unicos' FROM DimProduct 
WHERE ClassName LIKE '%Deluxe%' --lIKE TARE A TODO LOS REGISTRO Q CONTNGA LA PALABRA DELUXE

SELECT * FROM Censo

--Visualizar columna estado
SELECT Estado FROM Censo

--Visualizar id_Estado 
SELECT id_estado FROM Censo

--Visualizar ciudades con M y idestado >= 30
SELECT Ciudad, id_estado FROM Censo  
WHERE Ciudad LIKE 'M%' AND id_estado >= 30

--Visualizar cuantas ciudades tiene cada estado y llamarla columna 'cantidad'
SELECT DISTINCT(Estado), COUNT(DISTINCT(Ciudad)) AS Cantidad FROM Censo
GROUP BY Estado;

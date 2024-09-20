SELECT * FROM Ciudades_USA$
SELECT * FROM Datos_Censo$
SELECT * FROM Estados$

SELECT * FROM Estados$ AS T1
LEFT JOIN Ciudades_USA$ AS T2 
ON T1.ID_EStado = T2.ID_Estado;

SELECT * FROM Ciudades_USA$ AS T1
RIGHT JOIN Estados$ AS T2 
ON T1.ID_Estado = T2.ID_EStado;

---
SELECT * FROM Ciudades_USA$ AS T1
LEFT JOIN Datos_Censo$ AS T2 
ON T1.ID_Ciudad = T2.ID_Ciudad;

SELECT * FROM Ciudades_USA$ AS T1
INNER JOIN Datos_Censo$ AS T2 
ON T1.ID_Ciudad = T2.ID_Ciudad;



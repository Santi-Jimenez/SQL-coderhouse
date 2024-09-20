--Practica sem4
--1, cuantos cursos Y carreras tiene el area de data. renombrar cant_asignaturas
SELECT * FROM Area
SELECT * FROM Asignaturas WHERE Area = 5;

SELECT COUNT(DISTINCT(Nombre)) AS Cant_Asignatura, Tipo , Area
FROM Asignaturas
WHERE Area = 5
GROUP BY Tipo, Area;

--2, Saber Nombre, documento, telefono de los estudiantes en agronomia que nacieron entre el anio 1970 y el anio 2000.
SELECT * FROM Estudiantes
SELECT * FROM Profesiones
WHERE Profesiones LIKE 'Agro%'

SELECT Nombre, Documento, telefono,[Fecha de Nacimiento], Profesion 
FROM Estudiantes
WHERE Profesion =6 AND 
[Fecha de Nacimiento] BETWEEN '1970' AND '2000';

--3, Listado de docente que ingresaron en el anio 2021, concatenar nombre y apellido con un guion en medio y debe estar en mayuscula.
SELECT * FROM Staff

SELECT UPPER(CONCAT(Nombre,'-',Apellido)) AS Nombres_Apellidos, [Fecha Ingreso] FROM Staff
WHERE [Fecha Ingreso] like '2020%';

--4, Cantidad de encargados de docentes y tutores, Renombrar CantEncargados. Quitar la palabra Encargado en c/u, Renombrar nuevo tipo.
SELECT * FROM Staff
SELECT * FROM Encargado;

SELECT DISTINCT(COUNT(Tipo)) AS CantEncargado, Tipo AS NuevoTipo FROM Encargado
GROUP BY Tipo;
/*
Select * From Encargado
SELECT REPLACE(Tipo,'Encargado','') AS NuevoTipo, COUNT(Encargado_ID) AS CantEncargados
FROM Encargado
GROUP BY Tipo;
*/
UPDATE Encargado SET Tipo = 'Docentes' WHERE tipo LIKE 'Encargado Do%';
UPDATE Encargado SET Tipo = 'Tutores' WHERE tipo LIKE 'Encargado Tu%';

--5, Cual es el precio Promedio de las carreras y cursos por jornada, Renombrar Promedio. Ordenar mayor a menos.
SELECT * FROM Asignaturas;

SELECT Jornada, Tipo, AVG(Costo) AS Promedio FROM Asignaturas
GROUP BY Jornada, Tipo
ORDER BY Promedio DESC;
/*
SELECT Costo FROM Asignaturas
SELECT Tipo, Jornada, AVG(Costo) AS Promedio
FROM Asignaturas
GROUP BY Tipo, Jornada
ORDER BY Promedio DESC; */

--6, Calcular la edad de los estudiantes en una nueva columna, renombrar nueva columna EDAD. Filtrar solo los +18. ordenar menor a mayor
SELECT * FROM Estudiantes;

SELECT Nombre, 
Apellido,
[Fecha de Nacimiento],
CONVERT(DATE,GETDATE()) AS FechaDeHoy,
DATEDIFF(YEAR, [Fecha de Nacimiento],GETDATE()) AS Edad
FROM Estudiantes ORDER BY Edad;

--7, Nombre, Corre, Camada(comision), Fecha ingreso de personas del staff que contienen correo .edu y su docenteID es mayor o igual que 100.
SELECT * FROM Staff;

SELECT DocentesID, CONCAT(Nombre,' ',Apellido) AS Nombre_Apellido, Correo, Camada, [Fecha Ingreso]  FROM Staff
WHERE Correo LIKE '%.edu' AND DocentesID >= 100;

--8, Conocer Documento, Domicilio, Codigo Postal y Nombre de los primeros 5 estudiantes que se registraron en la plataforma.
SELECT * FROM Estudiantes;

SELECT TOP(5)Nombre, Documento, Domicilio, [Codigo Postal], [Fecha Ingreso] 
FROM Estudiantes ORDER BY [Fecha Ingreso];
-------------SEMANA 5

--Documento, nombre Docente y comision(mayor a menos)
--Documento, nombre Docente, y comision(ingreso mayo 2021)
--Agregar campo indicador que informe cuales son los registros mayor a menor y los que son mayo2021, ordenar listado de menor a mayor por camada

SELECT * FROM Staff; --Analisis docente
SELECT Documento, CONCAT(Nombre, ' ', Apellido) AS Nombre, CamadaFROM StaffWHERE Camada IN (SELECT MAX(Camada) from staff UNION SELECT MIN(Camada) from staff)ORDER BY Camada desc;

SELECT Documento, CONCAT(Nombre, ' ', Apellido) AS Nombre, Camada, [Fecha Ingreso]FROM StaffWHERE [Fecha Ingreso] LIKE '2021-05%'

SELECT Documento, CONCAT(Nombre, ' ', Apellido) AS Nombre, Camada,	CASE		WHEN DATEPART(MONTH, [Fecha Ingreso]) = 5 OR DATEPART(YEAR, [Fecha Ingreso]) = 2021 THEN 'Mayo 2021'		WHEN DATEPART(MONTH, [Fecha Ingreso]) > 5 OR DATEPART(YEAR, [Fecha Ingreso]) > 2021 THEN 'Mayor'		WHEN DATEPART(MONTH, [Fecha Ingreso]) < 5 OR DATEPART(YEAR, [Fecha Ingreso]) < 2021 THEN 'Menor'		ELSE ''	END AS Indicador,[Fecha Ingreso]FROM Staff;

SELECT Documento, CONCAT(Nombre, ' ', Apellido) AS Nombre, Camada,	CASE		--WHEN DATEPART(MONTH, [Fecha Ingreso]) = 5 AND DATEPART(YEAR, [Fecha Ingreso]) = 2021 THEN 'Mayo 2021'		WHEN [Fecha Ingreso] > '2021-05-31' THEN 'Mayor'		WHEN [Fecha Ingreso] < '2021-05-01' THEN 'Menor'		ELSE 'Mayo 2021'	END AS Indicador, [Fecha Ingreso]FROM Staff;

--Por medio de la fecha de ingreso de los estudiantes identificar la cantidad total de estudiantes.
--Mostrar periodo de tiempo separados anio, mes y dia. Ordenar por la fechas que mas ingresaron estudiantes

SELECT * FROM Estudiantes

SELECT [Fecha Ingreso], COUNT([Fecha Ingreso]) AS CantidadTotalEstudiantes 
FROM Estudiantes
GROUP BY [Fecha Ingreso]
ORDER BY [Fecha Ingreso];

SELECT YEAR([Fecha Ingreso]) AS Anio_Ingreso,(MONTH([Fecha Ingreso])) AS Mes_Ingreso,(DAY([Fecha Ingreso])) AS Dia_Ingreso,
COUNT([Fecha Ingreso]) AS CantidadTotalEstudiantesIngresaron 
FROM Estudiantes
GROUP BY [Fecha Ingreso]
ORDER BY CantidadTotalEstudiantesIngresaron DESC;

--TOP 10 de los encargados que tiene mas docentes a cargo, solo los q tiene a cargo docentes.
--Ordenar mayor a menor para tener listado correctamente.
SELECT * FROM Encargado;
SELECT * FROM Staff;

SELECT TOP(10) E.Encargado_ID, E.Nombre,
E.Tipo,
COUNT(ST.Encargado) AS CantDocentesACargo
FROM Encargado AS E
INNER JOIN Staff AS ST 
ON E.Encargado_ID = ST.Encargado
WHERE Tipo = 'Docentes'
GROUP BY E.Tipo, E.Encargado_ID, E.Nombre
ORDER BY CantDocentesACargo DESC;

--Identificar la profesion y la cantidad de estudiantes, mostrar listados de profesiones que tienen mas estudiantes
--Ordenar de mayor a menor
SELECT * FROM Profesiones;
SELECT * FROM Estudiantes;

SELECT  DISTINCT(P.Profesiones),
COUNT(E.EstudiantesID) AS CantEstudiantes
FROM Profesiones AS P
INNER JOIN Estudiantes AS E
ON P.ProfesionesID = E.Profesion
GROUP BY P.Profesiones
HAVING COUNT(E.EstudiantesID) >= 5
ORDER BY CantEstudiantes DESC;

--Nombre de area, si la asignatura es curso o carrera, jornada a la que pertenece, cant de estudiantes y monto total del costo de la asignatura.
--mayor a menor por monto de costos total, sumar docentes q no tienen estudiantes ni asignatura.
SELECT * FROM Area
SELECT * FROM Asignaturas
SELECT * FROM Estudiantes
SELECT * FROM Staff


SELECT A.Nombre AS NombreArea,
ASI.Nombre AS NombreAsignatura, ASI.Tipo, ASI.Jornada, SUM(ASI.Costo) AS MontoTotal,
COUNT(DISTINCT ST.DocentesID) AS CantDocentes,
COUNT(E.EstudiantesID) AS CantEstudiantes
FROM Asignaturas AS ASI
INNER JOIN Area AS A
ON ASI.Area = A.AreaID
INNER JOIN Staff AS ST
ON ASI.AsignaturasID = ST.Asignatura
INNER JOIN Estudiantes AS E
ON ST.DocentesID = E.Docente
GROUP BY A.Nombre,ASI.Nombre,ASI.Tipo,ASI.Jornada
ORDER BY MontoTotal DESC;





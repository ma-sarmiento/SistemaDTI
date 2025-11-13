--Consulta #1
CREATE VIEW Vista_Valor_Poliza AS
SELECT p.ID AS id_poliza,
       SUM(p.valorasegurable * (1 + d.PORCENTAJE / 100) * (1 + t.PORCENTAJE / 100)) AS valor_poliza
FROM POLIZA p
JOIN TOMADOR t ON p.TOM_ID = t.ID
JOIN DEPARTAMENTO d ON t.IDDEPARTAMENTO = d.ID
JOIN TIPO_CUBRIMIENTO c ON p.ID_TIP = c.ID
GROUP BY p.ID;

--Consulta #2
CREATE VIEW Vista_Datos_Poliza AS
SELECT t.NOMBRE AS nombre_tomador,
       COALESCE(c.NOMBRE, 'Sin cubrimiento') AS nombre_tipo_cubrimiento,
       COALESCE(d.NOMBRE, 'Sin departamento') AS nombre_departamento,
       COALESCE(p.numero, 'Sin póliza') AS numero_poliza,
       COALESCE(v.valor_poliza, 0) AS valor_poliza
FROM TOMADOR t
LEFT JOIN POLIZA p ON t.ID = p.TOM_ID
LEFT JOIN Vista_Valor_Poliza v ON p.ID = v.id_poliza
LEFT JOIN TIPO_CUBRIMIENTO c ON p.ID_TIP = c.ID
LEFT JOIN DEPARTAMENTO d ON t.IDDEPARTAMENTO = d.ID;

--Consulta #3
CREATE VIEW Vista_PolizasPorTomador AS
(SELECT 
    T.NOMBRE AS "Nombre del Tomador",
    SUM(P.VALORASEGURABLE) AS "Total Asegurable por Tomador",
    SUM(P.VALORASEGURABLE * (1 + TC.PORCENTAJE / 100)) AS "Total de Póliza por Tomador"
FROM 
    TOMADOR T
JOIN 
    POLIZA P ON T.ID = P.TOM_ID
JOIN 
    TIPO_CUBRIMIENTO TC ON P.ID_TIP = TC.ID
GROUP BY 
    T.NOMBRE
UNION ALL
SELECT 
    'Total General' AS "Nombre del Tomador",
    SUM(P.VALORASEGURABLE) AS "Total Asegurable por Tomador",
    SUM(P.VALORASEGURABLE * (1 + TC.PORCENTAJE / 100)) AS "Total de Póliza por Tomador"
FROM 
    TOMADOR T
JOIN 
    POLIZA P ON T.ID = P.TOM_ID
JOIN 
    TIPO_CUBRIMIENTO TC ON P.ID_TIP = TC.ID);


--Consulta #4
CREATE VIEW Vista_Valor_Polizas_Por_Año_Mes AS
SELECT EXTRACT(YEAR FROM fechafin) AS año_vencimiento,
       EXTRACT(MONTH FROM fechafin) AS mes_vencimiento,
       SUM(valorasegurable) AS suma_valor_poliza
FROM POLIZA
GROUP BY EXTRACT(YEAR FROM fechafin), EXTRACT(MONTH FROM fechafin);

--Consulta #5

CREATE VIEW Vista_PorcentajeParticipacion AS
SELECT 
    D.NOMBRE AS "Nombre del Departamento",
    (COUNT(T.ID) * 100.0 / (SELECT COUNT(*) FROM TOMADOR)) AS "Porcentaje de Participación"
FROM 
    DEPARTAMENTO D
LEFT JOIN 
    TOMADOR T ON D.ID = T.IDDEPARTAMENTO
GROUP BY 
    D.NOMBRE;


--Consulta #6
CREATE VIEW Vista_Tomador_Todos_Cubrimientos AS
SELECT t.NOMBRE AS nombre_tomador
FROM TOMADOR t
JOIN (
    SELECT TOM_ID
    FROM POLIZA
    GROUP BY TOM_ID
    HAVING COUNT(DISTINCT ID_TIP) = (SELECT COUNT(*) FROM TIPO_CUBRIMIENTO)
) p ON t.ID = p.TOM_ID;

--Consulta #7
CREATE VIEW Vista_Totales_Tomadores AS
SELECT d.NOMBRE AS Dpto,
       SUM(CASE WHEN t.GENERO = 'femenino' THEN 1 ELSE 0 END) AS "Número total de mujeres",
       SUM(CASE WHEN t.GENERO = 'masculino' THEN 1 ELSE 0 END) AS "Número total de hombres",
       COUNT(t.ID) AS Total
FROM TOMADOR t
JOIN DEPARTAMENTO d ON t.IDDEPARTAMENTO = d.ID
GROUP BY d.NOMBRE
UNION ALL
SELECT 'Totales' AS Dpto,
       SUM(CASE WHEN t.GENERO = 'femenino' THEN 1 ELSE 0 END) AS "Número total de mujeres",
       SUM(CASE WHEN t.GENERO = 'masculino' THEN 1 ELSE 0 END) AS "Número total de hombres",
       COUNT(t.ID) AS Total
FROM TOMADOR t;

# SistemaDTI
Proyecto académico desarrollado para la materia de Bases de Datos (2024-10).


Proyecto académico desarrollado como parte del diseño y construcción de bases de datos relacionales utilizando Oracle Database.
El sistema modela la operación básica de una entidad aseguradora y permite calcular el valor total de las pólizas de seguro según el tipo de cubrimiento y el nivel de riesgo asociado al departamento.

---

## 📌 Funcionalidades principales

## 📌 Funcionalidades principales

El sistema incorpora la estructura de datos necesaria para gestionar pólizas de seguro, sus tomadores y sus coberturas. Incluye:

- Creación de las tablas base del sistema.
- Inserción de datos de ejemplo con valores significativos.
- Consultas SQL desarrolladas como **vistas**, entre ellas:
  - Cálculo total del valor de la póliza.
  - Listado detallado de pólizas (tomador, departamento, cubrimiento, valor).
  - Totales por tomador.
  - Totales agrupados por año y mes de vencimiento.
  - Porcentaje de participación por departamento.
  - Identificación de tomadores que poseen todos los tipos de cubrimiento.
  - Distribución de tomadores por género en cada departamento.
- Scripts para **asignación de permisos**.

---

## 🛠️ Tecnologías utilizadas

- **Oracle SQL / PL-SQL**
- Oracle Live SQL, Oracle SQL Developer u Oracle XE
- Git + GitHub para control de versiones
---

## 📂 Estructura del proyecto
```plaintext
SistemaDTI/
├── Scripts/
│   ├── Creacion_Tablas.sql        # DDL: definición de entidades, llaves primarias y foráneas
│   ├── Insercion_Tuplas.sql       # DML: inserción inicial de datos
│   ├── Consultas.sql              # Vistas y consultas analíticas
│   └── Permisos.sql               # Otorgamiento de permisos de lectura
├── .gitignore
├── LICENSE
└── README.md
```

---

## 🧠 Descripción del modelo de datos

El sistema se basa en un modelo relacional normalizado compuesto por cuatro entidades principales:

- 🏛️ DEPARTAMENTO

Contiene los departamentos del país y un porcentaje de riesgo asociado.

- 🧍 TOMADOR

Registra a los clientes que adquieren pólizas.
Incluye información personal como género, edad y departamento.

- ⚙️ TIPO_CUBRIMIENTO

Define el tipo de cobertura y su porcentaje asociado.

- 📄 POLIZA

Contiene las pólizas adquiridas por los clientes, enlazando:

  -Tomador

  -Tipo de cubrimiento

  -Valor asegurable

  -Fecha de inicio y fin

Las consultas del sistema permiten calcular el valor de la póliza combinando los porcentajes de riesgo del departamento y del cubrimiento, aplicados al valor asegurable.

---

📊 Estado del proyecto

Este proyecto se revisó y reorganizó para su publicación en GitHub con fines académicos y de portafolio personal.
Los scripts fueron probados en OracleXE y Oracle Live y funcionan de forma independiente.

---

## 🚀 Cómo ejecutar los scripts

⭐Opción 1 **Oracle Live SQL**:
```bash
1. Ingresa a https://livesql.oracle.com

2. Abre SQL Worksheet.

3. Ejecuta los archivos en este orden:

    a. Creacion_Tablas.sql

    b. Insercion_Tuplas.sql

    c. Consultas.sql

    d. Permisos.sql
   ```
⭐Opción 2 **Oracle SQL Developer o XE**:
   ```bash
1.Crea una conexión con:

    Usuario: system o uno propio

    Host: localhost

    Puerto: 1521

   SID: XE

Ejecuta los scripts en el mismo orden anterior.
```

---
   
>  Nota: Por razones de derechos académicos, el enunciado original del proyecto **no será publicado en este repositorio**.

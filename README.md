# RetailPro / TechStore — Proyecto de Análisis de Datos

Proyecto desarrollado como parte de mi formación en Análisis de Datos.

El objetivo es construir una solución de análisis de ventas completa, comenzando por el diseño de una base de datos relacional en SQL Server y avanzando hacia un proceso ETL en Power BI mediante Power Query.

---

## Base de datos

Se creó la base de datos:

`Ventas_Tech_DB`

El modelo está compuesto por cuatro tablas relacionadas:

- `categorias`
- `clientes`
- `productos`
- `ventas`

Se implementaron:

- Primary Keys
- Foreign Keys
- Restricciones `NOT NULL`
- Valores `DEFAULT`
- Inserción de datos
- Relaciones entre las tablas

---

## Consultas SQL de negocio

Se desarrollaron consultas orientadas al análisis comercial para obtener métricas como:

- Facturación total
- Cantidad de pedidos
- Ticket promedio
- Ranking de productos
- Unidades vendidas
- Clientes recurrentes
- Facturación mensual
- Comparación contra el promedio mensual

---

## JOINs y análisis relacional

Se utilizaron `INNER JOIN` y `LEFT JOIN` para combinar la información de las diferentes tablas.

Entre las consultas realizadas se encuentran:

- Vista detallada de ventas
- Ventas con información del cliente
- Ventas con información del producto y categoría
- Identificación de clientes sin compras
- Identificación de productos sin ventas
- Consolidación de información mediante `UNION ALL`

---

## Pipeline ETL con Power BI

Se desarrolló un proceso ETL utilizando Power BI y Power Query a partir del dataset `Pipeline_ETL_Dataset.xlsx`.

El proceso incluyó:

### Extracción
Importación de las tablas:

- `clientes`
- `productos`
- `categorias`
- `ventas`

### Transformación
Se realizaron tareas de limpieza y preparación de datos:

- Análisis de calidad de columnas
- Eliminación de registros duplicados por ID
- Tratamiento de valores nulos
- Corrección de tipos de datos
- Estandarización de nombres
- Validación de claves
- Preparación de dimensiones y tabla de hechos

Las consultas fueron renombradas siguiendo una nomenclatura orientada a un modelo analítico:

- `Dim_Clientes`
- `Dim_Productos`
- `Dim_Categorias`
- `Fact_Ventas`

### Merge de consultas

Se realizó un Merge entre `Fact_Ventas` y `Dim_Productos` mediante `id_producto`.

Esto permitió incorporar a la tabla de ventas información descriptiva como:

- `nombre_producto`
- `categoria`

De esta forma, `Fact_Ventas` queda preparada como fuente principal para los futuros análisis y visualizaciones.

---

## Calidad de datos

Durante el proceso ETL se identificaron y trataron problemas intencionales del dataset:

- Clientes duplicados
- Productos duplicados
- Valores nulos en clientes
- Valores nulos en productos
- Tipos de datos incorrectos

Las decisiones de limpieza fueron tomadas buscando conservar información útil sin comprometer la calidad del modelo.

---

##  Power Query y lenguaje M

Las transformaciones realizadas en Power Query fueron documentadas mediante lenguaje M.

Se incorporaron comentarios técnicos para explicar decisiones como:

- Eliminación de duplicados por clave primaria
- Tratamiento de valores nulos
- Asignación de tipos de datos
- Preparación de claves para relaciones
- Transformaciones necesarias para el modelo analítico

---


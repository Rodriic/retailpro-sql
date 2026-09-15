# retailpro-sql
Proyecto SQL - Modelo de datos RetailPro

# Proyecto de Base de Datos - Ventas Tech DB

## 📌 Descripción del Proyecto
Este proyecto implementa el diseño, creación y carga de una base de datos relacional para la gestión de ventas y productos de una tienda de tecnología. Contempla la administración de categorías, productos, clientes y el registro de ventas con sus correspondientes relaciones de integridad referencial.

---

## 🚀 Requisitos e Instalación

### Requisitos previos:
- Gestor de Base de Datos: **SQL Server** / Azure Data Studio / DBeaver.
- Permisos para crear y modificar bases de datos locales.

### Instrucciones de ejecución:
1. Abrir el archivo `script.sql` en SQL Server Management Studio (SSMS) o tu cliente SQL preferido.
2. Asegurarse de estar conectado a la instancia local.
3. Ejecutar el script completo de forma secuencial. El script crea la base de datos `Ventas_Tech_DB`, selecciona el contexto automáticamente y carga la información inicial.

---

## 📂 Estructura del Script SQL

El archivo SQL está organizado en las siguientes secciones:

1. **Configuración y Creación de Base de Datos:**
   - Creación de `Ventas_Tech_DB` y selección con `USE`.
2. **DDL - Eliminación (DROP) y Creación de Tablas (CREATE):**
   - Definición de tablas maestras (`categorias`, `clientes`).
   - Definición de tablas con claves foráneas (`productos`, `ventas`, `detalle_ventas`).
   - Restricciones de integridad (`PRIMARY KEY`, `FOREIGN KEY`, tipos de datos y valores por defecto).
3. **DML - Inserción de Datos (INSERT INTO):**
   - Carga de registros de prueba consistentes para validar las relaciones.
4. **DQL - Verificación (SELECT):**
   - Consultas de comprobación para validar la correcta persistencia de los datos.

---

## 🛠️ Tecnologías Utilizadas
- **Lenguaje:** SQL (T-SQL / Estándar)
- **Motor:** SQL Server

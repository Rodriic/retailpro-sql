USE Ventas_Tech_DB;
GO

-- ==========================================================
-- CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
-- Total facturado, cantidad de pedidos y ticket promedio
-- agrupados por mes.
-- ==========================================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- ==========================================================
-- CONSULTA 2 - RANKING DE PRODUCTOS
-- Top 5 productos por total facturado.
-- ==========================================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- ==========================================================
-- CONSULTA 3 - CLIENTES RECURRENTES
-- Clientes que realizaron más de un pedido.
-- ==========================================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- ==========================================================
-- CONSULTA 4 - MESES POR ENCIMA / POR DEBAJO DEL PROMEDIO
-- Se compara la facturación de cada mes contra
-- el promedio mensual general.
-- ==========================================================


WITH facturacion_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado >= (
            SELECT AVG(total_facturado)
            FROM facturacion_mensual
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;

-- ==========================================================
-- HALLAZGOS
-- ==========================================================

-- 1. La facturación total registrada en marzo fue de USD 6.444,
--    distribuida en 10 pedidos, con un ticket promedio de USD 644,40.

-- 2. El producto con id_producto = 1 fue el de mayor facturación,
--    generando USD 3.600 con 3 unidades vendidas.

-- 3. Los cinco clientes registrados realizaron más de una compra.
--    El cliente con id_cliente = 1 fue el que más gastó,
--    con un total de USD 2.640.

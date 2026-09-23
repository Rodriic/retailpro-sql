USE Ventas_Tech_DB;
GO

-- ==========================================================
-- CONSULTA 1 - VISTA BASE DEL PROYECTO
-- INNER JOIN entre ventas, clientes, productos y categorias
-- ==========================================================

SELECT
    v.id_venta,
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email,
    c.ciudad,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
JOIN clientes c
    ON v.id_cliente = c.id_cliente
JOIN productos p
    ON v.id_producto = p.id_producto
JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;


-- ==========================================================
-- CONSULTA 2 - CLIENTES SIN VENTAS
-- AQUI AGREGUÉ UN CLIENTE PARA VERIFICAR QUE LA CONSULTA ANDE CORRECTAMENTE
-- ==========================================================

INSERT INTO clientes
VALUES
(6, 'Sofía Martínez', 'sofia@mail.com', 'Córdoba', '2024-03-20');

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
    FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


-- ==========================================================
-- CONSULTA 3 - PRODUCTOS SIN VENTAS
-- AQUI AGREGUÉ UN PRODUCTO PARA VERIFICAR QUE LA CONSULTA ANDE CORRECTAMENTE
-- ==========================================================

INSERT INTO productos
VALUES
(7, 'Webcam HD', 2, 75.00, 20, 1);

SELECT
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;


-- ==========================================================
-- CONSULTA 4 - CONSOLIDADO POR CANAL
-- UNION ALL
-- ==========================================================

SELECT
    canal,
    SUM(total) AS total_facturado
FROM (

    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Primera quincena' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) <= 10

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        cantidad * precio_unitario AS total,
        'Segunda quincena' AS canal
    FROM ventas
    WHERE DAY(fecha_venta) > 10

) AS ventas_por_canal
GROUP BY canal
ORDER BY total_facturado DESC;

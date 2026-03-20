-- Dashboard de inventario

SELECT
    p.nombre,
    v.stock_actual,
    p.precio,
    (p.precio * v.stock_actual) AS valor_total,
    
    CASE 
        WHEN v.stock_actual = 0 THEN 'SIN STOCK'
        WHEN v.stock_actual <= 10 THEN 'BAJO'
        ELSE 'OK'
    END AS estado_stock

FROM vista_inventario v
JOIN productos p ON v.id_producto = p.id_producto;

#!/bin/bash

RUTA="$HOME/inventario-mysql-linux/reportes"
FECHA=$(date +"%Y-%m-%d_%H-%M")

mkdir -p "$RUTA"

mysql -e "
USE inventario_db;

SELECT
    p.nombre,
    v.stock_actual,
    p.precio,
    (p.precio * v.stock_actual) AS valor_total
FROM vista_inventario v
JOIN productos p ON v.id_producto = p.id_producto;
" > "$RUTA/reporte_$FECHA.txt"

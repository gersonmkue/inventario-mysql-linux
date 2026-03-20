
DROP DATABASE IF EXISTS inventario_db;
CREATE DATABASE inventario_db;
USE inventario_db;

-- Tabla categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2),
    id_categoria INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla movimientos
CREATE TABLE movimientos (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    tipo_movimiento ENUM('entrada','salida'),
    cantidad INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Índices
CREATE INDEX idx_producto_movimientos ON movimientos(id_producto);
CREATE INDEX idx_categoria_productos ON productos(id_categoria);

-- Vista
CREATE VIEW vista_inventario AS
SELECT 
    p.id_producto,
    p.nombre,
    COALESCE(SUM(
        CASE 
            WHEN m.tipo_movimiento = 'entrada' THEN m.cantidad
            WHEN m.tipo_movimiento = 'salida' THEN -m.cantidad
        END
    ),0) AS stock_actual
FROM productos p
LEFT JOIN movimientos m 
ON p.id_producto = m.id_producto
GROUP BY p.id_producto, p.nombre;

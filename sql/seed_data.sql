USE inventario_db;

INSERT INTO categorias (nombre, descripcion) VALUES
('Electrónica', 'Dispositivos electrónicos'),
('Accesorios', 'Periféricos');

INSERT INTO productos (nombre, descripcion, precio, id_categoria) VALUES
('Mouse Logitech', 'Inalámbrico', 350, 2),
('Teclado Mecánico', 'RGB', 1200, 2),
('Monitor 24"', 'Full HD', 3200, 1);

INSERT INTO movimientos (id_producto, tipo_movimiento, cantidad) VALUES
(1,'entrada',50),
(1,'salida',10),
(2,'entrada',30),
(3,'entrada',15);

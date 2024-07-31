
INSERT INTO cliente (id, nombre, apellidos, celular, direccion, correo) VALUES
('1', 'Juan', 'Perez', 1234567890, 'Av. ### 123', 'juan.perez@gmail.com'),
('2', 'Ana', 'Martinez ', 2345678901, 'Calle ### ## 456 colombia', 'ana.martinez@yahoo.com'),
('3', 'Luis', 'Fernández', 3456789012, 'cr ### # - 789', 'luis.fernandez@hotmail.com');


INSERT INTO categoria (descripcion, estado) VALUES
('Electrónica', 1),
('Hogar', 1),
('Ropa', 1);


INSERT INTO producto (nombre, categoriaId, codigoBarras, precioVenta, stock, estado) VALUES
('Smartphone', 1, '1234567890123', 599.99, 50, 1),
('Televisor', 1, '1234567890124', 799.99, 30, 1),
('Sofá', 2, '1234567890125', 299.99, 20, 1);

INSERT INTO compra (clienteId, fecha, medioDePago, comentario, estado) VALUES
('1', '2024-07-01 14:30:00', 'C', 'Compra realizada en promoción', 'A'),
('2', '2024-07-05 10:15:00', 'T', 'Compra de varios artículos', 'A'),
('3', '2024-07-10 16:45:00', 'E', 'Compra con descuento', 'P');


INSERT INTO comprasProductos (compraId, productoId, cantidad, total, estado) VALUES
(1, 1, 1, 599.99, 1),
(1, 2, 2, 91.98, 1),
(2, 3, 1, 299.99, 1);


INSERT INTO proveedor (nombre, contacto, telefono, direccion, correo) VALUES
('A', 'Juan', 1234567890, 'Av. xxxxx 123, Ciudad A', 'juan.perez@###.com'),
('B', 'Ana', 2345678901, 'Calle xxxx 456, Ciudad B', 'ana.lopez####.com'),
('C', 'Carlos', 3456789012, 'xxxx #xx - 789, Ciudad C', 'xxxxxxx@····.com');

INSERT INTO suministro (proveedorId, productoId, cantidad, fecha) VALUES
(1, 1, 100, '2024-07-01'),
(1, 2, 150, '2024-07-05'),
(2, 2, 200, '2024-07-10'),
(2, 3, 250, '2024-07-15');



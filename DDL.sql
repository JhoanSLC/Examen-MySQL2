DROP DATABASE IF EXISTS examenJhoan;
CREATE DATABASE examenJhoan;
USE examenJhoan;

CREATE TABLE cliente(
    id VARCHAR(20),
    nombre VARCHAR(40),
    apellidos VARCHAR(100),
    celular DECIMAL(10,0),
    direccion VARCHAR(80),
    correo VARCHAR(70),
    CONSTRAINT Pk_cliente PRIMARY KEY (id)
);

CREATE TABLE categoria(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(45),
    estado TINYINT,
    CONSTRAINT Pk_categoria PRIMARY KEY (id)
);

CREATE TABLE compra(
    id INT AUTO_INCREMENT,
    clienteId VARCHAR(20),
    fecha DATETIME,
    medioDePago CHAR(1),
    comentario VARCHAR(300),
    estado char(1),
    CONSTRAINT Pk_compra PRIMARY KEY (id),
    CONSTRAINT Fk_compraCliente FOREIGN KEY (clienteId) REFERENCES cliente(id)
);

CREATE TABLE producto(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(45),
    categoriaId INT,
    codigoBarras VARCHAR(150),
    precioVenta DECIMAL(16,2),
    stock INT,
    estado TINYINT,
    CONSTRAINT Pk_producto PRIMARY KEY (id),
    CONSTRAINT Fk_productoCategoria FOREIGN KEY (categoriaId) REFERENCES categoria(id)
);

CREATE TABLE comprasProductos(
    id INT AUTO_INCREMENT,
    compraId INT,
    productoId INT,
    cantidad INT,
    total DECIMAL(16,2),
    estado TINYINT,
    CONSTRAINT Pk_comprasProducto PRIMARY KEY (id),
    CONSTRAINT Fk_cpCompra FOREIGN KEY (compraId) REFERENCES compra(id),
    CONSTRAINT Fk_cpProducto FOREIGN KEY (productoId) REFERENCES producto(id)
);
DROP DATABASE IF EXISTS examenJhoan;
CREATE DATABASE examenJhoan;
USE examenJhoan;

CREATE TABLE cliente(
    id VARCHAR(20) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(100),
    celular DECIMAL(10,0) NOT NULL,
    direccion VARCHAR(80),
    correo VARCHAR(70) NOT NULL,
    CONSTRAINT Pk_cliente PRIMARY KEY (id)
);

CREATE TABLE categoria(
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(45) NOT NULL,
    estado TINYINT NOT NULL,
    CONSTRAINT Pk_categoria PRIMARY KEY (id)
);

CREATE TABLE compra(
    id INT AUTO_INCREMENT,
    clienteId VARCHAR(20) NOT NULL,
    fecha DATETIME NOT NULL,
    medioDePago CHAR(1) NOT NULL,
    comentario VARCHAR(300),
    estado char(1) NOT NULL,
    CONSTRAINT Pk_compra PRIMARY KEY (id),
    CONSTRAINT Fk_compraCliente FOREIGN KEY (clienteId) REFERENCES cliente(id)
);

CREATE TABLE producto(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    categoriaId INT NOT NULL,
    codigoBarras VARCHAR(150) NOT NULL,
    precioVenta DECIMAL(16,2) NOT NULL,
    stock INT NOT NULL,
    estado TINYINT NOT NULL,
    CONSTRAINT Pk_producto PRIMARY KEY (id),
    CONSTRAINT Fk_productoCategoria FOREIGN KEY (categoriaId) REFERENCES categoria(id),
    CONSTRAINT Uc_prodcutoCodigo UNIQUE (codigoBarras)
);

CREATE TABLE comprasProductos(
    id INT AUTO_INCREMENT,
    compraId INT NOT NULL,
    productoId INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(16,2) NOT NULL,
    estado TINYINT NOT NULL,
    CONSTRAINT Pk_comprasProducto PRIMARY KEY (id),
    CONSTRAINT Fk_cpCompra FOREIGN KEY (compraId) REFERENCES compra(id),
    CONSTRAINT Fk_cpProducto FOREIGN KEY (productoId) REFERENCES producto(id)
);

CREATE TABLE proveedor (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono DECIMAL(10,0),
    direccion VARCHAR(100),
    correo VARCHAR(70),
    CONSTRAINT Pk_proveedor PRIMARY KEY (id)
);


CREATE TABLE suministro (
    id INT AUTO_INCREMENT,
    proveedorId INT NOT NULL,
    productoId INT NOT NULL,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT Pk_suministro PRIMARY KEY (id),
    CONSTRAINT Fk_suministroProveedor FOREIGN KEY (proveedorId) REFERENCES proveedor(id),
    CONSTRAINT Fk_suministroProducto FOREIGN KEY (productoId) REFERENCES producto(id)
);

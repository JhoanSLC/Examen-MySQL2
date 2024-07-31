# Examen de SQL2

# Consultas Básicas

### Consultar todos los productos y sus categorías

```sql
SELECT 
    p.nombre,
    p.categoriaId,
    ca.descripcion AS descripcion_categoria
FROM
    producto p
JOIN categoria ca ON p.categoriaId = ca.id;
```

### Consultar todas las compras y los clientes que las realizaron

```sql
SELECT
    c.id,
    c.clienteId
    cli.nombre as nombreCliente
FROM
    compra c
JOIN
    cliente cli ON c.id = cli.id;
```

### Consultar los productos comprados en una compra específica

```sql
SELECT 
    cp.compraId,
    cp.productoId,
    cp.cantidad,
    cp.total,
    cp.estado
FROM
    comprasProcuctos cp
WHERE cp.compraId = 1
```

### Agregar un nuevo producto

```sql
INSERT INTO producto(nombre,categoriaId,codigoBarras,precioVenta,stock,estado) VALUES ("Blanqueador",1,"456asd",5600,10,1);
```

### Actualizar el stock de un producto

```sql
UPDATE producto
SET stock = 10
WHERE id = 1;
```

### Consultar todas las compras de un cliente específico

```sql
SELECT 
    c.id,
    c.clienteId,
    c.fecha,
    c.medioDePago,
    c.comentario,
    c.estado
FROM compra c
WHERE c.clienteId = "1";
```

### Consultar todos los clientes y sus correos electrónicos

```sql
SELECT 
    cli.id,
    cli.nombre,
    cli.apellidos,
    cli.correo
FROM cliente cli;
```
### Consultar la cantidad total de productos comprados en cada compra

```sql
SELECT 
    cp.compraId,
    SUM(cp.cantidad) AS totalProductos
FROM comprasProductos cp
GROUP BY cp.compraId;
```
### Consultar las compras realizadas en un rango de fechas

```sql
SELECT
    c.id,
    c.clienteId,
    c.fecha,
    c.medioDePago,
    c.comentario,
    c.estado
FROM 
    compra c
WHERE c.fecha BETWEEN "2024-07-20" AND "2024-07-31"; 
```

# Consultas usando funciones agregadas


### Contar la cantidad de productos por categoría

```sql
SELECT
    p.categoriaId,
    COUNT(p.id) AS cantidadProductos
FROM producto p
GROUP BY p.categoriaId;
```
### Calcular el precio total de ventas por cada cliente

```sql
SELECT
    cp.compraId,
    co.clienteId,
    SUM(cp.total) AS totalDeVentas
FROM comprasProductos cp
JOIN compra co ON cp.compraId = co.id
GROUP BY co.clienteId, cp.compraId;
```
### Calcular el precio promedio de los productos por categoría

```sql
SELECT 
    p.categoriaId,
    TRUNCATE((AVG(p.precioVenta)),2) AS promedioPrecio
FROM
    producto p
GROUP BY p.categoriaId;
```

### Encontrar la fecha de la primera y última compra registrada

```sql
SELECT 
    MIN(co.fecha) AS primeraFecha,
    MAX(co.fecha) AS ultimaFecha
FROM
    compra co;
```

### Calcular el total de ingresos por ventas

```sql
SELECT
    cp.compraId,
    cp.productoId,
    TRUNCATE((SUM(cp.total)),2) AS totalIngresos
FROM comprasProductos cp
GROUP BY cp.compraId,cp.productoId;
```

### Contar la cantidad de compras realizadas por cada medio de pago

```sql
SELECT
    co.medioDePago,
    COUNT(co.id) AS comprasRealizadas
FROM
    compra co
GROUP BY co.medioDePago;
```

### Calcular el total de productos vendidos por cada producto

```sql
SELECT
    cp.productoId,
    p.nombre AS nombreProducto,
    SUM(cp.cantidad) AS cantidadVendida
FROM comprasProductos cp
JOIN producto p ON cp.productoId = p.id
GROUP BY cp.productoId, p.nombre;
```
### Obtener el promedio de cantidad de productos comprados por compra

```sql
SELECT
    cp.compraId,
    TRUNCATE((AVG(cp.cantidad)),2) AS promedioCantidad
FROM 
    comprasProductos cp
GROUP BY cp.compraId;
    
```

### Encontrar los productos con el stock más bajo

```sql
SELECT
    p.id,
    p.nombre,
    p.stock
FROM producto p
ORDER BY p.stock ASC
LIMIT 3;
```

### Calcular el total de productos comprados y el total gastado por cliente

```sql
SELECT
    cli.nombre AS cliente,
    SUM(cp.cantidad) AS totalComprados,
    SUM(cp.total) AS totalGastado
FROM 
    comprasProductos cp
JOIN compra co ON cp.compraId = co.id
JOIN cliente cli ON co.clienteId = cli.id
GROUP BY cli.nombre;
```


# Consultas usando join

### Consultar todos los productos con sus categorías 

```sql
SELECT
    p.id,
    p.nombre,
    p.categoriaId,
    ca.descripcion,
    ca.estado AS estadoCategoria,
    p.codigoBarras,
    p.precioVenta,
    p.stock,
    p.estado AS estadoProducto
FROM producto p
JOIN categoria ca ON p.categoriaId = ca.id;
```

### Consultar todas las compras y los clientes que las realizaron

```sql
SELECT
    co.id,
    co.clienteId,
    cli.nombre AS nombreCLiente,
    cli.apellidos AS apellidosCliente,
    cli.celular AS celularCliente,
    cli.direccion AS direccionCliente,
    cli.correo AS correoCliente,
    co.fecha,
    co.medioDePago,
    co.comentario,
    co.estado
FROM 
    compra co
JOIN cliente cli ON co.clienteId = cli.id;
```

### Consultar los productos comprados en cada compra

```sql
SELECT 
    cp.compraId,
    cp.productoId,
    SUM(cp.cantidad) AS cantidad,
    p.nombre AS nombreProducto,
    p.categoriaId AS categoriaProducto,
    p.codigoBarras,
    p.precioVenta,
    p.stock
FROM
    comprasProductos cp
JOIN producto p ON cp.productoId = p.id
GROUP BY cp.compraId,cp.productoId
ORDER BY cp.compraId ASC;
```

### Consultar las compras realizadas por un cliente específico

```sql
SELECT 
    co.id,
    co.clienteId,
    co.fecha,
    co.medioDePago,
    co.comentario,
    co.estado,
    cli.nombre,
    cli.apellidos
FROM 
    compra co
JOIN cliente cli ON co.clienteId = cli.id
WHERE cli.id = "001";
```
### Consultar el total gastado por cada cliente

```sql
SELECT
    cli.nombre AS cliente,
    SUM(cp.total) AS totalGastado
FROM 
    comprasProductos cp
JOIN compra co ON cp.compraId = co.id
JOIN cliente cli ON co.clienteId = cli.id
GROUP BY cli.nombre;
```

### Consultar el stock disponible de productos y su categoría

```sql
SELECT
    p.id,
    p.nombre,
    p.stock,
    p.categoriaId,
    ca.descripcion,
    ca.estado AS estadoCategoria
FROM producto p
JOIN categoria ca ON p.categoriaId = ca.id;
```
### Consultar los detalles de compras junto con la información del cliente y el producto

```sql
SELECT
    cp.compraId,
    cli.id,
    cli.nombre AS nombreCliente,
    cli.apellidos AS apellidosCliente,
    cli.celular,
    cli.direccion,
    cli.correo,
    cp.productoId,
    p.nombre AS nombreProducto,
    p.categoriaId,
    p.codigoBarras,
    p.precioVenta,
    p.stock,
    p.estado AS estadoProducto,
    cp.cantidad,
    cp.total,
    cp.estado AS estadoDetalle
FROM
    comprasProductos cp
JOIN compra co ON cp.compraId = co.id
JOIN cliente cli ON co.clienteId = cli.id
JOIN producto p ON cp.productoId = p.id;
```

### Consultar los productos que han sido comprados por más de una cantidad específica

```sql
SELECT
    p.id,
    p.nombre,
    p.categoriaId,
    p.precioVenta,
    p.stock,
    SUM(cp.cantidad) AS cantidadComprada
FROM
    producto p
JOIN comprasProductos cp ON cp.productoId = p.id
GROUP BY p.id
HAVING cantidadComprada > 3; -- CANTIDAD ESPECIFICADA --
```
### Consultar la cantidad total de productos vendidos por categoría

```sql
SELECT
    p.categoriaId,
    SUM(cp.cantidad) AS cantidadVendida
FROM
    producto p
JOIN comprasProductos cp ON cp.productoId = p.id
GROUP BY p.categoriaId;
```

### Consultar los clientes que han realizado compras en un rango de fechas específico

```sql
SELECT DISTINCT
    cli.id,
    cli.nombre,
    cli.apellidos,
    cli.celular,
    cli.direccion,
    cli.correo
FROM cliente cli
JOIN compra co ON co.clienteId = cli.id
WHERE co.fecha BETWEEN "2024-07-10" AND "2024-07-31";
```

### Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados

```sql
SELECT
    cli.id,
    cli.nombre,
    SUM(cp.total) AS totalGastado,
    SUM(cp.cantidad) AS cantidadTotal
FROM
    cliente cli
JOIN compra co ON cli.id = co.clienteId
JOIN comprasProductos cp ON co.id = cp.compraId
GROUP BY cli.id, cli.nombre;

```

### Consultar los productos que nunca han sido comprados

```sql
SELECT 
    p.id, 
    p.nombre, 
    p.categoriaId, 
    p.codigoBarras, 
    p.precioVenta, 
    p.stock, 
    p.estado
FROM producto p
LEFT JOIN comprasProductos cp ON p.id = cp.productoId
WHERE cp.productoId IS NULL;
```
### Consultar los clientes que han realizado más de una compra y el total gastado por ellos

```sql
SELECT 
    c.id, 
    c.nombre, 
    c.apellidos, 
    c.correo, 
    COUNT(comp.id) AS cantidadTotal, 
    SUM(cp.total) AS totalGastado
FROM cliente c
JOIN compra comp ON c.id = comp.clienteId
JOIN comprasProductos cp ON comp.id = cp.compraId
GROUP BY c.id, c.nombre, c.apellidos, c.correo
HAVING COUNT(comp.id) > 1;

```

### Consultar los productos más vendidos por categoría

```sql

SELECT
    c.descripcion AS categoriaDescripcion,
    p.nombre AS productoNombre,
    SUM(cp.cantidad) AS cantidadVendida
FROM producto p
JOIN comprasProductos cp ON p.id = cp.productoId
JOIN categoria c ON p.categoriaId = c.id
GROUP BY c.descripcion, p.id, p.nombre
ORDER BY c.descripcion, cantidadVendida DESC;

```

### Consultar las compras realizadas por clientes de una ciudad específica y el total gastado

```sql

SELECT
    c.id AS clienteId,
    c.nombre AS clienteNombre,
    c.direccion AS clienteDireccion,
    SUM(cp.total) AS totalGastado
FROM cliente c
JOIN compra comp ON c.id = comp.clienteId
JOIN comprasProductos cp ON comp.id = cp.compraId
WHERE c.direccion LIKE '%Colombia%'
GROUP BY c.id, c.nombre, c.direccion;

```

### Consultar los proveedores que han suministrado productos y la cantidad total suministrada

```sql
-- SE CREA TABLA DE PROVEEDORES Y ADICIONAL UNA DE SUMINISTROS PARA NO AGREGAR NADA A LAS TABLAS YA CREADAS --

SELECT
    p.id AS proveedorId,
    p.nombre AS proveedorNombre,
    SUM(s.cantidad) AS cantidadTotalSuministrada
FROM proveedor p
JOIN suministro s ON p.id = s.proveedorId
GROUP BY p.id, p.nombre;

```

# Subconsultas

### Consultar los productos que tienen un precio de venta superior al precio promedio de todos los productos

```sql
SELECT id, nombre, precioVenta
FROM producto
WHERE precioVenta > (
    SELECT AVG(precioVenta)
    FROM producto
);

```
### Consultar los clientes que han gastado más del promedio general en sus compras

```sql
SELECT
    c.id AS clienteId,
    c.nombre AS clienteNombre,
    SUM(cp.total) AS totalGastado
FROM cliente c
JOIN compra comp ON c.id = comp.clienteId
JOIN comprasProductos cp ON comp.id = cp.compraId
GROUP BY c.id, c.nombre
HAVING SUM(cp.total) > (
    SELECT AVG(totalGastado)

-- SIN TERMINAR --
```

### Consultar las categorías que tienen más de 5 productos

```sql
SELECT
    id,
    descripcion
FROM categoria
WHERE id IN (
    SELECT categoriaId
    FROM producto
    GROUP BY categoriaId
    HAVING COUNT(id) > 5
);
```

### Consultar los productos más vendidos (top 5) por categoría

```sql


```

### Consultar los clientes que han realizado compras en los últimos 30 días

```sql
SELECT DISTINCT c.id AS clienteId, c.nombre AS clienteNombre
FROM cliente c
WHERE c.id IN (
    SELECT clienteId
    FROM compra
    WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
);

```

### Consultar las compras y sus productos para un cliente específico, mostrando solo las compras más recientes

```sql
SELECT
    co.id,
    co.clienteId,
    co.fecha,
    cp.productoId,
    cp.cantidad
FROM compra co
WHERE co.id = "1" AND 
ORDER BY co.fecha ASC
LIMIT 5;

-- SIN TERMINAR --

```

### Consultar las categorías que tienen productos con un stock por debajo del promedio general

```sql
SELECT DISTINCT
    c.id AS categoriaId,
    c.descripcion AS categoriaDescripcion
FROM categoria c
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.categoriaId = c.id
    AND p.stock < (
        SELECT AVG(stock)
        FROM producto
    )
);
```
### Consultar los productos que han sido comprados por todos los clientes

```sql
SELECT
    p.id AS productoId,
    p.nombre AS productoNombre
FROM producto p
WHERE (
    SELECT COUNT(DISTINCT c.id)
    FROM cliente c
) = (
    SELECT COUNT(DISTINCT co.clienteId)
    FROM compra co
    WHERE co.clienteId = p.id
);
```
### Consultar las compras que tienen más productos que el promedio de productos por compra

```sql
SELECT
    comp.id AS compraId,
    comp.fecha AS compraFecha,
    COUNT(cp.productoId) AS numProductos
FROM compra comp
JOIN comprasProductos cp ON comp.id = cp.compraId
GROUP BY comp.id, comp.fecha
HAVING COUNT(cp.productoId) > (
    SELECT AVG(numProductos)
    FROM (
        SELECT COUNT(cp2.productoId) AS numProductos
        FROM comprasProductos cp2
        GROUP BY cp2.compraId
    ) AS promedioSubquery
);

```
### Consultar los productos que se han vendido menos de la cantidad promedio de productos vendidos

```sql
--SIN HACER --
```


## Requerimientos de entrega
1. Cree un repositorio.
2. Genere los comandos DDL y publíquelos en el Repositorio.
3. Genere comando DML para realizar la inserción de datos.
4. Genere README donde se encuentre el enunciado de la consulta y su solución.
5. Publicar el repositorio en el classroom. No olvidar entregar el trabajo en el classroom.
INSERT INTO cliente(id,nombre,apellidos,celular,direccion,correo) VALUES ("001","Jhoan","Landazabal",3000000000,"calle xx #xx - xx","JhoanSLC4@gmail.com");

INSERT INTO categoria(descripcion,estado) VALUES ("Aseo","1");

INSERT INTO producto(nombre,categoriaId,codigoBarras,precioVenta,stock,estado) VALUES ("Jabón de manos",1,"5as45d645a6s",3600,20,1);

INSERT INTO compra(clienteId,fecha,medioDePago,comentario,estado) VALUES ("001",NOW(),"e","Se hace compra de jabón de manos","1");

INSERT INTO comprasProductos(compraId,productoId,cantoidad,total,estado) VALUES (1,1,1,3600,2);
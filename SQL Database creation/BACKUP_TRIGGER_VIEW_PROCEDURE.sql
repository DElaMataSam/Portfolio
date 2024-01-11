USE COMPRAS;

SELECT * FROM detalle_factura;

#Diseñar un TRIGGER que permita insertar datos en una tabla de respaldo para las facturas y líneas de factura.
CREATE TABLE BACK_UP(idBack_up INT NOT NULL AUTO_INCREMENT, 
`idFactura` INT, 
`fecha` DATE,
`idCliente` INT, 
`idEmpleado` INT, 
`idDetalle` INT, 
`idProducto` INT, 
`precioUnitario` INT, 
`cantidad` INT, 
PRIMARY KEY(`idBack_up`));


CREATE TRIGGER Back_up_trigger AFTER INSERT ON detalle_factura
FOR EACH ROW 
BEGIN 
	INSERT INTO BACK_UP(idFactura, idDetalle, idProducto, precioUnitario, cantidad) 
	VALUE (NEW.idFactura, NEW.idDetalle, NEW.idProducto, NEW.precioUnitario, NEW.cantidad)
END;

CREATE TRIGGER Back_up_trigger_dos AFTER INSERT ON factura 
FOR EACH ROW 
BEGIN 
	INSERT INTO BACK_UP(idFactura, fecha, idCliente, idEmpleado) 
		VALUE (NEW.idFactura, NEW.fecha, NEW.idCliente, NEW.idEmpleado);
END //



#Diseñar una VIEW que permita obtener el precio medio de los productos agrupados por categorías. 
CREATE VIEW PRECIO-MEDIO AS SELECT AVG(ALL precio) FROM producto GROUP BY idCategoria; 


#Diseñar un PROCEDURE que al ejecutarse nos determine si se han vendido 3, más de 3 o menos de 3 productos en una transacción de venta.
CREATE PROCEDURE comprobacion() 
BEGIN 
SELECT * FROM detalle_factura
ORDER BY(CASE 
WHEN cantidad = 3 THEN "IGUAL" 
WHEN cantidad <3 THEN "BAJAS" 
WHEN cantidad >3 THEN "ALTAS" END);
END;



 




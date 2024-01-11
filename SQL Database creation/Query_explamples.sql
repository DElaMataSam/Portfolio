USE COMPRAS;

SELECT * FROM factura; 

INSERT INTO factura() VALUES(), ();

SELECT COUNT(*) FROM factura;

SELECT SUM(cantidad) FROM detalle_factura;

SELECT  SUM(cantidad), TO_CHAR(fecha, 'DD/MM/YYYY') FROM detalle_factura INNER_JOIN idFactura.detalle_factura = idFactura.factura 
GROUP BY TO_CHAR(fecha, 'DD/MM/YYYY') 
ORDER BY TO_DATE(TO_CHAR(fecha, 'DD/MM/YYYY', 'DD/MM/YYYY'));

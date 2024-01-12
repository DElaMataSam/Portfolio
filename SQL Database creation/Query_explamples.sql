USE COMPRAS;

SELECT * FROM factura; 

INSERT INTO factura() VALUES(), ();

SELECT COUNT(*) FROM factura;

SELECT SUM(cantidad) FROM detalle_factura;

SELECT  SUM(df.cantidad), TO_CHAR(f.fecha, 'DD/MM/YYYY') FROM detalle_factura df INNER JOIN factura f ON df.idFactura = f.idFactura 
GROUP BY TO_CHAR(f.fecha, 'DD/MM/YYYY') 
ORDER BY TO_DATE(TO_CHAR(f.fecha, 'DD/MM/YYYY'), 'DD/MM/YYYY');

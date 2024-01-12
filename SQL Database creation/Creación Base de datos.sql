CREATE DATABASE 

DROP DATABASE IF EXISTS COMPRAS;
CREATE DATABASE COMPRAS;
USE COMPRAS;

CREATE TABLE `categoria`(
`idProducto` INT(11) NOT NULL AUTO_INCREMENT, 
`nombre` VARCHAR(45), 
`idCategoria`INT(11),
PRIMARY KEY(`idProducto`)
)

CREATE TABLE `departamento`(
`idDepartamento` INT(11) NOT NULL AUTO_INCREMENT, 
`nombre` VARCHAR(45),
PRIMARY KEY (`idDepartamento`)
)

CREATE TABLE `cliente`(
`idCliente` INT(11) NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(45) DEFAULT NULL,
`apellido` VARCHAR(45) DEFAULT NULL,
`email` VARCHAR(45) DEFAULT NULL,
`telefono` VARCHAR(45) DEFAULT NULL,
`ciudad` VARCHAR(45)  DEFAULT NULL,
`pais` VARCHAR(45) DEFAULT NULL,
PRIMARY KEY (`idCliente`)
)

CREATE TABLE `producto`(
`idProducto` INT(11) NOT NULL AUTO_INCREMENT, 
`nombre` VARCHAR(45), 
`idCategoria`INT(11), 
`precioUnitario` DECIMAL(10,2), 
PRIMARY KEY (`idProducto`),
FOREIGN KEY (`idCategoria`) REFERENCES `categoria`(`idCategoria`)
ON CASCADE
)

CREATE TABLE `factura`(
`idFactura` INT(11) NOT NULL AUTO_INCREMENT, 
`fecha` DATE DEFAULT NULL, 
`idCliente`INT(11), 
`idEmpleado` INT(11), 
PRIMARY KEY (`idFactura`),
FOREIGN KEY (`idCliente`) REFERENCES `cliente`(`idCliente`)
ON CASCADE,
FOREIGN KEY (`idEmpleado`) REFERENCES `empleado`(`idEmpleado`)
  ON CASCADE
)

CREATE TABLE `detalle_factura`(
`idDetalle` INT(11) NOT NULL AUTO_INCREMENT, 
`idFactura`INT(11), 
`idProducto`INT(11), 
`precioUnitario` DECIMAL(10,2),
`cantidad` INT(11),  
PRIMARY KEY (`idDetalle`),
FOREIGN KEY (`idFactura`) REFERENCES `factura`(`idFactura`)
  ON CASCADE, 
FOREIGN KEY (`idProducto`) REFERENCES `producto`(`idProducto`)
  ON CASCADE
)

CREATE TABLE `empleado`(
`idEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
`nombre` VARCHAR(45) DEFAULT NULL,
`apellido` VARCHAR(45) DEFAULT NULL,
`fechaIngreso` DATE DEFAULT NULL,
`fechaNacimiento` DATE DEFAULT NULL,
`sexo` ENUM('hombre','mujer') DEFAULT NULL,
`email` VARCHAR(45) DEFAULT NULL,
`telefono` VARCHAR(45) DEFAULT NULL,
`salario` DECIMAL(10,2) DEFAULT NULL,
`idDepartamento` INT(11) DEFAULT NULL,
PRIMARY KEY (`idEmpleado`),
FOREIGN KEY (`idDepartamento`) REFERENCES `departamento`(`idDepartamento`)
  ON CASCADE
)




SHOW DATABASES;

create table marcas (
    idMarca int primary key auto_increment, 
    marca varchar(45)
);

create table tipo_vehiculo(
    idTipo int primary key auto_increment,
    tipo_vehiculo varchar(45),
    marcaId INT
);

create table colores (
    idColor int primary key auto_increment, 
    color varchar(45)
);

create table vehiculos (
    idVehiculo int primary key AUTO_INCREMENT,
    modelo varchar(45),
    placa varchar(45) UNIQUE,
    colorId int,
    tipoVehiculoId int
)

ALTER TABLE vehiculos ADD FOREIGN KEY (colorId) REFERENCES colores (idColor)

ALTER TABLE vehiculos ADD FOREIGN KEY (tipoVehiculoId) REFERENCES tipo_vehiculo (idTipo)

ALTER TABLE tipo_vehiculo ADD FOREIGN KEY(marcaId) REFERENCES marcas(idMarca)

SELECT * FROM vehiculos

SELECT * FROM vehiculos INNER JOIN colores WHERE vehiculos.colorId = colores.idColor

SELECT vehiculos.idVehiculo, vehiculos.placa, tipo_vehiculo.tipo_vehiculo  FROM vehiculos INNER JOIN tipo_vehiculo WHERE vehiculos.tipoVehiculoId = tipo_vehiculo.idTipo;

SELECT vehiculos.placa, colores.color, tipo_vehiculo.tipo_vehiculo, marcas.marca FROM vehiculos INNER JOIN colores INNER JOIN tipo_vehiculo INNER JOIN marcas
WHERE
    vehiculos.colorId = colores.idColor AND
    vehiculos.tipoVehiculoId = tipo_vehiculo.idTipo AND
    tipo_vehiculo.marcaId = marcas.idMarca

/*VISTAS*/

CREATE VIEW vistaVehiculos AS
SELECT vehiculos.placa, colores.color, tipo_vehiculo.tipo_vehiculo, marcas.marca FROM vehiculos INNER JOIN colores INNER JOIN tipo_vehiculo INNER JOIN marcas
WHERE
    vehiculos.colorId = colores.idColor AND
    vehiculos.tipoVehiculoId = tipo_vehiculo.idTipo AND
    tipo_vehiculo.marcaId = marcas.idMarca

SELECT * FROM vistaVehiculos


/*Procedure*/



CREATE PROCEDURE verVehiculos()
BEGIN
    SELECT * FROM vehiculos;
END

CALL verVehiculos()

CREATE PROCEDURE parametroColores(IN idCol INT)
BEGIN
    SELECT * FROM vehiculos WHERE idCol = colorId;
END

DROP Procedure insertarColores

CALL parametroColores(3)


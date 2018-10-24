CREATE DATABASE bd_alumnos_p3;

USE bd_alumnos_p3;

CREATE TABLE ciudad(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY(id)
);

INSERT INTO ciudad VALUES(NULL, 'Rancagua');
INSERT INTO ciudad VALUES(NULL, 'Rengo');
INSERT INTO ciudad VALUES(NULL, 'Santa Cruz');

CREATE TABLE alumno(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    genero BOOLEAN, /*TRUE - Masculino, FALSE - Femenino*/
    telefono VARCHAR(20),
    correo VARCHAR(30),
    fk_ciudad INT,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_ciudad) REFERENCES ciudad(id)
);

INSERT INTO alumno VALUES(NULL, 'Humberto Riquelme Páez',TRUE,'+(569)85416325','hriquelme@gmail.com',1);
INSERT INTO alumno VALUES(NULL, 'María Pérez Soto',FALSE,'+(569)52214562','mperez@gmail.com',3);

SELECT * FROM ciudad;
SELECT * FROM alumno;

/*1- Cantidad de alumnos*/
SELECT COUNT(0) FROM alumno;

/*2.- Cantidad de mujeres*/
SELECT COUNT(0) FROM alumno WHERE genero IS FALSE;

/*3.- Cantidad de hombres*/
SELECT COUNT(0) FROM alumno WHERE genero IS TRUE;

/*4.- Listado de alumnos*/
SELECT 
	a.id AS 'ID',
	a.nombre AS 'Nombre',
    a.genero AS 'Género',
    a.telefono AS 'Telefono',
    a.correo AS 'Correo',
    c.nombre AS 'Ciudad'
FROM
	alumno a
INNER JOIN
	ciudad c ON c.id = a.fk_ciudad;

/*4.- Listado de alumnos ordenados por nombre de manera descendente*/
SELECT 
	a.id AS 'ID',
	a.nombre AS 'Nombre',
    a.genero AS 'Género',
    a.telefono AS 'Telefono',
    a.correo AS 'Correo',
    c.nombre AS 'Ciudad'
FROM
	alumno a
INNER JOIN
	ciudad c ON c.id = a.fk_ciudad
ORDER BY
	a.nombre DESC;
    
/*5.- Listado de alumnos ordenados por ciudad de manera descendente*/
SELECT 
	a.id AS 'ID',
	a.nombre AS 'Nombre',
    a.genero AS 'Género',
    a.telefono AS 'Telefono',
    a.correo AS 'Correo',
    c.nombre AS 'Ciudad'
FROM
	alumno a
INNER JOIN
	ciudad c ON c.id = a.fk_ciudad
ORDER BY
	c.nombre DESC;

/*6.- Eliminar a un alumno por id*/
DELETE FROM alumno WHERE id = '';

/*7.- Obtener los datos de un alumno en particular por su ID*/
SELECT 
	a.id AS 'ID',
	a.nombre AS 'Nombre',
    a.genero AS 'Género',
    a.telefono AS 'Telefono',
    a.correo AS 'Correo',
    c.nombre AS 'Ciudad'
FROM
	alumno a
INNER JOIN
	ciudad c ON c.id = a.fk_ciudad
WHERE 
	a.id = '';
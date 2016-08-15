https://subversion.assembla.com/svn/dej4501-equipo-10/branches/evaluacion-3
jdbc/inscripcionramosDS

CREATE DATABASE tomaramos;

GRANT ALL PRIVILEGES 
ON tomaramos.* 
TO 'dejusr'@'localhost' 
IDENTIFIED BY 'dejpwd';

INSERT INTO alumno (id, usuario, password) VALUES (DEFAULT, 'iformas', '4229528cd9742c2c7e594c526af6d2a34f08418f');
INSERT INTO alumno (id, usuario, password) VALUES (DEFAULT, 'samrofi', '88f0fefbeeec3a041f42cde5813a5604bd1a03ad');
INSERT INTO alumno (id, usuario, password) VALUES (DEFAULT, "francisco", "6b59d12d6d7870ea5b83f3c639bf0c95024639dd");

INSERT INTO asignatura (id, nombre, creditos) VALUES(301, 'Inteligencia Artificial', 8);
INSERT INTO asignatura (id, nombre, creditos) VALUES(302, 'Sistemas Distribuidos', 8);
INSERT INTO asignatura (id, nombre, creditos) VALUES(303, 'Diseño de Estructura de Datos y Algoritmos', 10);
INSERT INTO asignatura (id, nombre, creditos) VALUES(304, 'Inteligencia de Software', 8);
INSERT INTO asignatura (id, nombre, creditos) VALUES(305, 'Programacion Orientada a Objetos', 8);
INSERT INTO asignatura (id, nombre, creditos) VALUES(306, 'Base de Datos', 5);
INSERT INTO asignatura (id, nombre, creditos) VALUES(307, 'Algoritmos', 5);

INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('4', 'Lunes 09:00-10:30 Jueves 10:30-13:00', 'Kokonoe Rin', '301');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('5', 'Lunes 09:00-10:30 Jueves 10:30-13:00', 'Cocoa Chan', '302');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('6', 'Martes 09:00-20:30 Viernes 10:30-13:00', 'Chino Chan', '302');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('1', 'Lunes 09:00-10:30 Jueves 10:30-13:00', 'Stephen Hawking', '303');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('2', 'Martes 09:00-20:30 Viernes 10:30-13:00', 'Tim Berners-Lee', '303');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('3', 'Lunes 19:00-10:30 Jueves 19:30-20:00', 'James Watson', '303');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('7', 'Lunes 09:00-10:30 Jueves 10:30-13:00', 'Iolite AI', '304');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('8', 'Martes 09:00-20:30 Viernes 10:30-13:00', 'Zvezda', '304');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('9', 'Lunes 19:00-10:30 Jueves 19:30-20:00', 'Serara-Chan', '304');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('10', 'Lunes 09:00-10:30 Jueves 10:30-13:00', 'Ika Musume', '305');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('11', 'Martes 09:00-20:30 Viernes 10:30-13:00', 'Fremea Seivelun', '305');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('12', 'Lunes 19:00-10:30 Jueves 19:30-20:00', 'Misaka-Misaka', '305');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('13', 'Viernes 19:00-10:30 Miercoles 19:30-20:00', 'Chifuyu Himeki', '305');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('14', 'Lunes 09:00-10:30 Jueves 10:30-13:00', 'Hasegawa Kobato', '306');
INSERT INTO `tomaramos`.`seccion` (`ID`, `HORARIO`, `NOMBRE_PROFESOR`, `ASIGNATURA_ID`) VALUES ('15', 'Martes 09:00-20:30 Viernes 10:30-13:00', 'Noel', '306');

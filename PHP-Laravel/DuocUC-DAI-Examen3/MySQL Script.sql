CREATE DATABASE certificadev;

GRANT ALL PRIVILEGES 
ON certificadev.* 
TO 'certificadev'@'localhost' 
IDENTIFIED BY 'toor';


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comuna
-- ----------------------------
DROP TABLE IF EXISTS `comuna`;
CREATE TABLE `comuna` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comuna
-- ----------------------------
INSERT INTO `comuna` VALUES ('1', 'Santiago');
INSERT INTO `comuna` VALUES ('2', 'Cerrillos');
INSERT INTO `comuna` VALUES ('3', 'Cerro Navia');
INSERT INTO `comuna` VALUES ('4', 'Conchalí');
INSERT INTO `comuna` VALUES ('5', 'El Bosque');
INSERT INTO `comuna` VALUES ('6', 'Estación Central');
INSERT INTO `comuna` VALUES ('7', 'Huechuraba');
INSERT INTO `comuna` VALUES ('8', 'Independencia');
INSERT INTO `comuna` VALUES ('9', 'La Cisterna');
INSERT INTO `comuna` VALUES ('10', 'La Florida');
INSERT INTO `comuna` VALUES ('11', 'La Granja');
INSERT INTO `comuna` VALUES ('12', 'La Pintana');
INSERT INTO `comuna` VALUES ('13', 'La Reina');
INSERT INTO `comuna` VALUES ('14', 'Las Condes');
INSERT INTO `comuna` VALUES ('15', 'Lo Barnechea');
INSERT INTO `comuna` VALUES ('16', 'Lo Espejo');
INSERT INTO `comuna` VALUES ('17', 'Lo Prado');
INSERT INTO `comuna` VALUES ('18', 'Macul');
INSERT INTO `comuna` VALUES ('19', 'Maipú');
INSERT INTO `comuna` VALUES ('20', 'Ñuñoa');
INSERT INTO `comuna` VALUES ('21', 'Pedro Aguirre Cerda');
INSERT INTO `comuna` VALUES ('22', 'Peñalolén');
INSERT INTO `comuna` VALUES ('23', 'Providencia');
INSERT INTO `comuna` VALUES ('24', 'Pudahuel');
INSERT INTO `comuna` VALUES ('25', 'Quilicura');
INSERT INTO `comuna` VALUES ('26', 'Quinta Normal');
INSERT INTO `comuna` VALUES ('27', 'Recoleta');
INSERT INTO `comuna` VALUES ('28', 'Renca');
INSERT INTO `comuna` VALUES ('29', 'San Joaquín');
INSERT INTO `comuna` VALUES ('30', 'San Miguel');
INSERT INTO `comuna` VALUES ('31', 'San Ramón');
INSERT INTO `comuna` VALUES ('32', 'Vitacura');
INSERT INTO `comuna` VALUES ('33', 'Puente Alto');
INSERT INTO `comuna` VALUES ('34', 'Pirque');
INSERT INTO `comuna` VALUES ('35', 'San José de Maipo');
INSERT INTO `comuna` VALUES ('36', 'Colina');
INSERT INTO `comuna` VALUES ('37', 'Lampa ');
INSERT INTO `comuna` VALUES ('38', 'Tiltil');
INSERT INTO `comuna` VALUES ('39', 'San Bernardo');
INSERT INTO `comuna` VALUES ('40', 'Buin');
INSERT INTO `comuna` VALUES ('41', 'Calera de Tango');
INSERT INTO `comuna` VALUES ('42', 'Paine');
INSERT INTO `comuna` VALUES ('43', 'Melipilla');
INSERT INTO `comuna` VALUES ('44', 'Alhué');
INSERT INTO `comuna` VALUES ('45', 'Curacaví');
INSERT INTO `comuna` VALUES ('46', 'María Pinto');
INSERT INTO `comuna` VALUES ('47', 'San Pedro');
INSERT INTO `comuna` VALUES ('48', 'Talagante');
INSERT INTO `comuna` VALUES ('49', 'El Monte');
INSERT INTO `comuna` VALUES ('50', 'Isla de Maipo');
INSERT INTO `comuna` VALUES ('51', 'Padre Hurtado');
INSERT INTO `comuna` VALUES ('52', 'Peñaflor');

-- ----------------------------
-- Table structure for curso
-- ----------------------------
DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nombre` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of curso
-- ----------------------------
INSERT INTO `curso` VALUES ('1', 'Java');
INSERT INTO `curso` VALUES ('2', '.Net');
INSERT INTO `curso` VALUES ('3', 'PHP');

-- ----------------------------
-- Table structure for educacion
-- ----------------------------
DROP TABLE IF EXISTS `educacion`;
CREATE TABLE `educacion` (
  `id` int(11) NOT NULL,
  `nombre` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of educacion
-- ----------------------------
INSERT INTO `educacion` VALUES ('1', 'Profesional');
INSERT INTO `educacion` VALUES ('2', 'Técnico');
INSERT INTO `educacion` VALUES ('3', 'Media');
INSERT INTO `educacion` VALUES ('4', 'Básica');
INSERT INTO `educacion` VALUES ('5', 'No Posee');

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES ('1', 'Pendiente');
INSERT INTO `estado` VALUES ('2', 'Aprobado');
INSERT INTO `estado` VALUES ('3', 'Rechazado');

-- ----------------------------
-- Table structure for modalidad
-- ----------------------------
DROP TABLE IF EXISTS `modalidad`;
CREATE TABLE `modalidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modalidad
-- ----------------------------
INSERT INTO `modalidad` VALUES ('1', 'Diurna');
INSERT INTO `modalidad` VALUES ('2', 'Vespertina');

-- ----------------------------
-- Table structure for postulacion
-- ----------------------------
DROP TABLE IF EXISTS `postulacion`;
CREATE TABLE `postulacion` (
  `id` int(11) NOT NULL,
  `rut` char(8) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `apaterno` varchar(32) NOT NULL,
  `amaterno` varchar(32) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `direccion` varchar(32) NOT NULL,
  `experiencia` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `comuna_id` int(11) NOT NULL,
  `educacion_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_url` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `check_url_UNIQUE` (`check_url`),
  KEY `ix_relationship1` (`modalidad_id`),
  KEY `ix_relationship2` (`curso_id`),
  KEY `ix_relationship3` (`comuna_id`),
  KEY `ix_relationship4` (`usuario_id`),
  KEY `ix_relationship6` (`educacion_id`),
  KEY `relationship7` (`estado_id`),
  CONSTRAINT `relationship1` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidad` (`id`),
  CONSTRAINT `relationship2` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  CONSTRAINT `relationship3` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`),
  CONSTRAINT `relationship4` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `relationship6` FOREIGN KEY (`educacion_id`) REFERENCES `educacion` (`id`),
  CONSTRAINT `relationship7` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of postulacion
-- ----------------------------

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'ejecutivo');
INSERT INTO `rol` VALUES ('2', 'postulante');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `rut` int(8) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `apaterno` varchar(32) NOT NULL,
  `amaterno` varchar(32) NOT NULL,
  `password` varchar(512) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rut` (`rut`),
  KEY `ix_relationship5` (`rol_id`),
  CONSTRAINT `relationship5` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


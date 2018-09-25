-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2018 a las 17:46:53
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `publikate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `categoria_codigo` int(11) NOT NULL,
  `categoria_nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`categoria_codigo`, `categoria_nombre`) VALUES
(1, 'INFORMATICA'),
(2, 'INTERNET'),
(3, 'MERCADEO'),
(4, 'VENTAS'),
(5, 'SERVICIOS FINANCIEROS'),
(6, 'RECURSOS HUMANOS'),
(7, 'PRODUCCION'),
(8, 'INGENIERIA'),
(9, 'MANTENIMIENTO'),
(10, 'CALL CENTER'),
(11, 'SALUD'),
(12, 'RESTAURANTES'),
(13, 'TELECOMUNICACIONES'),
(14, 'ALMACENAMIENTO'),
(15, 'LOGISTICA'),
(16, 'COMPRAS'),
(17, 'CONTABILIDAD'),
(18, 'JARDINERIA'),
(19, 'ELECTRICIDAD'),
(20, 'MECANICA AUTOMOTRIZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ciudad`
--

CREATE TABLE `tbl_ciudad` (
  `ciudad_codigo` int(11) NOT NULL,
  `ciudad_nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_ciudad`
--

INSERT INTO `tbl_ciudad` (`ciudad_codigo`, `ciudad_nombre`) VALUES
(1, 'LA CEIBA'),
(2, 'SAN PEDRO SULA'),
(3, 'TEGUCIGALPA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empresa`
--

CREATE TABLE `tbl_empresa` (
  `empresa_codigo` int(11) NOT NULL,
  `empresa_nombre` text,
  `empresa_rtn` varchar(45) DEFAULT NULL,
  `ciudad_codigo` int(11) DEFAULT NULL,
  `categoria_codigo` int(11) DEFAULT NULL,
  `empresa_descripcion` text,
  `empresa_direccion` text,
  `empresa_correo` text,
  `empresa_horario` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_empresa`
--

INSERT INTO `tbl_empresa` (`empresa_codigo`, `empresa_nombre`, `empresa_rtn`, `ciudad_codigo`, `categoria_codigo`, `empresa_descripcion`, `empresa_direccion`, `empresa_correo`, `empresa_horario`) VALUES
(1, 'Nintendo', '10230450440', 2, 2, 'en la primera versión de la novela aparecen dilatadas descripciones acerca de la mala vida de la ciudad; el sistema más utilizado en las descripciones de personas es el que pasa de la descripción de la cabeza, al cuello, tronco, piernas y pies, o en sentido inverso', 'Colonia La Aurora', 'nintendo@gmail.com', ' 7:00am a 10:00pm de Lunes a Viernes'),
(2, 'From Sofware', '5644505050', 1, 7, 'en la primera versión de la novela aparecen dilatadas descripciones acerca de la mala vida de la ciudad; el sistema más utilizado en las descripciones de personas es el que pasa de la descripción de la cabeza, al cuello, tronco, piernas y pies, o en sentido inverso', 'Colonia La Aurora', 'fromsoftware@gmail.com', ' 7:00am a 10:00pm de Lunes a Viernes'),
(3, 'Quantic Dream', '2034240234050', 3, 8, 'en la primera versión de la novela aparecen dilatadas descripciones acerca de la mala vida de la ciudad; el sistema más utilizado en las descripciones de personas es el que pasa de la descripción de la cabeza, al cuello, tronco, piernas y pies, o en sentido inverso', 'Colonia La Aurora', 'qd@gmail.com', ' 7:00am a 10:00pm de Lunes a Viernes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empresaimagenes`
--

CREATE TABLE `tbl_empresaimagenes` (
  `imagenes_codigo` int(11) NOT NULL,
  `empresa_codigo` int(11) DEFAULT NULL,
  `imagenes_nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_empresaimagenes`
--

INSERT INTO `tbl_empresaimagenes` (`imagenes_codigo`, `empresa_codigo`, `imagenes_nombre`) VALUES
(1, 1, 'Imagenes/Nintendo/FB_IMG_15053506315295260.jpg'),
(2, 1, 'Imagenes/Nintendo/FB_IMG_15054405669114854.jpg'),
(3, 1, 'Imagenes/Nintendo/FB_IMG_15060002134698888.jpg'),
(4, 2, 'Imagenes/From Sofware/FB_IMG_15072349340241018.jpg'),
(5, 2, 'Imagenes/From Sofware/FB_IMG_15072441915006890.jpg'),
(6, 2, 'Imagenes/From Sofware/FB_IMG_15073224122626222.jpg'),
(7, 3, 'Imagenes/Quantic Dream/FB_IMG_15295165642383538.jpg'),
(8, 3, 'Imagenes/Quantic Dream/FB_IMG_15295245926440637.jpg'),
(9, 3, 'Imagenes/Quantic Dream/FB_IMG_15296013752260857.jpg'),
(10, 3, 'Imagenes/Quantic Dream/FB_IMG_15299569578738271.jpg'),
(11, 3, 'Imagenes/Quantic Dream/FB_IMG_15300343536153481.jpg'),
(12, 3, 'Imagenes/Quantic Dream/FB_IMG_15300429987500980.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empresalogo`
--

CREATE TABLE `tbl_empresalogo` (
  `logo_codigo` int(11) NOT NULL,
  `empresa_codigo` int(11) DEFAULT NULL,
  `logo_nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_empresalogo`
--

INSERT INTO `tbl_empresalogo` (`logo_codigo`, `empresa_codigo`, `logo_nombre`) VALUES
(1, 1, 'Logos/Nintendo/FB_IMG_15065261066033634.jpg'),
(2, 2, 'Logos/From Sofware/FB_IMG_15064421762924258.jpg'),
(3, 3, 'Logos/Quantic Dream/FB_IMG_15101207109692173.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empresatelefono`
--

CREATE TABLE `tbl_empresatelefono` (
  `telefono_codigo` int(11) NOT NULL,
  `empresa_codigo` int(11) DEFAULT NULL,
  `telefono_telefono` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_empresatelefono`
--

INSERT INTO `tbl_empresatelefono` (`telefono_codigo`, `empresa_codigo`, `telefono_telefono`) VALUES
(1, 1, '(504) 9867-3456'),
(2, 1, '(454) 4657-7688'),
(3, 2, '(477) 6690-5940'),
(4, 2, '(349) 3594-0460'),
(5, 3, '(477) 6690-5940'),
(6, 3, '(349) 3594-0460');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `genero_codigo` int(11) NOT NULL,
  `genero_nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_genero`
--

INSERT INTO `tbl_genero` (`genero_codigo`, `genero_nombre`) VALUES
(1, 'MASCULINO'),
(2, 'FEMENINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `usuario_codigo` int(11) NOT NULL,
  `usuario_identidad` text,
  `usuario_nombre` text,
  `usuario_correo` text,
  `ciudad_codigo` int(11) DEFAULT NULL,
  `genero_codigo` int(11) DEFAULT NULL,
  `usuario_fechanacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`categoria_codigo`);

--
-- Indices de la tabla `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD PRIMARY KEY (`ciudad_codigo`);

--
-- Indices de la tabla `tbl_empresa`
--
ALTER TABLE `tbl_empresa`
  ADD PRIMARY KEY (`empresa_codigo`);

--
-- Indices de la tabla `tbl_empresaimagenes`
--
ALTER TABLE `tbl_empresaimagenes`
  ADD PRIMARY KEY (`imagenes_codigo`),
  ADD KEY `empresa_codigo_fk2_idx` (`empresa_codigo`);

--
-- Indices de la tabla `tbl_empresalogo`
--
ALTER TABLE `tbl_empresalogo`
  ADD PRIMARY KEY (`logo_codigo`),
  ADD KEY `empresa_codigo_fk_idx` (`empresa_codigo`);

--
-- Indices de la tabla `tbl_empresatelefono`
--
ALTER TABLE `tbl_empresatelefono`
  ADD PRIMARY KEY (`telefono_codigo`),
  ADD KEY `empresa_codigo_fk3_idx` (`empresa_codigo`);

--
-- Indices de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`genero_codigo`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`usuario_codigo`),
  ADD KEY `ciudad_codigo_fk_idx` (`ciudad_codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `categoria_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  MODIFY `ciudad_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_empresa`
--
ALTER TABLE `tbl_empresa`
  MODIFY `empresa_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_empresaimagenes`
--
ALTER TABLE `tbl_empresaimagenes`
  MODIFY `imagenes_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_empresalogo`
--
ALTER TABLE `tbl_empresalogo`
  MODIFY `logo_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_empresatelefono`
--
ALTER TABLE `tbl_empresatelefono`
  MODIFY `telefono_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `genero_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `usuario_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_empresaimagenes`
--
ALTER TABLE `tbl_empresaimagenes`
  ADD CONSTRAINT `empresa_codigo_fk2` FOREIGN KEY (`empresa_codigo`) REFERENCES `tbl_empresa` (`empresa_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empresalogo`
--
ALTER TABLE `tbl_empresalogo`
  ADD CONSTRAINT `empresa_codigo_fk` FOREIGN KEY (`empresa_codigo`) REFERENCES `tbl_empresa` (`empresa_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empresatelefono`
--
ALTER TABLE `tbl_empresatelefono`
  ADD CONSTRAINT `empresa_codigo_fk3` FOREIGN KEY (`empresa_codigo`) REFERENCES `tbl_empresa` (`empresa_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `ciudad_codigo_fk` FOREIGN KEY (`ciudad_codigo`) REFERENCES `tbl_ciudad` (`ciudad_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

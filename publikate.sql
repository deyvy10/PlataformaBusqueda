-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-09-2018 a las 06:30:34
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `publikate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `id_empresa` int(8) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `rtn` varchar(15) NOT NULL,
  `id_ciudad` int(4) NOT NULL,
  `id_categoria` int(4) NOT NULL,
  `id_foto_logo` int(8) NOT NULL,
  `descripcion` text NOT NULL,
  `id_fotos` int(8) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `celular` varchar(8) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `horarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `empresas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(8) NOT NULL,
  `identidad` varchar(13) NOT NULL,
  `nombre_completo` varchar(150) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `ciudad` int(4) NOT NULL,
  `genero` int(1) NOT NULL,
  `fecha_nac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `usuario`
--


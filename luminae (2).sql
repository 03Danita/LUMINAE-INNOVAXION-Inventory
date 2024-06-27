-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 15-08-2023 a las 23:52:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `luminae`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Codigo_Cat` int(11) NOT NULL,
  `Nombre_Cat` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Codigo_Cat`, `Nombre_Cat`) VALUES
(156289, 'Tenis'),
(156444, 'Alpargatas'),
(336688, 'Tacones'),
(397411, 'Chanclas'),
(714439, 'Botas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `IdInventario` int(11) NOT NULL,
  `Cantidad_Entrada` int(11) NOT NULL,
  `Cantidad_Salida` int(11) NOT NULL,
  `Precio` float NOT NULL,
  `Producto_Cod_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`IdInventario`, `Cantidad_Entrada`, `Cantidad_Salida`, `Precio`, `Producto_Cod_Producto`) VALUES
(156289, 25, 24, 88, 325),
(336688, 24, 23, 90, 456),
(397411, 30, 29, 20, 652),
(456922, 15, 15, 60, 894),
(714439, 10, 9, 50, 578);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `Cod_Material` int(11) NOT NULL,
  `Nombre_Material` varchar(45) NOT NULL,
  `Valor_Material` float NOT NULL,
  `Cantidad_Material` varchar(45) NOT NULL,
  `Categoria_Codigo_Cat` int(11) NOT NULL,
  `Proveedor_Cod_Proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`Cod_Material`, `Nombre_Material`, `Valor_Material`, `Cantidad_Material`, `Categoria_Codigo_Cat`, `Proveedor_Cod_Proveedor`) VALUES
(62, 'Hilo', 42000, '12', 397411, 665712464),
(67, 'Pegante', 60000, '10', 336688, 754291466),
(77, 'Aguja', 20000, '20', 714439, 242697457),
(84, 'Cuero', 50000, '10', 156289, 748256954),
(89, 'Suela', 56000, '30', 156444, 514635589);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientodematerial`
--

CREATE TABLE `movimientodematerial` (
  `IdMov` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Tipo de movimiento` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Material_Cod_Material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientodematerial`
--

INSERT INTO `movimientodematerial` (`IdMov`, `Fecha`, `Tipo de movimiento`, `Cantidad`, `Material_Cod_Material`) VALUES
(2156, '2022-06-26', 'Salida', 55, 67),
(6321, '2022-11-30', 'Entrada', 87, 89),
(7456, '2022-08-15', 'Entrada', 15, 84),
(7766, '2022-07-05', 'Salida', 21, 77),
(9645, '2022-05-20', 'Entrada', 30, 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Cod_Producto` int(11) NOT NULL,
  `Nombre_Producto` varchar(45) NOT NULL,
  `Valor_Producto` float NOT NULL,
  `Cantidad_Producto` int(11) NOT NULL,
  `Categoria_Codigo_Cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Cod_Producto`, `Nombre_Producto`, `Valor_Producto`, `Cantidad_Producto`, `Categoria_Codigo_Cat`) VALUES
(325, 'Zapatos ', 88000, 20, 156289),
(456, 'alpargatas', 60, 34, 456922),
(578, 'Tacones ', 90, 23, 336688),
(652, 'botas ', 50, 32, 714439),
(894, 'chasclas', 20, 21, 397411);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Cod_Proveedor` int(11) NOT NULL,
  `Nombre_Proveedor` varchar(45) NOT NULL,
  `Telefono` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Cod_Proveedor`, `Nombre_Proveedor`, `Telefono`) VALUES
(242697457, 'Hernesto', 3254782155),
(665712464, 'Alfonso', 3876945271),
(714635589, 'martin', 3698521478),
(748256954, 'Ricardo', 3567896545),
(754291466, 'Julio', 3335864122);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `Codigo_Sub` int(11) NOT NULL,
  `Nombre_Sub` varchar(45) NOT NULL,
  `Categoria_Codigo_Cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`Codigo_Sub`, `Nombre_Sub`, `Categoria_Codigo_Cat`) VALUES
(156289, 'Tenis dportivo', 156289),
(336688, 'Tacones moda', 336688),
(397411, 'Chanclas de berano', 397411),
(456922, 'Alpargatas veraniegas', 156444),
(714439, 'Botas todo terreno', 714439);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeusuario`
--

CREATE TABLE `tipodeusuario` (
  `Tipo de usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodeusuario`
--

INSERT INTO `tipodeusuario` (`Tipo de usuario`) VALUES
('administrador'),
('Analista de inventario'),
('Dueño'),
('Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuarios` int(11) NOT NULL,
  `Nombre_Usuario` varchar(45) NOT NULL,
  `UsuarioLogin_IdLogin` int(11) NOT NULL,
  `TipoDeUsuario_Tipo de usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuarios`, `Nombre_Usuario`, `UsuarioLogin_IdLogin`, `TipoDeUsuario_Tipo de usuario`) VALUES
(1155784935, 'Natalia', 99102, 'Empleado'),
(1534867294, 'Danna', 47553, 'administrador'),
(1573496842, 'harold', 55662, 'Empleado'),
(1768294358, 'Daniela', 97342, 'Dueño'),
(1873169754, 'jhony', 48963, 'Analista de inventario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariologin`
--

CREATE TABLE `usuariologin` (
  `IdLogin` int(11) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuariologin`
--

INSERT INTO `usuariologin` (`IdLogin`, `Correo`, `Contraseña`) VALUES
(47553, 'dannamarcopolo@gmail.com', 'maCuin85'),
(48963, 'jhonygonzalesmalens@gmail.com', 'pHp369'),
(55662, 'harolcristancholopes@gmail.com', 'bEn55'),
(97342, 'danielagutierrescerra@gmail.com', 'toRmenta54'),
(99102, 'sofianataliapereida@gmail.com', 'lluVia99');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Codigo_Cat`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`IdInventario`,`Producto_Cod_Producto`),
  ADD KEY `fk_Inventario_Producto` (`Producto_Cod_Producto`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`Cod_Material`,`Categoria_Codigo_Cat`,`Proveedor_Cod_Proveedor`);

--
-- Indices de la tabla `movimientodematerial`
--
ALTER TABLE `movimientodematerial`
  ADD PRIMARY KEY (`IdMov`,`Material_Cod_Material`),
  ADD KEY `fk_MovimientoDeMaterial_Material1` (`Material_Cod_Material`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Cod_Producto`,`Categoria_Codigo_Cat`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Cod_Proveedor`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`Codigo_Sub`,`Categoria_Codigo_Cat`),
  ADD KEY `fk_Subcategoria_Categoria1` (`Categoria_Codigo_Cat`);

--
-- Indices de la tabla `tipodeusuario`
--
ALTER TABLE `tipodeusuario`
  ADD PRIMARY KEY (`Tipo de usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuarios`,`UsuarioLogin_IdLogin`,`TipoDeUsuario_Tipo de usuario`),
  ADD KEY `fk_Usuario_UsuarioLogin1` (`UsuarioLogin_IdLogin`),
  ADD KEY `fk_Usuario_TipoDeUsuario1` (`TipoDeUsuario_Tipo de usuario`);

--
-- Indices de la tabla `usuariologin`
--
ALTER TABLE `usuariologin`
  ADD PRIMARY KEY (`IdLogin`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_Inventario_Producto` FOREIGN KEY (`Producto_Cod_Producto`) REFERENCES `producto` (`Cod_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientodematerial`
--
ALTER TABLE `movimientodematerial`
  ADD CONSTRAINT `fk_MovimientoDeMaterial_Material1` FOREIGN KEY (`Material_Cod_Material`) REFERENCES `material` (`Cod_Material`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `fk_Subcategoria_Categoria1` FOREIGN KEY (`Categoria_Codigo_Cat`) REFERENCES `categoria` (`Codigo_Cat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_TipoDeUsuario1` FOREIGN KEY (`TipoDeUsuario_Tipo de usuario`) REFERENCES `tipodeusuario` (`Tipo de usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_UsuarioLogin1` FOREIGN KEY (`UsuarioLogin_IdLogin`) REFERENCES `usuariologin` (`IdLogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2024 a las 21:20:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `imagen`, `condicion`) VALUES
(6, 9, '00239', 'casual', 4, 'Las botas Kumbre son un calzado versátil diseñado para actividades al aire libre y aventuras en la naturaleza', '1708717785.jpg', 1),
(7, 7, '001283', 'kumbre Negras', 5, 'Las botas Kumbre son un calzado versátil diseñado para actividades al aire libre y aventuras en la naturaleza', '1708717451.jpg', 1),
(8, 9, 'ty234', 'converse', 8, 'Las zapatillas son un tipo de calzado cómodo y versátil, ideal para el uso diario.', '1708717624.jpg', 1),
(9, 9, '6788', 'Deportivas', 12, 'Las deportivas son un tipo de calzado diseñado para actividades físicas y deportivas.', '1708717771.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(7, 'Botas', 'Las botas vienen en una amplia gama de estilos y diseños para adaptarse a diferentes propósitos y preferencias estéticas. Pueden ser informales, elegantes, deportivas o funcionales, y están disponibles en una variedad de colores y acabados.', 1),
(8, 'Tacones', 'Los tacones se consideran un calzado elegante y femenino, y se utilizan comúnmente en ocasiones formales o para agregar un toque de estilo a un atuendo. Además de su función estética, los tacones también pueden modificar la postura del cuerpo, haciendo que', 1),
(9, 'zapatilla casual', 'En términos de diseño, las zapatillas casuales vienen en una amplia gama de estilos y colores para adaptarse a diferentes preferencias de moda y personalidades. Pueden tener detalles adicionales como cordones, cierres de velcro o detalles decorativos para', 1),
(12, 'zapatilla deportiva', 'Las zapatillas deportivas también están disponibles en una amplia gama de estilos y diseños para adaptarse a las preferencias personales y de moda de cada individuo. En resumen, las zapatillas deportivas son esenciales para aquellos que practican deportes', 1),
(13, 'zapatilla futsal', 'En resumen, las zapatillas de futsal están diseñadas específicamente para proporcionar el mejor rendimiento y comodidad en la práctica de este deporte en superficies indoor. Con su suela especializada, amortiguación adecuada y diseño ligero y flexible, son', 1),
(14, 'Sandalias', 'Las sandalias son una opción popular durante los meses más cálidos del año y son adecuadas para una variedad de actividades, desde paseos por la playa hasta salidas informales o incluso eventos más formales cuando se eligen modelos más elegantes. Su diseño', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(16, 6, 6, 10, 20.00, 30.00),
(17, 6, 7, 5, 200.00, 250.00),
(18, 7, 8, 10, 16.00, 25.00),
(19, 8, 7, 10, 250.00, 300.00),
(20, 9, 8, 50, 20.00, 30.00),
(21, 10, 6, 10, 25.00, 30.00),
(22, 11, 7, 15, 250.00, 300.00),
(23, 12, 7, 1, 5.00, 3000.00),
(24, 12, 8, 1, 2000.00, 3000.00),
(25, 13, 8, 1, 1.00, 1.00),
(26, 13, 6, 1, 1.00, 1.00),
(27, 14, 9, 10, 4000.00, 4500.00),
(28, 15, 9, 3, 300.00, 300.00),
(29, 16, 9, 3, 300000.00, 29987.00);

--
-- Disparadores `detalle_ingreso`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
UPDATE articulo SET stock=stock + NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(12, 10, 6, 10, 30.00, 5.00),
(13, 10, 7, 10, 250.00, 10.00),
(14, 11, 6, 1, 30.00, 0.00),
(15, 11, 7, 1, 250.00, 0.00),
(16, 12, 7, 4, 250.00, 0.00),
(17, 13, 7, 1, 250.00, 10.00),
(18, 14, 7, 2, 250.00, 10.00),
(19, 15, 6, 1, 30.00, 10.00),
(20, 16, 7, 1, 250.00, 5.00),
(21, 17, 7, 1, 250.00, 5.00),
(22, 18, 6, 1, 30.00, 0.00),
(23, 19, 7, 1, 250.00, 2.00),
(24, 20, 8, 2, 25.00, 0.00),
(25, 21, 6, 1, 30.00, 5.00),
(26, 22, 6, 1, 30.00, 0.00),
(27, 22, 7, 1, 300.00, 0.00),
(28, 22, 8, 1, 30.00, 0.00),
(29, 23, 6, 2, 30.00, 0.00),
(30, 23, 6, 1, 30.00, 0.00),
(31, 23, 6, 1, 30.00, 0.00),
(32, 23, 7, 1, 300.00, 0.00),
(33, 23, 7, 1, 300.00, 0.00),
(34, 23, 7, 1, 300.00, 0.00),
(35, 23, 6, 1, 30.00, 0.00),
(36, 24, 7, 1, 3000.00, 0.00);

--
-- Disparadores `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `tr_udpStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock - NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
(6, 7, 1, 'Factura', '001', '0001', '2018-08-20 00:00:00', 18.00, 1200.00, 'Aceptado'),
(7, 7, 1, 'Factura', '001', '008', '2018-08-21 00:00:00', 18.00, 160.00, 'Aceptado'),
(8, 7, 1, 'Boleta', '0002', '0004', '2018-08-22 00:00:00', 0.00, 2500.00, 'Aceptado'),
(9, 9, 1, 'Factura', '001', '0005', '2018-08-23 00:00:00', 18.00, 1000.00, 'Aceptado'),
(10, 10, 1, 'Factura', '001', '0006', '2018-08-25 00:00:00', 18.00, 250.00, 'Aceptado'),
(11, 10, 1, 'Factura', '001', '0007', '2018-08-27 00:00:00', 18.00, 3750.00, 'Aceptado'),
(12, 9, 1, 'Boleta', '2356287', '23254', '2024-02-01 00:00:00', 0.00, 2.00, 'Anulado'),
(13, 9, 3, 'Factura', '2356287', '23254', '2024-02-23 00:00:00', 18.00, 2.00, 'Aceptado'),
(14, 10, 1, 'Factura', '23455', '76', '2024-02-23 00:00:00', 18.00, 1.00, 'Anulado'),
(15, 9, 1, 'Factura', '0987', '1233', '2024-02-23 00:00:00', 18.00, 1.00, 'Aceptado'),
(16, 13, 1, 'Ticket', '6788', '6788', '2023-10-06 00:00:00', 0.00, 900000.00, 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(7, 'Proveedor', 'Fabricantes de materiales', 'CEDULA', '234567890\'', 'Av. los pinos 201', '54328730', 'Fabricante@hotmail.com'),
(8, 'Cliente', 'publico general', 'DNI', '30224520', 'Av.jose olaya 215', '54325230', 'public@hotmail.com'),
(9, 'Proveedor', 'Fabricantes de maquinaria y equipos', 'RUC', '20485248751', 'Calle los naranjales 245', '054587852', 'maquinaria@gmail.com'),
(10, 'Proveedor', 'Distribuidores y mayoristas de calzado', 'DNI', '40485245824', 'Av. quiñones 102', '054789854', 'Distribuidora@hotmail.com'),
(11, 'Cliente', 'pedro', 'DNI', '458521748', 'Simon bolivar 120', '78954263', 'pedro@gmailcom'),
(12, 'Cliente', 'natis', 'CEDULA', '10229322527', 'Calle los alpes 210', '3044687885', 'natis@gmail.com'),
(13, 'Proveedor', 'Proveedores de componentes', 'RUC', '914688257', 'Calle los alpes 210', '098712345', 'Componentes@gmail.com'),
(14, 'Proveedor', 'Proveedores de servicios de tercerización', 'CEDULA', '198720866', 'car 15 call 2 sur', '197298678678', 'Terceaderas@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'admin', 'CEDULA', '675362798298', 'Calle los alpes 210', '54782167787', 'administrador@gmail.com', 'Administrador', 'administrador', 'ca77c16cfb1c05f3c733d909741303c29c9a7b07c40a004dad807c904901bf29', '1708703429.jpeg', 1),
(2, 'daniela', 'CEDULA', '10229322527', 'calle los jirasoles 450', '3044687885', 'danie@hotmail.com', 'empleado', 'dani', '4897248476c695ed8f273a06884de8582327bd9a8473a9a670eb53a0b841a20b', '1708704360.jpeg', 1),
(3, 'Natalia', 'CEDULA', '1015403810', 'car 15 call 2 sur', '316 8474959', 'natis@gmail.com', 'cliente', 'natis', '08c5b3d0da7c775f648afdcd3912f216e5f92321614f0a5475117ff63d7e97bd', '1708704655.jpeg', 1),
(4, 'jhony', 'CEDULA', '1634572345', 'alpes', '3123513868', 'jhony@gmail.com', 'empleado', 'pecas', 'bac19d5d0b4af76040e0f18103cb4ae8c7ee3810f01a26d88c0d64ecc299bbb5', '1708705479.jpeg', 1),
(5, 'danna', 'CEDULA', '1031421687', 'chico sur', '320 4049548', 'danna@gmail.com', 'dueña', 'dannita', '4040f92b74e850d0b782dbcd373e0c8e4c1f70806cdac584e52864286bbacd20', '1708706656.jpeg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(101, 1, 1),
(102, 1, 2),
(103, 1, 3),
(104, 1, 4),
(105, 1, 5),
(106, 1, 6),
(107, 1, 7),
(112, 2, 1),
(113, 2, 3),
(114, 2, 4),
(115, 2, 7),
(116, 3, 1),
(117, 3, 3),
(118, 3, 4),
(123, 4, 1),
(124, 4, 2),
(125, 4, 6),
(126, 4, 7),
(127, 5, 1),
(128, 5, 2),
(129, 5, 3),
(130, 5, 4),
(131, 5, 6),
(132, 5, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total_venta` decimal(11,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(10, 8, 1, 'Boleta', '001', '0001', '2018-01-08 00:00:00', 0.00, 11800.15, 'Aceptado'),
(11, 8, 1, 'Factura', '001', '0002', '2018-03-05 00:00:00', 18.00, 3800.00, 'Aceptado'),
(12, 8, 1, 'Ticket', '001', '0001', '2018-04-17 00:00:00', 0.00, 1000.00, 'Aceptado'),
(13, 8, 1, 'Factura', '001', '0002', '2018-06-09 00:00:00', 18.00, 240.00, 'Aceptado'),
(14, 8, 1, 'Factura', '20', '30', '2018-07-24 00:00:00', 18.00, 490.00, 'Aceptado'),
(15, 8, 1, 'Factura', '001', '0008', '2018-08-26 00:00:00', 18.00, 20.00, 'Aceptado'),
(16, 8, 1, 'Boleta', '001', '0070', '2018-08-26 00:00:00', 0.00, 245.00, 'Aceptado'),
(17, 8, 1, 'Factura', '002', '0004', '2018-08-26 00:00:00', 18.00, 245.00, 'Aceptado'),
(18, 8, 1, 'Boleta', '001', '0006', '2018-08-26 00:00:00', 0.00, 30.00, 'Aceptado'),
(19, 8, 1, 'Factura', '001', '0009', '2018-08-26 00:00:00', 18.00, 248.00, 'Aceptado'),
(20, 8, 1, 'Factura', '001', '002', '2018-08-26 00:00:00', 18.00, 50.00, 'Aceptado'),
(21, 8, 1, 'Factura', '001', '0004', '2018-08-27 00:00:00', 18.00, 25.00, 'Aceptado'),
(22, 11, 1, 'Ticket', '001', '0004', '2018-08-27 00:00:00', 0.00, 360.00, 'Aceptado'),
(23, 11, 1, 'Factura', '2356287', '23254', '2024-02-23 00:00:00', 18.00, 1020.00, 'Aceptado'),
(24, 12, 3, 'Ticket', '2356287', '2345yui', '2024-02-23 00:00:00', 0.00, 3000.00, 'Aceptado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_idx` (`idingreso`),
  ADD KEY `fk_detalle_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_venta_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_persona_idx` (`idproveedor`),
  ADD KEY `fk_ingreso_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  ADD KEY `fk_usuario_permiso_idx` (`idpermiso`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

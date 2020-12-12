-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2020 a las 04:40:47
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_limapass_up`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buses`
--

CREATE TABLE `buses` (
  `id` int(11) NOT NULL,
  `busType` varchar(25) NOT NULL,
  `busName` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `buses`
--

INSERT INTO `buses` (`id`, `busType`, `busName`) VALUES
(1, 'Corredor Rojo', '202'),
(2, 'Alimentador', 'AN01'),
(3, 'Metropolitano', 'Expreso 1'),
(4, 'Corredor Rojo', '209');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `card_recharge`
--

CREATE TABLE `card_recharge` (
  `id` int(11) NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `buses_id` int(11) NOT NULL,
  `direction` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `routes`
--

INSERT INTO `routes` (`id`, `buses_id`, `direction`) VALUES
(1, 2, 'go'),
(2, 2, 'back'),
(3, 3, 'go'),
(4, 3, 'back'),
(5, 1, 'go'),
(6, 1, 'back');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routes_stop`
--

CREATE TABLE `routes_stop` (
  `id` int(11) NOT NULL,
  `routes_id` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL,
  `stop_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `routes_stop`
--

INSERT INTO `routes_stop` (`id`, `routes_id`, `stop_id`, `stop_order`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 1, 6, 6),
(7, 1, 7, 7),
(8, 1, 8, 8),
(9, 1, 9, 9),
(10, 2, 9, 1),
(11, 2, 8, 2),
(12, 2, 7, 3),
(13, 2, 6, 4),
(14, 2, 5, 5),
(15, 2, 4, 6),
(16, 2, 3, 7),
(17, 2, 2, 8),
(18, 2, 1, 9),
(36, 3, 10, 1),
(37, 3, 11, 2),
(38, 3, 12, 3),
(39, 3, 13, 4),
(40, 3, 14, 5),
(41, 3, 15, 6),
(42, 3, 16, 7),
(43, 3, 17, 8),
(44, 3, 18, 9),
(45, 3, 19, 10),
(46, 3, 20, 11),
(47, 3, 21, 12),
(48, 3, 22, 13),
(49, 3, 10, 13),
(50, 4, 11, 12),
(51, 4, 12, 11),
(52, 4, 13, 12),
(53, 4, 17, 8),
(54, 4, 18, 9),
(55, 4, 19, 10),
(56, 4, 20, 11),
(57, 4, 21, 12),
(58, 4, 22, 13),
(59, 3, 17, 8),
(60, 3, 18, 9),
(61, 3, 19, 10),
(62, 3, 20, 11),
(63, 3, 21, 12),
(64, 3, 22, 13),
(65, 3, 23, 14),
(66, 4, 23, 1),
(67, 4, 22, 2),
(68, 4, 21, 3),
(69, 4, 20, 4),
(70, 4, 19, 5),
(71, 4, 18, 6),
(72, 4, 17, 7),
(73, 4, 16, 8),
(74, 4, 15, 9),
(75, 4, 14, 10),
(76, 4, 12, 11),
(77, 4, 11, 12),
(78, 4, 10, 13),
(79, 5, 24, 1),
(80, 5, 25, 2),
(81, 5, 26, 3),
(82, 5, 27, 4),
(83, 5, 28, 5),
(84, 5, 29, 6),
(85, 5, 30, 7),
(86, 5, 31, 8),
(87, 5, 32, 9),
(88, 5, 33, 10),
(89, 5, 34, 11),
(90, 6, 34, 1),
(91, 6, 33, 2),
(92, 6, 35, 3),
(93, 6, 36, 4),
(94, 6, 30, 5),
(95, 6, 29, 6),
(96, 6, 28, 7),
(97, 6, 37, 8),
(98, 6, 26, 9),
(99, 6, 25, 10),
(100, 6, 24, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stop`
--

CREATE TABLE `stop` (
  `id` int(11) NOT NULL,
  `stop_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stop`
--

INSERT INTO `stop` (`id`, `stop_name`) VALUES
(1, 'Estación Naranjal‎'),
(2, ' Huáscar'),
(3, 'Paracas'),
(4, 'Cahuide'),
(5, ' Pisac'),
(6, 'Quipaypampa'),
(7, 'Yauri'),
(8, ' Vilcanota'),
(9, ' Mascaypacha'),
(10, ' Estación Central Grau '),
(11, 'Estadio Nacional '),
(12, 'Javier Prado '),
(13, 'Canaval Y Moreyra '),
(14, 'Angamos '),
(15, 'Ricardo Palma '),
(16, '28 De Julio '),
(17, 'Balta '),
(18, 'Bulevar '),
(19, 'Estadio Unión '),
(20, 'Escuela Militar '),
(21, 'Fernando Terán '),
(22, 'Rosario De Villa '),
(23, 'Matellini '),
(24, 'Huarochiri'),
(25, ' Flora Tristan'),
(26, 'La Molina'),
(27, ' Evitamiento'),
(28, ' Nicolás Arriola'),
(29, 'Masias'),
(30, ' Petit Thouars'),
(31, ' Arenales'),
(32, 'Salaverry'),
(33, ' Sucre'),
(34, 'Universitaria'),
(35, 'Ugarte Moscoso'),
(36, 'Basadre'),
(37, 'Jockey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tariff`
--

CREATE TABLE `tariff` (
  `id` int(11) NOT NULL,
  `tariffType` varchar(50) NOT NULL,
  `price` double(10,2) NOT NULL,
  `buses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tariff`
--

INSERT INTO `tariff` (`id`, `tariffType`, `price`, `buses_id`) VALUES
(1, 'Tarifa General', 2.50, 3),
(2, 'Tarifa General', 1.00, 2),
(3, 'Tarifa General', 1.70, 1),
(4, 'Tarifa Medio Pasaje', 0.85, 1),
(5, 'Tarifa Medio Pasaje', 1.25, 3),
(6, 'Tarifa Medio Pasaje', 0.50, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `firstName` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `lastName` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `dni` char(8) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `firstName`, `lastName`, `dni`, `email`, `password`) VALUES
(1, 'RAMIRO RAFAEL', 'APAZA', 'CAMERO', '74080042', 'test124@gmail.com', '$2b$10$2wDjvNqzl.rQfpm6u9B0n.qOVy7wWgSJlg34FBAb8hoc0D22Sez3C'),
(2, 'D LAND JHONN', 'ARRESE', 'VALLE', '74080045', 'test125@gmail.com', '$2b$10$JlECiKXYZfIEEPJlu4/Xwua7GeMEzqc5SnG/LApo.JCzRItM0Elna'),
(4, 'JOSET ALDAIR', 'OLIVARES', 'CRISTAN', '74080043', 'test126@gmail.com', '$2b$10$UcK97ipG6ctAdcwWa.jm9eQNA1FeawoNWH/5Y4qv/ziAVxsIfP9t6'),
(6, 'NELSON RONALDO', 'LEON', 'ARANDA', '74080049', 'test16@gmail.com', '$2b$10$6mxKXzKWtU0Ymwvmn5wnNOUzU4/q6jNjdhPPho/0xy.T6mgRUnYo.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_perfil`
--

CREATE TABLE `user_perfil` (
  `id` int(11) NOT NULL,
  `cardType` int(11) NOT NULL,
  `cardValue` double NOT NULL,
  `studyCenter` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usualBus` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `card_recharge`
--
ALTER TABLE `card_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_buses_routes` (`buses_id`);

--
-- Indices de la tabla `routes_stop`
--
ALTER TABLE `routes_stop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_routes_routes_stop` (`routes_id`),
  ADD KEY `fk_stop_routes_stop` (`stop_id`);

--
-- Indices de la tabla `stop`
--
ALTER TABLE `stop`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tariff`
--
ALTER TABLE `tariff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_buses_tariff` (`buses_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `user_perfil`
--
ALTER TABLE `user_perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_user_perfil` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `card_recharge`
--
ALTER TABLE `card_recharge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `routes_stop`
--
ALTER TABLE `routes_stop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `stop`
--
ALTER TABLE `stop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `tariff`
--
ALTER TABLE `tariff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user_perfil`
--
ALTER TABLE `user_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `fk_buses_routes` FOREIGN KEY (`buses_id`) REFERENCES `buses` (`id`);

--
-- Filtros para la tabla `routes_stop`
--
ALTER TABLE `routes_stop`
  ADD CONSTRAINT `fk_routes_routes_stop` FOREIGN KEY (`routes_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stop_routes_stop` FOREIGN KEY (`stop_id`) REFERENCES `stop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tariff`
--
ALTER TABLE `tariff`
  ADD CONSTRAINT `fk_buses_tariff` FOREIGN KEY (`buses_id`) REFERENCES `buses` (`id`);

--
-- Filtros para la tabla `user_perfil`
--
ALTER TABLE `user_perfil`
  ADD CONSTRAINT `fk_users_user_perfil` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

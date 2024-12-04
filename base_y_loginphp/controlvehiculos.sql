-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 16:33:01
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
-- Base de datos: `controlvehiculos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `ID_Area` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`ID_Area`, `Nombre`) VALUES
(1, 'Administración'),
(2, 'Recursos Humanos'),
(3, 'Logística'),
(4, 'Ventas'),
(5, 'Finanzas'),
(6, 'Tecnología'),
(7, 'Atención al Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrouso`
--

CREATE TABLE `registrouso` (
  `ID_Registro` int(11) NOT NULL,
  `ID_Usuario` char(10) NOT NULL,
  `ID_Vehiculo` char(10) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Jornada` enum('Inicio Conducción','Final Conducción','Vehículo Detenido','Otro') NOT NULL,
  `Destino` varchar(255) NOT NULL,
  `Actividad` varchar(255) NOT NULL,
  `ID_Area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registrouso`
--

INSERT INTO `registrouso` (`ID_Registro`, `ID_Usuario`, `ID_Vehiculo`, `Fecha`, `Hora`, `Jornada`, `Destino`, `Actividad`, `ID_Area`) VALUES
(71, '11111111-1', 'ABC-123', '2024-12-01', '08:00:00', 'Inicio Conducción', 'Oficina Central', 'Revisión de documentos', 1),
(72, '22222222-2', 'DEF-456', '2024-12-01', '09:30:00', 'Inicio Conducción', 'Sucursal Sur', 'Reunión con cliente', 2),
(73, '33333333-3', 'GHI-789', '2024-12-02', '14:00:00', 'Final Conducción', 'Planta Logística', 'Entrega de materiales', 3),
(74, '44444444-4', 'JKL-012', '2024-12-02', '10:00:00', 'Vehículo Detenido', 'Sucursal Norte', 'Visita de inspección', 4),
(75, '55555555-5', 'MNO-345', '2024-12-03', '13:00:00', 'Otro', 'Banco Central', 'Depósito bancario', 5),
(76, '66666666-6', 'PQR-678', '2024-12-03', '15:30:00', 'Inicio Conducción', 'Centro Tecnológico', 'Configuración de equipos', 6),
(77, '77777777-7', 'STU-901', '2024-12-04', '07:45:00', 'Final Conducción', 'Oficina Central', 'Capacitación de personal', 7),
(78, '88888888-8', 'ABC-123', '2024-12-04', '10:15:00', 'Vehículo Detenido', 'Sucursal Oeste', 'Entrega de informe', 1),
(79, '99999999-9', 'DEF-456', '2024-12-05', '12:00:00', 'Otro', 'Planta Norte', 'Supervisión de proyecto', 2),
(80, '10101010-0', 'GHI-789', '2024-12-05', '16:00:00', 'Inicio Conducción', 'Sucursal Este', 'Asesoramiento técnico', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisor`
--

CREATE TABLE `supervisor` (
  `ID_Supervisor` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `ID_Area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `supervisor`
--

INSERT INTO `supervisor` (`ID_Supervisor`, `Nombre`, `Apellido`, `ID_Area`) VALUES
(1, 'Carlos', 'González', 1),
(2, 'María', 'López', 2),
(3, 'José', 'Martínez', 3),
(4, 'Ana', 'Hernández', 4),
(5, 'Juan', 'Pérez', 5),
(6, 'Laura', 'Ramírez', 6),
(7, 'Sofía', 'Torres', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Rut` char(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ID_Area` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Rut`, `Nombre`, `Apellido`, `Password`, `ID_Area`, `Username`) VALUES
('10101010-0', 'Sebastián', 'Figueroa', 'pass1234', 3, 'sf'),
('11111111-1', 'Diego', 'Jeldres', 'admin2024', 1, 'dj'),
('22222222-2', 'Viviana', 'Chandia', 'secure9876', 2, 'vc'),
('33333333-3', 'Rita', 'Peters', 'test4567', 3, 'rp'),
('44444444-4', 'Luis', 'Valenzuela', 'password1', 4, 'lv'),
('55555555-5', 'Jair', 'Duarte', 'qwerty123', 5, 'jd'),
('66666666-6', 'Matias', 'Linares', 'flutterdev', 6, 'ml'),
('77777777-7', 'Nicolas', 'Candia', 'recycleit', 7, 'nc'),
('88888888-8', 'Diego', 'Hernandez', 'mypassword', 1, 'dh'),
('99999999-9', 'Carlos', 'Leiva', 'example123', 2, 'cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `Patente` char(10) NOT NULL,
  `Kilometraje` int(11) NOT NULL,
  `Modelo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`Patente`, `Kilometraje`, `Modelo`) VALUES
('ABC-123', 71000, 'Kia rio'),
('DEF-456', 10450, 'hyundai si'),
('GHI-789', 180202, 'Chevrolet si'),
('JKL-012', 75000, 'ford ranger'),
('MNO-345', 4000, 'nissan'),
('PQR-678', 43200, 'si'),
('STU-901', 32762, 'dodge durango');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`ID_Area`);

--
-- Indices de la tabla `registrouso`
--
ALTER TABLE `registrouso`
  ADD PRIMARY KEY (`ID_Registro`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Vehiculo` (`ID_Vehiculo`),
  ADD KEY `ID_Area` (`ID_Area`);

--
-- Indices de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`ID_Supervisor`),
  ADD KEY `ID_Area` (`ID_Area`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Rut`),
  ADD KEY `ID_Area` (`ID_Area`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`Patente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `ID_Area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `registrouso`
--
ALTER TABLE `registrouso`
  MODIFY `ID_Registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `ID_Supervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registrouso`
--
ALTER TABLE `registrouso`
  ADD CONSTRAINT `registrouso_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`Rut`),
  ADD CONSTRAINT `registrouso_ibfk_2` FOREIGN KEY (`ID_Vehiculo`) REFERENCES `vehiculo` (`Patente`),
  ADD CONSTRAINT `registrouso_ibfk_3` FOREIGN KEY (`ID_Area`) REFERENCES `area` (`ID_Area`);

--
-- Filtros para la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`ID_Area`) REFERENCES `area` (`ID_Area`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_Area`) REFERENCES `area` (`ID_Area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

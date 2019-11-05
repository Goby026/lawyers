-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2019 a las 20:35:02
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lawyers`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_abogado`
--

CREATE TABLE `t_abogado` (
  `t_AboCod` int(11) NOT NULL,
  `t_AboNombre` varchar(45) NOT NULL,
  `t_AboApellidos` varchar(45) NOT NULL,
  `t_AboDni` int(11) NOT NULL,
  `t_AboDireccion` varchar(100) NOT NULL,
  `t_AboTelfcel` int(11) NOT NULL,
  `t_AboTelf` int(11) NOT NULL,
  `t_AboCorreo` varchar(100) NOT NULL,
  `t_AboDepartamento` varchar(45) NOT NULL,
  `t_AboProvincia` varchar(45) NOT NULL,
  `t_AboDistrito` varchar(45) NOT NULL,
  `t_AboContrasena` varchar(15) NOT NULL DEFAULT 'min 6' COMMENT 'Minimo 6 caracteres maximo 25',
  `idt_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_abogado`
--

INSERT INTO `t_abogado` (`t_AboCod`, `t_AboNombre`, `t_AboApellidos`, `t_AboDni`, `t_AboDireccion`, `t_AboTelfcel`, `t_AboTelf`, `t_AboCorreo`, `t_AboDepartamento`, `t_AboProvincia`, `t_AboDistrito`, `t_AboContrasena`, `idt_usuario`) VALUES
(2, 'CESAR', 'CORRUPTUS MALICIUS', 98653265, 'AV. LARCO 660', 987653251, 0, 'justo@fuerzapopular.com', 'Junin', 'Lima', 'Cercado', '123456', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_apelacion`
--

CREATE TABLE `t_apelacion` (
  `t_ApeCod` int(11) NOT NULL,
  `t_ApeResolucion` varchar(45) NOT NULL,
  `t_ApeObservacion` varchar(45) NOT NULL,
  `t_CasoCod` int(11) NOT NULL,
  `t_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_audiencia`
--

CREATE TABLE `t_audiencia` (
  `t_AudiCod` int(11) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `t_AudiDireccion` varchar(100) NOT NULL,
  `t_AudiHora` time NOT NULL,
  `t_AudiFecha` date NOT NULL,
  `t_AudiObservaciones` varchar(45) NOT NULL,
  `t_casocod` int(11) NOT NULL,
  `t_estado` int(11) NOT NULL,
  `idt_juzgado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_audiencia`
--

INSERT INTO `t_audiencia` (`t_AudiCod`, `asunto`, `t_AudiDireccion`, `t_AudiHora`, `t_AudiFecha`, `t_AudiObservaciones`, `t_casocod`, `t_estado`, `idt_juzgado`) VALUES
(1, 'CONCILIACION', 'JR. Abancay 556', '09:30:00', '2019-10-29', '', 1, 3, 2),
(2, 'SEPARACION', 'JR. Abancay 556', '11:00:00', '2019-10-30', '', 4, 3, 3),
(3, 'SEPARACION', 'JR. Abancay 556', '10:30:00', '2019-10-31', '', 1, 4, 3),
(4, 'CONCILIACION', 'Av. Centenario 698', '10:30:00', '2019-10-30', '', 2, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_caso`
--

CREATE TABLE `t_caso` (
  `t_CasoCod` int(11) NOT NULL,
  `caso_titulo` varchar(250) NOT NULL,
  `cod_demandante` int(11) DEFAULT NULL,
  `cod_demandado` int(11) DEFAULT NULL,
  `t_CasoFech` date NOT NULL,
  `t_CasoNumExp` varchar(45) NOT NULL,
  `t_AboCod` int(11) DEFAULT NULL,
  `t_CasoJuzgado` varchar(45) NOT NULL,
  `t_CasoObservaciones` varchar(45) NOT NULL,
  `t_pagoTotal` decimal(6,2) DEFAULT NULL,
  `idt_usuario` int(11) NOT NULL,
  `idt_cliente` int(11) NOT NULL,
  `t_MateCod` int(11) NOT NULL,
  `t_InsCod` int(11) NOT NULL,
  `idt_EstadoCaso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_caso`
--

INSERT INTO `t_caso` (`t_CasoCod`, `caso_titulo`, `cod_demandante`, `cod_demandado`, `t_CasoFech`, `t_CasoNumExp`, `t_AboCod`, `t_CasoJuzgado`, `t_CasoObservaciones`, `t_pagoTotal`, `idt_usuario`, `idt_cliente`, `t_MateCod`, `t_InsCod`, `idt_EstadoCaso`) VALUES
(1, 'DIVORSIO', 1, 1, '2019-10-15', 'S/N', 2, 'JUZGADO CHILCA', '', '0.00', 6, 1, 1, 1, 1),
(2, 'AGRESIÓN', 5, 6, '2019-10-15', 'S/N', 2, 'JUZGADO CHILCA', '', '0.00', 6, 3, 4, 3, 1),
(3, 'AGRESIÓN', 1, 1, '2019-10-16', 'S/N', 2, 'JUZGADO CHILCA', '', '0.00', 6, 1, 1, 1, 1),
(4, 'AGRESIÓN', 1, 1, '2019-10-16', 'S/N', 2, 'JUZGADO CHILCA', '', '0.00', 6, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cliente`
--

CREATE TABLE `t_cliente` (
  `idt_cliente` int(11) NOT NULL,
  `idt_tipoCliente` int(11) NOT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `razon_social` varchar(250) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `fec_nac` date DEFAULT NULL,
  `dpto` varchar(45) DEFAULT NULL,
  `prov` varchar(45) DEFAULT NULL,
  `dist` varchar(45) DEFAULT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_cliente`
--

INSERT INTO `t_cliente` (`idt_cliente`, `idt_tipoCliente`, `nombres`, `apellidos`, `dni`, `ruc`, `razon_social`, `direccion`, `telefono`, `telefono2`, `fec_nac`, `dpto`, `prov`, `dist`, `fechaSistema`) VALUES
(1, 1, 'ANDRES', 'GOMES', '12345678', '', '', 'JR. ANGAMOS 110', '9875421', '', '2019-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 16:59:28'),
(2, 1, 'SOFIA', 'HURTADO', '87654321', '', '', 'JR. PROCERES 2210', '999545421', '', '1999-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 17:14:33'),
(3, 1, 'DIEGO', 'TORRES', '66332255', '', '', 'JR. ANGAMOS 110', '9875421', '', '2019-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 17:14:33'),
(4, 1, 'MICHAEL', 'OLIVARES', '99663322', '', '', 'JR. ANGAMOS 110', '9875421', '', '2019-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 17:14:33'),
(5, 1, 'JUANA', 'VELIZ', '87986545', '', '', 'JR. ANGAMOS 110', '9875421', '', '2019-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 17:14:33'),
(6, 1, 'ARTUR', 'BERMUDEZ', '65321451', '', '', 'JR. ANGAMOS 110', '9875421', '', '2019-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 17:14:33'),
(7, 1, 'MARCIAL', 'PARIONA', '45784512', '', '', 'JR. ANGAMOS 110', '9875421', '', '2019-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 17:14:33'),
(8, 1, 'JIMMY', 'ÑAUPARI', '63254125', '', '', 'JR. ANGAMOS 110', '9875421', '', '2019-10-02', 'JUNIN', 'HUANCAYO', 'CHILCA', '2019-10-15 17:14:33'),
(9, 2, '', '', '', '10450689039', 'Dev Soft EIRL', 'Jr. Cusco 584', '987542525', 'sn', '0000-00-00', '1', '1', '1', '2019-10-22 05:38:08'),
(10, 1, 'Angélica Verónica', 'Ramos Ortega', '48955223', '', '', 'Jr. Puno 142', '968542155', '', '1995-10-22', '1', '1', '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_confignotificaciones`
--

CREATE TABLE `t_confignotificaciones` (
  `idt_configNotificaciones` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `estado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_documento`
--

CREATE TABLE `t_documento` (
  `t_DocuCod` int(11) NOT NULL,
  `t_DocuDescripcion` text NOT NULL,
  `t_url` varchar(255) DEFAULT NULL,
  `t_CasoCod` int(11) DEFAULT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_documento`
--

INSERT INTO `t_documento` (`t_DocuCod`, `t_DocuDescripcion`, `t_url`, `t_CasoCod`, `fechaSistema`) VALUES
(1, 'Informe psicológico', './assets/documentos/5db7c08bd8eea1.41072691.pdf', 1, '2019-10-29 04:38:11'),
(2, 'Reporte médico', './assets/documentos/5db7c2f001db43.02837980.docx', 1, '2019-10-29 04:41:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_estado`
--

CREATE TABLE `t_estado` (
  `t_estado` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `t_observacion` text NOT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_estado`
--

INSERT INTO `t_estado` (`t_estado`, `title`, `color`, `t_observacion`, `fechaSistema`) VALUES
(1, 'ACUERDO', 'bg-success', 'sn', '0000-00-00 00:00:00'),
(2, 'POSPUESTO', 'bg-warning', 'sn', '0000-00-00 00:00:00'),
(3, 'NUEVA AUDIENCIA', 'bg-info', 'sn', '0000-00-00 00:00:00'),
(4, 'DESACUERDO', 'bg-danger', 'sn', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_estadocaso`
--

CREATE TABLE `t_estadocaso` (
  `idt_EstadoCaso` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_estadocaso`
--

INSERT INTO `t_estadocaso` (`idt_EstadoCaso`, `title`, `description`, `fechaSistema`) VALUES
(1, 'EN PROCESO', 'EN PROCESO', '2019-10-15 19:59:28'),
(2, 'CULMINADO', 'CULMINADO', '2019-10-15 19:59:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_instancia`
--

CREATE TABLE `t_instancia` (
  `t_InsCod` int(11) NOT NULL,
  `t_InsNombre` varchar(45) NOT NULL,
  `t_InsDescripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_instancia`
--

INSERT INTO `t_instancia` (`t_InsCod`, `t_InsNombre`, `t_InsDescripcion`) VALUES
(1, 'JUZGADO I', 'DESCRIPCION'),
(3, 'JUZGADO II', 'DESCRIPCION-instancia'),
(4, 'JUZGADO III', 'JUZGADO III');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_juzgado`
--

CREATE TABLE `t_juzgado` (
  `idt_juzgado` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `horariom` varchar(100) DEFAULT NULL,
  `horariot` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_juzgado`
--

INSERT INTO `t_juzgado` (`idt_juzgado`, `nombre`, `direccion`, `telefono`, `horariom`, `horariot`) VALUES
(1, 'SALA PENAL DE APELACIONES', 'JR. PARRA DEL RIEGO Nº 400', 'sn', '08:00 hrs - 13:15 hrs', '14:30 hrs - 17:45 hrs'),
(2, 'SALA MIXTA', 'JR. LIMA Nº 501 - TARMA', 'sn', '08:00 hrs - 13:15 hrs', '14:30 hrs - 17:45 hrs'),
(3, '01º JUZGADO DE FAMILIA', 'JR. JULIO C. TELLO N° 624', 'sn', '08:00 hrs - 13:15 hrs', '14:30 hrs - 17:45 hrs'),
(4, '03° JUZGADO DE TRABAJO', 'JR. NEMESIO RAEZ N° 510', 'sn', '08:00 hrs - 13:15 hrs', '14:30 hrs - 17:45 hrs'),
(5, ' 03° JUZGADO CIVIL', 'JR. MANUEL ALONSO Nº 499', 'sn', '08:00 hrs - 13:15 hrs', '14:30 hrs - 17:45 hrs'),
(6, '01° JUZGADO PENAL UNIPERSONAL', 'JR. CUZCO Nº 262 - CENTRO CIVICO FORTUNATO CARDENAS PISO 3 -TARMA', 'sn', '08:00 hrs - 13:15 hrs', '14:30 hrs - 17:45 hrs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_materia`
--

CREATE TABLE `t_materia` (
  `t_MateCod` int(11) NOT NULL,
  `t_MateDescripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_materia`
--

INSERT INTO `t_materia` (`t_MateCod`, `t_MateDescripcion`) VALUES
(1, 'Civil'),
(4, 'PENAL'),
(6, 'CONSTITUCIONAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_modelo`
--

CREATE TABLE `t_modelo` (
  `idmodelo` int(11) NOT NULL,
  `t_url` varchar(255) NOT NULL,
  `t_title` varchar(100) DEFAULT NULL,
  `body` text,
  `idt_usuario` int(11) NOT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_modelo`
--

INSERT INTO `t_modelo` (`idmodelo`, `t_url`, `t_title`, `body`, `idt_usuario`, `fechaSistema`) VALUES
(1, '', 'Carta Poder Simple', '<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><strong><span lang=\"ES\" style=\"font-size: 14.0pt; font-family: \'Arial\',sans-serif;\">CARTA PODER SIMPLE</span></strong><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-indent: 35.4pt; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">El (la) suscrito/(a</span><span lang=\"ES\" style=\"font-size: 9.0pt; line-height: 150%; font-family: \'Arial\',sans-serif;\">)_________(anotar nombre y apellidos tal como aparecen en su identificaci&oacute;n</span><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">), de nacionalidad mexicana, &nbsp;otorga&nbsp; a: ________________ poder simple para que en mi nombre y representaci&oacute;n tramite&nbsp; la Constancia de Datos&nbsp; Registrales ante la Direcci&oacute;n General de Control de Procesos Penales Federales, &nbsp;Procuradur&iacute;a General de la Rep&uacute;blica, sita en&nbsp; Av. Insurgentes Sur N&ordm; 235, piso 4&ordm;, Colonia Roma Norte, Delegaci&oacute;n Cuauht&eacute;moc, CP(06700), M&eacute;xico, Distrito Federal. - - - - - - - - - - - - - - - - - - - - - - -- - - - - - - - - - - - - - - --&nbsp; </span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-indent: 35.4pt; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">Ciudad de Buenos Aires, Argentina, a los ____ d&iacute;as del mes de____&shy;&shy;&shy;&shy;&shy;_________ de 20___. </span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-indent: 35.4pt; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-indent: 35.4pt; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-indent: 35.4pt; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________________________</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-indent: 35.4pt; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre y&nbsp; Firma del otorgante</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span lang=\"ES\">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tipo y N&ordm; de identificaci&oacute;n oficial</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><span lang=\"ES\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES\">___________________________________</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">Nombre y firma del(a)&nbsp; apoderado (a)</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">Tipo y N&ordm; de identificaci&oacute;n oficial</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">TESTIGOS</span><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">___________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;___________________________</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify; text-indent: 35.4pt; line-height: 150%;\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;&nbsp;&nbsp; Nombre y firma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Nombre y firma</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES\" style=\"font-family: \'Arial\',sans-serif;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tipo y N&ordm; de identificaci&oacute;n oficial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Tipo y N&ordm; de identificaci&oacute;n oficial</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><strong><span lang=\"ES\" style=\"font-size: 9.0pt;\">&nbsp;</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><strong><span lang=\"ES\" style=\"font-size: 9.0pt;\">&nbsp;</span></strong></p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\"><strong><span lang=\"ES\" style=\"font-size: 9.0pt;\">&nbsp;</span></strong></p>\r\n<p><strong><span lang=\"ES\" style=\"font-size: 10.0pt; font-family: \'Arial\',sans-serif; mso-fareast-font-family: \'Times New Roman\'; mso-ansi-language: ES; mso-fareast-language: ES; mso-bidi-language: AR-SA;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Anexar copias legibles de todas las identificaciones vigentes con firma de su titular</span></strong><span lang=\"ES\" style=\"font-size: 10.0pt; font-family: \'Arial\',sans-serif; mso-fareast-font-family: \'Times New Roman\'; mso-ansi-language: ES; mso-fareast-language: ES; mso-bidi-language: AR-SA;\">)</span></p>', 11, '2019-11-05 19:24:58'),
(2, '', 'Curriculum vitae', '<p>&nbsp;</p>\r\n<p class=\"MsoTitle\" style=\"text-align: center;\"><span lang=\"ES-PE\" style=\"font-size: 14.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: ES-PE;\"><strong>SILVIA DEL ROSARIO GARCIA CARO</strong></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"PT-BR\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: PT-BR; mso-bidi-font-weight: bold;\">Jr. Sechura N&deg; 151 - Urb. Santa Ana - Callao</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"PT-BR\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: PT-BR; mso-bidi-font-weight: bold;\">2308328 - 969124584 - RPC 989266989</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-bidi-font-weight: bold;\">silviadelrosario@gmail.com</span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: EN-US; mso-bidi-font-weight: bold;\"><a href=\"mailto:sgarciac2004@hotmail.com\"><span lang=\"ES-PE\" style=\"mso-ansi-language: ES-PE;\">sgarciac2004@hotmail.com</span></a></span></p>\r\n<p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-bidi-font-weight: bold;\">&nbsp;</span></p>\r\n<h1><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: ES-PE; mso-bidi-font-style: italic;\">PERFIL PROFESIONAL</span></u></h1>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Asistente de Gerencia con experiencia en atenci&oacute;n al cliente, recepci&oacute;n, ventas, comercio<span style=\"mso-spacerun: yes;\">&nbsp; </span>y contabilidad. Con habilidades y competencias, capaz de entablar relaci&oacute;n en todo nivel y trabajar bajo resultados.</span></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"ES-PE\" style=\"font-size: 12.0pt; font-family: \'Arial\',sans-serif;\">&nbsp;</span></strong></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">CAPACIDADES DEMOSTRADAS</span></u></strong></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Control y seguimiento de los presupuestos</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Evaluaci&oacute;n de los resultados del equipo y asignaci&oacute;n de comisiones</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Captaci&oacute;n de nuevos clientes</span></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"ES-PE\" style=\"font-size: 12.0pt; font-family: \'Arial\',sans-serif;\">&nbsp;</span></strong></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">OBJETIVOS CONSEGUIDOS</span></u></strong></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Desarrollo de nuevas estrategias que apoyaban al planeamiento gerencial</span></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"ES-PE\" style=\"font-size: 12.0pt; font-family: \'Arial\',sans-serif;\">&nbsp;</span></strong></p>\r\n<h3><strong><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; font-style: normal; mso-bidi-font-style: italic;\">EXPERIENCIA<span style=\"mso-spacerun: yes;\">&nbsp; </span>LABORAL</span></u></strong></h3>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">Asistencia de Gerencia</span></strong></p>\r\n<p class=\"MsoNormal\"><strong><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">&ldquo;DCM&rdquo; <span style=\"mso-tab-count: 8;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style=\"mso-spacerun: yes;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Enero<span style=\"mso-spacerun: yes;\">&nbsp; </span>2011</span></strong></p>\r\n<p class=\"MsoNormal\"><strong><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">INGENIEROS &amp; CONSTRUCTORES S.R.L<span style=\"mso-tab-count: 2;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">Redacci&oacute;n y elaboraci&oacute;n de documentos</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">Recepci&oacute;n y env&iacute;o de fax</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">Elaboraci&oacute;n de cotizaciones, facturas y gu&iacute;as de remisi&oacute;n</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">Importaci&oacute;n de productos</span></p>\r\n<p class=\"MsoNormal\"><strong><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\"><span style=\"mso-spacerun: yes;\">&nbsp;</span></span></strong></p>\r\n<p class=\"MsoNormal\"><strong><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">&ldquo;WALTER NECIOSUP PUICAN&rdquo;<span style=\"mso-spacerun: yes;\">&nbsp; </span><span style=\"mso-tab-count: 5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Junio 2008 -<span style=\"mso-spacerun: yes;\">&nbsp; </span>Enero 2010</span></strong></p>\r\n<p class=\"MsoNormal\"><strong><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">ESTUDIO JURIDICO</span></strong></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Recepci&oacute;n de llamadas</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Manejo de Agenda</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Elaboraci&oacute;n y actualizaci&oacute;n de base de datos</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Manejo de caja chica</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">&nbsp;<strong style=\"mso-bidi-font-weight: normal;\">LABORATORIOS STIEFEGEL<span style=\"mso-tab-count: 5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Marzo 2008 &ndash; Mayo 2008</strong></span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: \'Times New Roman\';\">Practicas en el dpto. Comercial<span style=\"mso-tab-count: 5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\r\n<h1><span lang=\"ES\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: ES; font-weight: normal;\">&nbsp;</span></h1>\r\n<p class=\"MsoNormal\"><span lang=\"ES\" style=\"mso-ansi-language: ES;\">&nbsp;</span></p>\r\n<h1><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: ES-PE; mso-bidi-font-style: italic;\">FORMACI&Oacute;N PROFESIONAL</span></u></h1>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-bidi-font-weight: bold;\">Grado Acad&eacute;mico: T&eacute;cnico</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-bidi-font-weight: bold;\">Abril 2005 - Mayo 2008<span style=\"mso-tab-count: 1;\">&nbsp; </span></span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-bidi-font-weight: bold;\">Instituto Superior Tecnol&oacute;gico<span style=\"mso-spacerun: yes;\">&nbsp; </span>&ldquo;Ejecutivas&rdquo;</span></p>\r\n<p class=\"MsoNormal\"><em><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-bidi-font-weight: bold; font-style: normal;\">Especializaci&oacute;n en marketing comercia</span></em></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\">&nbsp;</span></p>\r\n<h1><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; mso-ansi-language: ES-PE; mso-bidi-font-style: italic;\"><span style=\"text-decoration: none;\">&nbsp;</span></span></u></h1>\r\n<h3><strong><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial; font-style: normal; mso-bidi-font-style: italic;\">IDIOMAS</span></u></strong></h3>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\"><span class=\"apple-style-span\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Ingles, escritura y lenguaje fluido</span></span></p>\r\n<p class=\"MsoNormal\"><span class=\"apple-style-span\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Franc&eacute;s, escritura y lenguaje intermedio</span></span></p>\r\n<p class=\"MsoNormal\"><span class=\"apple-style-span\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">&nbsp;</span></span></p>\r\n<p class=\"MsoNormal\"><strong style=\"mso-bidi-font-weight: normal;\"><u><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">CONOCIMIENTOS INFORM&Aacute;TICOS</span></u></strong></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">&nbsp;</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Microsoft Office 2007</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Word</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Excel</span></p>\r\n<p class=\"MsoNormal\"><span lang=\"ES-PE\" style=\"font-size: 11.0pt; font-family: \'Calibri\',sans-serif; mso-bidi-font-family: Arial;\">Internet</span></p>\r\n<p>&nbsp;</p>', 11, '2019-11-05 19:23:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_observacion`
--

CREATE TABLE `t_observacion` (
  `idt_observacion` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `t_CasoCod` int(11) NOT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_observacion`
--

INSERT INTO `t_observacion` (`idt_observacion`, `title`, `description`, `t_CasoCod`, `fechaSistema`) VALUES
(1, 'No llego a reunión', 'Se programó una reunión con la parte demandada, pero no se presentó a dicha cita.', 4, '2019-10-29 05:25:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_pagos`
--

CREATE TABLE `t_pagos` (
  `idPagoCod` int(11) NOT NULL,
  `t_PagoMonto` varchar(45) NOT NULL,
  `t_PagoMontoInicial` int(11) NOT NULL,
  `t_PagoDescrip` varchar(45) NOT NULL,
  `t_CasoCod` int(11) NOT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_pagos`
--

INSERT INTO `t_pagos` (`idPagoCod`, `t_PagoMonto`, `t_PagoMontoInicial`, `t_PagoDescrip`, `t_CasoCod`, `fechaSistema`) VALUES
(1, '200', 0, 'Pago para constitución de empresa SUNARP', 4, '2019-10-29 15:21:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_perfil`
--

CREATE TABLE `t_perfil` (
  `idt_perfil` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_perfil`
--

INSERT INTO `t_perfil` (`idt_perfil`, `titulo`, `descripcion`) VALUES
(1, 'ADMINISTRADOR', 'ADMIN-USER'),
(2, 'USER', 'USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_resolucion`
--

CREATE TABLE `t_resolucion` (
  `idResoCod` int(11) NOT NULL,
  `t_ResoDescripcion` varchar(45) NOT NULL,
  `t_CasoCod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_tipocliente`
--

CREATE TABLE `t_tipocliente` (
  `idt_tipoCliente` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_tipocliente`
--

INSERT INTO `t_tipocliente` (`idt_tipoCliente`, `title`, `description`) VALUES
(1, 'NATURAL', 'CLIENTE NATURAL'),
(2, 'JURIDICO', 'CLIENTE JURIDICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuario`
--

CREATE TABLE `t_usuario` (
  `idt_usuario` int(11) NOT NULL,
  `idt_perfil` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token_password` text,
  `password_request` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `t_usuario`
--

INSERT INTO `t_usuario` (`idt_usuario`, `idt_perfil`, `username`, `password`, `token_password`, `password_request`) VALUES
(4, 1, 'CORRUPTUS', '123456', NULL, NULL),
(5, 2, 'raul@mail.com', '123456', NULL, NULL),
(6, 2, 'frank@email.com', '123456', NULL, NULL),
(7, 2, 'gac184@hotmail.com', '654321', NULL, NULL),
(8, 2, 'grover@mail.com', '1234', NULL, NULL),
(9, 2, 'stripe_dev@protonmail.com', '$2y$10$TgOzcg1P0SFxGAoO.4GoQu/a13LxVG.Kn8Pmq6biu3Ur2qDdaVJ1O', '', 0),
(11, 2, 'george.rendich@gmail.com', '$2y$10$V3HFLuA4xUQuSjvNbrwPueySOB0LIUqOk2Agtmfbz.4qSdyQcHE/u', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarionoti`
--

CREATE TABLE `t_usuarionoti` (
  `idusuarioNoti` int(11) NOT NULL,
  `idt_usuario` int(11) NOT NULL,
  `idt_configNotificaciones` int(11) NOT NULL,
  `fechaSistema` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_verificacion`
--

CREATE TABLE `t_verificacion` (
  `t_VeriCod` int(11) NOT NULL,
  `t_VeriObservaiones` varchar(45) NOT NULL,
  `t_caso_t_CasoCod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_abogado`
--
ALTER TABLE `t_abogado`
  ADD PRIMARY KEY (`t_AboCod`),
  ADD KEY `abogado_idx` (`idt_usuario`);

--
-- Indices de la tabla `t_apelacion`
--
ALTER TABLE `t_apelacion`
  ADD PRIMARY KEY (`t_ApeCod`),
  ADD KEY `apelacion.caso_idx` (`t_CasoCod`),
  ADD KEY `apelacion.estado_idx` (`t_estado`);

--
-- Indices de la tabla `t_audiencia`
--
ALTER TABLE `t_audiencia`
  ADD PRIMARY KEY (`t_AudiCod`),
  ADD KEY `fk_t_audiencia_t_caso1_idx` (`t_casocod`),
  ADD KEY `audiencia.estado_idx` (`t_estado`),
  ADD KEY `audiencia.juzgado_idx` (`idt_juzgado`);

--
-- Indices de la tabla `t_caso`
--
ALTER TABLE `t_caso`
  ADD PRIMARY KEY (`t_CasoCod`),
  ADD KEY `caso.usuario_idx` (`idt_usuario`),
  ADD KEY `caso.cliente_idx` (`idt_cliente`),
  ADD KEY `caso.materia_idx` (`t_MateCod`),
  ADD KEY `caso.instancia_idx` (`t_InsCod`),
  ADD KEY `caso.estado_idx` (`idt_EstadoCaso`);

--
-- Indices de la tabla `t_cliente`
--
ALTER TABLE `t_cliente`
  ADD PRIMARY KEY (`idt_cliente`),
  ADD KEY `cliente.tipocliente_idx` (`idt_tipoCliente`);

--
-- Indices de la tabla `t_confignotificaciones`
--
ALTER TABLE `t_confignotificaciones`
  ADD PRIMARY KEY (`idt_configNotificaciones`);

--
-- Indices de la tabla `t_documento`
--
ALTER TABLE `t_documento`
  ADD PRIMARY KEY (`t_DocuCod`),
  ADD KEY `documento.caso_idx` (`t_CasoCod`);

--
-- Indices de la tabla `t_estado`
--
ALTER TABLE `t_estado`
  ADD PRIMARY KEY (`t_estado`);

--
-- Indices de la tabla `t_estadocaso`
--
ALTER TABLE `t_estadocaso`
  ADD PRIMARY KEY (`idt_EstadoCaso`);

--
-- Indices de la tabla `t_instancia`
--
ALTER TABLE `t_instancia`
  ADD PRIMARY KEY (`t_InsCod`);

--
-- Indices de la tabla `t_juzgado`
--
ALTER TABLE `t_juzgado`
  ADD PRIMARY KEY (`idt_juzgado`);

--
-- Indices de la tabla `t_materia`
--
ALTER TABLE `t_materia`
  ADD PRIMARY KEY (`t_MateCod`);

--
-- Indices de la tabla `t_modelo`
--
ALTER TABLE `t_modelo`
  ADD PRIMARY KEY (`idmodelo`),
  ADD KEY `modelo.usuario_idx` (`idt_usuario`);

--
-- Indices de la tabla `t_observacion`
--
ALTER TABLE `t_observacion`
  ADD PRIMARY KEY (`idt_observacion`),
  ADD KEY `observacion.caso_idx` (`t_CasoCod`);

--
-- Indices de la tabla `t_pagos`
--
ALTER TABLE `t_pagos`
  ADD PRIMARY KEY (`idPagoCod`),
  ADD KEY `fk_t_pagos_t_caso1_idx` (`t_CasoCod`);

--
-- Indices de la tabla `t_perfil`
--
ALTER TABLE `t_perfil`
  ADD PRIMARY KEY (`idt_perfil`);

--
-- Indices de la tabla `t_resolucion`
--
ALTER TABLE `t_resolucion`
  ADD PRIMARY KEY (`idResoCod`),
  ADD KEY `resolucion.caso_idx` (`t_CasoCod`);

--
-- Indices de la tabla `t_tipocliente`
--
ALTER TABLE `t_tipocliente`
  ADD PRIMARY KEY (`idt_tipoCliente`);

--
-- Indices de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`idt_usuario`),
  ADD KEY `usuario.perfil_idx` (`idt_perfil`);

--
-- Indices de la tabla `t_usuarionoti`
--
ALTER TABLE `t_usuarionoti`
  ADD PRIMARY KEY (`idusuarioNoti`),
  ADD KEY `usuario.config_idx` (`idt_usuario`),
  ADD KEY `config.usuario_idx` (`idt_configNotificaciones`);

--
-- Indices de la tabla `t_verificacion`
--
ALTER TABLE `t_verificacion`
  ADD PRIMARY KEY (`t_VeriCod`),
  ADD KEY `fk_t_verificacion_t_caso1_idx` (`t_caso_t_CasoCod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_abogado`
--
ALTER TABLE `t_abogado`
  MODIFY `t_AboCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_apelacion`
--
ALTER TABLE `t_apelacion`
  MODIFY `t_ApeCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_audiencia`
--
ALTER TABLE `t_audiencia`
  MODIFY `t_AudiCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_caso`
--
ALTER TABLE `t_caso`
  MODIFY `t_CasoCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_cliente`
--
ALTER TABLE `t_cliente`
  MODIFY `idt_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `t_confignotificaciones`
--
ALTER TABLE `t_confignotificaciones`
  MODIFY `idt_configNotificaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_documento`
--
ALTER TABLE `t_documento`
  MODIFY `t_DocuCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_estado`
--
ALTER TABLE `t_estado`
  MODIFY `t_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_estadocaso`
--
ALTER TABLE `t_estadocaso`
  MODIFY `idt_EstadoCaso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_instancia`
--
ALTER TABLE `t_instancia`
  MODIFY `t_InsCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_juzgado`
--
ALTER TABLE `t_juzgado`
  MODIFY `idt_juzgado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `t_materia`
--
ALTER TABLE `t_materia`
  MODIFY `t_MateCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `t_modelo`
--
ALTER TABLE `t_modelo`
  MODIFY `idmodelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_observacion`
--
ALTER TABLE `t_observacion`
  MODIFY `idt_observacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `t_pagos`
--
ALTER TABLE `t_pagos`
  MODIFY `idPagoCod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `t_perfil`
--
ALTER TABLE `t_perfil`
  MODIFY `idt_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_resolucion`
--
ALTER TABLE `t_resolucion`
  MODIFY `idResoCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_tipocliente`
--
ALTER TABLE `t_tipocliente`
  MODIFY `idt_tipoCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  MODIFY `idt_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `t_usuarionoti`
--
ALTER TABLE `t_usuarionoti`
  MODIFY `idusuarioNoti` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_verificacion`
--
ALTER TABLE `t_verificacion`
  MODIFY `t_VeriCod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_abogado`
--
ALTER TABLE `t_abogado`
  ADD CONSTRAINT `abogado` FOREIGN KEY (`idt_usuario`) REFERENCES `t_usuario` (`idt_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_apelacion`
--
ALTER TABLE `t_apelacion`
  ADD CONSTRAINT `apelacion.caso` FOREIGN KEY (`t_CasoCod`) REFERENCES `t_caso` (`t_CasoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `apelacion.estado` FOREIGN KEY (`t_estado`) REFERENCES `t_estado` (`t_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_audiencia`
--
ALTER TABLE `t_audiencia`
  ADD CONSTRAINT `audiencia.estado` FOREIGN KEY (`t_estado`) REFERENCES `t_estado` (`t_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `audiencia.juzgado` FOREIGN KEY (`idt_juzgado`) REFERENCES `t_juzgado` (`idt_juzgado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_audiencia_t_caso1` FOREIGN KEY (`t_casocod`) REFERENCES `t_caso` (`t_CasoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_caso`
--
ALTER TABLE `t_caso`
  ADD CONSTRAINT `caso.cliente` FOREIGN KEY (`idt_cliente`) REFERENCES `t_cliente` (`idt_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `caso.estado` FOREIGN KEY (`idt_EstadoCaso`) REFERENCES `t_estadocaso` (`idt_EstadoCaso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `caso.instancia` FOREIGN KEY (`t_InsCod`) REFERENCES `t_instancia` (`t_InsCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `caso.materia` FOREIGN KEY (`t_MateCod`) REFERENCES `t_materia` (`t_MateCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `caso.usuario` FOREIGN KEY (`idt_usuario`) REFERENCES `t_usuario` (`idt_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_cliente`
--
ALTER TABLE `t_cliente`
  ADD CONSTRAINT `cliente.tipocliente` FOREIGN KEY (`idt_tipoCliente`) REFERENCES `t_tipocliente` (`idt_tipoCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_documento`
--
ALTER TABLE `t_documento`
  ADD CONSTRAINT `documento.caso` FOREIGN KEY (`t_CasoCod`) REFERENCES `t_caso` (`t_CasoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_modelo`
--
ALTER TABLE `t_modelo`
  ADD CONSTRAINT `modelo.usuario` FOREIGN KEY (`idt_usuario`) REFERENCES `t_usuario` (`idt_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_observacion`
--
ALTER TABLE `t_observacion`
  ADD CONSTRAINT `observacion.caso` FOREIGN KEY (`t_CasoCod`) REFERENCES `t_caso` (`t_CasoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_pagos`
--
ALTER TABLE `t_pagos`
  ADD CONSTRAINT `fk_t_pagos_t_caso1` FOREIGN KEY (`t_CasoCod`) REFERENCES `t_caso` (`t_CasoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_resolucion`
--
ALTER TABLE `t_resolucion`
  ADD CONSTRAINT `resolucion.caso` FOREIGN KEY (`t_CasoCod`) REFERENCES `t_caso` (`t_CasoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD CONSTRAINT `usuario.perfil` FOREIGN KEY (`idt_perfil`) REFERENCES `t_perfil` (`idt_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_usuarionoti`
--
ALTER TABLE `t_usuarionoti`
  ADD CONSTRAINT `config.usuario` FOREIGN KEY (`idt_configNotificaciones`) REFERENCES `t_confignotificaciones` (`idt_configNotificaciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario.config` FOREIGN KEY (`idt_usuario`) REFERENCES `t_usuario` (`idt_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_verificacion`
--
ALTER TABLE `t_verificacion`
  ADD CONSTRAINT `fk_t_verificacion_t_caso1` FOREIGN KEY (`t_caso_t_CasoCod`) REFERENCES `t_caso` (`t_CasoCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

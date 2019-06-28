-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2019 a las 04:38:57
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
-- Base de datos: `bdtecnoserv`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_AsientosxIdCategoria` (`_idCategAsiento` INT(11))  BEGIN
	SELECT `idAsiento`, `numero`, `IdEstado` FROM `asientos` WHERE idCategAsiento = _idCategAsiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_AsientosxIdCategoriaXIdSede` (`_idCategAsiento` INT(11), `_IdSede` INT(11))  BEGIN
	SELECT `idAsiento`, `numero`, `IdEstado`, `precio` FROM `asientos` WHERE idCategAsiento = _idCategAsiento AND IdSede = _IdSede;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_CategoriaAsiento` ()  BEGIN
	SELECT idCategoriaAsiento, NombreCategoriaA FROM categoriaasiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_CategoriaAsientoxidCategoriaAsiento` (`_idCategoriaAsiento` INT(11))  BEGIN
	SELECT NombreCategoriaA FROM categoriaasiento WHERE idCategoriaAsiento = _idCategoriaAsiento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_Sedes` ()  BEGIN
	SELECT `idSede`, `imgSede`, `DireccionSede` FROM `sedes`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_SedexIdSede` (`_idSede` INT(11))  BEGIN
	SELECT `DireccionSede` FROM `sedes` WHERE idSede = _idSede;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_foto` ()  NO SQL
select * from foto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_video` ()  NO SQL
select* From video$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_conocenos_sp` ()  BEGIN
SELECT co_desc AS descripcion, co_imagen AS rutaImagen FROM vision WHERE co_fecha = fechaActual;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_delete_medalleroHistorico_SP` (`idmed` INT)  BEGIN
DELETE FROM medallerohistorico
WHERE idmedHis_PK = idmed;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_confSedeDeporte_SP` (`sede` INT, `deporte` INT)  BEGIN
INSERT INTO config_sede_deporte(idSedeFK, idDeporteFK)
VALUES(sede, deporte);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_Equipo_SP` (`codigoPais` INT, `numeroIntegrantes` INT)  BEGIN
INSERT INTO equipo(idPaisFK,totalIntegrantes)
VALUES(codigoPais, numeroIntegrantes);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_eventos_SP` (`sede` INT, `horario` INT, `dir` VARCHAR(100), `depFK` INT, `confSedeDeporte` INT)  BEGIN
INSERT INTO eventos(idSede, idHorarioEventos, direccion, idDeportesFK, idConfig_Sede_DeporteFK)
VALUES(sede, horario, dir, depFK, confSedeDeporte);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_integrantes_SP` (`equifk` INT, `depFK` INT)  BEGIN
INSERT INTO eventos(idEquipoFK, idDeportistasFK)
VALUES(equifk, depFK);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_medalleroHistorico_SP` (`puesto` INT, `pais` INT, `oro` INT, `plata` INT, `bronce` INT, `total` INT)  BEGIN
INSERT INTO medallerohistorico(medHisPue, pai_FK, medHisOro, medHisPla, medHisBro, medHisTot)
VALUES(puesto, pais, oro, plata, bronce, total);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_participanteGrupal_SP` (`idEve` INT, `idEq1` INT, `idEq2` INT)  BEGIN
INSERT INTO participantegrupal(idEventoFK, idEquipo1FK, idEquipo2FK)
VALUES(idEve, idEq1, idEq2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_participanteIndividual_SP` (`idDepIndividual` INT, `idPaFK` INT, `idEvFK` INT)  BEGIN
INSERT INTO participanteindividual(idDeportistasFK, idPaisFk, idEventoFK)
VALUES(idDepIndividual, idPaFK, idEvFK);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_reglamento_SP` (`numSeccion` INT, `tituloSecc` VARCHAR(255), `norma` INT, `subnorma` INT)  BEGIN
INSERT INTO seccionreglamento(numSec, titsec, normaFK, subNorFK)
VALUES(numSeccion, tituloSecc, norma, subnorma);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_resultadoGrupal_SP` (`idParticipanteGrupal` INT, `resultadoPuesto` VARCHAR(25))  BEGIN
INSERT INTO resultadogrupal(idPartGrupalFK, res_gr_puesto)
VALUES (idParticipanteGrupal, resultadoPuesto);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_insertar_resultadoIndividual_SP` (`idparticipanteIndividual` INT, `resultadoPuesto` VARCHAR(25))  BEGIN
INSERT INTO resultadoindividual(idPartIndividualFK,fechaResultado,res_in_puesto)
VALUES (idparticipanteIndividual,NOW(),resultadoPuesto);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarNorma_SP` (`id` INT)  SELECT
N.idNormaPK AS codigo,
N.numNor AS numeroNorma,
N.contNor AS contenido
FROM
norma AS N
WHERE
N.SecRegFK = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarPais_SP` ()  BEGIN
SELECT
P.idPais AS codigo,
P.NombrePais AS pais
FROM
pais AS P;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarPregFrecAreas_SP` ()  BEGIN
SELECT
PFA.idareaPreFrePK AS codigo,
PFA.nomAre AS area
FROM
pregfrecareas AS PFA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarpregunta_SP` (`id` INT)  BEGIN
SELECT
PF.idPreguntasFrecuentes AS codigo,
PF.pregunta AS pregunta
FROM
preguntasfrecuentes AS PF
WHERE
PF.idPregFrecAreaFK = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarRespuesta_SP` (`id` INT)  BEGIN
SELECT
RPF.idrespPregFrec AS codigo,
RPF.respuesta AS respuesta
FROM
respuestapreguntafrec AS RPF
WHERE
RPF.idPregFrecuentes = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarSeccion_SP` ()  BEGIN
SELECT
SR.TitSec AS seccion,
SR.idSecRegPK codigo
FROM
seccionreglamento AS SR;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_listarSubnorma_SP` (`id` INT)  SELECT
SN.idSubNor AS codigo,
SN.numSubNor AS numeroSubnorma,
SN.contSubNor AS contenido
FROM
subnorma AS SN
WHERE
SN.normaFK = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarConocenos_sp` ()  BEGIN
SELECT
C.co_desc AS descripcion,
C.co_imagen AS rutaImagen
FROM
conocenos AS C
WHERE
C.bEstPri = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarMedalleroPorId_SP` (`id` INT)  BEGIN
SELECT
MH.idmedHis_PK AS codigo,
MH.medHisPue AS puesto,
MH.pai_FK AS pais,
MH.medHisOro AS oro,
MH.medHisPla AS plata,
MH.medHisBro AS bronce,
MH.medHisTot AS total
FROM
medallerohistorico AS MH
WHERE MH.idmedHis_PK = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarMision_sp` ()  BEGIN
SELECT
M.mi_desc AS descripcion,
M.mi_imagen AS rutaImagen
FROM
mision AS M
WHERE
M.bEstPri = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarOficinasOrganigrama_sp` ()  BEGIN
	SELECT
		OO.idSecretaria AS codigo,
		OO.se_nombre AS oficina,
		OO.se_tipo AS tipo
	FROM
		oficinasorganigrama AS OO;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarParticipantesEvento_SP` (`idEvento` INT)  SELECT
PI.idPartIndividual AS codigo,
D.Nombre_Deportista AS nombreDeportista,
DE.NombDeporte AS deporte
FROM
participanteindividual AS PI
INNER JOIN deportistas AS D ON PI.idDeportistasFK = D.idDeportistas
INNER JOIN deportes AS DE ON D.idDeporte = DE.idDeporte
WHERE
PI.idEventoFK = idEvento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarSedeEvento_SP` ()  SELECT
E.idEvento AS codigo,
CONCAT(DE.NombDeporte , '-' , S.NombreSede) AS evento
FROM
eventos AS E
INNER JOIN deportes AS DE ON E.idDeportesFK = DE.idDeporte
INNER JOIN sedes AS S ON E.idSede = S.idSede$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarTrabajaConNosotros_sp` ()  BEGIN
SELECT
T.tra_desc AS descripcion,
T.tra_imagen AS rutaImagen
FROM
trabajaconnosotros AS T
WHERE
T.bEstPri = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarUnidadesOrganigrama_sp` (IN `CODIGOOFICINA` INT)  BEGIN
	SELECT
		OO.se_tipo AS tipo,
		UO.U_nombre AS unidad
	FROM
		oficinasorganigrama AS OO
	INNER JOIN unidadorganizacional AS UO ON UO.idSecUniOrgFK = OO.idSecretaria
	WHERE
		OO.idSecretaria = CODIGOOFICINA;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrarVision_sp` ()  BEGIN
SELECT
V.vi_desc AS descripcion,
V.vi_imagen AS rutaImagen
FROM
vision AS V
WHERE
V.bEstPri = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrar_medalleroHistorico_SP` ()  SELECT
MH.medHisPue AS puesto,
MH.medHisOro AS medallaOro,
MH.medHisPla AS medallaPlata,
MH.medHisBro AS medallaBronce,
MH.medHisTot AS medallaTotal,
P.bandera AS bandera,
P.NombrePais AS pais,
MH.idmedHis_PK AS codigo
FROM
medallerohistorico AS MH
INNER JOIN pais AS P ON MH.pai_FK = P.idPais$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_mostrar_Reglamento_SP` ()  BEGIN
SELECT
SR.TitSec AS tituloSeccion,
N.contNor AS contenidoNorma,
SN.contSubNor AS subContenidoNorma
FROM
seccionreglamento AS SR
INNER JOIN norma AS N ON N.SecRegFK = SR.idSecRegPK
INNER JOIN subnorma AS SN ON SN.normaFK = N.idNormaPK;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_preguntasFrecuentes_SP` (`id` INT)  BEGIN
SELECT
PF.idPreguntasFrecuentes AS codigo,
PF.pregunta  AS pregunta
FROM
preguntasfrecuentes AS PF
WHERE PF.idPregFrecAreaFK  = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_registrarMision_sp` (IN `descripcion` TEXT(400), `imagen` NVARCHAR(50))  BEGIN
insert into mision (mi_desc,mi_imagen,mi_fecha) values(descripcion,imagen,NOW());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_trabajaConNosotros_sp` (IN `fechaActual` DATE)  BEGIN
SELECT tra_desc AS descripcion, tra_imagen AS rutaImagen FROM vision WHERE tra_fecha = fechaActual;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mgc_update_medalleroHistorico_SP` (`idmed` INT, `puesto` INT, `pais` INT, `oro` INT, `plata` INT, `bronce` INT, `total` INT)  BEGIN
UPDATE medallerohistorico
SET  medHisPue = puesto, pai_FK = pais, medHisOro = oro, medHisPla = plata, medHisBro = bronce, medHisTot = total
WHERE idmedHis_PK = idmed;
END$$

CREATE DEFINER=`id9947750_usuario`@`%` PROCEDURE `set_CompraEntrada` (IN `_idUsuario` INT(11), IN `_idSede` INT(11), IN `_idHorarioEvento` INT(11), IN `_idMoneda` INT(11), IN `_idReporteEntrada` INT(11), IN `_idAsiento` INT(11), IN `_NumTarjeta` VARCHAR(30))  INSERT INTO `compra_entrada` VALUES (null, _idUsuario, _idSede, _idHorarioEvento, _idMoneda, _idReporteEntrada, _idAsiento, _NumTarjeta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarf_datos` (IN `nombreF` VARCHAR(40), IN `fotoF` VARCHAR(200), IN `codigoF` INT)  NO SQL
BEGIN
	update foto set nombre=nombreF,
						foto=fotoF
				where codigo=codigoF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarv_datos` (IN `nombreV` VARCHAR(200))  NO SQL
BEGIN
	update video set nombre=nombreV,
						video=videoV
				where codigo=codigoV;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_datos` (IN `disciplinaU` VARCHAR(150), IN `sedeU` VARCHAR(200), IN `direccionU` VARCHAR(200), IN `idjuegoU` INT)  NO SQL
BEGIN
	update disciplinas set disciplina=disciplinaU,
						sedeU=sedeU,
						direccion=direccionU
				where id_juego=idJuegoU;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AUSPICIADORES` ()  BEGIN
	SELECT ta.NomAuspiciador, a.descripcionAus, a.imagenE FROM tipoauspiciadores ta 
	inner join auspiciadores a on ta.idTipoAuspiciador = a.idTipoAuspiciador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CEREMONIA` (`idTipo` INT)  BEGIN
	SELECT * FROM ceremonias where idCeremonias = idTipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CEREMONIAS` ()  BEGIN
	SELECT * FROM ceremonias;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CEREMTIPO` (`idCeremonia` INT)  BEGIN
	SELECT * FROM tipoceremonias WHERE idCeremonias = idCeremonia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMITE` ()  BEGIN
	SELECT c.NombresR, c.ApellidoR, c.DescripcionCO, c.imagenR, r.DescripcionR, tr.NombreR as Cargo 
	FROM comiteorganizador c
	INNER JOIN representantes r on c.idRepresentateORG = r.idRepresentateORG
	INNER JOIN tiporepresentante tr on c.idTipoRepresentante = tr.idTipoRepresentante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELDEPORTISTA` (`_codigo` INT)  BEGIN
	DELETE FROM deportistas WHERE idDeportistas = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELDOCUMENTO` (`_codigo` INT)  BEGIN
	DELETE FROM `documentos` WHERE id = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELFOTO` (`_codigo` INT)  BEGIN
	DELETE FROM foto WHERE codigo = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELPARTICIPANTE` (`_codigo` INT)  BEGIN
	DELETE FROM `participantes` WHERE id = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELVIDEO` (`_codigo` INT)  BEGIN
	DELETE FROM `video` WHERE codigo = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarf_datos` (IN `codigoF` INT)  NO SQL
BEGIN
delete from foto
where codigo=codigoF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarV_datos` (IN `codigoV` INT)  NO SQL
BEGIN
delete from video
where codigo=codigoV;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_datos` (IN `idjuegoD` INT)  NO SQL
BEGIN
	delete from disciplinas 
    where id_juego=idJuegoD;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FINDDEPORTISTA` (`_codigo` INT)  BEGIN
	select * from deportistas de 
	inner join deportes d on de.idDeporte = d.idDeporte
	inner join pais p on de.idPais = p.idPais
	where p.idPais = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FINDFIXTURE` (`_deporte` VARCHAR(200), `_sede` VARCHAR(200))  BEGIN
	IF _sede != ""
		THEN 
			select f.fechaInicio, d.NombDeporte, s.DireccionSede from fixture f
			inner join deportes d on f.idDeporte = d.idDeporte
			inner join config_sede_deporte sd on d.idDeporte = sd.idDeporteFK
			inner join sedes s on sd.idSedeFK = s.idSede
			where s.DireccionSede like concat('%',_sede, '%');
	ELSEIF _deporte != ""
		THEN 
			select f.fechaInicio, d.NombDeporte, s.DireccionSede from fixture f
			inner join deportes d on f.idDeporte = d.idDeporte
			inner join config_sede_deporte sd on d.idDeporte = sd.idDeporteFK
			inner join sedes s on sd.idSedeFK = s.idSede
			where d.NombDeporte like concat('%',_deporte, '%');
	ELSE
			select f.fechaInicio, d.NombDeporte, s.DireccionSede from fixture f
			inner join deportes d on f.idDeporte = d.idDeporte
			inner join config_sede_deporte sd on d.idDeporte = sd.idDeporteFK
			inner join sedes s on sd.idSedeFK = s.idSede;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDECRETO` ()  BEGIN
	SELECT * FROM bdtecnoserv.decreto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDEPORTES` ()  BEGIN
	SELECT * FROM deportes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDEPORTISTA` (`_codigo` INT)  BEGIN
	select * from deportistas de 
	inner join deportes d on de.idDeporte = d.idDeporte
	inner join pais p on de.idPais = p.idPais
    where de.idDeportistas = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDEPORTISTAS` ()  BEGIN
	select * from deportistas de 
	inner join deportes d on de.idDeporte = d.idDeporte
	inner join pais p on de.idPais = p.idPais;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDETALLEEVENTOS` ()  BEGIN
	select * from eventos e
	inner join detalleeventos de on e.idEvento = de.idEvento
	inner join pais p on de.idPais = p.idPais;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDISCIPLINA` ()  BEGIN
SELECT * FROM `disciplina` WHERE 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDOCUMENTO` (`_codigo` INT)  BEGIN
	select * from documentos where id = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETDOCUMENTOS` ()  BEGIN
SELECT * FROM `documentos` WHERE 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETEVENTO` (`_codigo` INT)  BEGIN
	select * from eventos e
	inner join sedes s on e.idSede = s.idSede
	inner join deportes d on e.idDeportes = d.idDeporte
    inner join resutado r on e.idEvento = r.idEvento
	where e.idEvento = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETEVENTOS` ()  BEGIN
    select * from eventos e
	inner join resutado r on r.idEvento = e.idEvento
	inner join deportes d on e.idDeportes = d.idDeporte
	inner join sedes s on e.idSede = s.idSede;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETFIXTURE` ()  BEGIN
	select f.fechaInicio, d.NombDeporte, s.DireccionSede from fixture f
	inner join deportes d on f.idDeporte = d.idDeporte
	inner join config_sede_deporte sd on d.idDeporte = sd.idDeporteFK
	inner join sedes s on sd.idSedeFK = s.idSede;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETFOTO` (`id` INT)  BEGIN
	SELECT * FROM foto WHERE codigo = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETFOTOS` ()  BEGIN
	SELECT * FROM `foto` WHERE 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETNOTIFICACION` (`_codigo` INT)  BEGIN
	select * from notificaion where idnotificacion = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETNOTIFICACIONES` ()  BEGIN
	select * from notificacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETNOTIFICACIONUSUARIO` (`_idusuario` INT)  BEGIN
	select * from notificacion n
	inner join usuario_notificaciones un on n.idnotificacion = un.idnotificacion
	inner join usuarios u on un.idusuario = u.id
	where u.id = _idusuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETPARTICIPANTE` (`_codigo` INT)  BEGIN
	select * from participantes where id = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETPARTICIPANTES` ()  BEGIN
SELECT * FROM `participantes` WHERE 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETRESULTADOS` ()  BEGIN
	select * from resutado r
	inner join eventos e on r.idEvento = e.idEvento
	inner join deportes d on e.idDeportes = d.idDeporte;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETSEDES` ()  BEGIN
	SELECT * FROM sedes;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETVIDEO` (`_codigo` INT)  BEGIN
	SELECT * FROM video WHERE codigo = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GETVIDEOS` ()  BEGIN
select * from video where 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarf_datos` (IN `nombre_f` VARCHAR(40), IN `foto_f` VARCHAR(200))  NO SQL
insert into foto (nombre,foto) VALUES (nombre_f,foto_f)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarv_datos` (IN `nombre_V` VARCHAR(40), IN `video_V` VARCHAR(200))  NO SQL
insert into video (nombre,video) VALUES (nombre_V,video_V)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_datos` (IN `disciplinaI` VARCHAR(150), IN `sedeI` VARCHAR(200), IN `direccionI` VARCHAR(200))  NO SQL
BEGIN
	insert into disciplinas (disciplina,
							sede,
							direccion)
			values (disciplinaI,sedeI,direccionI);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LOGIN` (`usuario` VARCHAR(100), `pass` VARCHAR(100))  BEGIN
	SELECT * FROM usuarios WHERE usuario= usuario and pass= pass;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MEDALLERO` ()  BEGIN
	SELECT p.NombrePais, m.oro, m.plata, m.bronce, (m.oro + m.plata + m.bronce) as 'total' 
    FROM medallero m 
    inner join pais p on m.idPais = p.idPais
    order by total desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_datos` ()  NO SQL
BEGIN
	select id_juego,
			disciplina,
			sede,
			direccion 
	from disciplinas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerF_regjuego` (IN `codigoF` INT)  NO SQL
BEGIN
	select * from foto where codigo=codigoF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerV_regJuego` (IN `codigoV` INT)  NO SQL
BEGIN
	select * from video where codigo=codigoV;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_regJuego` (IN `idjuegoO` INT)  NO SQL
BEGIN
	select * from disciplinas where id_juego=idJuegoO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PAIS` ()  BEGIN
	SELECT * FROM pais;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGDEPORTISTA` (`_idDeporte` INT, `_descripcion` VARCHAR(200), `_idPais` INT, `_nombres` VARCHAR(200), `_apellidos` VARCHAR(200), `_peso` VARCHAR(100), `_talla` VARCHAR(100))  BEGIN
	INSERT INTO `deportistas`
	(`idDeporte`,
	`descripcion`,
	`idPais`,
	`nombres`,
	`apellidos`,
	`peso`,
	`talla`)
	VALUES
	(_idDeporte,
	_descripcion,
	_idPais,
	_nombres,
	_apellidos,
	_peso,
	_talla);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGDISCIPLINA` (`_dis` VARCHAR(200), `_sed` VARCHAR(200), `_direcc` VARCHAR(200))  BEGIN
INSERT INTO disciplina (disciplina,sede, direccion) VALUES (_dis, _sed,_direcc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGDOCUMENTOS` (`_name` VARCHAR(200), `_picture` TEXT)  BEGIN
	INSERT INTO documentos (nombre, documentos) VALUES (_name, _picture);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGEVENTO` (`_idSede` INT, `_idHorarioEventos` INT, `_direccion` VARCHAR(200), `_idDeportes` INT, `_fecha` DATE, `_estado` INT)  BEGIN
	INSERT INTO `eventos`(`idSede`,`idHorarioEventos`,`direccion`,`idDeportes`,`fecha`,`estado`)
	VALUES (_idSede,_idHorarioEventos,_direccion,_idDeportes,_fecha,_estado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGFOTO` (`_name` VARCHAR(200), `_picture` TEXT)  BEGIN
	INSERT INTO foto (nombre, foto) VALUES (_name, _picture);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGNOTIFICACION` (`_fecha` DATE, `_idEvento` INT, `_estado` INT, `_titulo` VARCHAR(200), `_descripcion` TEXT, `_idtiponotificacion` INT)  BEGIN
INSERT INTO `notificacion`
	(`fecha`,
	`idEvento`,
	`estado`,
	`titulo`,
	`descripcion`,
    `idtiponotificacion`)
	VALUES
	(_fecha,
	_idEvento,
	_estado,
	_titulo,
	_descripcion,
    _idtiponotificacion);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGPARTICIPANTES` (`_name` VARCHAR(200), `_apeP` VARCHAR(200), `_apeM` VARCHAR(200), `_from` VARCHAR(200), `_picture` TEXT)  BEGIN
	INSERT INTO participantes (Nombre, ApellidoP, ApellidoM, Pais, Foto ) VALUES (_name,_apeP,_apeM,_from, _picture);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGRESULTADO` (`_idevento` INT, `_pais1` VARCHAR(100), `_pais2` VARCHAR(100), `_res1` DOUBLE, `_res2` DOUBLE)  BEGIN
	INSERT INTO `resutado`
	(`idEvento`,`pais1`,`pais2`,`res1`,`res2`)
	VALUES
	(_idevento,_pais1,_pais2,_res1,_res2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGUSUARIONOTIFICACION` (`_idnotificacion` INT, `_idusuario` INT, `_estado` INT)  BEGIN
	INSERT INTO `usuario_notificaciones`
	(`idnotificacion`,
	`idusuario`,
	`estado`)
	VALUES
	(_idnotificacion,
	_idusuario,
	_estado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGVIDEO` (`_name` VARCHAR(200), `_picture` TEXT)  BEGIN
INSERT INTO video (nombre, video) VALUES (_name, _picture);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPOCEREMONIAS` (`id` INT)  BEGIN
	SELECT * FROM tipoceremonias where idTipoCeremonias = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TIPOINSTITUCIONAL` ()  BEGIN
	SELECT ti.NombreInstitucional, i.descripInstitucional, i.imagenInstitucional FROM institucional i
	INNER JOIN tipoinstitucional ti ON i.idTipoInstitucional = ti.idTipoInstitucional;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEDEPORTISTA` (`_idDeportista` INT, `_idDeporte` INT, `_descripcion` VARCHAR(200), `_idPais` INT, `_nombres` VARCHAR(200), `_apellidos` VARCHAR(200), `_peso` VARCHAR(100), `_talla` VARCHAR(100))  BEGIN
	UPDATE `deportistas`
	SET
	`idDeporte` = _idDeporte,
	`descripcion` = _descripcion,
	`idPais` = _idPais,
	`nombres` = _nombres,
	`apellidos` = _apellidos,
	`peso` = _peso,
	`talla` = _talla
	WHERE `idDeportistas` = _idDeportista;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEDOCUMENTO` (`_codigo` INT, `_nombre` VARCHAR(200), `_documento` VARCHAR(200))  BEGIN
	UPDATE `documentos` SET `nombre` = _nombre, `documentos` = _documento WHERE `id` = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEEVENTO` (`_idevento` INT, `_idsede` INT, `_idHorarioEventos` INT, `_direccion` VARCHAR(100), `_idDeportes` INT, `_fecha` DATE, `_estado` INT)  BEGIN
	UPDATE `eventos`
	SET
	`idSede` = _idsede,
	`idHorarioEventos` = _idHorarioEventos,
	`direccion` = _direccion,
	`idDeportes` = _idDeportes,
	`fecha` = _fecha,
	`estado` = _estado
	WHERE `idEvento` = _idevento;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEFOTO` (`_codigo` INT, `_nombre` VARCHAR(100), `_foto` VARCHAR(200))  BEGIN
UPDATE foto SET nombre = _nombre , foto = _foto WHERE codigo = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATENOTIFICACION` (`_idnotificacion` INT, `_fecha` DATE, `_idEvento` INT, `_estado` INT, `_titulo` VARCHAR(200), `_descripcion` TEXT, `_idtiponotificacion` INT)  BEGIN
	UPDATE `notificacion`
	SET
	`fecha` = _fecha,
	`idEvento` = _idEvento,
	`estado` = _estado,
	`titulo` = _titulo,
	`descripcion` = _descripcion,
    `idtiponotificacion` = _idtiponotificacion
	WHERE `idnotificacion` = _idnotificacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEPARTICIPANTE` (`_codigo` INT, `_nombre` VARCHAR(200), `_apellidop` VARCHAR(200), `_apellidom` VARCHAR(200), `_pais` VARCHAR(100), `_foto` VARCHAR(200))  BEGIN
	UPDATE `participantes`
	SET
	`Nombre` = _nombre,
	`ApellidoP` = _apellidop,
	`ApellidoM` = _apellidom,
	`Pais` = _pais,
	`Foto` = _foto
	WHERE `id` = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATERESULTADO` (`_idresutado` INT, `_idEvento` INT, `_pais1` VARCHAR(200), `_pais2` VARCHAR(200), `_res1` VARCHAR(200), `_res2` VARCHAR(200))  BEGIN
	UPDATE `resutado`
	SET
	`idEvento` = _idEvento,
	`pais1` = _pais1,
	`pais2` = _pais2,
	`res1` = _res1,
	`res2` = _res2	
	WHERE `idresutado` = _idresutado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEUSUARIONOTIFICACION` (`_codigo` INT, `_idnotificacion` INT, `_idusuario` INT, `_estado` INT)  BEGIN
	UPDATE `usuario_notificaciones`
	SET	
	`idnotificacion` = _idnotificacion,
	`idusuario` = _idusuario,
	`estado` = _estado
	WHERE `idusuario_notificaciones` = _codigo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATEVIDEO` (`_cogido` INT, `_nombre` VARCHAR(200), `_video` VARCHAR(200))  BEGIN
	UPDATE `video` SET `nombre` = _nombre, `video` = _video WHERE `codigo` = _cogido;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos`
--

CREATE TABLE `asientos` (
  `idAsiento` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `IdEstado` int(11) DEFAULT NULL,
  `idCategAsiento` int(11) DEFAULT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `IdSede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auspiciadores`
--

CREATE TABLE `auspiciadores` (
  `idAuspiciadores` int(11) NOT NULL,
  `descripcionAus` text,
  `imagenE` text,
  `idTipoAuspiciador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auspiciadores`
--

INSERT INTO `auspiciadores` (`idAuspiciadores`, `descripcionAus`, `imagenE`, `idTipoAuspiciador`) VALUES
(1, 'La popular marca de refrescos norteamericana patrocina los Juegos desde el año 1928.', './assets/images/Auspiciadores/coca-cola.png', 1),
(2, 'Entró a formar parte del club de marcas patrocinadoras en los Juegos olímpicos de Montreal del año 1976. Abrió el primer restaurante en China en 1990.', './assets/images/Auspiciadores/mcdonalds.png', 2),
(3, 'El grupo surcoreano participa en los Juegos de invierno y de verano desde las olimpiadas de Sydney 2000.', './assets/images/Auspiciadores/samsung.jpg', 3),
(4, 'El gigante tecnológico tuvo unos beneficios de 5.070 millones de dólares en el segundo trimestre del año, un 6% menos.', './assets/images/Auspiciadores/ge.jpg', 4),
(5, 'Fabricante chino de computadoras que durante el cuarto trimestre de año ha experimentado un crecimiento de sus ventas del 21%.', './assets/images/Auspiciadores/lenovo.png', 5),
(6, 'Es la única tarjeta de pago aceptada en las instalaciones y recintos olímpicos y paralímpicos.', './assets/images/Auspiciadores/visa.jpg', 6),
(7, 'Es el cronómetro oficial de los Juegos Olímpicos desde 1932.', './assets/images/Auspiciadores/omega.png', 7),
(8, 'Su apoyo al evento deportivo se remonta a los primeros Juegos Olímpicos modernos de Atenas, en 1896.', './assets/images/Auspiciadores/kodak.jpg', 8),
(9, 'La multinacional ganó 6.925 millones de dólares en el primer semestre de 2008, un 22,5% más que en 2007.', './assets/images/Auspiciadores/j-j.jpg', 9),
(10, 'Suministró los sistemas de sonido para los juegos de 1984 en Los Ángeles (California) y, en 1987, entró en el programa TOP.', './assets/images/Auspiciadores/Panasonic.jpg', 10),
(11, 'La compañía de tecnologías de la información es el socio tecnológico mundial para los Juegos.', './assets/images/Auspiciadores/atos.jpg', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaasiento`
--

CREATE TABLE `categoriaasiento` (
  `idCategoriaAsiento` int(11) NOT NULL,
  `NombreCategoriaA` varchar(50) DEFAULT NULL,
  `DescripCategoriaA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoriaasiento`
--

INSERT INTO `categoriaasiento` (`idCategoriaAsiento`, `NombreCategoriaA`, `DescripCategoriaA`) VALUES
(1, 'CategorÃ­a 1', NULL),
(2, 'CategorÃ­a 2', NULL),
(3, 'CategorÃ­a 3', NULL),
(4, 'CategorÃ­a 4', NULL),
(5, 'Palco', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ceremonias`
--

CREATE TABLE `ceremonias` (
  `idCeremonias` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `DescripcionC` text,
  `imagenC` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ceremonias`
--

INSERT INTO `ceremonias` (`idCeremonias`, `titulo`, `DescripcionC`, `imagenC`) VALUES
(2, 'CEREMONIAS', 'ESTAMOS PROBANDO', './assets/images/ceremonias-lima-2019.jpg'),
(3, 'INAUGURACIÓN', 'La cuenta regresiva agota su último grano de arena.<br> ¡Conoce a los campeones!', './assets/images/inauguracion/inauguracion-panamericanos-lima-2019.jpg'),
(4, 'CLAUSURA', 'La primera etapa de nuestros juegos llega a su fin. <br> ¡Celebra con nosotros!', './assets/images/clausura/clausura-panamericanos-lima-2019.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comiteorganizador`
--

CREATE TABLE `comiteorganizador` (
  `idComite` int(11) NOT NULL,
  `idRepresentateORG` int(11) DEFAULT NULL,
  `NombresR` varchar(150) DEFAULT NULL,
  `ApellidoR` varchar(150) DEFAULT NULL,
  `imagenR` varchar(240) DEFAULT NULL,
  `DescripcionCO` text,
  `idTipoRepresentante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comiteorganizador`
--

INSERT INTO `comiteorganizador` (`idComite`, `idRepresentateORG`, `NombresR`, `ApellidoR`, `imagenR`, `DescripcionCO`, `idTipoRepresentante`) VALUES
(1, 1, 'CARLOS', 'NEUHAUS', './assets/images/comite-organizador/person-man.png', 'Representante del Ministerio de Transportes y Comunicaciones', 1),
(2, 2, 'Eduardo', 'González Chávez', './assets/images/comite-organizador/person-man.png', 'Representante del Ministerio de Transportes y Comunicaciones', 1),
(3, 2, 'Alejandro Gilbert', 'Moreno Bocanegra', './assets/images/comite-organizador/person-man.png', 'Representante de la Municipalidad Metropolitana de Lima', 2),
(4, 2, 'Fernando', 'Perera Díaz', './assets/images/comite-organizador/person-man.png', 'Representante de la Municipalidad Metropolitana de Lima', 2),
(5, 2, 'Dante José', 'Mandriotti Castro', './assets/images/comite-organizador/person-man.png', 'Representante del Gobierno Regional del Callao', 3),
(6, 3, 'Pedro', 'Del Rosario Delgado', './assets/images/comite-organizador/person-man.png', 'Presidente del Comité Olímpico Peruano', 4),
(7, 4, 'Jorge', 'Barrera Zegarra', './assets/images/comite-organizador/person-man.png', 'Representante del Comité Olímpico Peruano', 4),
(8, 5, 'Víctor', 'Aspíllaga Alayza', './assets/images/comite-organizador/person-man.png', 'Representante del Instituto Peruano del Deporte', 5),
(9, 6, 'Karla', 'Ayala de las Casas', './assets/images/comite-organizador/person-woman.png', 'Representante del Ministerio de Economía y Finanzas', 2),
(10, 7, 'José Manuel', 'Girau Mendoza', './assets/images/comite-organizador/person-man.png', 'Representante del Ministerio de Vivienda y Construcción', 2),
(11, 8, 'Susana Victoria', 'Córdova Avila', './assets/images/comite-organizador/person-woman.png', 'Representante del Ministerio de Educación', 2),
(12, 10, 'Luisa', 'Villar Gálvez', './assets/images/comite-organizador/person-woman.png', 'Presidente de la Asociación Nacional Paralímpica del Perú', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_entrada`
--

CREATE TABLE `compra_entrada` (
  `idCompraEntrada` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idSede` int(11) DEFAULT NULL,
  `idHorarioEvento` int(11) DEFAULT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `idReporteEntrada` int(11) DEFAULT NULL,
  `idAsiento` int(11) DEFAULT NULL,
  `NumTarjeta` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantepago`
--

CREATE TABLE `comprobantepago` (
  `idPagosEntrada` int(11) NOT NULL,
  `idCompraEntrada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_sede_deporte`
--

CREATE TABLE `config_sede_deporte` (
  `idConfigSedeDeporte` int(11) NOT NULL,
  `idSedeFK` int(11) NOT NULL,
  `idDeporteFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `config_sede_deporte`
--

INSERT INTO `config_sede_deporte` (`idConfigSedeDeporte`, `idSedeFK`, `idDeporteFK`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 1, 22),
(23, 2, 23),
(24, 3, 24),
(25, 4, 25),
(26, 5, 26),
(27, 6, 27),
(28, 7, 28),
(29, 8, 29),
(30, 9, 30),
(31, 10, 31),
(32, 11, 32),
(33, 12, 33),
(34, 13, 34),
(35, 14, 35),
(36, 15, 36),
(37, 16, 37),
(38, 17, 38),
(39, 18, 39),
(40, 19, 40),
(41, 20, 41),
(42, 21, 42),
(43, 1, 43),
(44, 2, 44),
(45, 3, 45),
(46, 4, 46),
(47, 5, 47),
(48, 6, 48),
(49, 7, 49),
(50, 8, 50),
(51, 9, 51),
(52, 10, 52),
(53, 11, 53),
(54, 12, 54),
(55, 13, 55),
(56, 14, 56),
(57, 15, 57),
(58, 16, 58),
(59, 17, 59),
(60, 18, 60),
(61, 19, 61),
(62, 20, 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conocenos`
--

CREATE TABLE `conocenos` (
  `idconocenos` int(11) NOT NULL,
  `co_desc` text NOT NULL,
  `co_imagen` varchar(50) NOT NULL,
  `co_fecha` date NOT NULL,
  `bEstPri` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conocenos`
--

INSERT INTO `conocenos` (`idconocenos`, `co_desc`, `co_imagen`, `co_fecha`, `bEstPri`) VALUES
(1, 'CONOCEMOS: Estamos preparando el camino a los XVIII Juegos Panamericanos y Sextos Juegos Parapanamericanos.', 'vista/mgc/img/conocenos.jpg', '0000-00-00', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `decreto`
--

CREATE TABLE `decreto` (
  `idDecreto` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `estado` tinyint(4) DEFAULT NULL,
  `rutaPdf` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `decreto`
--

INSERT INTO `decreto` (`idDecreto`, `titulo`, `descripcion`, `estado`, `rutaPdf`, `fechaSistema`) VALUES
(1, 'D.L. N° 1335', 'Se dispone la transferencia al Ministerio de Transportes y Comunicaciones del desarrollo de la infraestructura, equipamiento y las operaciones para los XVIII Juegos Panamericanos y Sextos Juegos Parapanamericanos del 2019.', 1, './assets/docs/dl1335-1.pdf', '2019-06-20 20:08:36'),
(2, 'D.L. N° 1248', 'Dicta medidas para agilizar el proceso de inversión y otras actividades en el marco de la preparación y desarrollo de los XVIII Juegos Panamericanos del 2019 y Sextos Juegos Parapanamericanos del 2019.', 1, './assets/docs/dl1248.pdf', '2019-06-20 20:10:41'),
(3, 'D.S. N° 017-2018-MTC', 'Se modifican los artículos 2, 5 y 6 del Decreto Supremo N° 002-2015-MINEDU que crea el Proyecto Especial para la preparación y desarrollo de los XVIII Juegos Panamericanos y Sextos Juegos Parapanamericanos del 2019 en el ámbito del Ministerio de Transportes y Comunicaciones.', 1, './assets/docs/ds0172018mtc.pdf', '2019-06-20 20:10:41'),
(4, 'D.S. N° 009-2015-MINEDU', 'Se modifica el D.S. N° 002-2015-MINEDU y se incluye el objeto de programar y ejecutar las acciones necesarias para el desarrollo de los Sextos Juegos Parapanamericanos del 2019.', 1, './assets/docs/ds0092015minedu.pdf', '2019-06-20 20:10:41'),
(5, 'D.S. N° 002-2015-MINEDU', 'Se creó el Proyecto Especial para la Preparación y Desarrollo de los XVIII Juegos Panamericanos del 2019 – PEJP.', 1, './assets/docs/ds0022015minedu.pdf', '2019-06-20 20:10:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportedestacado`
--

CREATE TABLE `deportedestacado` (
  `idDeporteDestac` int(11) NOT NULL,
  `idRanking` int(11) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `idDeporte` int(11) NOT NULL,
  `NombDeporte` varchar(150) DEFAULT NULL,
  `idDetalleDeporte` int(11) DEFAULT NULL,
  `idReglamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`idDeporte`, `NombDeporte`, `idDetalleDeporte`, `idReglamento`) VALUES
(1, 'Futbol', 1, 1),
(2, 'Atletismo', 1, 1),
(3, 'BÃ¡dminton', 1, 1),
(4, 'Baloncesto', 1, 1),
(5, 'Boxeo', 1, 1),
(6, 'Ciclismo de Pista', 1, 1),
(7, 'Ciclismo de Ruta', 1, 1),
(8, 'Gimnasia Ritmica', 1, 1),
(9, 'Golf', 1, 1),
(10, 'Judo', 1, 1),
(11, 'Lucha-Grecorromana', 1, 1),
(12, 'Lucha-Libre', 1, 1),
(13, 'Raquetbol', 1, 1),
(14, 'Taekwondo-Kyorugi', 1, 1),
(15, 'Taekwondo-Poomasae', 1, 1),
(16, 'Voleibol', 1, 1),
(17, 'Ciclismo-BMX', 1, 1),
(18, 'Ciclismo-BMX Freestyle', 1, 1),
(19, 'Patinaje-velocidad', 1, 1),
(20, 'Voleibol-Play', 1, 1),
(21, 'Acuatico-Natacion', 1, 1),
(22, 'Acuatico-Clavadas', 1, 1),
(23, 'Acuatico-Natacion Artistica', 1, 1),
(24, 'Balonmano', 1, 1),
(25, 'Bowling', 1, 1),
(26, 'Patinaje-Artistico', 1, 1),
(27, 'Squash', 1, 1),
(28, 'Tenis de Mesa', 1, 1),
(29, 'Baloncesto 3X3', 1, 1),
(30, 'Ecuestre-Adiestramiento', 1, 1),
(31, 'Ecuestre-Salto', 1, 1),
(32, 'Atlestismo-Maraton', 1, 1),
(33, 'Atletismo-Marcha', 1, 1),
(34, 'Acuatico-Polo Acuatico', 1, 1),
(35, 'Beisbol', 1, 1),
(36, 'Hockey', 1, 1),
(37, 'Pelota Vasca', 1, 1),
(38, 'Rugby', 1, 1),
(39, 'Softbol', 1, 1),
(40, 'Tiro con Arco', 1, 1),
(41, 'Ciclismo-Montaña', 1, 1),
(42, 'Fisicoculturismo', 1, 1),
(43, 'Levantamiento de Pesas', 1, 1),
(44, 'Pentatlon Moderno', 1, 1),
(45, 'Triatlon', 1, 1),
(46, 'Tiro-Escopeta', 1, 1),
(47, 'Tiro-Pistola', 1, 1),
(48, 'Tiro-Rifle', 1, 1),
(49, 'Gimnasia-Artistica', 1, 1),
(50, 'Gimanasi-Trampolin', 1, 1),
(51, 'Karate-Kata', 1, 1),
(52, 'Karate-Kumite', 1, 1),
(53, 'Tenis', 1, 1),
(54, 'Suff', 1, 1),
(55, 'Acuatico-Natacion Aguas Abiertas', 1, 1),
(56, 'Esqui Acuatico', 1, 1),
(57, 'Canotaje-Extreme Slalom', 1, 1),
(58, 'Canotaje-Slalom', 1, 1),
(59, 'Vela', 1, 1),
(60, 'Canotaje-Velacidad', 1, 1),
(61, 'Esgrima', 1, 1),
(62, 'Pentatlon Moderno', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistadisciplina`
--

CREATE TABLE `deportistadisciplina` (
  `iddeportistadisciplina` int(11) NOT NULL,
  `idDeportistas` int(11) NOT NULL,
  `iddisciplina` int(11) NOT NULL,
  `deportistadisciplinacol` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas`
--

CREATE TABLE `deportistas` (
  `idDeportistas` int(11) NOT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `descripcion` text,
  `idPais` int(11) DEFAULT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `talla` varchar(50) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `deportistas`
--

INSERT INTO `deportistas` (`idDeportistas`, `idDeporte`, `descripcion`, `idPais`, `nombres`, `apellidos`, `peso`, `talla`, `foto`) VALUES
(1, 3, 'badminton deporte de a dos', 1, 'harold Ferrer', 'ga', '50', '90', NULL),
(2, 3, 'deporte de a dos', 9, 'jonathan Franco', 'ga', '50', '90', NULL),
(3, 2, 'deporte base', 4, 'frank', 'ga', '50', '90', NULL),
(4, 2, 'deporte base', 18, 'Ines Melchor', 'ga', '50', '90', NULL),
(5, 2, 'deporte base', 18, 'Gladys Tejeda', 'ga', '50', '90', NULL),
(6, 2, 'deporte base', 18, 'Kimberly Garcia', 'ga', '50', '90', NULL),
(7, 2, 'deporte base', 18, 'Raul Pacheco', 'ga', '50', '90', NULL),
(8, 3, 'raqueta y una plumilla', 18, 'Fernanda Saponara', 'ga', '50', '90', NULL),
(9, 3, 'raqueta y una plumilla', 18, 'Mario Cuba Rodriguez', 'ga', '50', '90', NULL),
(10, 3, 'raqueta y una plumilla', 18, 'Katherine Winder Cochella', 'ga', '50', '90', NULL),
(11, 3, 'raqueta y una plumilla', 18, 'Paula La torre Regal', 'ga', '50', '90', NULL),
(12, 3, 'raqueta y una plumilla', 18, 'Diego MiniCuadros', 'ga', '50', '90', NULL),
(13, 3, 'raqueta y una plumilla', 18, 'Ines Castillo Salazar', 'ga', '50', '90', NULL),
(14, 3, 'raqueta y una plumilla', 18, 'Daniela Macias Brandes', 'ga', '50', '90', NULL),
(15, 3, 'raqueta y una plumilla', 18, 'Danica Nishimura Higa', 'ga', '50', '90', NULL),
(16, 3, 'raqueta y una plumilla', 18, 'Daniel La torre Regal', 'ga', '50', '90', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledeporte`
--

CREATE TABLE `detalledeporte` (
  `idDetalleDeporte` int(11) NOT NULL,
  `descripcionDeporte` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalledeporte`
--

INSERT INTO `detalledeporte` (`idDetalleDeporte`, `descripcionDeporte`) VALUES
(1, 'Boxeo'),
(2, 'Lucha-Grecorromana'),
(3, 'Lucha-Libre'),
(4, 'Raquetbol'),
(5, 'Taekwondo-Kyorugi'),
(6, 'Taekwondo-Poomasae'),
(7, 'Voleibol'),
(8, 'Ciclismo-BMX'),
(9, 'Ciclismo-BMX Freestyle'),
(10, 'Ciclismo-Ruta'),
(11, 'Patinaje-velocidad'),
(12, 'Voleibol-Play'),
(13, 'Atlestismo-atletismo'),
(14, 'Acuatico-Natacion'),
(15, 'Acuatico-Clavadas'),
(16, 'Acuatico-Natacion Artistica'),
(17, 'Badminton'),
(18, 'Balonmano'),
(19, 'Bowling'),
(20, 'Ciclismo-Pista'),
(21, 'Judo'),
(22, 'Patinaje-Artistico'),
(23, 'Squash'),
(24, 'Tenis de Mesa'),
(25, 'Baloncesto'),
(26, 'Baloncesto 3X3'),
(27, 'Ecuestre-Adiestramiento'),
(28, 'Ecuestre-Salto'),
(29, 'Atlestismo-Maraton'),
(30, 'Atletismo-Marcha'),
(31, 'Acuatico-Polo Acuatico'),
(32, 'Beisbol'),
(33, 'Hockey'),
(34, 'Pelota Vasca'),
(35, 'Rugby'),
(36, 'Softbol'),
(37, 'Tiro con Arco'),
(38, 'Ciclismo-Montaña'),
(39, 'Fisicoculturismo'),
(40, 'Levantamiento de Pesas'),
(41, 'Pentatlon Moderno'),
(42, 'Triatlon'),
(43, 'Tiro-Escopeta'),
(44, 'Tiro-Pistola'),
(45, 'Tiro-Rifle'),
(46, 'Gimnasia-Artistica'),
(47, 'Gimnasia-Ritmica'),
(48, 'Gimanasi-Trampolin'),
(49, 'Karate-Kata'),
(50, 'Karate-Kumite'),
(51, 'Golf'),
(52, 'Tenis'),
(53, 'Suff'),
(54, 'Acuatico-Natacion Aguas Abiertas'),
(55, 'Esqui Acuatico'),
(56, 'Canotaje-Extreme Slalom'),
(57, 'Canotaje-Slalom'),
(58, 'Vela'),
(59, 'Canotaje-Velacidad'),
(60, 'Esgrima'),
(61, 'Pentatlon Moderno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleeventos`
--

CREATE TABLE `detalleeventos` (
  `idDetalleEvento` int(11) NOT NULL,
  `idEvento` int(11) DEFAULT NULL,
  `idDeportista` int(11) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleeventos`
--

INSERT INTO `detalleeventos` (`idDetalleEvento`, `idEvento`, `idDeportista`, `idPais`, `score`) VALUES
(1, 1, NULL, 1, 71),
(2, 1, NULL, 2, 76);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disciplina`
--

CREATE TABLE `disciplina` (
  `id_juego` int(11) NOT NULL,
  `disciplina` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sede` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `disciplina`
--

INSERT INTO `disciplina` (`id_juego`, `disciplina`, `sede`, `direccion`) VALUES
(1, 'Disciplina prueba', 'HYO', 'HYO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `documentos` text COLLATE utf8_spanish2_ci,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `nombre`, `documentos`, `fechaSistema`) VALUES
(1, 'Estatuto del Colegio de Ingenieros', './assets/documentos/5d116ba1156bb0.68440692.pdf', '2019-06-25 00:32:33'),
(4, 'Ampliar ancho de banda', './assets/documentos/5d116c2b17c198.98283124.txt', '2019-06-25 00:34:51'),
(5, 'Análisis de requerimientos funcionales', './assets/documentos/5d116c942538a4.51984678.pdf', '2019-06-25 00:36:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL,
  `idPaisFK` int(11) NOT NULL,
  `totalIntegrantes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoasiento`
--

CREATE TABLE `estadoasiento` (
  `idEstadoA` int(11) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadousuario`
--

CREATE TABLE `estadousuario` (
  `idestadoUsuario` int(11) NOT NULL,
  `descripcionestadoU` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estadousuario`
--

INSERT INTO `estadousuario` (`idestadoUsuario`, `descripcionestadoU`) VALUES
(1, 'habilitado'),
(2, 'deshabilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `idEvento` int(11) NOT NULL,
  `idSede` int(11) DEFAULT NULL,
  `idHorarioEventos` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `idDeportes` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`idEvento`, `idSede`, `idHorarioEventos`, `direccion`, `idDeportes`, `fecha`, `estado`, `fechaSistema`) VALUES
(1, 1, 1, '', '3', '1970-01-01 00:00:00', 1, '2019-06-27 01:38:57'),
(3, 4, 1, 'av. seg prueba', '6', NULL, NULL, '2019-06-25 23:18:50'),
(4, 3, 1, '', '1', '2019-06-26 00:00:00', 1, '2019-06-26 02:34:24'),
(5, 2, 1, '', '1', '2019-06-27 00:00:00', 1, '2019-06-26 02:36:31'),
(6, 2, 1, '', '5', '2019-06-27 00:00:00', 1, '2019-06-26 02:39:44'),
(7, 1, 1, '', '2', '2019-06-28 00:00:00', 1, '2019-06-26 02:42:08'),
(8, 6, 1, '', '8', '2019-06-28 00:00:00', 1, '2019-06-26 02:45:52'),
(9, 4, 1, '', '7', '2019-06-05 00:00:00', 1, '2019-06-26 02:57:32'),
(10, 9, 1, '', '6', '2019-06-26 00:00:00', 1, '2019-06-26 02:58:52'),
(11, 3, 1, '', '4', '2019-06-28 00:00:00', 1, '2019-06-26 03:04:46'),
(12, 7, 1, '', '13', '2019-06-29 00:00:00', 1, '2019-06-26 03:34:09'),
(13, 16, 1, '', '4', '2019-06-28 00:00:00', 1, '2019-06-26 03:42:24'),
(14, 1, 1, '', '8', '2019-06-28 00:00:00', 1, '2019-06-26 03:44:42'),
(15, 10, 1, '', '5', '2019-06-27 00:00:00', 1, '2019-06-26 03:46:34'),
(16, 7, 1, '', '6', '2019-06-28 00:00:00', 1, '2019-06-26 03:51:39'),
(17, 6, 1, '', '11', '2019-06-26 00:00:00', 1, '2019-06-26 03:53:51'),
(18, 9, 1, '', '7', '2019-06-26 00:00:00', 1, '2019-06-26 03:54:41'),
(19, 11, 1, '', '54', '2019-06-26 00:00:00', 1, '2019-06-26 04:01:01'),
(20, 16, 1, '', '8', '2019-06-26 00:00:00', 1, '2019-06-26 04:02:03'),
(21, 4, 1, '', '6', '2019-06-27 00:00:00', 1, '2019-06-26 04:05:12'),
(22, 4, 1, '', '6', '2019-06-27 00:00:00', 1, '2019-06-26 04:06:58'),
(23, 1, 1, '', '10', '2019-06-28 00:00:00', 1, '2019-06-26 04:09:31'),
(24, 4, 1, '', '9', '2019-06-28 00:00:00', 1, '2019-06-26 04:11:22'),
(25, 4, 1, '', '1', '2019-06-27 00:00:00', 1, '2019-06-26 04:11:49'),
(26, 11, 1, '', '9', '2021-08-28 00:00:00', 1, '2019-06-26 04:13:04'),
(27, 3, 1, '', '6', '2019-06-27 00:00:00', 1, '2019-06-26 04:16:04'),
(28, 6, 1, '', '8', '2019-06-28 00:00:00', 1, '2019-06-26 04:21:28'),
(29, 4, 1, '', '3', '2019-06-20 00:00:00', 1, '2019-06-26 04:27:18'),
(30, 7, 1, '', '1', '2019-06-27 00:00:00', 1, '2019-06-26 04:28:17'),
(31, 10, 1, '', '8', '2019-06-27 00:00:00', 1, '2019-06-26 04:30:27'),
(32, 10, 1, '', '6', '2019-06-27 00:00:00', 1, '2019-06-26 04:33:09'),
(33, 9, 1, '', '12', '2019-06-28 00:00:00', 1, '2019-06-26 04:37:51'),
(34, 4, 1, '', '1', '2019-06-11 00:00:00', 1, '2019-06-27 01:43:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fechaevento`
--

CREATE TABLE `fechaevento` (
  `idFechaEvento` int(11) NOT NULL,
  `idHora` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fechaevento`
--

INSERT INTO `fechaevento` (`idFechaEvento`, `idHora`, `fecha`, `idDeporte`, `fecha_inicio`, `fecha_final`) VALUES
(1, 1, '0000-00-00', 1, '2019-06-24', '2019-06-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fixture`
--

CREATE TABLE `fixture` (
  `idfixture` int(11) NOT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `fixture`
--

INSERT INTO `fixture` (`idfixture`, `idDeporte`, `fechaInicio`, `fechaFinal`, `fechaSistema`) VALUES
(1, 5, '2019-06-24', '2019-06-26', '2019-06-20 05:00:00'),
(2, 11, '2019-06-25', '2019-06-27', '2019-06-20 05:00:00'),
(3, 12, '2019-06-26', '2019-06-28', '2019-06-20 05:00:00'),
(4, 13, '2019-06-27', '2019-06-29', '2019-06-20 05:00:00'),
(5, 14, '2019-06-28', '2019-06-30', '2019-06-20 05:00:00'),
(6, 15, '2019-06-29', '2019-07-01', '2019-06-20 05:00:00'),
(7, 16, '2019-06-30', '2019-07-02', '2019-06-20 05:00:00'),
(8, 17, '2019-07-01', '2019-07-03', '2019-06-20 05:00:00'),
(9, 18, '2019-07-02', '2019-07-04', '2019-06-20 05:00:00'),
(10, 19, '2019-07-04', '2019-07-06', '2019-06-20 05:00:00'),
(11, 20, '2019-07-05', '2019-07-07', '2019-06-20 05:00:00'),
(12, 21, '2019-07-07', '2019-07-09', '2019-06-20 05:00:00'),
(13, 22, '2019-07-08', '2019-07-10', '2019-06-20 05:00:00'),
(14, 23, '2019-07-09', '2019-07-11', '2019-06-20 05:00:00'),
(15, 24, '2019-07-11', '2019-07-13', '2019-06-20 05:00:00'),
(16, 25, '2019-07-12', '2019-07-14', '2019-06-20 05:00:00'),
(17, 26, '2019-07-15', '2019-07-17', '2019-06-20 05:00:00'),
(18, 27, '2019-07-16', '2019-07-18', '2019-06-20 05:00:00'),
(19, 28, '2019-07-17', '2019-07-19', '2019-06-20 05:00:00'),
(20, 29, '2019-07-19', '2019-07-21', '2019-06-20 05:00:00'),
(21, 30, '2019-07-20', '2019-07-22', '2019-06-20 05:00:00'),
(22, 31, '2019-07-21', '2019-07-23', '2019-06-20 05:00:00'),
(23, 32, '2019-07-22', '2019-07-24', '2019-06-20 05:00:00'),
(24, 33, '2019-07-23', '2019-07-25', '2019-06-20 05:00:00'),
(25, 34, '2019-07-24', '2019-07-26', '2019-06-20 05:00:00'),
(26, 35, '2019-07-25', '2019-07-27', '2019-06-20 05:00:00'),
(27, 36, '2019-07-26', '2019-07-28', '2019-06-20 05:00:00'),
(28, 37, '2019-07-27', '2019-07-29', '2019-06-20 05:00:00'),
(29, 38, '2019-07-28', '2019-07-30', '2019-06-20 05:00:00'),
(30, 39, '2019-07-29', '2019-07-31', '2019-06-20 05:00:00'),
(31, 40, '2019-07-30', '2019-08-01', '2019-06-20 05:00:00'),
(32, 41, '2019-07-31', '2019-08-02', '2019-06-20 05:00:00'),
(33, 42, '2019-08-01', '2019-08-03', '2019-06-20 05:00:00'),
(34, 43, '2019-08-02', '2019-08-04', '2019-06-20 05:00:00'),
(35, 44, '2019-08-03', '2019-08-05', '2019-06-20 05:00:00'),
(36, 45, '2019-08-04', '2019-08-06', '2019-06-20 05:00:00'),
(37, 46, '2019-08-05', '2019-08-07', '2019-06-20 05:00:00'),
(38, 47, '2019-08-06', '2019-08-08', '2019-06-20 05:00:00'),
(39, 48, '2019-08-07', '2019-08-09', '2019-06-20 05:00:00'),
(40, 49, '2019-08-08', '2019-08-10', '2019-06-20 05:00:00'),
(41, 50, '2019-08-10', '2019-08-12', '2019-06-20 05:00:00'),
(42, 51, '2019-08-11', '2019-08-13', '2019-06-20 05:00:00'),
(43, 52, '2019-08-12', '2019-08-14', '2019-06-20 05:00:00'),
(44, 53, '2019-08-14', '2019-08-16', '2019-06-20 05:00:00'),
(45, 54, '2019-08-15', '2019-08-17', '2019-06-20 05:00:00'),
(46, 55, '2019-08-16', '2019-08-18', '2019-06-20 05:00:00'),
(47, 56, '2019-08-17', '2019-08-19', '2019-06-20 05:00:00'),
(48, 57, '2019-08-18', '2019-08-20', '2019-06-20 05:00:00'),
(49, 58, '2019-08-19', '2019-08-21', '2019-06-20 05:00:00'),
(50, 59, '2019-08-20', '2019-08-22', '2019-06-20 05:00:00'),
(51, 60, '2019-08-21', '2019-08-23', '2019-06-20 05:00:00'),
(52, 61, '2019-08-22', '2019-08-24', '2019-06-20 05:00:00'),
(53, 62, '2019-08-23', '2019-08-25', '2019-06-20 05:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

CREATE TABLE `foto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `foto` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `foto`
--

INSERT INTO `foto` (`codigo`, `nombre`, `foto`) VALUES
(1, 'Superman', './assets/images/fotos/5d0e68bea03337.48005350.png'),
(4, 'Hulk', './assets/images/fotos/5d0e682e91fee7.96808444.png'),
(6, 'Batman', './assets/images/fotos/5d0e6874ed76c7.32666593.png'),
(8, 'Daredevil', './assets/images/fotos/5d0e6fc634f510.40003850.png'),
(9, 'Linterna verde', './assets/images/fotos/5d0e5f9e380697.92599322.png'),
(12, 'Namor', './assets/images/fotos/5d0e75a735f6f9.97179006.png'),
(14, 'Cap. America', './assets/images/fotos/5d0e7a8842bae7.40642071.png'),
(15, 'Mujer invisible', './assets/images/fotos/5d0e7b65d92319.94351931.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria`
--

CREATE TABLE `galeria` (
  `idGaleria` int(11) NOT NULL,
  `Fotos` longblob,
  `Medios` varchar(50) DEFAULT NULL,
  `Documentos` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `galeria`
--

INSERT INTO `galeria` (`idGaleria`, `Fotos`, `Medios`, `Documentos`) VALUES
(1, NULL, 'aaaa', 'ddddd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora`
--

CREATE TABLE `hora` (
  `idHora` int(11) NOT NULL,
  `horainicio` varchar(10) DEFAULT NULL,
  `horafin` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hora`
--

INSERT INTO `hora` (`idHora`, `horainicio`, `horafin`) VALUES
(1, '8', '9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarioeventos`
--

CREATE TABLE `horarioeventos` (
  `idHorarioEventos` int(11) NOT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `idFechaEvento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarioeventos`
--

INSERT INTO `horarioeventos` (`idHorarioEventos`, `idDeporte`, `idFechaEvento`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucional`
--

CREATE TABLE `institucional` (
  `idInstitucional` int(11) NOT NULL,
  `descripInstitucional` text,
  `imagenInstitucional` varchar(200) DEFAULT NULL,
  `idTipoInstitucional` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `institucional`
--

INSERT INTO `institucional` (`idInstitucional`, `descripInstitucional`, `imagenInstitucional`, `idTipoInstitucional`) VALUES
(1, 'Ejecutar con eficacia las acciones necesarias para el desarrollo de los XVIII Juegos Panamericanos y Juegos Parapanamericanos del 2019, de manera planificada y coordinada con los actores involucrados.', './assets/images/institucional/mision.jpg', 1),
(2, 'Excelente organización de los XVIII Juegos Panamericanos y Juegos Parapanamericanos del 2019, contribuyendo con el desarrollo del deporte nacional y el posicionamiento internacional de la ciudad de Lima.', './assets/images/institucional/vision.jpg', 2),
(3, 'Estamos preparando el camino a los XVIII Juegos Panamericanos y Sextos Juegos Parapanamericanos.', './assets/images/institucional/conocenos.jpg', 3),
(4, 'Las personas que cumplan con los requisitos especificados en las bases de la Convocatoria, deberán enviar la documentación de acuerdo a las indicaciones brindadas en el cronograma de los Procesos de Selección, publicados por la Oficina de Personal de los Juegos.', './assets/images/institucional/trabaja.jpg', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantes`
--

CREATE TABLE `integrantes` (
  `idIntegrante` int(11) NOT NULL,
  `idEquipoFK` int(11) NOT NULL,
  `idDeportistasFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medallas`
--

CREATE TABLE `medallas` (
  `idMedalla` int(11) NOT NULL,
  `idTipoMedalla` int(11) DEFAULT NULL,
  `IdNumMedalla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medallero`
--

CREATE TABLE `medallero` (
  `idmedallero` int(11) NOT NULL,
  `idPais` int(11) NOT NULL,
  `oro` int(11) DEFAULT NULL,
  `plata` int(11) DEFAULT NULL,
  `bronce` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `medallero`
--

INSERT INTO `medallero` (`idmedallero`, `idPais`, `oro`, `plata`, `bronce`) VALUES
(1, 18, 1948, 1455, 1027),
(2, 14, 875, 593, 558),
(3, 10, 456, 656, 801),
(4, 9, 328, 359, 520),
(5, 2, 294, 331, 435),
(6, 28, 220, 289, 502),
(7, 12, 108, 148, 228),
(8, 41, 92, 205, 277),
(9, 11, 44, 91, 151),
(10, 34, 29, 63, 112),
(11, 33, 28, 81, 134),
(12, 16, 28, 30, 61),
(13, 27, 25, 46, 60),
(14, 20, 20, 15, 40),
(15, 40, 12, 25, 46),
(16, 39, 11, 23, 29),
(17, 4, 9, 15, 13),
(18, 32, 8, 33, 69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medallerohistorico`
--

CREATE TABLE `medallerohistorico` (
  `idmedHis_PK` int(11) NOT NULL,
  `medHisPue` int(11) NOT NULL,
  `pai_FK` int(11) NOT NULL,
  `medHisOro` int(11) NOT NULL,
  `medHisPla` int(11) NOT NULL,
  `medHisBro` int(11) NOT NULL,
  `medHisTot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medallerohistorico`
--

INSERT INTO `medallerohistorico` (`idmedHis_PK`, `medHisPue`, `pai_FK`, `medHisOro`, `medHisPla`, `medHisBro`, `medHisTot`) VALUES
(1, 1, 1, 1948, 1455, 1027, 1200),
(2, 2, 2, 875, 593, 558, 2026),
(3, 3, 3, 456, 656, 801, 1913),
(4, 4, 4, 328, 359, 520, 1207),
(5, 5, 5, 294, 331, 435, 1060),
(6, 6, 6, 220, 289, 502, 1019),
(7, 7, 7, 108, 148, 277, 574),
(8, 8, 8, 92, 205, 277, 574),
(9, 9, 9, 44, 91, 151, 286),
(10, 10, 10, 29, 63, 112, 204),
(11, 11, 11, 28, 81, 134, 243),
(12, 12, 12, 28, 30, 61, 119),
(13, 13, 13, 25, 46, 60, 131),
(14, 14, 14, 20, 15, 40, 75),
(15, 15, 15, 12, 25, 46, 83),
(16, 16, 16, 11, 23, 29, 63),
(17, 17, 17, 9, 15, 13, 37),
(18, 18, 18, 8, 33, 69, 110),
(19, 19, 19, 5, 9, 17, 31),
(20, 20, 20, 5, 6, 11, 22),
(21, 21, 21, 3, 19, 26, 48),
(22, 22, 22, 3, 2, 5, 10),
(23, 23, 23, 2, 4, 12, 18),
(24, 24, 24, 1, 8, 13, 22),
(25, 25, 25, 1, 4, 4, 9),
(26, 26, 26, 1, 4, 1, 6),
(27, 27, 27, 1, 0, 2, 3),
(28, 28, 28, 1, 0, 2, 3),
(29, 29, 29, 0, 4, 7, 11),
(30, 30, 30, 0, 4, 6, 10),
(31, 31, 31, 0, 4, 11, 15),
(32, 32, 32, 0, 2, 5, 7),
(33, 33, 33, 0, 2, 1, 3),
(34, 34, 34, 0, 2, 1, 3),
(35, 35, 35, 0, 2, 8, 10),
(36, 36, 36, 0, 2, 6, 8),
(37, 37, 37, 0, 2, 4, 6),
(38, 38, 38, 0, 2, 2, 4),
(39, 39, 39, 0, 0, 2, 2),
(40, 40, 40, 0, 0, 2, 2),
(41, 41, 41, 0, 0, 0, 0),
(42, 42, 42, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menuprincipal`
--

CREATE TABLE `menuprincipal` (
  `idMenuPrincipal` int(11) NOT NULL,
  `idCeremonias` int(11) DEFAULT NULL,
  `idPreguntasFrecuentes` int(11) DEFAULT NULL,
  `idAuspiciadores` int(11) DEFAULT NULL,
  `idInstitucional` int(11) DEFAULT NULL,
  `idComite` int(11) DEFAULT NULL,
  `idGaleria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mision`
--

CREATE TABLE `mision` (
  `idmision` int(11) NOT NULL,
  `mi_desc` text NOT NULL,
  `mi_imagen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `mi_fecha` date NOT NULL,
  `bEstPri` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mision`
--

INSERT INTO `mision` (`idmision`, `mi_desc`, `mi_imagen`, `mi_fecha`, `bEstPri`) VALUES
(1, 'patatas', 'ruta3.jpg', '0000-00-00', 0),
(2, 'patatas', 'ruta3.jpg', '0000-00-00', 0),
(3, 'patatas', 'ruta3.jpg', '0000-00-00', 0),
(4, 'MISION: Ejecutar con eficacia las acciones necesarias para el desarrollo de los XVIII Juegos Panamericanos y Juegos Parapanamericanos del 2019, de manera planificada y coordinada con los actores involucrados.', 'vista/mgc/img/mision.jpg', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `idMoneda` int(11) NOT NULL,
  `idTipoMoneda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `norma`
--

CREATE TABLE `norma` (
  `idNormaPK` int(11) NOT NULL,
  `numNor` int(11) NOT NULL,
  `contNor` text NOT NULL,
  `SecRegFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `norma`
--

INSERT INTO `norma` (`idNormaPK`, `numNor`, `contNor`, `SecRegFK`) VALUES
(1, 1, '1.  Establecer las reglas a travez de las cuales se cumpla, estrictamente, todo lo relativo a la organizacion de los Juegos Panamericanos.', 1),
(2, 2, '2.  Definir los aspectos organizativos, tecnicos y de logistica general que debe cumplirse, tanto en la etapa preparatoria como durante el desarrollo de los Juegos Panamericanos.', 1),
(3, 3, '3.  Controlar y asegurar que el Comite Organizador cumpla sus obligaciones y garantice las condiciones adecuadas, desde el punto de vista material, organizativo y teccnico, para que los Juegos Panamericanos se desarrollen exitosamente, en beneficio de los atletas y	de los Miembros de la Odepa.', 1),
(4, 4, '4.  Establecer un marco adecuado para la coordinacion entre todos los factores que participan en la organizacion de los Juegos,	definiendo y armonizando las responsabilidades de cada una de las partes,	en  inter y	enbeneficio de los propios Juegos, de los atletas y demas participantes.', 1),
(5, 5, '5.  Respetar los principios generales establecidos por el Comite Olimpico Internacional para la organizacion de los Juegos Olimpicos y adoptar su aplicacion, cuando resulte conveniente, en el ambito de los Juegos Panamericanos, particularmente	lo	que	se	refiere	al	concepto	organizativo,	las	reglas	tÃ©cnicas	para cada deporte, la lucha contra el dopaje, el juego limpio, el espÃ­ritu humanista y solidario, el respeto al medio ambiente y la promociÃ³n de la imagen olÃ­mpica que debe caracterizar a los Juegos Panamericanos, reconociendo, en todo momento, que la OrganizaciÃ³n Deportiva Panamericana es la mÃ¡xima autoridad sobre cualquier cuestiÃ³n relativa a los Juegos Panamericanos.', 1),
(6, 6, '6.  Asegurar que el Reglamento sea respetado por los Miembros de la Odepa, sus atletas y oficiales representantes y por el Comite Organizador; asi como, por las Federaciones Internacionales y/o Confederaciones Deportivas Panamericanas u organizaciones deportivas con similares funciones y cualquier otro participante debidamente acreditado en los Juegos Panamericanos. ', 1),
(7, 1, '2.  Una vez que la Odepa haya elegido la ciudad que organizarÃ¡ los Juegos, la Comision Tecnica de la Odepa tendra la responsabilidad de presentar una propuesta al Comite Ejecutivo de la Odepa sobre los deportes, disciplinas y eventos que se recomienda incluir en el Programa de los Juegos Panamericanos. Dicha propuesta sera elaborada en coordinacioncon el Comite Organizador, el Miembro de la Odepa sede de los Juegos y las Confederaciones Deportivas Panamericanas y/o Federaciones Internacionales. La Comision Tecnica sometera el Proyecto del Programa de los Juegos Panamericanos al Comite Ejecutivo de la Odepa para su aprobacion.', 2),
(8, 2, '5.  Para que un deporte no olimpico sea elegible para formar parte del Programa de los Juegos Panamericanos, su Federacion Internacional debe ser reconocida por la Odepa; al menos veinte (20) Miembros de la Odepa deberan reconocer a su correspondiente Federacion Nacional y el Estatuto de la Confederacion Deportiva Panamericana y la Federacion Internacional deben presentarse a la Comision Tecnica de la Odepa, junto con una descripcion detallada de las actividades de su deporte en America. La Comision Tecnica de la Odepa revisara estos documentos y hara una recomendacion al Comite Ejecutivo de la Odepa.', 2),
(9, 3, '1.  Para participar en los Juegos Panamericanos, un competidor es elegible si esta dispuesto a observar, acatar y cumplir el Estatuto de la Odepa y el Reglamento de los Juegos Panamericanos; asi como, los reglamentos de su Comite Olimpico Nacional y de la Federacion Internacional y/o ConfederaciÃ³n Deportiva Panamericana del deporte que representa.', 2),
(10, 4, '3.  El Estatuto de la Odepa en su Articulo XXII, acapites 4 y 5, sobre la nacionalidad de los atletas participantes en los Juegos Panamericanos, establece que: (4) Todo competidor que posea simultalneamente la nacionalidad de dos o mas paises podra representar a uno de ellos de su eleccion. Sin embargo, despues de haber representado a un pais en los Juegos Panamericanos, en campeonatos mundiales o regionales reconocidos por una Confederacion Deportiva Panamericana competente, no podra representar a otro pais, a menos que satisfaga las condiciones previstas en el parrafo 5 mas abajo, aplicables a las personas que hayan cambiado de nacionalidad o adquirido una nueva.', 2),
(11, 5, '5.  Para que un deporte no olimpico sea elegible para formar parte del Programa de los Juegos Panamericanos, su Federacion Internacional debe ser reconocida por la Odepa; al menos veinte (20) Miembros de la Odepa deberan reconocer a su correspondiente Federacion Nacional y el Estatuto de la Confederacion Deportiva Panamericana y la Federacion Internacional deben presentarse a la Comision Tecnica de la Odepa, junto con una descripcion detallada de las actividades de su deporte en America. La Comision Tecnica de la Odepa revisara estos documentos y harÃ¡ una recomendacion al Comite Ejecutivo de la Odepa.', 2),
(12, 1, '\"1.  Las competencias deportivas de los Juegos Panamericanos seran consideradas oficiales siempre que, al menos noventa (90) dias ante del comienzo de los Juegos Panamericanos, las inscripciones numericas finales hayan sido hechas y se cumplan las siguientes condiciones:\"', 3),
(13, 2, '\"2.  Si las condiciones minimas establecidas en el numeral (1) no han sido cumplidas	al momento en que las inscripciones finales sean requeridas por nombre (de 15 a 21 dias antes de la inauguracion de los Juegos), el deporte, la disciplina o la prueba no se realizara y el Comite Organizador, previa consulta con la Odepa, notificara	la decision a los CON inscritos, dentro de las 4 horas posteriores a la toma de la decision\"', 3),
(14, 1, '1.  Para participar en los Juegos Panamericanos, un competidor es elegible si esta dispuesto a observar, acatar y cumplir el Estatuto de la Odepa y el Reglamento de los Juegos Panamericanos; asi como, los reglamentos de su Comite Olimpico Nacional y de la Federacion Internacional y/o Confederacion Deportiva Panamericana del deporte que representa.', 4),
(15, 2, '\"2.  No existen limites de edad para los competidores en los Juegos Panamericanos, excepto cuando haya sido previamente aprobado y notificado a la  Odepa por la Federacion Internacional y/o Confederacion Panamericana que gobierna un deporte especifico.\"', 4),
(16, 3, '3.  El Estatuto de la Odepa en su Articulo XXII, acapites 4 y 5, sobre la nacionalidad de los atletas participantes en los Juegos Panamericanos, establece que: (4) Todo competidor que posea simultaneamente la nacionalidad de dos o mas paÃ­ses podra representar a uno de ellos de su eleccion. Sin embargo, despues de haber representado a un pais en los Juegos Panamericanos, en campeonatos mundiales o regionales reconocidos por una Confederacion Deportiva Panamericana competente, no podra representar a otro pais, a menos que satisfaga las condiciones previstas en el parrafo 5 mas abajo, aplicables a las personas que hayan cambiado de nacionalidad o adquirido una nueva.', 4),
(17, 1, '\"1.  Sobre la inscripcion de los atletas en los Juegos Panamericanos el Estatuto de la Odepa, en su Articulo XXII, acapites 6, 7 y 8, establece lo siguiente: (6) â€œSolo los Miembros de la Odepa podrÃ¡n inscribir competidores en los Juegos Panamericanos.	El derecho de aceptar definitivamente las inscripciones corresponde al Comite Ejecutivo de la Odepa (7) â€œLos miembros de la Odepa solo ejercerÃ¡n este derecho sobre la base de las recomendaciones de inscripciÃ³n formuladas por sus federaciones nacionales. Si el Miembro de la Odepa las aprueba, transmitirÃ¡ estas inscripciones al ComitÃ© Organizador, que tendrÃ¡ la obligaciÃ³n de acusar recibo. Cada Miembro de la Odepa deberÃ¡ investigar la validez de las inscripciones propuestas por las federaciones nacionales y asegurarse de que ningÃºn candidato ha sido rechazado por razones raciales, religiosas o polÃ­ticas o como consecuencia de cualquier otra forma de discriminaciÃ³n.â€ (8) â€œLa participaciÃ³n en los Juegos Panamericanos implica para todo competidor, el compromiso de respetar las disposiciones contenidas en el Estatuto de la Odepa, el Reglamento de los Juegos Panamericanos y los Reglamentos TÃ©cnicos de cada deporte. El Miembro de la Odepa que inscribe a un competidor asegura, bajo su responsabilidad, que dicho competidor tiene plena conciencia de su compromiso de respetar el Estatuto de la Odepa, el Reglamento de los Juegos Panamericanos y el Codigo Mundial Antidopaje.\"', 5),
(18, 2, '\"2.  El Comite Organizador de los Juegos Panamericanos enviara los formularios oficiales de inscripcion, a	los Miembros de la Odepa, como minimo	seis (6) meses antes de la fecha de inauguracion de los Juegos Panamericanos. Los formularios de inscripciÃ³n deberÃ¡n especificar todas las disciplinas y prueba de cada deporte que han sido incluidas en el Programa de los Juegos Panamericanos.\"', 5),
(19, 1, '1.  Las protestas o reclamaciones relacionadas con la elegibilidad de un competidor, deberan ser presentadas, por su Jefe de Mision o el representante de este, junto con un deposito de $100.00 USD (cien dolares), al Comite Ejecutivo de la Odepa, el que decidira sobre el asunto. El Comite Ejecutivo de la Odepa podra actuar con la presencia de un minimo de tres de sus miembros. El analisis de los casos tendra en cuenta lo siguiente:', 6),
(20, 2, '2.  Las protestas sobre asuntos tecnicos realizadas, de acuerdo a las Reglas de las Federaciones Internacionales, seran dirigidas a la autoridad actuante, Juez o arbitro, de acuerdo a la nomenclatura utilizada en cada deporte, quien, en coordinacion con la Federacion Internacional y/o Confederacion Deportiva Panamericana, decidira en primera instancia. La decision puede ser recurrida ante el Jurado de Apelaciones, actuante en el deporte en cuestion, de acuerdo a las reglas del deporte correspondiente.', 6),
(21, 1, '1.  Solo los competidores, asi como el personal medico y paramedico y oficiales de equipo, de acuerdo a las cuotas aprobadas y que realicen servicios esenciales para los competidores, inscritos por su correspondiente CON, seran alojados en la Villa Panamericana.', 7),
(22, 2, '2.  Las cuotas para oficiales de equipo alojados en la Villa Panamericana, para cada Miembro de la Odepa, son fijadas por el ComitÃ© Ejecutivo de la Odepa y no podran exceder el cuarenta por ciento (40%) del nÃºmero de competidores inscritos por cada Miembro de la Odepa.', 7),
(25, 3, '\"3.  Los oficiales de competencia (arbitros,	jueces, cronometristas, inspectores y otro personal tecnico reglamentario) deberan ser designados por la Federacion Internacional y/o Confederacion Deportiva Panamericana respectiva, segun sus reglamentos y de acuerdo con la retroalimentacion y transporte local durante los Juegos Panamericanos y, en el caso que esta establecido, honorarios para dichos oficiales de competencia, son responsabilidad del Comite Organizador.\"', 7),
(26, 1, '1.  Villa Panamericana:', 8),
(27, 1, '\"1.  El Estatuto de la Odepa, en su ArtÃ­culo XVIII (4)(a)(iv), define que para otorgar la sede de los Juegos Panamericanos la ciudad candidata presentarÃ¡ una Carta	firmada	por	los	niveles	mÃ¡s	altos	de	la	autoridad	gubernamental	del	paÃ­s, mediante la cual, se asegure a la Odepa que se respetarÃ¡ el Estatuto y el Reglamento de los Juegos Panamericanos y se ofrecerÃ¡n garantÃ­as para el acceso	y	salida	del	paÃ­s	de	los	atletas, dirigentes,	oficiales,	jueces,	representantes	de los medios y otros participantes, debidamente acreditados.\"', 9),
(28, 2, '2.  Los Ãºnicos facultados para solicitar acreditaciÃ³n en los Juegos Panamericanos son:', 9),
(29, 3, '\"3.  El ComitÃ© Organizador, previa aprobaciÃ³n del ComitÃ© Ejecutivo de la Odepa, emitirÃ¡ la Credencial de Identidad Panamericana a todas las personas que asistan	a	los	Juegos	Panamericanos	en	calidad	de	participante	oficial.	Dicha	Credencial registrarÃ¡ el nombre y apellidos, la fecha y lugar de nacimiento, el sexo, la nacionalidad y la funciÃ³n del titular en los Juegos Panamericanos.	La	Credencial	de	Identidad	Panamericana	tendrÃ¡	la	firma	y	fotografÃ­a	del	titular	y	deberÃ¡	estar	contrafirmada,	en	cada	caso,	por	el	Presidente	o	en	ausencia	de este por el Secretario General del ComitÃ© OlÃ­mpico Nacional y el Presidente de la Odepa o del ComitÃ© Organizador, segÃºn el nivel de autoridad establecido.\"', 9),
(30, 4, '4.  El ComitÃ© Organizador elaborarÃ¡ y propondrÃ¡ al ComitÃ© Ejecutivo de la Odepa para su aprobaciÃ³n, al menos un aÃ±o antes de su inauguraciÃ³n, el Manual de AcreditaciÃ³n que se aplicarÃ¡ durante los Juegos Panamericanos. De', 9),
(31, 5, '5.  El Sistema de AcreditaciÃ³n se pondrÃ¡ en prÃ¡ctica a partir de la aprobaciÃ³n del ComitÃ© Ejecutivo de la Odepa, como mÃ­nimo, un (1) aÃ±o antes de la fecha de inauguraciÃ³n de los Juegos Panamericanos. Los formularios de solicitud de acreditaciÃ³n serÃ¡n enviados, como mÃ­nimo, seis (6) meses antes del inicio de los Juegos Panamericanos a todos los Miembros de la Odepa, a las Federaciones Internacionales y/o Confederaciones Deportivas Panamericanas, a la Odepa y a otros organismos deportivos que deban recibirlos, de acuerdo con el sistema de acreditaciÃ³n aprobado.', 9),
(32, 6, '6.		El	ComitÃ©	Organizador,	en	virtud	del	Acuerdo	de	Responsabilidades	firmado entre las partes y de conformidad con lo establecido en el Estatuto de la Odepa, harÃ¡ los arreglos convenientes con el Gobierno de su paÃ­s, para que la Credencial de Identidad Panamericana constituya el documento de viaje (visa), acompaÃ±ada de un pasaporte con vigencia, como mÃ­nimo, hasta los seis meses posteriores a la conclusiÃ³n de los Juegos Panamericanos.', 9),
(33, 7, '7.  La Credencial de Identidad Panamericana deberÃ¡ tener ubicado, en lugar preponderante, los logotipos de la Odepa y de los Juegos Panamericanos. La propaganda o anuncio comercial en dicha Credencial deberÃ¡ ajustarse a lo que al respecto haya aprobado el ComitÃ© Ejecutivo de la Odepa.', 9),
(34, 8, '8.  Cada participante y el Miembro de la Odepa que lo inscribe son conjuntamente responsables de la veracidad de los datos ofrecidos y del cuidado, protecciÃ³n y uso de la acreditaciÃ³n entregada. El participante estÃ¡ en la obligaciÃ³n de	notificar	de	inmediato	al	ComitÃ©	Organizador,	a	travÃ©s	de	su	ComitÃ©	OlÃ­mpico, cualquier caso de robo, deterioro Ã³ pÃ©rdida de la Credencial de Identidad Panamericana.', 9),
(35, 1, '1.  El ComitÃ© Organizador efectuarÃ¡ una ReuniÃ³n de Jefes de MisiÃ³n, por lo menos seis (6) meses antes de los Juegos, en la ciudad sede. La informaciÃ³n que proporcione el ComitÃ© Organizador a los Miembros de la Odepa, deberÃ¡ incluir, entre otros, los siguientes aspectos:', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `idnotificacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `idEvento` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `idtiponotificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinasorganigrama`
--

CREATE TABLE `oficinasorganigrama` (
  `idSecretaria` int(11) NOT NULL,
  `se_nombre` varchar(60) NOT NULL,
  `se_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `oficinasorganigrama`
--

INSERT INTO `oficinasorganigrama` (`idSecretaria`, `se_nombre`, `se_tipo`) VALUES
(1, 'Secreteria Ejecutiva', 1),
(2, 'Oficina de Administracion', 1),
(3, 'Oficina de Recursos Humanos', 1),
(4, 'Oficina de Voluntariado', 1),
(5, 'Oficina de Acreditacion', 1),
(6, 'Oficina de Asesoria Juridica', 1),
(7, 'Oficina de Planeamiento, Presupuesto y Modernizacion', 1),
(8, 'Oficina de Coordinacion de Riesgos y Legado', 1),
(10, 'Direccion Ejecutiva', 0),
(11, 'Direccion de Integracion', 0),
(12, 'Direccion de Proyectos e Infraestructura Definitiva', 0),
(13, 'Direccion de Operaciones', 0),
(14, 'Direccion de Desarrollo Tecnologico y Transmisiones', 0),
(15, 'Direccion de Comunicaciones', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL,
  `NombrePais` varchar(200) DEFAULT NULL,
  `bandera` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idPais`, `NombrePais`, `bandera`) VALUES
(1, 'Antigua y Barbuda Antigua y Barbuda (ANT', 'some_flag'),
(2, 'Argentina.svg Argentina (ARG)', 'some_flag'),
(3, 'Aruba Aruba (ARU)', 'some_flag'),
(4, 'Bahamas Bahamas (BAH)', 'some_flag'),
(5, 'Barbados Barbados (BAR)', 'some_flag'),
(6, 'Belice Belice (BIZ)', 'some_flag'),
(7, 'Bermudas Bermudas (BER)', 'some_flag'),
(8, 'Bolivia.svg Bolivia (BOL)', 'some_flag'),
(9, 'Brazil.svg Brasil (BRA)', 'some_flag'),
(10, 'Canada.svg Canadá (CAN)', 'some_flag'),
(11, 'Chile.png Chile (CHI)', 'some_flag'),
(12, 'Colombia Colombia (COL)', 'some_flag'),
(13, 'Costa Rica.svg Costa Rica (CRC)', 'some_flag'),
(14, 'Cuba.svg Cuba (CUB)', 'some_flag'),
(15, 'Dominica Dominica (DMA)', 'some_flag'),
(16, 'Ecuador.svg Ecuador (ECU)', 'some_flag'),
(17, 'El Salvador El Salvador (ESA)', 'some_flag'),
(18, 'Estados Unidos Estados Unidos (USA)', 'some_flag'),
(19, 'Granada Granada (GRN)', 'some_flag'),
(20, 'Guatemala.svg Guatemala (GUA)', 'some_flag'),
(21, 'Guyana Guyana (GUY)', 'some_flag'),
(22, 'Haití Haití (HAI)', 'some_flag'),
(23, 'Honduras Honduras (HON)', 'some_flag'),
(24, 'las Islas Caimán Islas Caimán (CAY)', 'some_flag'),
(25, 'Islas Vírgenes Británicas (IVB)', 'some_flag'),
(26, 'Islas Vírgenes de los Estados Unidos (IS', 'some_flag'),
(27, 'Jamaica Jamaica (JAM)', 'some_flag'),
(28, 'Mexico.svg México (MEX)', 'some_flag'),
(29, 'Nicaragua.svg Nicaragua (NCA)', 'some_flag'),
(30, 'Panama.svg Panamá (PAN)', 'some_flag'),
(31, 'Paraguay Paraguay (PAR)', 'some_flag'),
(32, 'Perú Perú (PER)', 'some_flag'),
(33, 'Puerto Rico Puerto Rico (PUR)', 'some_flag'),
(34, 'República Dominicana (DOM)', 'some_flag'),
(35, 'San Cristobal y Nieves San Cristóbal y N', 'some_flag'),
(36, 'San Vicente y las Granadinas San Vicente', 'some_flag'),
(37, 'Santa Lucía Santa Lucía (LCA)', 'some_flag'),
(38, 'Surinam Surinam (SUR)', 'some_flag'),
(39, 'Trinidad y Tobago Trinidad y Tobago (TTO', 'some_flag'),
(40, 'Uruguay.svg Uruguay (URU)', 'some_flag'),
(41, 'Venezuela Venezuela (VEN)', 'some_flag'),
(42, 'f', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantegrupal`
--

CREATE TABLE `participantegrupal` (
  `idPartGrupal` int(11) NOT NULL,
  `idEventoFK` int(11) NOT NULL,
  `idEquipo1FK` int(11) NOT NULL,
  `idEquipo2FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participanteindividual`
--

CREATE TABLE `participanteindividual` (
  `idPartIndividual` int(11) NOT NULL,
  `idDeportistasFK` int(11) NOT NULL,
  `idPaisFK` int(11) NOT NULL,
  `idEventoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `participanteindividual`
--

INSERT INTO `participanteindividual` (`idPartIndividual`, `idDeportistasFK`, `idPaisFK`, `idEventoFK`) VALUES
(1, 1, 1, 1),
(2, 2, 9, 1),
(8, 8, 18, 1),
(9, 9, 18, 1),
(10, 10, 18, 1),
(11, 11, 18, 1),
(12, 12, 18, 1),
(13, 13, 18, 1),
(14, 14, 18, 1),
(15, 15, 18, 1),
(16, 16, 18, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantes`
--

CREATE TABLE `participantes` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ApellidoP` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ApellidoM` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Pais` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Foto` text COLLATE utf8_spanish_ci,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participantes`
--

INSERT INTO `participantes` (`id`, `Nombre`, `ApellidoP`, `ApellidoM`, `Pais`, `Foto`, `fechaSistema`) VALUES
(3, 'Marcel', 'Rendich', 'Arias', 'Perú', './assets/images/participantes/5d118aa8c41222.70994649.png', '2019-06-25 02:44:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregfrecareas`
--

CREATE TABLE `pregfrecareas` (
  `idareaPreFrePK` int(11) NOT NULL,
  `nomAre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pregfrecareas`
--

INSERT INTO `pregfrecareas` (`idareaPreFrePK`, `nomAre`) VALUES
(1, 'JUEGOS PANAMERICANOS'),
(2, 'VOLUNTARIADO'),
(3, 'CONVOCATORIAS'),
(4, 'SEDES'),
(5, 'COMPETENCIAS'),
(6, 'TICKETS'),
(7, 'PROVEEDORES'),
(8, 'CONTACTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasfrecuentes`
--

CREATE TABLE `preguntasfrecuentes` (
  `idPreguntasFrecuentes` int(11) NOT NULL,
  `pregunta` varchar(250) NOT NULL,
  `idPregFrecAreaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preguntasfrecuentes`
--

INSERT INTO `preguntasfrecuentes` (`idPreguntasFrecuentes`, `pregunta`, `idPregFrecAreaFK`) VALUES
(1, '1. ¿Cuándo se llevarán a cabo los Juegos Panamericanos?', 1),
(2, '2. ¿Cuántos deportes y disciplinas tendrán los Juegos Panamericanos?', 1),
(3, '3. ¿Cuántos deportistas participarán en los Juegos Parapanamericanos?', 1),
(4, '4. ¿Cuántas delegaciones participarán en los Juegos Panamericanos?', 1),
(5, '1. ¿Cuántos voluntarios podrán participar en los Juegos Panamericanos y Parapanamericanos Lima 2019?', 2),
(6, '2. ¿Hay un límite de edad?', 2),
(7, '3. ¿Las personas con discapacidad pueden participar en el programa de Voluntariado?', 2),
(8, '4. Si soy extranjero, ¿también puedo ser voluntario o voluntaria de los Juegos Panamericanos Lima 2019?', 2),
(9, '1. ¿Cómo puedo postular a las convocatorias de Lima2019?', 3),
(10, '2. ¿Cómo me puedo contactar con el área de selección de personal?', 3),
(11, '3. He postulado a una convocatoria y tengo dudas sobre el proceso ¿Cómo puedo contactarlos?', 3),
(12, '4. Si soy extranjero, ¿puedo postular a una convocatoria?', 3),
(13, '1. ¿Cuál es el número de obras listas para los Juegos Lima 2019?', 4),
(14, '2. ¿Cuándo estarán listas las demás obras?', 4),
(15, '3. ¿Cuál es la sede de inauguración y clausura de los Juegos Lima 2019?', 4),
(16, '4. ¿Cuántas sedes de competencia tiene Lima 2019?', 4),
(17, '1. ¿Está lista la programación de las competencias?', 5),
(18, '2. ¿Cómo puedo competir en los Juegos Panamericanos?', 5),
(19, '3. ¿Cómo puedo saber el sistema de clasificación a Lima 2019?', 5),
(20, '4. ¿Cuántas delegaciones participarán en los Juegos Panamericanos?', 5),
(21, '1. ¿Cuándo inicia la venta de tickets?', 6),
(22, '1. ¿Cómo puedo ser proveedor de los Juegos?', 7),
(23, '1. ¿A qué teléfono me puedo comunicar?', 8),
(24, '2. Quisiéramos compartir una nota de prensa con ustedes, ¿a qué correo la podemos compartir?', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

CREATE TABLE `ranking` (
  `idRanking` int(11) NOT NULL,
  `idDeportista` int(11) DEFAULT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `idMedalla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reglamento`
--

CREATE TABLE `reglamento` (
  `idReglamento` int(11) NOT NULL,
  `descripReglamento` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reglamento`
--

INSERT INTO `reglamento` (`idReglamento`, `descripReglamento`) VALUES
(1, 'ga'),
(2, 'ga'),
(3, 'ga'),
(4, 'ga'),
(5, 'ga'),
(6, 'ga'),
(7, 'ga'),
(8, 'ga'),
(9, 'ga'),
(10, 'ga'),
(11, 'ga'),
(12, 'ga'),
(13, 'ga'),
(14, 'ga'),
(15, 'ga'),
(16, 'ga'),
(17, 'ga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporteentrada`
--

CREATE TABLE `reporteentrada` (
  `idReporteEntrada` int(11) NOT NULL,
  `idDeporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `IdRepresentateORG` int(11) NOT NULL,
  `DescripcionR` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`IdRepresentateORG`, `DescripcionR`) VALUES
(1, 'Ministerio de Transportes y Comunicaciones'),
(2, 'Municipalidad Metropolitana de Lima'),
(3, 'Gobierno Regional del Callao'),
(4, 'Comité Olímpico Peruano'),
(5, 'Instituto Peruano del Deporte'),
(6, 'Ministerio de Economía y Finanzas'),
(7, 'Ministerio de Vivienda y Construcción'),
(8, 'Ministerio de Educación'),
(9, 'Comité Olímpico Internacional'),
(10, 'Asociación Nacional Paralímpica del Perú');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestapreguntafrec`
--

CREATE TABLE `respuestapreguntafrec` (
  `idrespPregFrec` int(11) NOT NULL,
  `respuesta` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `idPregFrecuentes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `respuestapreguntafrec`
--

INSERT INTO `respuestapreguntafrec` (`idrespPregFrec`, `respuesta`, `idPregFrecuentes`) VALUES
(1, 'Los Juegos se llevarán a cabo desde el 26 de julio al 11 de agosto. ', 1),
(2, 'Los Juegos Panamericanos contarán con 39 deportes y 61 disciplinas. ', 2),
(3, 'En los Juegos Panamericanos participarán 6680 deportistas. ', 3),
(4, 'Participarán 41 delegaciones en los Juegos Panamericanos. ', 4),
(5, 'Necesitamos 12 mil voluntarios y voluntarias para los XVIII Juegos Panamericanos y 7 mil voluntarios y voluntarias para los Juegos Parapanamericanos. La convocatoria de voluntarios y voluntarias estará abierta a nivel nacional e internacional. ', 5),
(6, 'Los límites los pones tú. Solo debes ser mayor de 16 años al 01 de abril de 2019, día en el cual se da inicio a las actividades previas de los Juegos Panamericanos. ', 6),
(7, '¡Te necesitamos! Esperamos que las personas con discapacidad participen en los Juegos Panamericanos y/o en los Juegos Parapanamericanos. ', 7),
(8, '¡Por supuesto! Las inscripciones del Programa de Voluntariado se lanzarán a nivel nacional como internacional. ', 8),
(9, 'Puedes conocer las convocatorias laborales en la sección Trabaja con Nosotros ', 9),
(10, 'Si tienes una consulta sobre un proceso puedes escribir a consultascas@lima2019.pe ', 10),
(11, 'Puedes escribir a convocatorias@lima2019.pe ', 11),
(12, 'Todos pueden postular siempre y cuando cumplan con los requisitos y la correcta presentación de los formatos y/o anexos según lo indican las bases. ', 12),
(13, 'Actualmente contamos con 10 sedes entregadas para la realización de los juegos Lima 2019. ', 13),
(14, 'La infraestructura en construcción estará lista en marzo de 2019, fecha en la que estará ejecutada el 100% de las obras. ', 14),
(15, 'La inauguración y clausura de los Juegos Lima 2019 será en el Estadio Nacional. ', 15),
(16, 'Contamos con 19 sedes de competencia para la realización de los Juegos Panamericanos y Parapanamericanos. ', 16),
(17, 'La programación final está lista, los detalles los puedes ver a través de nuestros canales oficiales. ', 17),
(18, 'Para participar en los Juegos Panamericanos debes ser un atleta de alto rendimiento y ser seleccionado por la federación nacional de tu deporte. ', 18),
(19, 'Puedes conocer el manual de clasificación a nuestros juegos aquí http://www.panamsports.org/downloads/pdf/manual-de-sistemas-de-clasificacion-lima-2019.pdf ', 19),
(20, 'Participarán 41 delegaciones en los Juegos Panamericanos. ', 20),
(21, 'La venta de tickets iniciará el 27 de mayo. Estaremos informando todos los detalles a través de nuestros canales oficiales. ', 21),
(22, 'Puedes conocer los procesos de contrataciones que se llevaron o se están llevando en la sección de Contrataciones. ', 22),
(23, 'El número de nuestra central telefónica es 4105500. Si estás fuera de Perú deberás anteponerle el código (511). ', 23),
(24, 'Puedes escribir a prensa@lima2019.pe para compartir tu información. ', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultadogrupal`
--

CREATE TABLE `resultadogrupal` (
  `idResGrupal` int(11) NOT NULL,
  `idPartGrupalFK` int(11) NOT NULL,
  `fechaResultadoGr` date NOT NULL,
  `res_gr_puesto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultadoindividual`
--

CREATE TABLE `resultadoindividual` (
  `idResIndividual` int(11) NOT NULL,
  `idPartIndividualFK` int(11) NOT NULL,
  `fechaResultado` date NOT NULL,
  `res_in_puesto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resultadoindividual`
--

INSERT INTO `resultadoindividual` (`idResIndividual`, `idPartIndividualFK`, `fechaResultado`, `res_in_puesto`) VALUES
(1, 1, '0000-00-00', '1'),
(9, 1, '0000-00-00', '16'),
(10, 1, '0000-00-00', '23'),
(11, 16, '0000-00-00', '12'),
(12, 9, '0000-00-00', '1'),
(13, 10, '0000-00-00', '1'),
(14, 1, '0000-00-00', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resutado`
--

CREATE TABLE `resutado` (
  `idresutado` int(11) NOT NULL,
  `idEvento` int(11) DEFAULT NULL,
  `pais1` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pais2` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `res1` double DEFAULT NULL,
  `res2` double DEFAULT NULL,
  `fechaSistema` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `resutado`
--

INSERT INTO `resutado` (`idresutado`, `idEvento`, `pais1`, `pais2`, `res1`, `res2`, `fechaSistema`) VALUES
(1, 1, 'Bermudas Bermudas (BER)', 'Argentina.svg Argentina (ARG)', 71, 76, '2019-06-27 18:02:16'),
(2, 13, 'Brazil.svg Brasil (BRA)', 'Bolivia.svg Bolivia (BOL)', 1, 2, '2019-06-26 04:23:47'),
(3, 13, 'Bolivia.svg Bolivia (BOL)', 'Belice Belice (BIZ)', 2, 0, '2019-06-26 04:27:18'),
(4, 31, 'Antigua y Barbuda Antigua y Barbuda (ANT', 'Chile.png Chile (CHI)', 1, 2, '2019-06-26 04:30:27'),
(5, 32, 'Brazil.svg Brasil (BRA)', 'Bolivia.svg Bolivia (BOL)', 3, 22, '2019-06-27 01:42:35'),
(6, 33, 'Honduras Honduras (HON)', 'Mexico.svg México (MEX)', 0, 1, '2019-06-27 01:43:13'),
(7, 34, 'Perú Perú (PER)', 'Chile.png Chile (CHI)', 3, 2, '2019-06-27 01:43:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccionreglamento`
--

CREATE TABLE `seccionreglamento` (
  `idSecRegPK` int(11) NOT NULL,
  `numSec` int(11) NOT NULL,
  `TitSec` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccionreglamento`
--

INSERT INTO `seccionreglamento` (`idSecRegPK`, `numSec`, `TitSec`) VALUES
(1, 1, 'SECCION I OBJETIVOS'),
(2, 2, 'SECCION II PROGRAMA DE LOS JUEGOS PANAMERICANOS'),
(3, 3, 'SECCION III COMPETENCIAS DE LOS JUEGOS PANAMERICANOS'),
(4, 4, 'SECCION IV ELEGIBILIDAD DE LOS ATLETAS PARA PARTICIPAR EN LOS JUEGOS PANAMERICANOS'),
(5, 5, 'SECCION V INSCRIPCIONES DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS'),
(6, 6, 'SECCION VI PROTESTAS Y RECLAMACIONES DURANTE LOS JUEGOS PANAMERICANOS'),
(7, 7, 'SECCION VII OFICIALES, PERSONAL MÃ‰DICO Y PARAMEDICO, OFICIALES TECNICOS, JUECES Y ARBITROS QUE ACTUARAN EN LOS JUEGOS PANAMERICANOS'),
(8, 8, 'SECCION VIII ALOJAMIENTO DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS'),
(9, 9, 'SECCION IX ACREDITACION DE LOS PARTICIPANTES EN LOS JUEGOS PANAMERICANOS'),
(10, 10, 'SECCION X REUNION DE JEFES DE MISION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `idSede` int(11) NOT NULL,
  `idTipoSede` int(11) DEFAULT NULL,
  `imgSede` text,
  `DireccionSede` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`idSede`, `idTipoSede`, `imgSede`, `DireccionSede`) VALUES
(1, 19, '1', 'Villa Deportiva Regional del Callao'),
(2, 19, '2', 'Estadio San Marcos'),
(3, 19, '3', 'Costa Verde San Miguel'),
(4, 19, '4', 'Villa Deportiva Nacional - VIDENA'),
(5, 19, '5', 'Coliseo Eduardo Dibos'),
(6, 20, '6', 'Escuela de Equitacion del Ejercito'),
(7, 20, '7', 'Parque Kennedy'),
(8, 20, '8', 'Complejo Deportivo Villa Maria del Trinfo'),
(9, 20, '9', 'Morro Solar - Chorrillos'),
(10, 20, '10', 'Escuela Militar de Chorrillos'),
(11, 21, '11', 'Playa Chorrillos'),
(12, 21, '12', 'Base Aerea La Palmas'),
(13, 21, '13', 'Polideportivo Villa El Salvador'),
(14, 21, '14', 'Lima Golf Club'),
(15, 21, '15', 'Club Lawn Tennis'),
(16, 21, '16', 'Punta Rocas'),
(17, 22, '17', 'Laguna Bujama'),
(18, 22, '18', 'Rio Cañete-Lunahuana'),
(19, 22, '19', 'Bahia  de Paracas'),
(20, 22, '20', 'Albufera Medio Mundo - Huacho'),
(21, 22, '21', 'Lima Convention Center');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stockasientos`
--

CREATE TABLE `stockasientos` (
  `idStockAsiento` int(11) NOT NULL,
  `CantiDisponible` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subnorma`
--

CREATE TABLE `subnorma` (
  `idSubNor` int(11) NOT NULL,
  `numSubNor` char(255) NOT NULL,
  `contSubNor` text NOT NULL,
  `normaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subnorma`
--

INSERT INTO `subnorma` (`idSubNor`, `numSubNor`, `contSubNor`, `normaFK`) VALUES
(1, '3.1', '3.1  La totalidad de deportes, disciplinas y pruebas incluidos en el Programa de los siguientes Juegos OlÃ­mpicos.', 3),
(2, '3.2', '\"3.2  Los deportes que consideran los Juegos Panamericanos como evento de calificaciÃ³n	olÃ­mpica.	El	ComitÃ©	Ejecutivo	de	la	Odepa,	en	coordinaciÃ³n	con	la FederaciÃ³n Internacional y/o ConfederaciÃ³n Deportiva Panamericana correspondiente, podrÃ¡ establecer otras alternativas, a travÃ©s de las cuales se vinculen los resultados de los atletas y equipos en los Juegos Panamericanos con su participaciÃ³n en los siguientes Juegos OlÃ­mpicos.\"', 3),
(3, '3.3', '3.3  Aquellos deportes, disciplinas y pruebas cuya FederaciÃ³n Internacional y/o ConfederaciÃ³n Deportiva Panamericana hayan alcanzado un nivel adecuado en el desarrollo de sus actividades en AmÃ©rica.', 3),
(4, '3.4', '3.4  Los deportes y eventos con mayor participaciÃ³n y popularidad en AmÃ©rica', 3),
(5, '3.5', '3.5  Los deportes en que participen hombres y mujeres.', 3),
(6, '4.1', '\"4.1  Deportes del Programa OlÃ­mpico (28 deportes): ATLETISMO Masculino y Femenino, - BÃDMINTON Masculino y	Femenino - BALONMANO Masculino y Femenino - BALONCESTO Masculino y Femenino - BÃ‰ISBOL Masculino - BOXEO Masculino - CANOTAJE Masculino y Femenino -	CICLISMO	Masculino y Femenino - ECUESTRE Masculino y Femenino - ESGRIMA Masculino y Femenino -	FÃšTBOL Masculino y Femenino - GIMNASIA Masculino y Femenino - HOCKEY SOBRE CÃ‰SPED Masculino	y Femenino - JUDO Masculino	y Femenino - LEVANTAMIENTO DE PESAS	Masculino	y Femenino - LUCHA Masculino y Femenino - NATACIÃ“N Masculino y Femenino - PENTATLÃ“N MODERNO Masculino y Femenino - REMO Masculino y Femenino - SOFTBOL Femenino - TAE KWON DO Masculino y Femenino - TENIS Masculino y Femenino - TENIS	DE MESA Masculino	y Femenino - TIRO Masculino y	Femenino - TIRO CON ARCO Masculino y	Femenino - TRIATLÃ“N Masculino y Femenino - VELA Masculino y Femenino - VOLEIBOL Masculino y Femenino.\"', 10),
(7, '4.2', '4.2 Las disciplinas y pruebas de cada deporte olÃ­mpico serÃ¡n, sin excepciÃ³n, las aprobadas por el ComitÃ© OlÃ­mpico Internacional para los Juegos OlÃ­mpicos inmediatamente posteriores a los Juegos Panamericanos.', 10),
(8, '4.3', '\"4.3 Los deportes, disciplinas y pruebas pueden ser modificados	por el ComitÃ© OlÃ­mpico Internacional. Si este fuera el caso, la lista de deportes seÃ±alada en el AcÃ¡pite 4.1 precedente, se ajustarÃ¡ a lo establecido por el COI.\"', 10),
(9, '1.1', '1.1 Para deportes individuales, un mÃ­nimo de ocho (8) comitÃ©s olÃ­mpicos nacionales (CON) deben haber presentado inscripciones.', 12),
(10, '1.2', '1.2  Para deportes de equipo, hombres o mujeres, un mÃ­nimo de cinco (5) CON deben haber presentado inscripciones.', 12),
(11, '1.3', '1.3  Para deportes individuales, en los que hay mÃ¡s de una prueba, individual y por equipos, un mÃ­nimo de cinco (5) CON deben haber presentado inscripciones.', 12),
(12, '1.1', '1.1  Si una protesta o reclamaciÃ³n es presentada antes del inicio de los Juegos Panamericanos y la decisiÃ³n es adversa para el atleta involucrado, este no podrÃ¡ participar en los Juegos.', 19),
(13, '1.2', '1.2  Si una decisiÃ³n adversa es adoptada despuÃ©s del inicio de los Juegos Panamericanos, el atleta deberÃ¡ ser descalificado de los Juegos Panamericanos.', 19),
(14, '1.3', '1.3  En las competencias de deporte de equipo, el retiro del atleta o los atletas afectados por la decisiÃ³n adversa, puede resultar en la pÃ©rdida del partido o los partidos en los que haya o hayan participado dichos atletas.', 19),
(15, '1.1', '1.1  Todos los competidores en los Juegos Panamericanos serÃ¡n alojados en la Villa Panamericana, a menos que otra decisiÃ³n haya sido tomada por el ComitÃ© Ejecutivo de la Odepa.', 26),
(16, '1.2', '1.2  La Villa estarÃ¡ abierta al menos diez (10) dÃ­as antes de la ceremonia de inauguraciÃ³n y permanecerÃ¡ abierta al menos durante tres (3) dÃ­as posteriores a la ceremonia de clausura de los Juegos Panamericanos. La Villa Panamericana debe satisfacer las exigencias mÃ­nimas, similares a las establecidas por el COI para la organizaciÃ³n de la Villa de los atletas en unos Juegos OlÃ­mpicos.', 26),
(17, '2.1', '\"2.1  Los ComitÃ©s OlÃ­mpicos Nacionales, en	cuanto a la delegaciÃ³n oficial y el personal del paÃ­s que, de acuerdo con el presente Reglamento, tienen el derecho de asistir a los Juegos Panamericanos;\"', 28),
(18, '2.2', '2.2  El ComitÃ© Organizador, en lo referente al personal que trabajarÃ¡ en la organizaciÃ³n de los Juegos.', 28),
(19, '2.3', '\"2.3  La Odepa, para el ComitÃ© Ejecutivo y su propio personal; para los representantes de las Federaciones Internacionales, de las Confederaciones Deportivas	Panamericanas	y	los	oficiales	tÃ©cnicos,	jueces	internacionales	y personalidades invitadas al evento.\"', 28),
(20, '1.1', '1.1  Esquema general sobre la organizaciÃ³n de los Juegos;', 35),
(21, '1.2', '1.2  DescripciÃ³n completa de la Villa Panamericana y otros alojamientos; sistema de transporte, incluyendo los vehÃ­culos asignados a cada delegaciÃ³n;', 35),
(22, '1.3', '1.3  Instalaciones de competencia y entrenamiento;', 35),
(23, '1.4', '1.4  Sistema de AcreditaciÃ³n;', 35),
(24, '1.5', '1.5  Calendario con las fechas mÃ¡s importantes que deben cumplirse;', 35),
(25, '1.6', '1.6  Regulaciones de la aduana del paÃ­s sede con respecto al equipamiento, medicina, vestuario y otros medios importados, con carÃ¡cter temporal, para uso durante los Juegos Panamericanos;', 35),
(26, '1.7', '1.7  Servicios equinos, incluyendo normas sanitarias, cuarentena, tarifas para la alimentaciÃ³n de los caballos, servicios veterinarios, recepciÃ³n en el aeropuerto y entrega desde y hacia la instalaciÃ³n ecuestre;', 35),
(27, '1.8', '1.8  Procedimientos generales de seguridad;', 35),
(28, '1.9', '1.9  Procedimientos para el envÃ­o, recepciÃ³n y distribuciÃ³n de la carga;', 35),
(29, '1.10', '1.10 Tarifas de costo por los diferentes servicios que se ofrecerÃ¡n; aaaaaa', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sysdiagrams`
--

CREATE TABLE `sysdiagrams` (
  `diagram_id` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  `principal_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sysdiagrams`
--

INSERT INTO `sysdiagrams` (`diagram_id`, `name`, `principal_id`, `version`, `definition`) VALUES
(6, 'Diagram_final', 1, 1, 0xd0cf11e0a1b11ae1000000000000000000000000000000003e000300feff0900060000000000000000000000020000000100000000000000001000005e00000001000000feffffff000000000000000061000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdffffff60000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015000000feffffff1700000018000000190000001a0000001b0000001c0000001d0000001e0000001f000000200000002100000022000000230000002400000025000000260000002700000028000000290000002a0000002b0000002c0000002d0000002e0000002f000000300000003100000032000000330000003400000035000000360000003700000038000000390000003a0000003b0000003c0000003d0000003e0000003f000000400000004100000042000000430000004400000045000000460000004700000048000000490000004a0000004b0000004c0000004d0000004e0000004f000000500000005100000052000000530000005400000055000000560000005700000058000000590000005a0000005b0000005c0000005d000000fefffffffeffffff9b000000fefffffffdffffff630000006400000065000000660000006700000068000000690000006a0000006b0000006c0000006d0000006e0000006f000000700000007100000072000000730000007400000075000000760000007700000078000000790000007a0000007b0000007c0000007d0000007e0000007f0000008000000052006f006f007400200045006e00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500ffffffffffffffff0200000000000000000000000000000000000000000000000000000000000000c0a84869a707d5015f000000c00a0000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000002000000da260000000000006f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000ffffffff00000000000000000000000000000000000000000000000000000000000000000000000016000000d38e000000000000010043006f006d0070004f0062006a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000005f00000000000000000434000a1e500c05000080920000000f00ffff5000000092000000007d0000b9820000a0440000cc64010069f7000066e6ffff00990000de805b10f195d011b0a000aa00bdcb5c000008003000000000020000030000003c006b0000000900000000000000d9e6b0e91c81d011ad5100a0c90f5739f43b7f847f61c74385352986e1d552f8a0327db2d86295428d98273c25a2da2d00002800430000000000000053444dd2011fd1118e63006097d2df4834c9d2777977d811907000065b840d9c00002800430000000000000051444dd2011fd1118e63006097d2df4834c9d2777977d811907000065b840d9c83000000e425000000ff01008401000000003000a50900000700008001000000a202000000800000080000805363684772696400ee980000c8640000417369656e746f7300003800a50900000700008002000000ac020000008000000d000080536368477269640028b9000036d800004175737069636961646f7265730b000000003800a50900000700008003000000b20200000080000010000080536368477269640078b40000de8a000043617465676f726961417369656e746f00007800a5090000070000800400000062000000018000004d000080436f6e74726f6c005fab0000e37d000052656c616369f36e2027464b5f417369656e746f735f43617465676f726961417369656e746f2720656e747265202743617465676f726961417369656e746f2720792027417369656e746f7327006e1400002800b50100000700008005000000310000006b00000002800000436f6e74726f6c0013ae00004c87000000003400a50900000700008006000000a6020000008000000a00008053636847726964004c68000050dc0000436572656d6f6e696173000000003c00a50900000700008007000000b4020000008000001100008053636847726964008025000038120100436f6d6974654f7267616e697a61646f7200000000003800a50900000700008008000000ae020000008000000e00008053636847726964003075000044610000436f6d7072615f456e7472616461000000003800a50900000700008009000000b0020000008000000f0000805363684772696400f22b0000286e0000436f6d70726f62616e74655061676f0000003800a5090000070000800a000000b20200000080000010000080536368477269640006cdffff32fa00004465706f72746544657374616361646f00003000a5090000070000800b000000a2020000008000000800008053636847726964002ea5ffff5eb000004465706f7274657300003400a5090000070000800c000000a8020000008000000b00008053636847726964007a0d00001ae500004465706f727469737461735000003800a5090000070000800d000000ae020000008000000e00008053636847726964005ecfffff368d0000446574616c6c654465706f7274656f0000003800a5090000070000800e000000ae020000008000000e0000805363684772696400220b000052cb0000446574616c6c654576656e746f736f0000003800a5090000070000800f000000ac020000008000000d0000805363684772696473f2c100002067000045737461646f417369656e746f61646f00007000a50900000700008010000000520000000180000047000080436f6e74726f6c0052b30000a369000052656c616369f36e2027464b5f417369656e746f735f45737461646f417369656e746f2720656e747265202745737461646f417369656e746f2720792027417369656e746f73275400002800b50100000700008011000000310000006500000002800000436f6e74726f6c0035b400003869000000003000a50900000700008012000000a00200000080000007000080536368477269640060090000f4b000004576656e746f730000003400a50900000700008013000000a8020000008000000b0000805363684772696400fa32000082aa000046656368614576656e746f6900003000a50900000700008014000000a002000000800000070000805363684772696400d06b0000c6c0000047616c657269610000003800a50900000700008015000000ae020000008000000e00008053636847726964007a580000e6910000486f726172696f4576656e746f736f0000007800a509000007000080160000005a000000018000004f000080436f6e74726f6c00664d0000a2a1000052656c616369f36e2027464b5f486f726172696f4576656e746f735f46656368614576656e746f2720656e747265202746656368614576656e746f2720792027486f726172696f4576656e746f73271400002800b50100000700008017000000310000006d00000002800000436f6e74726f6c73055f0000e1af000000003800a50900000700008018000000ac020000008000000d0000805363684772696400d49400006ebe0000496e737469747563696f6e616c6e746f00003000a50900000700008019000000a20200000080000008000080536368477269640086a7ffff36d800004d6564616c6c617300003800a5090000070000801a000000ac020000008000000d00008053636847726964001293000062d900004d656e755072696e636970616c61646f00003000a5090000070000801b0000009e02000000800000060000805363684772696400488a0000de8a00004d6f6e656461640000003c00a5090000070000801c000000b802000000800000130000805363684772696400729c000078ff000050726567756e7461734672656375656e7465730000003000a5090000070000801d000000a002000000800000070000805363684772696400fcd6ffff5ad2000052616e6b696e670000003400a5090000070000801e000000a6020000008000000a000080536368477269640054d9ffff3ca500005265676c616d656e746f000000003800a5090000070000801f000000ae020000008000000e0000805363684772696400f0a6ffffda6100005265706f727465456e7472616461646f00003800a50900000700008020000000ae020000008000000e0000805363684772696400dc50000014180100526570726573656e74616e746573746f00003800a50900000700008021000000ac020000008000000d000080536368477269647338c700000474000053746f636b417369656e746f73736f0000007000a50900000700008022000000520000000180000047000080436f6e74726f6c0052b300008776000052656c616369f36e2027464b5f417369656e746f735f53746f636b417369656e746f732720656e747265202753746f636b417369656e746f732720792027417369656e746f73275400002800b50100000700008023000000310000006500000002800000436f6e74726f6c00d3b60000cd78000000003c00a50900000700008024000000b40200000080000011000080536368477269640080bb000082f500005469706f4175737069636961646f72657365730000003800a50900000700008025000000ae020000008000000e00008053636847726964004c68000006f900005469706f436572656d6f6e696173000000007800a5090000070000802600000052000000018000004d000080436f6e74726f6c004b6700006ded000052656c616369f36e2027464b5f436572656d6f6e6961735f5469706f436572656d6f6e6961732720656e74726520275469706f436572656d6f6e6961732720792027436572656d6f6e6961732700000000002800b50100000700008027000000310000006b00000002800000436f6e74726f6c0091690000c7f3000000003c00a50900000700008028000000b402000000800000110000805363684772696400beb9000076c500005469706f496e737469747563696f6e616c65730000003400a50900000700008029000000a8020000008000000b00008053636847726964001ca8fffffef100005469706f4d6564616c6c610000006c00a5090000070000802a000000520000000180000043000080436f6e74726f6c0023aeffff04e6000052656c616369f36e2027464b5f4d6564616c6c61735f5469706f4d6564616c6c612720656e74726520275469706f4d6564616c6c6127207920274d6564616c6c6173270000002800b5010000070000802b000000310000006100000002800000436f6e74726f6c0069b0ffff78ec000000003400a5090000070000802c000000a6020000008000000a0000805363684772696400de8a000010a400005469706f4d6f6e656461726100003400a5090000070000802d000000aa020000008000000c0000805363684772696400dc9b0000401901005469706f50726567756e746100003c00a5090000070000802e000000b402000000800000110000805363684772696473b2f3ffff622401005469706f526570726573656e74616e746565730000003400a5090000070000802f000000a40200000080000009000080536368477269640072060000f27600005469706f53656465736e746100003400a50900000700008030000000a8020000008000000b0000805363684772696400143700000e0001005469706f5573756172696f7400003000a50900000700008031000000a2020000008000000800008053636847726964001437000062d900005573756172696f7300002c00a509000007000080320000009a02000000800000040000805363684772696400f22b00005cc10000486f726100006400a5090000070000803300000052000000018000003b000080436f6e74726f6c00733f0000b2b4000052656c616369f36e2027464b5f46656368614576656e746f5f486f72612720656e7472652027486f7261272079202746656368614576656e746f270000002800b50100000700008034000000310000005900000002800000436f6e74726f6c00b9410000a5bb000000002c00a509000007000080350000009a02000000800000040000805363684772696400d4feffffac0701005061697300003000a509000007000080360000009c02000000800000050000805363684772696400f6090000e6910000536564657369640000006400a50900000700008037000000520000000180000039000080436f6e74726f6c006f1600004788000052656c616369f36e2027464b5f53656465735f5469706f53656465732720656e74726520275469706f5365646573272079202753656465732700650000002800b50100000700008038000000310000005700000002800000436f6e74726f6c00410c0000c88d000000008400a5090000070000803900000052000000018000005b000080436f6e74726f6c004da10000ff10010052656c616369f36e2027464b5f50726567756e7461734672656375656e7465735f5469706f50726567756e74612720656e74726520275469706f50726567756e7461272079202750726567756e7461734672656375656e746573270000002800b5010000070000803a000000310000007900000002800000436f6e74726f6c0093a30000d315010000008400a5090000070000803b000000520000000180000059000080436f6e74726f6c7375c4000099eb000052656c616369f36e2027464b5f4175737069636961646f7265735f5469706f4175737069636961646f7265732720656e74726520275469706f4175737069636961646f72657327207920274175737069636961646f7265732700000000002800b5010000070000803c000000310000007700000002800000436f6e74726f6c00bbc6000041f1000000008000a5090000070000803d000000520000000180000057000080436f6e74726f6c7356460000276d000052656c616369f36e2027464b5f436f6d70726f62616e74655061676f5f436f6d7072615f456e74726164612720656e7472652027436f6d7072615f456e74726164612720792027436f6d70726f62616e74655061676f270000002800b5010000070000803e000000310000007500000002800000436f6e74726f6c0005500000bc6c000000007000a50900000700008043000000520000000180000047000080436f6e74726f6c734315000015c2000052656c616369f36e2027464b5f446574616c6c654576656e746f735f4576656e746f732720656e74726520274576656e746f732720792027446574616c6c654576656e746f73275400002800b50100000700008044000000310000006500000002800000436f6e74726f6c003308000065c7000000008c00a50900000700008045000000520000000180000061000080436f6e74726f6c00160e00006123010052656c616369f36e2027464b5f436f6d6974654f7267616e697a61646f725f5469706f526570726573656e74616e74652720656e74726520275469706f526570726573656e74616e74652720792027436f6d6974654f7267616e697a61646f722700000000002800b50100000700008046000000310000007f00000002800000436f6e74726f6c00430f0000a725010000008400a5090000070000804700000052000000018000005b000080436f6e74726f6c00e33f0000591c010052656c616369f36e2027464b5f436f6d6974654f7267616e697a61646f725f526570726573656e74616e7465732720656e7472652027526570726573656e74616e7465732720792027436f6d6974654f7267616e697a61646f72270000002800b50100000700008048000000310000007900000002800000436f6e74726f6c00bb400000ee1b010000008400a50900000700008049000000520000000180000059000080436f6e74726f6c0045af000075c4000052656c616369f36e2027464b5f496e737469747563696f6e616c5f5469706f496e737469747563696f6e616c2720656e74726520275469706f496e737469747563696f6e616c2720792027496e737469747563696f6e616c2700000000002800b5010000070000804a000000310000007700000002800000436f6e74726f6c006dae00000ac4000000008800a5090000070000804b00000052000000018000005d000080436f6e74726f6c00339d0000cbf5000052656c616369f36e2027464b5f4d656e755072696e636970616c5f50726567756e7461734672656375656e7465732720656e747265202750726567756e7461734672656375656e74657327207920274d656e755072696e636970616c2705000000002800b5010000070000804c000000310000007b00000002800000436f6e74726f6c00a689000055fb000000007000a5090000070000804d000000720000000180000047000080436f6e74726f6c0024250000c196000052656c616369f36e2027464b5f4576656e746f735f486f726172696f4576656e746f732720656e7472652027486f726172696f4576656e746f7327207920274576656e746f73270000002800b5010000070000804e000000310000006500000002800000436f6e74726f6c00c32700007396000000007000a5090000070000804f000000620000000180000045000080436f6e74726f6c006ae7ffffab06010052656c616369f36e2027464b5f4465706f72746544657374616361646f5f506169732720656e74726520275061697327207920274465706f72746544657374616361646f2700ab1400002800b50100000700008050000000310000006300000002800000436f6e74726f6c00e3efffff7809010000007000a50900000700008051000000620000000180000045000080436f6e74726f6c00348600007dcb000052656c616369f36e2027464b5f4d656e755072696e636970616c5f47616c657269612720656e747265202747616c6572696127207920274d656e755072696e636970616c2773275400002800b50100000700008052000000310000006300000002800000436f6e74726f6c00da8d00009acf000000006400a5090000070000805500000052000000018000003b000080436f6e74726f6c00fd0f00003ff9000052656c616369f36e2027464b5f4465706f727469737461735f506169732720656e74726520275061697327207920274465706f72746973746173270000002800b50100000700008056000000310000005900000002800000436f6e74726f6c0043120000da00010000006c00a50900000700008057000000620000000180000043000080436f6e74726f6c0092bfffffabbb000052656c616369f36e2027464b5f4465706f727469737461735f4465706f727465732720656e74726520274465706f7274657327207920274465706f72746973746173276c00002800b50100000700008058000000310000006100000002800000436f6e74726f6c0022f1fffff1bd000000007400a50900000700008059000000620000000180000049000080436f6e74726f6c0035b8ffff5097000052656c616369f36e2027464b5f4465706f727465735f446574616c6c654465706f7274652720656e7472652027446574616c6c654465706f72746527207920274465706f727465732700730000002800b5010000070000805a000000310000006700000002800000436f6e74726f6c00adbcffff63a2000000007c00a5090000070000805c000000520000000180000051000080436f6e74726f6c0075ad000011dd000052656c616369f36e2027464b5f4d656e755072696e636970616c5f4175737069636961646f7265732720656e74726520274175737069636961646f72657327207920274d656e755072696e636970616c2705000000002800b5010000070000805d000000310000006f00000002800000436f6e74726f6c007eab0000a6dc000000007c00a5090000070000805e000000520000000180000051000080436f6e74726f6c009d9c0000e3cf000052656c616369f36e2027464b5f4d656e755072696e636970616c5f496e737469747563696f6e616c2720656e7472652027496e737469747563696f6e616c27207920274d656e755072696e636970616c2765506100002800b5010000070000805f000000310000006f00000002800000436f6e74726f6c00c08d000053d5000000007400a50900000700008060000000520000000180000049000080436f6e74726f6c00948f0000a369000052656c616369f36e2027464b5f436f6d7072615f456e74726164615f417369656e746f732720656e7472652027417369656e746f732720792027436f6d7072615f456e747261646127007d0000002800b50100000700008061000000310000006700000002800000436f6e74726f6c00168d00003869000000008400a50900000700008062000000620000000180000059000080436f6e74726f6c0063310000cbf5000052656c616369f36e2027464b5f4d656e755072696e636970616c5f436f6d6974654f7267616e697a61646f722720656e7472652027436f6d6974654f7267616e697a61646f7227207920274d656e755072696e636970616c2700000000002800b50100000700008063000000310000007700000002800000436f6e74726f6c009c890000a70f010000006c00a50900000700008064000000620000000180000041000080436f6e74726f6c0092bfffff5daf000052656c616369f36e2027464b5f4465706f727465735f5265676c616d656e746f2720656e74726520275265676c616d656e746f27207920274465706f727465732773270000002800b50100000700008065000000310000005f00000002800000436f6e74726f6c0045bffffff2ae000000007400a50900000700008066000000520000000180000049000080436f6e74726f6c00dda8ffffc36c000052656c616369f36e2027464b5f5265706f727465456e74726164615f4465706f727465732720656e74726520274465706f7274657327207920275265706f727465456e74726164612769617300002800b50100000700008067000000310000006700000002800000436f6e74726f6c0023abffff029d000000007400a5090000070000806800000052000000018000004b000080436f6e74726f6c73b082000019e4000052656c616369f36e2027464b5f4d656e755072696e636970616c5f436572656d6f6e6961732720656e7472652027436572656d6f6e69617327207920274d656e755072696e636970616c270000002800b50100000700008069000000310000006900000002800000436f6e74726f6c00948300005fe6000000006c00a5090000070000806a0000006a0000000180000043000080436f6e74726f6c0053230000cf77000052656c616369f36e2027464b5f436f6d7072615f456e74726164615f53656465732720656e747265202753656465732720792027436f6d7072615f456e7472616461270000002800b5010000070000806b000000310000006100000002800000436f6e74726f6c00c3290000e984000000006000a5090000070000806c000000520000000180000035000080436f6e74726f6c00b70a0000c1a2000052656c616369f36e2027464b5f4576656e746f735f53656465732720656e7472652027536564657327207920274576656e746f732700000000002800b5010000070000806d000000310000005300000002800000436f6e74726f6c00fb0100008caa000000006400a5090000070000807400000052000000018000003b000080436f6e74726f6c00eac1ffff35d7000052656c616369f36e2027464b5f52616e6b696e675f4d6564616c6c61732720656e74726520274d6564616c6c6173272079202752616e6b696e67270000002800b50100000700008075000000310000005900000002800000436f6e74726f6c007ec7ffffcad6000000007400a5090000070000807600000052000000018000004b000080436f6e74726f6c00fbd5ffff4fe4000052656c616369f36e2027464b5f4465706f72746544657374616361646f5f52616e6b696e672720656e747265202752616e6b696e6727207920274465706f72746544657374616361646f270000002800b50100000700008077000000310000006900000002800000436f6e74726f6c00efc6fffff2ef000000006800a5090000070000807800000062000000018000003f000080436f6e74726f6c0092bfffff8783000052656c616369f36e2027464b5f5469706f53656465735f4465706f727465732720656e74726520274465706f7274657327207920275469706f5365646573270000002800b50100000700008079000000310000005d00000002800000436f6e74726f6c00e1fbffff03b2000000006800a5090000070000807a00000082000000018000003d000080436f6e74726f6c00f78d00005e95000052656c616369f36e2027464b5f4d6f6e6564615f5469706f4d6f6e6564612720656e74726520275469706f4d6f6e65646127207920274d6f6e6564612700000000002800b5010000070000807b000000310000005b00000002800000436f6e74726f6c0085950000789c000000008000a5090000070000807e000000620000000180000055000080436f6e74726f6c0077680000b680000052656c616369f36e2027464b5f436f6d7072615f456e74726164615f486f726172696f4576656e746f732720656e7472652027486f726172696f4576656e746f732720792027436f6d7072615f456e7472616461276f270000002800b5010000070000807f000000310000007300000002800000436f6e74726f6c00096f00003f87000000007000a50900000700008080000000520000000180000045000080436f6e74726f6c008d8e0000b680000052656c616369f36e2027464b5f436f6d7072615f456e74726164615f4d6f6e6564612720656e74726520274d6f6e6564612720792027436f6d7072615f456e74726164612700ab1400002800b50100000700008081000000310000006300000002800000436f6e74726f6c73d39000007e86000000008000a50900000700008082000000520000000180000055000080436f6e74726f6c0077c1ffff3163000052656c616369f36e2027464b5f436f6d7072615f456e74726164615f5265706f727465456e74726164612720656e74726520275265706f727465456e74726164612720792027436f6d7072615f456e74726164612700000000002800b50100000700008083000000310000007300000002800000436f6e74726f6c0018200000c662000000006400a509000007000080840000005a000000018000003b000080436f6e74726f6c7392bfffff2fbf000052656c616369f36e2027464b5f52616e6b696e675f4465706f727465732720656e74726520274465706f72746573272079202752616e6b696e67270000002800b50100000700008085000000310000005900000002800000436f6e74726f6c008bcfffff75c1000000006c00a50900000700008086000000620000000180000041000080436f6e74726f6c0019f1ffffc3dd000052656c616369f36e2027464b5f52616e6b696e675f4465706f727469737461732720656e74726520274465706f72746973746173272079202752616e6b696e672700000000002800b50100000700008087000000310000005f00000002800000436f6e74726f6c738afcffffd6eb000000007800a5090000070000808800000052000000018000004f000080436f6e74726f6c00f3190000bfd9000052656c616369f36e2027464b5f446574616c6c654576656e746f735f4465706f727469737461732720656e74726520274465706f727469737461732720792027446574616c6c654576656e746f73270000002800b50100000700008089000000310000006d00000002800000436f6e74726f6c00391c000020e0000000006c00a5090000070000808a000000520000000180000043000080436f6e74726f6c00cb410000d5f4000052656c616369f36e2027464b5f5573756172696f735f5469706f5573756172696f2720656e74726520275469706f5573756172696f27207920275573756172696f73270000002800b5010000070000808b000000310000006100000002800000436f6e74726f6c001144000025fb000000003800a5090000070000808c000000ac020000008000000d0000805363684772696400c24c0000f2c1000045737461646f5573756172696f09000000007000a5090000070000808d000000520000000180000047000080436f6e74726f6c0071500000c7c9000052656c616369f36e2027464b5f5573756172696f735f45737461646f5573756172696f2720656e747265202745737461646f5573756172696f27207920275573756172696f73271400002800b5010000070000808e000000310000006500000002800000436f6e74726f6c001d430000d3d0000000006c00a5090000070000808f000000520000000180000043000080436f6e74726f6c00de270000d1ef000052656c616369f36e2027464b5f4465706f727469737461735f5573756172696f732720656e74726520275573756172696f7327207920274465706f72746973746173270000002800b50100000700008090000000310000006100000002800000436f6e74726f6c00b429000066ef000000006400a5090000070000809100000062000000018000003b000080436f6e74726f6c00f2550000b1d3000052656c616369f36e2027464b5f5573756172696f735f47616c657269612720656e747265202747616c6572696127207920275573756172696f73270000002800b50100000700008092000000310000005900000002800000436f6e74726f6c005b57000011d800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002143341208000000901b0000d61b000078563412070000001401000041007300690065006e0074006f0073000000500072006f006700720061006d002000460069006c00650073002000280078003800360029002f004d006900630072006f0073006f00660074002000530051004c0020005300650072007600650072002f003100320030002f0054006f006f006c0073002f00420069006e006e002f004d0061006e006100670065006d0065006e007400530074007500640069006f002f004900440045002f00500072006900760061007400650041007300730065006d0062006c006900650073002f00650073002f004d006900630072006f0073006f00660074002e0053007100000000000000000000000100000005000000540000002c0000002c0000002c00000034000000000000000000000002340000d0170000000000002d010000080000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c80400000000000001000000901b0000d61b000000000000060000000600000002000000020000001c010000cc0c000000000000010000003a180000a70c000000000000040000000400000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000900000041007300690065006e0074006f00730000002143341208000000491b00001e1600007856341207000000140100004100750073007000690063006900610064006f00720065007300000050e637175ce637175ce6371768e6371768e6371774e6371774e6371780e6371780e63717d4e73717d4e73717e0e73717e0e73717ece73717ece73717f8e73717f8e7371704e8371704e837175ce837175ce8371768e8371768e8371774e8371774e8371780e8371780e837178ce837178ce8371798e8371798e8371700000000000000000000000000000000000000003979f10e000600804d006900630072006f0073006f00660074002e00530071006c005300650072007600650072002e0045007800700072006500730073002e004f00000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c09000010020000a0020000d40100003c060000f003000058020000f0030000f80400006c0300000000000001000000491b00001e16000000000000040000000400000002000000020000001c010000080d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000e0000004100750073007000690063006900610064006f00720065007300000021433412080000007e1b0000b50f0000785634120700000014010000430061007400650067006f0072006900610041007300690065006e0074006f000000310033003100300030003000340030003000300030003000310030003000300031003000300032003700320037003300360061006400360065003500660039003500380036006200610063003200640035003300310065006100620063003300610063006300360036003600630032006600380065006300380037003900660061003900340066003800660037006200300033003200370064003200660066003200650064003500320033003400340038006979c10e330600800894097400000000d0230873010000000000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c804000000000000010000007e1b0000b50f000000000000030000000300000002000000020000001c010000cc0c000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f00000011000000430061007400650067006f0072006900610041007300690065006e0074006f00000004000b000eb50000de8a00000eb500004e890000daac00004e890000daac00009e8000000000000002000000f0f0f0000000000000000000000000000000000001000000050000000000000013ae00004c870000970f00005301000032000000010000020000970f0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d611c0046004b005f0041007300690065006e0074006f0073005f00430061007400650067006f0072006900610041007300690065006e0074006f002143341208000000901b0000d813000078563412070000001401000043006500720065006d006f006e0069006100730000006f006e0073005f0053006300720069007000740058006d006c0049006e00640065007800650073005f003100330031003200350032002c0020005000750062006c00690063004b00650079003d00300030003200340030003000300030003000340038003000300030003000300039003400300030003000300030003000300036003000320030003000300030003000300032003400300030003000300035003200350033003400310033003100300030003000340030003000300030003000310030003000300031003000300032003700320037003300000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b0000d813000000000000040000000400000002000000020000001c010000680d000000000000010000003a1800003008000000000000020000000200000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005e00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000b00000043006500720065006d006f006e00690061007300000021433412080000008f1b0000511e000078563412070000001401000043006f006d006900740065004f007200670061006e0069007a00610064006f007200000048bcc87254bcc87254bcc87260bcc87260bcc8726cbcc8726cbcc87278bcc87278bcc87284bcc87284bcc87290bcc87290bcc8729cbcc8729cbcc872a8bcc872a8bcc872b4bcc872b4bcc872c0bcc872c0bcc872d0bcc872d0bcc872e0bcc872e0bcc872ecbcc872ecbcc87200bdc87200bdc87214bdc87214bdc87220bdc87220bdc8722cbdc8722cbdc87238bdc87238bdc8724cbdc8724cbdc87258bdc87258bdc87264bdc87264bdc87270bdc87270bdc8727cbdc8727cbdc87288bdc87288bdc87294bdc87294bd000000000000000000000100000005000000540000002c0000002c0000002c000000340000000000000000000000023400000c1a0000000000002d010000090000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f80700007005000000000000010000008f1b0000511e000000000000070000000700000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000001200000043006f006d006900740065004f007200670061006e0069007a00610064006f00720000002143341208000000901b00002d22000078563412070000001401000043006f006d007000720061005f0045006e00740072006100640061000000891460350f010900000000000000060000000000000000000000000100000001000000000000084688187c72c872acfec972a07ebd721c15c972e0ee0773441600000000000044160000831e0000da16000000000000da160000831e0000701700000000000070170000831e000000000000960000003a18000096000000000000002c0100003a1800002c01000000000000c20100003a180000c201000000000000580200003a1800005802000000000000ee0200003a180000ee02000000000000840300003a180000840300000000000000000000000000000100000005000000540000002c0000002c0000002c00000034000000000000000000000002340000471c0000000000002d0100000a0000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00002d22000000000000080000000800000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f00000043006f006d007000720061005f0045006e007400720061006400610000002143341208000000901b0000550e000078563412070000001401000043006f006d00700072006f00620061006e00740065005000610067006f0000003300640035006300350064006400320064006600630037006200630039003900630035003200380036006200320063003100320035003100310037006200660035006300620065003200340032006200390064003400310037003500300037003300320062003200620064006600660065003600340039006300360065006600620038006500350035003200360064003500320036006600640064003100330030003000390035006500630064006200370062006600320031003000380030003900630036006300640061006400000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b0000550e000000000000020000000200000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000001000000043006f006d00700072006f00620061006e00740065005000610067006f0000002143341208000000901b0000d80f00007856341207000000140100004400650070006f00720074006500440065007300740061006300610064006f00000064003300620032003800660031006600360065003400630038000000630038000000000000000000000000000000000000009a7a520d000500800894097400000000b0e8371702000000000000007480bd727480bd727c80bd727c80bd729c80bd729c80bd72b080bd72b080bd728ce637178ce6371794e6371794e63717a4e63717a4e63717b4e63717b4e63717c4e63717c4e63717d4e63717d4e63717e4e63717e4e63717f4e63717f4e6371704e7371704e7371714e7371714e7371724e7371724e7371734e7371734e7000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b0000d80f000000000000030000000300000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000110000004400650070006f00720074006500440065007300740061006300610064006f0000002143341208000000901b0000381500007856341207000000140100004400650070006f007200740065007300000064003500320033003400340038006600380033006300330064003500630035006400640032006400660063003700620063003900390063003500320038003600620032006300310032003500310031003700620066003500630062006500320034003200620039006400340031003700350030003700330032006200320062006400660066006500360034003900630036006500660062003800650035003500320036006400350032003600660064006400310033003000300039003500650063006400620037006200660032003100300038003000390063003600000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00003815000000000000040000000400000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000090000004400650070006f00720074006500730000002143341208000000901b0000e01600007856341207000000140100004400650070006f00720074006900730074006100730000004ce437174ce4371758e4371758e4371764e4371764e4371770e4371770e437177ce43717f27aaa0e8805008088e4371794e4371794e43717a0e43717a0e43717ace43717ace43717b8e43717b8e43717c4e43717c4e43717d0e43717d0e43717dce43717dce43717e8e43717e8e43717f4e43717f4e4371700e5371700e537170ce537170ce5371718e5371718e5371724e5371724e5371730e5371730e537173ce537173ce5371748e5371748e5371754e5371754e5371760e5371760e537176ce537176ce5371778e5371778e5371784e5371784e5000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b0000e016000000000000050000000500000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000c0000004400650070006f007200740069007300740061007300000021433412080000007e1b0000d10c000078563412070000001401000044006500740061006c006c0065004400650070006f0072007400650000008614f0ba86140500000000000000030000000000000000000000000100000001000000000000a07ebd721c15c972e0ee0773a07ebd721c15c972e0ee0773441600000000000044160000831e0000da16000000000000da160000831e0000701700000000000070170000831e000000000000960000003a18000096000000000000002c0100003a1800002c01000000000000c20100003a180000c201000000000000580200003a1800005802000000000000ee0200003a180000ee02000000000000840300003a180000840300000000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f80700007005000000000000010000007e1b0000d10c000000000000020000000200000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f00000044006500740061006c006c0065004400650070006f00720074006500000021433412080000007d1b00002811000078563412070000001401000044006500740061006c006c0065004500760065006e0074006f007300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f80700007005000000000000010000007d1b00002811000000000000030000000300000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f00000044006500740061006c006c0065004500760065006e0074006f00730000002143341208000000891b0000d7090000785634120700000014010000450073007400610064006f0041007300690065006e0074006f0000000000000000000000000000000000000000000000000000000000000000000000000000008ce637178ce6371794e6371794e63717a4e63717a4e63717b4e63717b4e63717c4e63717c4e63717d4e63717d4e63717e4e63717e4e63717f4e63717f4e6371704e7371704e7371714e7371714e7371724e7371724e7371734e7371734e7371744e7371744e7371754e7371754e7371764e7371764e7371774e7371774e7371784e7371784e7371794e7371794e73717a4e73717a4e73717b4e73717b4e73717c4e73717c4e7371720e8371720e8000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c80400000000000001000000891b0000d709000000000000020000000200000002000000020000001c0100008409000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000e000000450073007400610064006f0041007300690065006e0074006f00000002000b00f2c100003a6b00007eb400003a6b00000000000002000000f0f0f0000000000000000000000000000000000001000000110000000000000035b40000386900000f0e000053010000350000000100000200000f0e0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61190046004b005f0041007300690065006e0074006f0073005f00450073007400610064006f0041007300690065006e0074006f002143341208000000f01c0000d81300007856341207000000140100004500760065006e0074006f0073000000b8e43717b8e43717c4e43717c4e43717d0e43717d0e43717dce43717dce43717e8e43717e8e43717f4e43717f4e4371700e5371700e537170ce537170ce5371718e5371718e5371724e5371724e5371730e5371730e537173ce537173ce5371748e5371748e5371754e5371754e5371760e5371760e537176ce537176ce5371778e5371778e5371784e5371784e5371790e5371790e537179ce537173f78f70fa8080080a8e53717b4e53717b4e53717c0e53717c0e53717cce53717cce53717d8e53717d8e53717e4e53717e4e53717f0e53717f0e53717fce53717fce5000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000f01c0000d813000000000000040000000400000002000000020000001c010000340e000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000080000004500760065006e0074006f00730000002143341208000000981b0000eb0c0000785634120700000014010000460065006300680061004500760065006e0074006f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000981b0000eb0c000000000000030000000300000002000000020000001c010000680d000000000000010000003a1800003008000000000000020000000200000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000c000000460065006300680061004500760065006e0074006f0000002143341208000000901b00007f150000785634120700000014010000470061006c00650072006900610000009cbcc8729cbcc872a8bcc872a8bcc872b4bcc872b4bcc872c0bcc872c0bcc872d0bcc872d0bcc872e0bcc872e0bcc872ecbcc872ecbcc87200bdc87200bdc87214bdc87214bdc87220bdc87220bdc8722cbdc8722cbdc87238bdc87238bdc8724cbdc8724cbdc87258bdc87258bdc87264bdc87264bdc87270bdc87270bdc8727cbdc8727cbdc87288bdc87288bdc87294bdc87294bdc872a0bdc872a0bdc872acbdc872acbdc872b8bdc872b8bdc872c4bdc872c4bdc872d0bdc872d0bdc872dcbdc872dcbdc872e8bdc872e8bdc872f4bdc872f4bdc87200bec87200be000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00007f15000000000000040000000400000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f00000008000000470061006c00650072006900610000002143341208000000901b00007712000078563412070000001401000048006f0072006100720069006f004500760065006e0074006f0073000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c7a840d0003008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00007712000000000000030000000300000002000000020000001c010000680d000000000000010000003a1800003008000000000000020000000200000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f00000048006f0072006100720069006f004500760065006e0074006f007300000003000b00924e000032af00009c63000032af00009c6300005da400000000000002000000f0f0f00000000000000000000000000000000000010000001700000000000000055f0000e1af0000c31000005301000032000000010000020000c3100000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d611d0046004b005f0048006f0072006100720069006f004500760065006e0074006f0073005f00460065006300680061004500760065006e0074006f0021433412080000009d1b00002c14000078563412070000001401000049006e0073007400690074007500630069006f006e0061006c000000d4bec872e0bec872e0bec872ecbec872ecbec87200bfc87200bfc8720cbfc8720cbfc87218bfc87218bfc87224bfc87224bfc87238bfc87238bfc87244bfc87244bfc87250bfc87250bfc8725cbfc8725cbfc87268bfc87268bfc87274bfc87274bfc87280bfc87280bfc8728cbfc8728cbfc872a4bfc872a4bfc872b0bfc872b0bfc872bcbfc872bcbfc872c8bfc872c8bfc872d4bfc872d4bfc872e0bfc872e0bfc872ecbfc872ecbfc872f8bfc872f8bfc87204c0c87204c0c87210c0c87210c0c8721cc0c8721cc0c87228c0c87228c0000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c804000000000000010000009d1b00002c14000000000000040000000400000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000e00000049006e0073007400690074007500630069006f006e0061006c0000002143341208000000901b0000891000007856341207000000140100004d006500640061006c006c0061007300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00008910000000000000030000000300000002000000020000001c010000680d000000000000010000003a1800003008000000000000020000000200000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000090000004d006500640061006c006c0061007300000021433412080000008f1b0000241f00007856341207000000140100004d0065006e0075005000720069006e0063006900700061006c0000006c005300650072007600650072002e0045007800700072006500730073002e00530071006c004d0061006e006100670065007200550049002c0020005000750062006c00690063004b00650079003d0030003000320034003000300030003000300034003800300030003000300030003900340030003000300030003000300030003600300032003000300030003000300030003200340030003000300030003500320035003300340031003300310030003000300034003000300030003000300031003000300030003100300030003200000000000000000000000100000005000000540000002c0000002c0000002c000000340000000000000000000000023400000c1a0000000000002d010000090000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c804000000000000010000008f1b0000241f000000000000070000000700000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000e0000004d0065006e0075005000720069006e0063006900700061006c0000002143341208000000741b00003b0d00007856341207000000140100004d006f006e0065006400610000009904d4d39904e0d3990420d499042cd4990438d49904a8d49904b4d49904f4d49904c4d59904d0d599049cd69904a8d69904e8d6990404d7990430d79904a0d79904acd7990430d899043cd899047cd8990488d8990494d8990404d9990410d9990450d9990420da99042cda9904acda9904b8da9904f8da990404db990420db990490db99049cdb9904dcdb9904acdc9904b8dc990458469a0484469a0490469a04f0dd9904f4de9904b4e09904d0469a04184f9a04244f9a04f0469a04fc469a0428e199046c479a0478479a04b8479a0404e4990450e499040ce59904bce5000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c80400000000000001000000741b00003b0d000000000000020000000200000002000000020000001c010000a80c000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000070000004d006f006e00650064006100000021433412080000007e1b000042140000785634120700000014010000500072006500670075006e007400610073004600720065006300750065006e007400650073000000603c1a15303d1a153c3d1a15a0a21915a4a3191564a51915c8461a15d4461a1514471a15e4471a15f0471a15d8a51915d0a719158ca819153ca9191548a91915a8a9191564aa191514ab191520ab191574ab191530ac1915e0ac1915ecac191570ad19157cad1915c8ad191570ae191528af191598af1915a4af1915e4af1915b4b01915c0b01915ecb21915f8b2191544b3191550b319156cb31915dcb31915e8b319154cb4191558b4191598b41915a4b41915ccb419153cb5191548b5191568b51915e8b5000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c0900007c02000024030000280200003c060000b0040000d0020000b0040000f40500001404000000000000010000007e1b00004214000000000000030000000300000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000007000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f00000014000000500072006500670075006e007400610073004600720065006300750065006e0074006500730000002143341208000000491b0000ac140000785634120700000014010000520061006e006b0069006e00670000002c401a1578d9191570db19152cdc1915dcdc1915e8dc191548dd191504de1915b4de1915c0de191514df1915d0df191580e019158ce0191510e119151ce1191568e1191510e21915c8e2191538e3191544e3191584e3191554e4191560e419158ce6191598e61915e4e61915f0e619150ce719157ce7191588e71915ece71915f8e7191538e8191544e819156ce81915dce81915e8e8191508e9191588e91915c0e91915cce91915cced1915d8ed191524ee191560ee19157cee1915ecee1915f8ee191504f0191510f0191550f0191598f01915f0f0191560f119156cf1000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000491b0000ac14000000000000030000000300000002000000020000001c010000440d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005800000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f00000008000000520061006e006b0069006e00670000002143341208000000901b0000ad0c00007856341207000000140100005200650067006c0061006d0065006e0074006f0000009a04404a9a04804a9a0424129a0430129a04a0129a04ac129a04ec129a04f8129a0404139a0474139a0480139a04c0139a0490149a049c149a0458159a0464159a04a4159a04c0159a04ec159a045c169a0468169a04ec169a04f8169a0438179a0444179a0450179a04c0179a04cc179a040c189a04dc189a04e8189a0458199a0464199a04a4199a04b0199a04cc199a043c1a9a04481a9a04881a9a04581b9a04641b9a049c4a9a04c84a9a04384b9a049c1c9a04a01d9a04601f9a04444b9a04c84b9a04d44b9a04144c9a04204c9a04d41f9a042c4c000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b0000ad0c000000000000020000000200000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005e00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000b0000005200650067006c0061006d0065006e0074006f0000002143341208000000b31b0000a40d00007856341207000000140100005200650070006f0072007400650045006e0074007200610064006100000096044c389604083996047c39960488399604e405980400069804444496043c3e990450449604d4449604e04496040c4596041845960448459604644596043006980494459604a0459604344696047c469604ac4696041c47960428479604504d9604480698045c4d9604cc4d9604d84d9604f44d960490079804304e9604484e9604b84e96049c079804c44e9604344f9604404f96045c4f9604180898048c4f9604a44f9604d0509604545196043c089804580898046c519604dc519604e851960404529604c8089804d40898040009000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c80400000000000001000000b31b0000a40d000000000000020000000200000002000000020000001c010000200d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f0000005200650070006f0072007400650045006e0074007200610064006100000021433412080000008f1b0000280f000078563412070000001401000052006500700072006500730065006e00740061006e0074006500730000009904d8979904e4979904309899044c98990478989904e8989904f49899047899990484999904c4999904d0999904dc9999044c9a9904589a9904989a9904689b9904749b9904e89b9904f49b9904409c99044c9c9904689c9904d89c9904e49c9904249d9904f49d9904009e990448429a04bc429a04c8429a04389f99043ca09904fca19904e84c9a04b84d9a04c44d9a041c439a048c439a0470a2990498439a04d8439a04a8449a044ca5990498a5990454a6990404a7990410a7990470a799042ca89904dca89904e8a899043ca9000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f80700007005000000000000010000008f1b0000280f000000000000020000000200000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f00000052006500700072006500730065006e00740061006e0074006500730000002143341208000000b21b00000e0e0000785634120700000014010000530074006f0063006b0041007300690065006e0074006f0073000000f85696043c5796042459960464599604205a9604605a96046c5a9604f05a9604a05b9604d05b9604f45b9604645c9604705c9604f8139804101498042c149804f83e99045c149804985f9604746696049814980480669604f0669604fc669604186796045c1c980454679604a8679604886a9604043f9904946a9604046b9604106b96042c6b9604781c9804686b9604bc6b96040c6e9604286e9604446e9604e81c9804f41c9804786e9604906e9604cc6e9604c46f9604c0729604047396045c7a9604101d9804687a9604ec7a9604f87a000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000e8020000a8030000880200003c0600007c050000480300007c050000f0060000c80400000000000001000000b21b00000e0e000000000000020000000200000002000000020000001c010000cc0c000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000e000000530074006f0063006b0041007300690065006e0074006f007300000002000b0038c700001e7800007eb400001e7800000000000002000000f0f0f00000000000000000000000000000000000010000002300000000000000d3b60000cd780000f80d00005301000033000000010000020000f80d0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61190046004b005f0041007300690065006e0074006f0073005f00530074006f0063006b0041007300690065006e0074006f00730021433412080000007e1b0000391300007856341207000000140100005400690070006f004100750073007000690063006900610064006f007200650073000000a0f29904acf29904c4f69904d0f699041cf7990458f7990474f79904e4f79904f0f79904fcf8990408f9990448f9990490f99904e8f9990458fa990464fa9904a4fa9904f8fa9904e4fb9904f0fb990490009a049c009a04e8009a0424019a0440019a04b0019a04bc019a0420029a042c029a046c029a0478029a0484029a04f4029a040c039a044c039a04a0039a048c049a0498049a04b0079a04bc079a04fc079a0408089a0424089a0494089a04a0089a04e0089a04b0099a04bc099a04940a9a04a00a9a04e00a000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c09000010020000a0020000d40100003c060000f003000058020000f0030000f80400006c03000000000000010000007e1b00003913000000000000030000000300000002000000020000001c010000200d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000120000005400690070006f004100750073007000690063006900610064006f0072006500730000002143341208000000d61b0000ac1400007856341207000000140100005400690070006f0043006500720065006d006f006e00690061007300000098045c2e9804682e9804503a98046c3a9804d83a9804a4449904f43a9804783b9804843b9804a03b9804b0449904ec3b9804283c9804843d9804b03d9804243e9804fc449904303e9804b43e9804c03e9804dc3e980438459904283f9804883f98040c409804c8409804548896046088960408419804144198046c889604f08896040889960414899604308996044c89960454459904c4459904a0899604ac899604c4899604dc8996040c429804c842980484439804c4439804d0439804d045990484449804dc4699046c8a9604788a000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000d61b0000ac14000000000000040000000400000002000000020000001c010000980d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006600000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000f0000005400690070006f0043006500720065006d006f006e00690061007300000002000b00e268000006f90000e268000028f000000000000002000000f0f0f0000000000000000000000000000000000001000000270000000000000091690000c7f3000009110000530100003400000001000002000009110000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d611c0046004b005f0043006500720065006d006f006e006900610073005f005400690070006f0043006500720065006d006f006e006900610073002143341208000000891b0000780e00007856341207000000140100005400690070006f0049006e0073007400690074007500630069006f006e0061006c0000003c281915ac281915b8281915c4291915d0291915102a1915582a1915b02a1915202b19152c2b19156c2b1915c02b1915ac2c1915b82c1915183119152431191570311915ac311915c83119153832191544321915a8321915b4321915f4321915003319150c3319157c33191594341a15c8341915d434191514351915203519153c351915ac351915b8351915f83519154c3619153837191544371915383819154438191590381915f03819156c391915dc391915e8391915283a1915f83a1915043b1915303f19153c3f000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c09000010020000a0020000d40100003c060000f003000058020000f0030000f80400006c0300000000000001000000891b0000780e000000000000040000000400000002000000020000001c010000380d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000120000005400690070006f0049006e0073007400690074007500630069006f006e0061006c00000021433412080000008f1b0000c80d00007856341207000000140100005400690070006f004d006500640061006c006c0061000000f4bb8e0484bc8e040cbd8e04980d9304988a9204bc8a9204a40d9304f80d9304b40e9304640f9304700f93043c109304481093048810930494109304bc1093042c1193043811930464119304701193044c13930408149304b8149304c414930424159304e0159304948b9204901693049c169304f0169304ac1793045c189304681893043419930440199304644f9a0434509a0440509a04743d9a04803d9a04c03d9a04e01e990410bf9504f8bf9504ec1e990400005000520049004d004100520059000000990498649904a4649904e46499042420000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f80700007005000000000000010000008f1b0000c80d000000000000020000000200000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000c0000005400690070006f004d006500640061006c006c006100000002000b00baaffffffef10000baafffffbfe800000000000002000000f0f0f00000000000000000000000000000000000010000002b0000000000000069b0ffff78ec0000400d00005301000035000000010000020000400d0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61170046004b005f004d006500640061006c006c00610073005f005400690070006f004d006500640061006c006c0061002143341208000000901b00000e0e00007856341207000000140100005400690070006f004d006f006e0065006400610000009604c4499904d0499904b08e9604bc8e9604c88e96042c90960458909604c8909604304e9904d4909604449196045c919604789196043c4e9904a8919604c09196045c92960468929604884e9904c44e990474929604e4929604f09296040c939604e04e9904504f9904509396045c93960474939604ec939604f89396045c4f9904c04f9904149496048494960490949604ac949604cc4f9904c04a9804f0949604fc94960450959604d4959604e0959604004b9804d04b980474969604e4969604f09696040c979604dc4b9804b04c9804509796045c97000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00000e0e000000000000020000000200000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005e00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000b0000005400690070006f004d006f006e00650064006100000021433412080000007e1b0000cf1200007856341207000000140100005400690070006f00500072006500670075006e00740061000000191584c4191590c4191500c519150cc519154cc519151cc6191528c6191504c7191578c7191584c719157c3d1a15ec3d1a15f83d1a15d8c7191548c8191554c8191594c8191564c9191570c919154cca191558ca1915243e1a15303e1a15703e1a15e8321b1558331b15a4ca191514cb191520cb19154ccb191558cb191598cb1915903e1a159c3e1a15b8cb1915c4cb191534cc191540cc191580cc19158ccc191598cc191508cd191514cd191554cd191524ce191530ce1915f0ce1915fcce191548cf191564cf191590cf191500d019150cd0000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c09000010020000a0020000d40100003c060000f003000058020000f0030000f80400006c03000000000000010000007e1b0000cf12000000000000040000000400000002000000020000001c010000200d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006200000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000d0000005400690070006f00500072006500670075006e007400610000002143341208000000901b00003b0d00007856341207000000140100005400690070006f0052006500700072006500730065006e00740061006e00740065000000c8619804d4619804c4b79604dcb796040cb8960414c0960420c196042cc1960428629804e462980438c19604a8c19604b4c19604e0c19604246398043063980430c296046cc2960484c29604f4c2960400c3960440c396047cc39604c4c3960434c496044cc49604d4c69604e0c69604906398044c649804ecc696045cc7960468c7960484c796048c64980498649804d4c7960410c896041cc8960498c89604a4c89604ec6498044065980410c9960480c996048cc99604a8c996042c66980438669804ecc99604f8c9000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c09000010020000a0020000d40100003c060000f003000058020000f0030000f80400006c0300000000000001000000901b00003b0d000000000000020000000200000002000000020000001c010000200d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000120000005400690070006f0052006500700072006500730065006e00740061006e0074006500000021433412080000007e1b00000c1400007856341207000000140100005400690070006f00530065006400650073000000cce89604e8e8960400599904185999042ce9960438e99604b4e99604d4eb9604e0eb960458599904285a9904eceb96045cec960468ec960484ec9604345a9904949b9804c8ec9604d4ec9604f8ec96040cf896046cf9960478f99604c4f9960400fa96040cfa96047cfa960488fa9604f8fa960404fb960444fb960480fb9604bcfb96042cfc960444fc9604b4fc9604c0fc9604045b9904785b9904ccfc96043cfd960448fd960464fd9604845b9904d49b9804a8fd9604b4fd9604ccfd960400009704109c9804649c980490a0980404689904c8a1980438a2000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f80700007005000000000000010000007e1b00000c14000000000000030000000300000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005c00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000a0000005400690070006f005300650064006500730000002143341208000000731b0000e90a00007856341207000000140100005400690070006f005500730075006100720069006f000000782f9a04842f9a04c42f9a04d02f9a04f82f9a0468309a0474309a0494309a0414319a044c319a0458319a0470359a047c359a04c8359a0404369a0420369a0490369a049c369a0400379a040c379a044c379a0458379a0464379a04d4379a04e0379a0420389a0474389a046c399a0478399a04843c9a04903c9a04dc3c9a04e83c9a04043d9a041c491b15cc321b150c10191510111915d01219152c301a1524311a1530311a153c341a1548341a15381319153c151915f8151915a8161915b416191508171915c4171915ab1500be1a493e00c000000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000731b0000e90a000000000000020000000200000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000006000000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000c0000005400690070006f005500730075006100720069006f00000021433412080000000a2000002e1e00007856341207000000140100005500730075006100720069006f00730000001915c04b1915b84c1915c44c1915d04f1915dc4f19152850191534501915505019156b15007e5a493e00c0000401502b220de8511915c4521915d0521915105319151c5319152853191598531915a4531915e4531915b4541915c05419159c551915105619151c561915a0341a15bc341a152c351a1570561915e0561915ec5619152c571915fc57191508581915ec581915f858191538351a1578351a1548361a1554361a151c371a1544591915b4591915c0591915ec591915f8591915385a191528371a1568371a15585a1915645a1915d45a1915e05a1915205b000000000000000000000100000005000000540000002c0000002c0000002c00000034000000000000000000000002340000831e0000000000002d0100000b0000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f80700007005000000000000010000000a2000002e1e000000000000090000000900000002000000020000001c010000f00f000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005a00000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f000000090000005500730075006100720069006f00730000002143341208000000981b0000810c000078563412070000001401000048006f00720061000000980430df980428e0980434e0980440e398044ce3980498e39804a4e39804c0e3980430e498043ce498047ce498044ce5980458e598041ce6980428e6980468e6980474e6980480e69804f0e69804fce698043ce798040ce8980418e89804f4e8980468e9980474e99804605f9904a05f99045c6b9904c8e9980438ea980444ea980484ea980454eb980460eb980424ec980430ec98041c6d9904c05f9904cc5f99043c609904486099047cec9804ecec9804f8ec980424ed980430ed980470ed9804886099049460990490ed98049ced98040cee980418ee980458ee980464ee980470ee000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000981b0000810c000000000000030000000300000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005200000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000500000048006f0072006100000002000b000a4100005cc100000a4100006db700000000000002000000f0f0f00000000000000000000000000000000000010000003400000000000000b9410000a5bb0000710b00005301000033000000010000020000710b0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61130046004b005f00460065006300680061004500760065006e0074006f005f0048006f00720061002143341208000000901b00005e0d00007856341207000000140100005000610069007300000099044c379904d0379904dc37990428389904d0389904e414960454159604601596047c15960488399904f8399904043a9904443a9904143b9904203b99044c3d9904583d9904bc159604f0019804a43d9904fc0198046c029804e4159604f0159604081696043816960478029804b01a960494029804b03d9904c82096048421960440229604802296048c229604882396044c2596041c26960428269604d0029804e802980434269604a4269604b0269604dc2696041c059804cc3d99042c2796046827960480279604fc2796040828960448289604902896049c2896040c2996041829000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00005e0d000000000000020000000200000002000000020000001c0100005c0d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005200000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f00000005000000500061006900730000002143341208000000901b000092130000785634120700000014010000530065006400650073000000806219158c621915cc6219159c631915a863191574371a1580371a15f0371a15e0641915e4651915a4671915fc371a153c381a150c391a1518391a15f4391a1518681915106a1915cc6a19157c6b1915886b1915e86b1915a46c1915546d1915606d1915b46d1915706e1915206f19152c6f1915b06f1915bc6f191508701915b070191568711915d8711915e471191524721915f4721915007319152c751915387519158475191590751915ac7519151c761915287619158c76191598761915d8761915e47619150c7719157c77191588771915a877191528781915607819156c78000000000000000000000100000005000000540000002c0000002c0000002c0000003400000000000000000000000234000095150000000000002d010000070000000c000000070000001c010000880b00006c090000480300002c040000e80200003c06000048060000c003000048060000f8070000700500000000000001000000901b00009213000000000000040000000400000002000000020000001c010000680d000000000000010000003a180000f405000000000000010000000100000002000000020000001c010000880b000001000000000000003a180000b903000000000000000000000000000002000000020000001c010000880b000000000000000000002b3f0000fa22000000000000000000000d00000004000000040000001c010000880b0000a40d00005808000078563412040000005400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000600000053006500640065007300000002000b0006180000fe8a000006180000e69100000000000002000000f0f0f00000000000000000000000000000000000010000003800000000000000410c0000c88d0000160b00005301000032000000010000020000160b0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61120046004b005f00530065006400650073005f005400690070006f005300650064006500730002000b00e4a2000040190100e4a20000ba1301000000000002000000f0f0f00000000000000000000000000000000000010000003a0000000000000093a30000d31501002f14000053010000320000000100000200002f140000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61230046004b005f00500072006500670075006e007400610073004600720065006300750065006e007400650073005f005400690070006f00500072006500670075006e007400610002000b000cc6000082f500000cc6000054ee00000000000002000000f0f0f00000000000000000000000000000000000010000003c00000000000000bbc6000041f1000003130000530100003200000001000002000003130000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61220046004b005f004100750073007000690063006900610064006f007200650073005f005400690070006f004100750073007000690063006900610064006f0072006500730002000b0030750000be6e000082470000be6e00000000000002000000f0f0f00000000000000000000000000000000000010000003e0000000000000005500000bc6c0000a31400005301000042000000010000020000a3140000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61210046004b005f0043006f006d00700072006f00620061006e00740065005000610067006f005f0043006f006d007000720061005f0045006e007400720061006400610002000b00da160000ccc40000da16000052cb00000000000002000000f0f0f000000000000000000000000000000000000100000044000000000000003308000065c70000f80d00005301000032000000010000020000f80d0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61190046004b005f0044006500740061006c006c0065004500760065006e0074006f0073005f004500760065006e0074006f00730002000b00420f0000f824010080250000f82401000000000002000000f0f0f00000000000000000000000000000000000010000004600000000000000430f0000a72501002b16000053010000090000000100000200002b160000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61260046004b005f0043006f006d006900740065004f007200670061006e0069007a00610064006f0072005f005400690070006f0052006500700072006500730065006e00740061006e007400650002000b00dc500000f01d01000f410000f01d01000000000002000000f0f0f00000000000000000000000000000000000010000004800000000000000bb400000ee1b010075140000530100005d00000001000002000075140000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61230046004b005f0043006f006d006900740065004f007200670061006e0069007a00610064006f0072005f0052006500700072006500730065006e00740061006e0074006500730002000b00beb900000cc6000071b000000cc600000000000002000000f0f0f00000000000000000000000000000000000010000004a000000000000006dae00000ac4000009110000530100004a00000001000002000009110000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61220046004b005f0049006e0073007400690074007500630069006f006e0061006c005f005400690070006f0049006e0073007400690074007500630069006f006e0061006c0002000b00ca9e000078ff0000ca9e000086f800000000000002000000f0f0f00000000000000000000000000000000000010000004c00000000000000a689000055fb000075140000530100003200000001000002000075140000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61240046004b005f004d0065006e0075005000720069006e0063006900700061006c005f00500072006500670075006e007400610073004600720065006300750065006e0074006500730006000b007a58000058980000a239000058980000a239000075980000812b000075980000812b00008ab10000502600008ab100000000000002000000f0f0f00000000000000000000000000000000000010000004e00000000000000c3270000739600003c0e0000530100002d0000000100000200003c0e0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61190046004b005f004500760065006e0074006f0073005f0048006f0072006100720069006f004500760065006e0074006f00730004000b00d4feffff4208010034efffff4208010034efffff6e09010096e8ffff6e0901000000000002000000f0f0f00000000000000000000000000000000000010000005000000000000000e3efffff78090100f80d00005301000045000000010000020000f80d0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61180046004b005f004400650070006f00720074006500440065007300740061006300610064006f005f00500061006900730004000b006087000014cd00002b8d000014cd00002b8d0000f8d9000012930000f8d900000000000002000000f0f0f00000000000000000000000000000000000010000005200000000000000da8d00009acf0000400d0000530100002a000000010000020000400d0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61180046004b005f004d0065006e0075005000720069006e0063006900700061006c005f00470061006c00650072006900610002000b0094110000ac07010094110000fafb00000000000002000000f0f0f0000000000000000000000000000000000001000000560000000000000043120000da0001005d0a000053010000350000000100000200005d0a0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61130046004b005f004400650070006f0072007400690073007400610073005f00500061006900730004000b00bec0ffff42bd0000b302000042bd0000b302000060ea00007a0d000060ea00000000000002000000f0f0f0000000000000000000000000000000000001000000580000000000000022f1fffff1bd0000e30c00005301000032000000010000020000e30c0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d61170046004b005f004400650070006f0072007400690073007400610073005f004400650070006f00720074006500730004000b00f4cfffff079a0000f4cfffff65a40000b0b9ffff65a40000b0b9ffff5eb000000000000002000000f0f0f00000000000000000000000000000000000010000005a00000000000000adbcffff63a20000b00e00005301000020000000010000020000b00e0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d611a0046004b005f004400650070006f0072007400650073005f0044006500740061006c006c0065004400650070006f0072007400650002000b0028b90000a8de0000a1ae0000a8de00000000000002000000f0f0f00000000000000000000000000000000000010000005d000000000000007eab0000a6dc0000c31000005301000032000000010000020000c3100000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d611e0046004b005f004d0065006e0075005000720069006e0063006900700061006c005f004100750073007000690063006900610064006f0072006500730002000b00349e00009ad20000349e000062d900000000000002000000f0f0f00000000000000000000000000000000000010000005f00000000000000c08d000053d50000c50f00005301000032000000010000020000c50f0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d611e0046004b005f004d0065006e0075005000720069006e0063006900700061006c005f0049006e0073007400690074007500630069006f006e0061006c0002000b00ee9800003a6b0000c09000003a6b00000000000002000000f0f0f00000000000000000000000000000000000010000006100000000000000168d000038690000800f00005301000032000000010000020000800f0000530100000200000000000500008008000080010000001500010000009001b0300100065461686f6d611a0046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f0041007300690065006e0074006f00730004000b00fa32000038120100fa320000f80e0100a8930000f80e0100a893000086f800000000000002000000f0f0f000000000000000000000000000000000000100000063000000000000009c890000a70f01008e13000053010000490000000100000200008e13000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61220046004b005f004d0065006e0075005000720069006e0063006900700061006c005f0043006f006d006900740065004f007200670061006e0069007a00610064006f00720004000b0054d9fffff4b00000c2c9fffff4b00000c2c9fffff4b00000bec0fffff4b000000000000002000000f0f0f0000000000000000000000000000000000001000000650000000000000045bffffff2ae0000400d00005301000032000000010000020000400d000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61160046004b005f004400650070006f0072007400650073005f005200650067006c0061006d0065006e0074006f0002000b0074aaffff5eb0000074aaffff7e6f00000000000002000000f0f0f0000000000000000000000000000000000001000000670000000000000023abffff029d0000240f0000530100001c000000010000020000240f000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d611a0046004b005f005200650070006f0072007400650045006e00740072006100640061005f004400650070006f00720074006500730002000b00dc830000b0e5000012930000b0e500000000000002000000f0f0f00000000000000000000000000000000000010000006900000000000000948300005fe60000c50f00005301000032000000010000020000c50f000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d611b0046004b005f004d0065006e0075005000720069006e0063006900700061006c005f0043006500720065006d006f006e0069006100730005000b00ea240000e6910000ea2400003a840000175c00003a840000175c00004a790000307500004a7900000000000002000000f0f0f00000000000000000000000000000000000010000006b00000000000000c3290000e9840000540e00005301000011000000010000020000540e000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61170046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f005300650064006500730002000b004e0c000078a500004e0c0000f4b000000000000002000000f0f0f00000000000000000000000000000000000010000006d00000000000000fb0100008caa0000a40900005301000032000000010000020000a409000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61100046004b005f004500760065006e0074006f0073005f005300650064006500730002000b0016c3ffffccd80000fcd6ffffccd800000000000002000000f0f0f000000000000000000000000000000000000100000075000000000000007ec7ffffcad60000160b00005301000032000000010000020000160b000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61130046004b005f00520061006e006b0069006e0067005f004d006500640061006c006c006100730002000b0092d7ffff06e7000092d7ffff32fa00000000000002000000f0f0f00000000000000000000000000000000000010000007700000000000000efc6fffff2ef0000f40f00005301000032000000010000020000f40f000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d611b0046004b005f004400650070006f00720074006500440065007300740061006300610064006f005f00520061006e006b0069006e00670004000b00bec0ffff78b4000032fbffff78b4000032fbffff0285000072060000028500000000000002000000f0f0f00000000000000000000000000000000000010000007900000000000000e1fbffff03b20000860c00005301000035000000010000020000860c000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61150046004b005f005400690070006f00530065006400650073005f004400650070006f00720074006500730008000b008e8f000010a400008e8f00004ea20000e29a00004ea20000e29a00007a9e0000648f00007a9e0000648f0000279a0000b09a0000279a0000b09a0000199800000000000002000000f0f0f00000000000000000000000000000000000010000007b0000000000000085950000789c0000e30c00005301000032000000010000020000e30c000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61140046004b005f004d006f006e006500640061005f005400690070006f004d006f006e0065006400610004000b000e6a0000e69100000e6a000090860000c675000090860000c6750000718300000000000002000000f0f0f00000000000000000000000000000000000010000007f00000000000000096f00003f870000ed120000530100003c000000010000020000ed12000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61200046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f0048006f0072006100720069006f004500760065006e0074006f00730002000b0024900000de8a000024900000718300000000000002000000f0f0f00000000000000000000000000000000000010000008100000000000000d39000007e8600003a0f000053010000320000000100000200003a0f000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61180046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f004d006f006e0065006400610002000b00a3c2ffffc864000030750000c86400000000000002000000f0f0f0000000000000000000000000000000000001000000830000000000000018200000c662000032130000530100003b0000000100000200003213000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61200046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f005200650070006f0072007400650045006e007400720061006400610003000b00bec0ffffc6c0000004deffffc6c0000004deffff5ad200000000000002000000f0f0f000000000000000000000000000000000000100000085000000000000008bcfffff75c100002d0b000053010000350000000100000200002d0b000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61130046004b005f00520061006e006b0069006e0067005f004400650070006f00720074006500730004000b007a0d0000d2f00000dbfbffffd2f00000dbfbffff3edf000045f2ffff3edf00000000000002000000f0f0f000000000000000000000000000000000000100000087000000000000008afcffffd6eb0000590c0000530100002e000000010000020000590c000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61160046004b005f00520061006e006b0069006e0067005f004400650070006f00720074006900730074006100730002000b008a1b00001ae500008a1b00007adc00000000000002000000f0f0f00000000000000000000000000000000000010000008900000000000000391c000020e00000c50f00005301000032000000010000020000c50f000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d611d0046004b005f0044006500740061006c006c0065004500760065006e0074006f0073005f004400650070006f00720074006900730074006100730002000b00624300000e0001006243000090f700000000000002000000f0f0f00000000000000000000000000000000000010000008b000000000000001144000025fb0000110d00005301000032000000010000020000110d000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61170046004b005f005500730075006100720069006f0073005f005400690070006f005500730075006100720069006f002143341208000000fb1700008c0a0000785634120700000014010000450073007400610064006f005500730075006100720069006f000000050000000100000000000000000000000000000000000000060000000a000000000000000000000000000000000000000000000001000000030000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000c411f7758ca80d0c8ca80d0c000000000000000000000000040000000000000000000000010000000300000000000000c0a80d0c0600000000000000d0a80d0cfeffffff4e0100000c000000020000000100000000000000000000000100000005000000540000002c0000002c0000002c000000340000000000000000000000802a0000bf150000000000002d010000070000000c000000070000001c0100003c0900008c070000480300002c040000e8020000f804000048060000c003000048060000f8070000700500000000000001000000fb1700008c0a000000000000020000000200000002000000020000001c010000640b00000000000001000000421400000906000000000000010000000100000002000000020000001c0100003c090000010000000000000042140000b903000000000000000000000000000002000000020000001c0100003c09000000000000000000006e3300004e23000000000000000000000d00000004000000040000001c0100003c090000ec0a0000a806000078563412040000006400000001000000010000000b000000000000000100000002000000030000000400000005000000060000000700000008000000090000000a00000004000000640062006f0000000e000000450073007400610064006f005500730075006100720069006f00000002000b00085200007ecc00000852000062d900000000000002000000f0f0f00000000000000000000000000000000000010000008e000000000000001d430000d3d000003c0e000053010000260000000100000200003c0e000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61190046004b005f005500730075006100720069006f0073005f00450073007400610064006f005500730075006100720069006f0002000b001437000068f100000a29000068f100000000000002000000f0f0f00000000000000000000000000000000000010000009000000000000000b429000066ef0000b50c00005301000032000000010000020000b50c000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61170046004b005f004400650070006f0072007400690073007400610073005f005500730075006100720069006f00730004000b00d06b000048d500009562000048d5000095620000c2e200001e570000c2e200000000000002000000f0f0f000000000000000000000000000000000000100000092000000000000005b57000011d800008b0a000053010000290000000100000200008b0a000053010000020000000000ffffff0008000080010000001500010000009001b0300100065461686f6d61130046004b005f005500730075006100720069006f0073005f00470061006c0065007200690061000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000fefffffffeffffff0400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f00000020000000210000002200000023000000240000002500000026000000270000002800000029000000fefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0100feff030a0000ffffffff00000000000000000000000000000000170000004d6963726f736f66742044445320466f726d20322e300010000000456d626564646564204f626a6563740000000000f439b271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000c0000000b0000004e61bc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000dbe6b0e91c81d011ad5100a0c90f57390000020090c24569a707d5010202000010484500000000000000000000000000000000008a0100004400610074006100200053006f0075007200630065003d004c004100500054004f0050002d00430045005300410052003b0049006e0069007400690061006c00200043006100740061006c006f0067003d00420044005400650063006e006f0053006500720076003b005000650072007300690073007400200053006500630075007200690074007900200049006e0066006f003d0054007200750065003b0055007300650072002000490044003d00730061003b004d0075006c007400690070006c00650041006300740069007600650052006500730075006c00740053006500740073003d00460061006c00730065003b005000610063006b00650074002000530069007a000300440064007300530074007200650061006d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000ffffffff00000000000000000000000000000000000000000000000000000000000000000000000062000000ff7000000000000053006300680065006d00610020005500440056002000440065006600610075006c0074000000000000000000000000000000000000000000000000000000000026000200ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002d0053004300480045004d0041002d0043004f004e00540045004e0054005300000000000000000000000000000000000000000000002c0002010500000007000000ffffffff000000000000000000000000000000000000000000000000000000000000000000000000030000008e0900000000000053006300680065006d00610020005500440056002000440065006600610075006c007400200050006f007300740020005600360000000000000000000000000036000200ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000002a00000012000000000000008100000082000000830000008400000085000000860000008700000088000000890000008a0000008b0000008c0000008d0000008e0000008f000000900000009100000092000000930000009400000095000000960000009700000098000000990000009a000000feffffff9c0000009d0000009e0000009f000000feffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0c00000066e6ffff009900000100260000007300630068005f006c006100620065006c0073005f00760069007300690062006c0065000000010000000b0000001e000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003200370036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000020000000200000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003300330036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000030000000300000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003200370036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000000400000004000000000000004a000000016a7b5401000000640062006f00000046004b005f0041007300690065006e0074006f0073005f00430061007400650067006f0072006900610041007300690065006e0074006f0000000000000000000000c402000000000500000005000000040000000800000001bc6614a8bc66140000000000000000ad070000000000060000000600000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000070000000700000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000080000000800000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000090000000900000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000000a0000000a00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000000b0000000b00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000000c0000000c00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000000d0000000d00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000000e0000000e00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000000f0000000f00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003400330036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c003200310033003600000010000000100000000000000044000000013d355401000000640062006f00000046004b005f0041007300690065006e0074006f0073005f00450073007400610064006f0041007300690065006e0074006f0000000000000000000000c402000000001100000011000000100000000800000001be661468be66140000000000000000ad070000000000120000001200000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003600330036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000130000001300000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000140000001400000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000150000001500000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000001600000016000000000000004c000000016a7b5401000000640062006f00000046004b005f0048006f0072006100720069006f004500760065006e0074006f0073005f00460065006300680061004500760065006e0074006f0000000000000000000000c402000000001700000017000000160000000800000001c2661468c266140000000000000000ad070000000000180000001800000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000190000001900000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000001a0000001a00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000001b0000001b00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003200340030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000001c0000001c00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000001d0000001d00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003300390036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000001e0000001e00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000001f0000001f00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003300360030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000200000002000000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000210000002100000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003200370036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000220000002200000000000000440000000100270001000000640062006f00000046004b005f0041007300690065006e0074006f0073005f00530074006f0063006b0041007300690065006e0074006f00730000000000000000000000c402000000002300000023000000220000000800000001c0661468c066140000000000000000ad070000000000240000002400000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003300360030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000250000002500000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400380030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000002600000026000000000000004a000000016a7b5401000000640062006f00000046004b005f0043006500720065006d006f006e006900610073005f005400690070006f0043006500720065006d006f006e0069006100730000000000000000000000c402000000002700000027000000260000000800000001bc661428bc66140000000000000000ad070000000000280000002800000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003300380034000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000290000002900000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000002a0000002a0000000000000040000000016a7b5401000000640062006f00000046004b005f004d006500640061006c006c00610073005f005400690070006f004d006500640061006c006c00610000000000000000000000c402000000002b0000002b0000002a0000000800000001be661428be66140000000000000000ad0700000000002c0000002c00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000002d0000002d00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003300360030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000002e0000002e00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003300360030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000002f0000002f00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000300000003000000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000310000003100000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0034003000380030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000320000003200000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000003300000033000000000000003800000001b1801401000000640062006f00000046004b005f00460065006300680061004500760065006e0074006f005f0048006f007200610000000000000000000000c402000000003400000034000000330000000800000001c3661428c366140000000000000000ad070000000000350000003500000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400320030000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c0032003100330036000000360000003600000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003900350032002c0031002c0032003400310032002c0035002c0031003500390036000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0033003400330032000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900350032000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003900350032002c00310032002c0033003400390032002c00310031002c00320031003300360000003700000037000000000000003600000001b1801401000000640062006f00000046004b005f00530065006400650073005f005400690070006f005300650064006500730000000000000000000000c402000000003800000038000000370000000800000001c16614e8c166140000000000000000ad07000000000039000000390000000000000058000000012b4d1401000000640062006f00000046004b005f00500072006500670075006e007400610073004600720065006300750065006e007400650073005f005400690070006f00500072006500670075006e007400610000000000000000000000c402000000003a0000003a000000390000000800000001c16614a8c166140000000000000000ad0700000000003b0000003b0000000000000056000000012b4d1401000000640062006f00000046004b005f004100750073007000690063006900610064006f007200650073005f005400690070006f004100750073007000690063006900610064006f0072006500730000000000000000000000c402000000003c0000003c0000003b0000000800000001c26614a8c266140000000000000000ad0700000000003d0000003d0000000000000054000000012b4d1401000000640062006f00000046004b005f0043006f006d00700072006f00620061006e00740065005000610067006f005f0043006f006d007000720061005f0045006e007400720061006400610000000000000000000000c402000000003e0000003e0000003d00000008000000019c8014609c80140000000000000000ad070000000000430000004300000000000000440000000100270001000000640062006f00000046004b005f0044006500740061006c006c0065004500760065006e0074006f0073005f004500760065006e0074006f00730000000000000000000000c402000000004400000044000000430000000800000001948014209480140000000000000000ad0700000000004500000045000000000000005e000000016a7b5401000000640062006f00000046004b005f0043006f006d006900740065004f007200670061006e0069007a00610064006f0072005f005400690070006f0052006500700072006500730065006e00740061006e007400650000000000000000000000c402000000004600000046000000450000000800000001938014e09380140000000000000000ad07000000000047000000470000000000000058000000012b4d1401000000640062006f00000046004b005f0043006f006d006900740065004f007200670061006e0069007a00610064006f0072005f0052006500700072006500730065006e00740061006e0074006500730000000000000000000000c402000000004800000048000000470000000800000001938014609380140000000000000000ad0700000000004900000049000000000000005600000001abb26d01000000640062006f00000046004b005f0049006e0073007400690074007500630069006f006e0061006c005f005400690070006f0049006e0073007400690074007500630069006f006e0061006c0000000000000000000000c402000000004a0000004a000000490000000800000001998014609980140000000000000000ad0700000000004b0000004b000000000000005a000000016a7b5401000000640062006f00000046004b005f004d0065006e0075005000720069006e0063006900700061006c005f00500072006500670075006e007400610073004600720065006300750065006e0074006500730000000000000000000000c402000000004c0000004c0000004b00000008000000018c8014a08c80140000000000000000ad0700000000004d0000004d0000000000000044000000013d355401000000640062006f00000046004b005f004500760065006e0074006f0073005f0048006f0072006100720069006f004500760065006e0074006f00730000000000000000000000c402000000004e0000004e0000004d00000008000000018b8014e08b80140000000000000000ad0700000000004f0000004f00000000000000420000000100270001000000640062006f00000046004b005f004400650070006f00720074006500440065007300740061006300610064006f005f00500061006900730000000000000000000000c4020000000050000000500000004f00000008000000018b8014a08b80140000000000000000ad070000000000510000005100000000000000420000000100270001000000640062006f00000046004b005f004d0065006e0075005000720069006e0063006900700061006c005f00470061006c00650072006900610000000000000000000000c4020000000052000000520000005100000008000000018b8014208b80140000000000000000ad0700000000005500000055000000000000003800000001b1801401000000640062006f00000046004b005f004400650070006f0072007400690073007400610073005f00500061006900730000000000000000000000c4020000000056000000560000005500000008000000018a8014e08a80140000000000000000ad07000000000057000000570000000000000040000000016a7b5401000000640062006f00000046004b005f004400650070006f0072007400690073007400610073005f004400650070006f00720074006500730000000000000000000000c4020000000058000000580000005700000008000000018a8014a08a80140000000000000000ad070000000000590000005900000000000000460000000100270001000000640062006f00000046004b005f004400650070006f0072007400650073005f0044006500740061006c006c0065004400650070006f0072007400650000000000000000000000c402000000005a0000005a000000590000000800000001918014a09180140000000000000000ad0700000000005c0000005c000000000000004e0000000100350001000000640062006f00000046004b005f004d0065006e0075005000720069006e0063006900700061006c005f004100750073007000690063006900610064006f0072006500730000000000000000000000c402000000005d0000005d0000005c0000000800000001908014209080140000000000000000ad0700000000005e0000005e000000000000004e000000016a7b5401000000640062006f00000046004b005f004d0065006e0075005000720069006e0063006900700061006c005f0049006e0073007400690074007500630069006f006e0061006c0000000000000000000000c402000000005f0000005f0000005e00000008000000018f8014a08f80140000000000000000ad070000000000600000006000000000000000460000000100270001000000640062006f00000046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f0041007300690065006e0074006f00730000000000000000000000c4020000000061000000610000006000000008000000018d8014e08d80140000000000000000ad07000000000062000000620000000000000056000000012b4d1401000000640062006f00000046004b005f004d0065006e0075005000720069006e0063006900700061006c005f0043006f006d006900740065004f007200670061006e0069007a00610064006f00720000000000000000000000c4020000000063000000630000006200000008000000018a8014608a80140000000000000000ad0700000000006400000064000000000000003e000000016a7b5401000000640062006f00000046004b005f004400650070006f0072007400650073005f005200650067006c0061006d0065006e0074006f0000000000000000000000c4020000000065000000650000006400000008000000018e8014a08e80140000000000000000ad07000000000066000000660000000000000046000000013d355401000000640062006f00000046004b005f005200650070006f0072007400650045006e00740072006100640061005f004400650070006f00720074006500730000000000000000000000c402000000006700000067000000660000000800000001878014a08780140000000000000000ad070000000000680000006800000000000000480000000100270001000000640062006f00000046004b005f004d0065006e0075005000720069006e0063006900700061006c005f0043006500720065006d006f006e0069006100730000000000000000000000c402000000006900000069000000680000000800000001868014208680140000000000000000ad0700000000006a0000006a0000000000000040000000016a7b5401000000640062006f00000046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f005300650064006500730000000000000000000000c402000000006b0000006b0000006a0000000800000001858014e08580140000000000000000ad0700000000006c0000006c000000000000003200000001b1801401000000640062006f00000046004b005f004500760065006e0074006f0073005f005300650064006500730000000000000000000000c402000000006d0000006d0000006c0000000800000001878014208780140000000000000000ad0700000000007400000074000000000000003800000001b1801401000000640062006f00000046004b005f00520061006e006b0069006e0067005f004d006500640061006c006c006100730000000000000000000000c402000000007500000075000000740000000800000001848014e08480140000000000000000ad070000000000760000007600000000000000480000000100270001000000640062006f00000046004b005f004400650070006f00720074006500440065007300740061006300610064006f005f00520061006e006b0069006e00670000000000000000000000c402000000007700000077000000760000000800000001828014208280140000000000000000ad0700000000007800000078000000000000003c000000016a7b5401000000640062006f00000046004b005f005400690070006f00530065006400650073005f004400650070006f00720074006500730000000000000000000000c402000000007900000079000000780000000800000001898014a08980140000000000000000ad0700000000007a0000007a000000000000003a000000016a7b5401000000640062006f00000046004b005f004d006f006e006500640061005f005400690070006f004d006f006e0065006400610000000000000000000000c402000000007b0000007b0000007a0000000800000001868014a08680140000000000000000ad0700000000007e0000007e0000000000000052000000012b4d1401000000640062006f00000046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f0048006f0072006100720069006f004500760065006e0074006f00730000000000000000000000c402000000007f0000007f0000007e0000000800000001898014608980140000000000000000ad070000000000800000008000000000000000420000000100270001000000640062006f00000046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f004d006f006e0065006400610000000000000000000000c402000000008100000081000000800000000800000001848014a08480140000000000000000ad07000000000082000000820000000000000052000000012b4d1401000000640062006f00000046004b005f0043006f006d007000720061005f0045006e00740072006100640061005f005200650070006f0072007400650045006e007400720061006400610000000000000000000000c402000000008300000083000000820000000800000001898014208980140000000000000000ad070000000000840000008400000000000000380000000100000001000000640062006f00000046004b005f00520061006e006b0069006e0067005f004400650070006f00720074006500730000000000000000000000c402000000008500000085000000840000000800000001848014608480140000000000000000ad0700000000008600000086000000000000003e000000016a7b5401000000640062006f00000046004b005f00520061006e006b0069006e0067005f004400650070006f00720074006900730074006100730000000000000000000000c402000000008700000087000000860000000800000001838014208380140000000000000000ad0700000000008800000088000000000000004c000000016a7b5401000000640062006f00000046004b005f0044006500740061006c006c0065004500760065006e0074006f0073005f004400650070006f00720074006900730074006100730000000000000000000000c402000000008900000089000000880000000800000001828014608280140000000000000000ad0700000000008a0000008a0000000000000040000000016a7b5401000000640062006f00000046004b005f005500730075006100720069006f0073005f005400690070006f005500730075006100720069006f0000000000000000000000c402000000008b0000008b0000008a0000000800000001838014a08380140000000000000000ad0700000000008c0000008c00000000000000000000000000000000000000d00200000600280000004100630074006900760065005400610062006c00650056006900650077004d006f006400650000000100000008000400000031000000200000005400610062006c00650056006900650077004d006f00640065003a00300000000100000008003a00000034002c0030002c003200380034002c0030002c0032003300360034002c0031002c0031003900330032002c0035002c0031003200370032000000200000005400610062006c00650056006900650077004d006f00640065003a00310000000100000008001e00000032002c0030002c003200380034002c0030002c0032003900310036000000200000005400610062006c00650056006900650077004d006f00640065003a00320000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300360034000000200000005400610062006c00650056006900650077004d006f00640065003a00330000000100000008001e00000032002c0030002c003200380034002c0030002c0032003300360034000000200000005400610062006c00650056006900650077004d006f00640065003a00340000000100000008003e00000034002c0030002c003200380034002c0030002c0032003300360034002c00310032002c0032003700390036002c00310031002c00310037003000340000008d0000008d00000000000000440000000100270001000000640062006f00000046004b005f005500730075006100720069006f0073005f00450073007400610064006f005500730075006100720069006f0000000000000000000000c402000000008e0000008e0000008d0000000800000001ae8014a0ae80140000000000000000ad0f00000100008f0000008f0000000000000040000000016a7b5401000000640062006f00000046004b005f004400650070006f0072007400690073007400610073005f005500730075006100720069006f00730000000000000000000000c4020000000090000000900000008f0000000800000001ab801420ab80140000000000000000ad0f00000100009100000091000000000000003800000001aa801401000000640062006f00000046004b005f005500730075006100720069006f0073005f00470061006c00650072006900610000000000000000000000c402000000009200000092000000910000000800000001768014607680140000000000000000ad0f0000010000e1000000600000000100000008000000700000007d0000005c000000020000001a0000006e0000006d000000040000000300000001000000000000004300000068000000060000001a0000007b0000008400000062000000070000001a0000002c000000010000003d0000000800000009000000880000005d000000570000000b0000000c000000870000006c000000660000000b0000001f000000100000000b000000780000000b0000002f000000690000008a000000840000000b0000001d0000009300000016000000860000000c0000001d0000008200000085000000880000000c0000000e0000002e00000037000000590000000d0000000b0000000100000044000000100000000f00000001000000680000007100000043000000120000000e0000002d000000260000001600000013000000150000006b00000025000000910000001400000031000000a00000008900000051000000140000001a000000850000005c0000004d000000150000001200000070000000610000007e00000015000000080000003a000000010000005e000000180000001a0000001f0000002400000074000000190000001d0000005d0000006e000000800000001b00000008000000120000005b0000004b0000001c0000001a0000000600000027000000760000001d0000000a0000000100000022000000640000001e0000000b000000820000005d000000820000001f0000000800000065000000660000004700000020000000070000006e00000083000000220000002100000001000000680000009d0000003b0000002400000002000000220000002b00000026000000250000000600000000000000010000004900000028000000180000005c000000750000002a0000002900000019000000180000001b0000007a0000002c0000001b0000000e00000037000000390000002d0000001c0000001600000015000000450000002e000000070000005d0000009a000000370000002f000000360000003b0000002e0000008a000000300000003100000028000000290000008f000000310000000c000000ba00000085000000330000003200000013000000460000002f00000055000000350000000c0000003e0000000d0000004f000000350000000a0000005c0000008f0000006a00000036000000080000005a000000ac0000006c000000360000001200000007000000080000008d0000008c00000031000000110000005a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065003d0034003000390036003b004100700070006c00690063006100740069006f006e0020004e0061006d0065003d0022004d006900630072006f0073006f00660074002000530051004c00200053006500720076006500720020004d0061006e006100670065006d0065006e0074002000530074007500640069006f0022000000008005001c0000004400690061006700720061006d005f00660069006e0061006c000000000226000c00000053006500640065007300000008000000640062006f000000000226000a0000005000610069007300000008000000640062006f000000000226000a00000048006f0072006100000008000000640062006f00000000022600120000005500730075006100720069006f007300000008000000640062006f00000000022600180000005400690070006f005500730075006100720069006f00000008000000640062006f00000000022600140000005400690070006f0053006500640065007300000008000000640062006f00000000022600240000005400690070006f0052006500700072006500730065006e00740061006e0074006500000008000000640062006f000000000226001a0000005400690070006f00500072006500670075006e0074006100000008000000640062006f00000000022600160000005400690070006f004d006f006e00650064006100000008000000640062006f00000000022600180000005400690070006f004d006500640061006c006c006100000008000000640062006f00000000022600240000005400690070006f0049006e0073007400690074007500630069006f006e0061006c00000008000000640062006f000000000226001e0000005400690070006f0043006500720065006d006f006e00690061007300000008000000640062006f00000000022600240000005400690070006f004100750073007000690063006900610064006f00720065007300000008000000640062006f000000000226001c000000530074006f0063006b0041007300690065006e0074006f007300000008000000640062006f000000000226001e00000052006500700072006500730065006e00740061006e00740065007300000008000000640062006f000000000226001e0000005200650070006f0072007400650045006e0074007200610064006100000008000000640062006f00000000022600160000005200650067006c0061006d0065006e0074006f00000008000000640062006f0000000002260010000000520061006e006b0069006e006700000008000000640062006f0000000002260028000000500072006500670075006e007400610073004600720065006300750065006e00740065007300000008000000640062006f000000000226000e0000004d006f006e00650064006100000008000000640062006f000000000226001c0000004d0065006e0075005000720069006e0063006900700061006c00000008000000640062006f00000000022600120000004d006500640061006c006c0061007300000008000000640062006f000000000226001c00000049006e0073007400690074007500630069006f006e0061006c00000008000000640062006f000000000226001e00000048006f0072006100720069006f004500760065006e0074006f007300000008000000640062006f0000000002260010000000470061006c006500720069006100000008000000640062006f0000000002260018000000460065006300680061004500760065006e0074006f00000008000000640062006f00000000022600100000004500760065006e0074006f007300000008000000640062006f000000000226001c000000450073007400610064006f0041007300690065006e0074006f00000008000000640062006f000000000226001e00000044006500740061006c006c0065004500760065006e0074006f007300000008000000640062006f000000000226001e00000044006500740061006c006c0065004400650070006f00720074006500000008000000640062006f00000000022600180000004400650070006f007200740069007300740061007300000008000000640062006f00000000022600120000004400650070006f007200740065007300000008000000640062006f00000000022600220000004400650070006f00720074006500440065007300740061006300610064006f00000008000000640062006f000000000226002000000043006f006d00700072006f00620061006e00740065005000610067006f00000008000000640062006f000000000226001e00000043006f006d007000720061005f0045006e0074007200610064006100000008000000640062006f000000000226002400000043006f006d006900740065004f007200670061006e0069007a00610064006f007200000008000000640062006f000000000226001600000043006500720065006d006f006e00690061007300000008000000640062006f0000000002260022000000430061007400650067006f0072006900610041007300690065006e0074006f00000008000000640062006f000000000226001c0000004100750073007000690063006900610064006f00720065007300000008000000640062006f000000000226001200000041007300690065006e0074006f007300000008000000640062006f000000000224001c000000450073007400610064006f005500730075006100720069006f00000008000000640062006f00000001000000d68509b3bb6bf2459ab8371664f0327008004e0000007b00310036003300340043004400440037002d0030003800380038002d0034003200450033002d0039004600410032002d004200360044003300320035003600330042003900310044007d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000c0000000b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thistoria`
--

CREATE TABLE `thistoria` (
  `idthistoria` int(11) NOT NULL,
  `idPais` int(11) DEFAULT NULL,
  `ano` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `titulo` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imagen_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoauspiciadores`
--

CREATE TABLE `tipoauspiciadores` (
  `idTipoAuspiciador` int(11) NOT NULL,
  `NomAuspiciador` varchar(200) DEFAULT NULL,
  `imgAuspiciador` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoauspiciadores`
--

INSERT INTO `tipoauspiciadores` (`idTipoAuspiciador`, `NomAuspiciador`, `imgAuspiciador`) VALUES
(1, 'COCA - COLA', './images/Auspiciadores/coca-cola.png'),
(2, 'McDonald\'s', './images/Auspiciadores/mcdonalds.png'),
(3, 'Samsung', './images/Auspiciadores/samsung.jpg'),
(4, 'General Electric', './images/Auspiciadores/ge.jpg'),
(5, 'Lenovo', './images/Auspiciadores/lenovo.png'),
(6, 'Visa', './images/Auspiciadores/visa.jpg'),
(7, 'Omega', './images/Auspiciadores/omega.png'),
(8, 'Kodak', './images/Auspiciadores/kodak.jpg'),
(9, 'Johnson & Johnson', './images/Auspiciadores/j-j.jpg'),
(10, 'Panasonic', './images/Auspiciadores/Panasonic.jpg'),
(11, 'Atos Origin', './images/Auspiciadores/atos.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoceremonias`
--

CREATE TABLE `tipoceremonias` (
  `idTipoCeremonias` int(11) NOT NULL,
  `NombreC` varchar(100) DEFAULT NULL,
  `subTitulo` varchar(100) DEFAULT NULL,
  `descripcionTipoC` text,
  `ImagenTipoCeremonia` text,
  `videoRef` text,
  `idCeremonias` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoceremonias`
--

INSERT INTO `tipoceremonias` (`idTipoCeremonias`, `NombreC`, `subTitulo`, `descripcionTipoC`, `ImagenTipoCeremonia`, `videoRef`, `idCeremonias`) VALUES
(1, 'PRESENTACION', NULL, 'banner principal de la página', './assets/images/ceremonias-lima-2019.jpg', 'null', 2),
(2, 'INAUGURACIÓN PANAMERICANOS', NULL, 'La cuenta regresiva agota su último grano de arena. ¡Conoce a los campeones!', './assets/images/ceremonias/inauguracion-pana.png', 'xs4zJsW4Ecs', 2),
(3, 'CLAUSURA PANAMERICANOS', NULL, 'CLAUSURA PANAMERICANOS La primera etapa de nuestros juegos llega a su fin. ¡Celebra con nosotros!', './assets/images/ceremonias/clausuras.png', 'null', 2),
(4, 'CEREMONIA DE INAUGURACIÓN', 'INAUGURACIÓN JUEGOS PANAMERICANOS LIMA 2019', '<p>La cuenta regresiva agota su último grano de arena, los atletas tienen las ansias y esperanzas a flor de piel y tú puedes ser testigo del momento en que toda la expectativa se convierta en realidad. Acompáñanos a hacer historia en la ceremonia de inauguración de los Juegos Panamericanos Lima 2019 que, junto a los Parapanamericanos, constituyen nuestros Juegos.</p><p>Este 26 de julio, conoce a las 41 delegaciones que participarán de los Juegos Panamericanos en su primera presentación en el Estadio Nacional.</p><p>Déjate maravillar por un despliegue de más de mil artistas en escena, entre bailarines, acróbatas y músicos en vivo mientras traemos al estadio los paisajes más asombrosos del Perú e incluso Iluminamos el cielo limeño con un recuento de la historia de los Juegos Panamericanos en forma de espectáculo.</p>', './assets/images/inauguracion/ceremonias-img3.png', 'null', 3),
(5, 'CEREMONIA DE CLAUSURA', 'CLAUSURA JUEGOS PANAMERICANOS LIMA 2019', '<p>La pasión y el temple de nuestros atletas cosechará, como fruto del esfuerzo y dedicación, a los nuevos campeones panamericanos. Nos quedamos no solo con la memoria del mejor deporte del continente, sino con muchos nuevos récords. Solo nos queda agradecer la entrega total de estos atletas. Acompáñanos a decir \"\"hasta pronto\"\" a los Juegos Panamericanos Lima 2019.</p><p>El 11 de agosto, damos cierre a los Juegos Panamericanos en un homenaje a todos los feroces atletas que nos hicieron vivir el espíritu deportivo, una vez más en el Estadio Nacional.</p><p>Revive los momentos más increíbles de los Juegos en una ceremonia que le hará justicia al impresionante despliegue de talento de nuestros atletas. Nuevamente, es turno de los artistas para hacernos despegar de la tierra. Una ceremonia que, sin duda, coronará al rey de los eventos deportivos en América.</p>', './assets/images/clausura/ceremonias-img2.png', 'null', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoinstitucional`
--

CREATE TABLE `tipoinstitucional` (
  `idTipoInstitucional` int(11) NOT NULL,
  `NombreInstitucional` varchar(150) DEFAULT NULL,
  `imgInstitucional` varchar(200) DEFAULT NULL,
  `DescripTipoInstitucional` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoinstitucional`
--

INSERT INTO `tipoinstitucional` (`idTipoInstitucional`, `NombreInstitucional`, `imgInstitucional`, `DescripTipoInstitucional`) VALUES
(1, 'MISION', 'NULL', 'NULL'),
(2, 'VISION', 'NULL', 'NULL'),
(3, 'CONOCENOS', 'NULL', 'NULL'),
(4, 'TRABAJA CON NOSTROS', 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomedalla`
--

CREATE TABLE `tipomedalla` (
  `idTipoMedalla` int(11) NOT NULL,
  `NombreTipoM` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomoneda`
--

CREATE TABLE `tipomoneda` (
  `idTipoMoneda` int(11) NOT NULL,
  `DescripcionTipoMoneda` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiponotificacion`
--

CREATE TABLE `tiponotificacion` (
  `idtiponotificacion` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `icono` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tiponotificacion`
--

INSERT INTO `tiponotificacion` (`idtiponotificacion`, `nombre`, `descripcion`, `icono`) VALUES
(1, 'Antes', 'Notificación antes de encuentro.', '<i class=\"fas fa-exclamation\"></i>'),
(2, 'Despues', 'Notificacion despues del partido.', '<i class=\"far fa-bell\"></i>'),
(3, 'Cancelación', 'Notificación de cancelación', '<i class=\"fas fa-ban\"></i>'),
(4, 'Cambio', 'Notificación de cambio de fecha/hora', '<i class=\"fas fa-exchange-alt\"></i>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporepresentante`
--

CREATE TABLE `tiporepresentante` (
  `idTipoRepresentante` int(11) NOT NULL,
  `NombreR` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiporepresentante`
--

INSERT INTO `tiporepresentante` (`idTipoRepresentante`, `NombreR`) VALUES
(1, 'PRESIDENTE'),
(2, 'REPRESENTANTE'),
(3, 'PRESIDENTE DEL COP'),
(4, 'REPRESENTANTE DEL COP'),
(5, 'REPRESENTANTE DEL IPD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposedes`
--

CREATE TABLE `tiposedes` (
  `idTipoSede` int(11) NOT NULL,
  `idDeporte` int(11) DEFAULT NULL,
  `NombreSede` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposedes`
--

INSERT INTO `tiposedes` (`idTipoSede`, `idDeporte`, `NombreSede`) VALUES
(19, 1, 'LIMA NORTE'),
(20, 1, 'LIMA CENTRO'),
(21, 1, 'LIMA SUR'),
(22, 1, 'AL SUR DE LIMA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `nombreTipoU` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `nombreTipoU`) VALUES
(1, 'Usuario'),
(2, 'Administrador'),
(3, 'Sponsor'),
(4, 'Deportista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajaconnosotros`
--

CREATE TABLE `trabajaconnosotros` (
  `idtrabajaConNosotros` int(11) NOT NULL,
  `tra_desc` text NOT NULL,
  `tra_imagen` varchar(50) NOT NULL,
  `tra_fecha` date NOT NULL,
  `bEstPri` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trabajaconnosotros`
--

INSERT INTO `trabajaconnosotros` (`idtrabajaConNosotros`, `tra_desc`, `tra_imagen`, `tra_fecha`, `bEstPri`) VALUES
(1, 'TRABAJA CON NOSOTROS: Las personas que cumplan con los requisitos especificados en las bases de la Convocatoria, deberan enviar la documentacion de acuerdo a las indicaciones brindadas en el cronograma de los Procesos de Seleccion, publicados por la Oficina de Personal de los Juegos.', 'vista/mgc/img/trabaja.jpg', '0000-00-00', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadorganizacional`
--

CREATE TABLE `unidadorganizacional` (
  `idUnidadOrganizacional` int(11) NOT NULL,
  `U_nombre` varchar(100) NOT NULL,
  `idSecUniOrgFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidadorganizacional`
--

INSERT INTO `unidadorganizacional` (`idUnidadOrganizacional`, `U_nombre`, `idSecUniOrgFK`) VALUES
(1, 'Unidad de Enlace y Coordinacion del Soporte Internacional', 1),
(2, 'Unidad Logistica', 2),
(3, 'Unidad Tesoreria', 2),
(4, 'Unidad de Presupuesto', 7),
(5, 'Unidad de Planeamiento y modernizacion', 7),
(6, 'Subdireccion de Implementacion Temporal para la Entrega de Sedes', 11),
(7, 'Subdireccion de Integracion operativa', 11),
(8, 'Subdireccion de obras', 12),
(9, 'Subdireccion de Recepcion, Liquidacion y Transferencias de Obras', 12),
(10, 'Subdireccion de Deportes', 13),
(11, 'Subdireccion de Gestion de Sedes', 13),
(12, 'Subdireccion de Relaciones Internacionales y Protocolo Deportivo', 13),
(13, 'Subdireccion de Gestion de Villas', 13),
(14, 'Subdireccion de Transporte y Seguridad', 13),
(15, 'Subdireccion de Servicios a los Juegos y Servicios Medicos', 13),
(16, 'Subdireccion de Desarrollo Tecnologico', 14),
(17, 'Subdireccion de Transmisiones', 14),
(18, 'Subdireccion de Comunicaciones, Prensa y Ceremonias', 15),
(19, 'Subdireccion de Comercializacion y Mercadotecnia', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `ApellidoU` varchar(50) NOT NULL,
  `telefonoU` varchar(20) NOT NULL,
  `DocIdentidad` varchar(20) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `password` varchar(130) NOT NULL,
  `last_session` datetime NOT NULL,
  `activacion` int(11) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `token_password` varchar(100) NOT NULL,
  `password_request` int(11) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `nombre`, `ApellidoU`, `telefonoU`, `DocIdentidad`, `correo`, `password`, `last_session`, `activacion`, `token`, `token_password`, `password_request`, `id_tipo`) VALUES
(1, 'Grover', 'Rendich', 'grover@mail.com', '112233', '45068903', '1', '123', '0000-00-00 00:00:00', 1, NULL, '', NULL, 0),
(2, 'raul', 'huaman', 'rhuaman@gmail.com', '964340347', '46797080', '1', '1234', '0000-00-00 00:00:00', 1, NULL, '', NULL, 0),
(3, 'goby', 'Grover', 'Rendich', '944560253', '45068903', 'grover@mail.com', '$2y$10$v7R1GG.M/Tx1LjkefwPqCOcYVO2VUODoa3izUMvHW8AseA8a.0PRu', '2019-06-27 13:01:42', 1, 'c97f7268a29a39332673a811edd36136', '', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_notificaciones`
--

CREATE TABLE `usuario_notificaciones` (
  `idusuario_notificaciones` int(11) NOT NULL,
  `idnotificacion` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `video` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`codigo`, `nombre`, `video`) VALUES
(6, 'Crazy Town - Butterfly (Official Video)', '6FEDrU85FLE'),
(10, 'The Wallflowers - One Headlight (Official Video)', 'Zzyfcys1aLM'),
(11, 'Dishwalla Angels Or Devils lyrics', '8tioia6duvE'),
(12, 'Radiohead - Creep (Best Live Performance)', 'k3_RU30tEIE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vision`
--

CREATE TABLE `vision` (
  `idVision` int(11) NOT NULL,
  `vi_desc` text NOT NULL,
  `vi_imagen` varchar(50) NOT NULL,
  `vi_fecha` date NOT NULL,
  `bEstPri` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vision`
--

INSERT INTO `vision` (`idVision`, `vi_desc`, `vi_imagen`, `vi_fecha`, `bEstPri`) VALUES
(1, 'VISIÓN: Excelente organización de los XVIII Juegos Panamericanos y Juegos Parapanamericanos del 2019, contribuyendo con el desarrollo del deporte nacional y el posicionamiento internacional de la ciudad de Lima.', 'vista/mgc/img/vision.jpg', '0000-00-00', b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD PRIMARY KEY (`idAsiento`),
  ADD KEY `FK_Asientos_CategoriaAsiento` (`idCategAsiento`),
  ADD KEY `FK_Asientos_EstadoAsiento` (`Precio`),
  ADD KEY `FK_Asientos_StockAsientos` (`IdSede`);

--
-- Indices de la tabla `auspiciadores`
--
ALTER TABLE `auspiciadores`
  ADD PRIMARY KEY (`idAuspiciadores`),
  ADD KEY `FK_Auspiciadores_TipoAuspiciadores` (`idTipoAuspiciador`);

--
-- Indices de la tabla `categoriaasiento`
--
ALTER TABLE `categoriaasiento`
  ADD PRIMARY KEY (`idCategoriaAsiento`);

--
-- Indices de la tabla `ceremonias`
--
ALTER TABLE `ceremonias`
  ADD PRIMARY KEY (`idCeremonias`);

--
-- Indices de la tabla `comiteorganizador`
--
ALTER TABLE `comiteorganizador`
  ADD PRIMARY KEY (`idComite`),
  ADD KEY `FK_ComiteOrganizador_Representantes` (`idRepresentateORG`),
  ADD KEY `FK_ComiteOrganizador_TipoRepresentante` (`idTipoRepresentante`);

--
-- Indices de la tabla `compra_entrada`
--
ALTER TABLE `compra_entrada`
  ADD PRIMARY KEY (`idCompraEntrada`),
  ADD KEY `FK_Compra_Entrada_Asientos` (`idAsiento`),
  ADD KEY `FK_Compra_Entrada_HorarioEventos` (`idHorarioEvento`),
  ADD KEY `FK_Compra_Entrada_Moneda` (`idMoneda`),
  ADD KEY `FK_Compra_Entrada_ReporteEntrada` (`idReporteEntrada`),
  ADD KEY `FK_Compra_Entrada_Sedes` (`idSede`);

--
-- Indices de la tabla `comprobantepago`
--
ALTER TABLE `comprobantepago`
  ADD PRIMARY KEY (`idPagosEntrada`),
  ADD KEY `FK_ComprobantePago_Compra_Entrada` (`idCompraEntrada`);

--
-- Indices de la tabla `config_sede_deporte`
--
ALTER TABLE `config_sede_deporte`
  ADD PRIMARY KEY (`idConfigSedeDeporte`,`idSedeFK`,`idDeporteFK`),
  ADD KEY `idSedeFK` (`idSedeFK`),
  ADD KEY `idDeporteFK` (`idDeporteFK`);

--
-- Indices de la tabla `conocenos`
--
ALTER TABLE `conocenos`
  ADD PRIMARY KEY (`idconocenos`);

--
-- Indices de la tabla `decreto`
--
ALTER TABLE `decreto`
  ADD PRIMARY KEY (`idDecreto`);

--
-- Indices de la tabla `deportedestacado`
--
ALTER TABLE `deportedestacado`
  ADD PRIMARY KEY (`idDeporteDestac`),
  ADD KEY `FK_DeporteDestacado_Pais` (`idPais`),
  ADD KEY `FK_DeporteDestacado_Ranking` (`idRanking`);

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`idDeporte`),
  ADD KEY `FK_Deportes_DetalleDeporte` (`idDetalleDeporte`),
  ADD KEY `FK_Deportes_Reglamento` (`idReglamento`);

--
-- Indices de la tabla `deportistadisciplina`
--
ALTER TABLE `deportistadisciplina`
  ADD PRIMARY KEY (`iddeportistadisciplina`),
  ADD KEY `deportistadd_idx` (`idDeportistas`),
  ADD KEY `ddisciplina_idx` (`iddisciplina`);

--
-- Indices de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  ADD PRIMARY KEY (`idDeportistas`),
  ADD KEY `FK_Deportistas_Deportes` (`idDeporte`),
  ADD KEY `FK_Deportistas_Pais` (`idPais`);

--
-- Indices de la tabla `detalledeporte`
--
ALTER TABLE `detalledeporte`
  ADD PRIMARY KEY (`idDetalleDeporte`);

--
-- Indices de la tabla `detalleeventos`
--
ALTER TABLE `detalleeventos`
  ADD PRIMARY KEY (`idDetalleEvento`),
  ADD KEY `FK_DetalleEventos_Deportistas` (`idDeportista`),
  ADD KEY `FK_DetalleEventos_Eventos` (`idEvento`);

--
-- Indices de la tabla `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_juego`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`idEquipo`),
  ADD KEY `FK_equipo_pais` (`idPaisFK`);

--
-- Indices de la tabla `estadoasiento`
--
ALTER TABLE `estadoasiento`
  ADD PRIMARY KEY (`idEstadoA`);

--
-- Indices de la tabla `estadousuario`
--
ALTER TABLE `estadousuario`
  ADD PRIMARY KEY (`idestadoUsuario`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `FK_Eventos_HorarioEventos` (`idHorarioEventos`),
  ADD KEY `FK_Eventos_Sedes` (`idSede`);

--
-- Indices de la tabla `fechaevento`
--
ALTER TABLE `fechaevento`
  ADD PRIMARY KEY (`idFechaEvento`),
  ADD KEY `FK_FechaEvento_Hora` (`idHora`),
  ADD KEY `FK_deporte_fecha_idx` (`idDeporte`);

--
-- Indices de la tabla `fixture`
--
ALTER TABLE `fixture`
  ADD PRIMARY KEY (`idfixture`),
  ADD KEY `fixture.deportes_idx` (`idDeporte`);

--
-- Indices de la tabla `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`idGaleria`);

--
-- Indices de la tabla `hora`
--
ALTER TABLE `hora`
  ADD PRIMARY KEY (`idHora`);

--
-- Indices de la tabla `horarioeventos`
--
ALTER TABLE `horarioeventos`
  ADD PRIMARY KEY (`idHorarioEventos`),
  ADD KEY `FK_HorarioEventos_FechaEvento` (`idFechaEvento`);

--
-- Indices de la tabla `institucional`
--
ALTER TABLE `institucional`
  ADD PRIMARY KEY (`idInstitucional`),
  ADD KEY `FK_Institucional_TipoInstitucional` (`idTipoInstitucional`);

--
-- Indices de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD PRIMARY KEY (`idIntegrante`),
  ADD KEY `FK_integrantes_equipo` (`idEquipoFK`),
  ADD KEY `FK_integrnates_deportistas` (`idDeportistasFK`);

--
-- Indices de la tabla `medallas`
--
ALTER TABLE `medallas`
  ADD PRIMARY KEY (`idMedalla`),
  ADD KEY `FK_Medallas_TipoMedalla` (`idTipoMedalla`);

--
-- Indices de la tabla `medallero`
--
ALTER TABLE `medallero`
  ADD PRIMARY KEY (`idmedallero`),
  ADD KEY `medallero.pais_idx` (`idPais`);

--
-- Indices de la tabla `medallerohistorico`
--
ALTER TABLE `medallerohistorico`
  ADD PRIMARY KEY (`idmedHis_PK`),
  ADD KEY `FK_medHist_Pais` (`pai_FK`);

--
-- Indices de la tabla `menuprincipal`
--
ALTER TABLE `menuprincipal`
  ADD PRIMARY KEY (`idMenuPrincipal`),
  ADD KEY `FK_MenuPrincipal_Auspiciadores` (`idAuspiciadores`),
  ADD KEY `FK_MenuPrincipal_Ceremonias` (`idCeremonias`),
  ADD KEY `FK_MenuPrincipal_ComiteOrganizador` (`idComite`),
  ADD KEY `FK_MenuPrincipal_Galeria` (`idGaleria`),
  ADD KEY `FK_MenuPrincipal_Institucional` (`idInstitucional`),
  ADD KEY `FK_MenuPrincipal_PreguntasFrecuentes` (`idPreguntasFrecuentes`);

--
-- Indices de la tabla `mision`
--
ALTER TABLE `mision`
  ADD PRIMARY KEY (`idmision`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`idMoneda`),
  ADD KEY `FK_Moneda_TipoMoneda` (`idTipoMoneda`);

--
-- Indices de la tabla `norma`
--
ALTER TABLE `norma`
  ADD PRIMARY KEY (`idNormaPK`),
  ADD KEY `FK_Norma_SeccReg` (`SecRegFK`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`idnotificacion`),
  ADD KEY `notificacion.evento_idx` (`idEvento`),
  ADD KEY `notificacion.tiponotificacion_idx` (`idtiponotificacion`);

--
-- Indices de la tabla `oficinasorganigrama`
--
ALTER TABLE `oficinasorganigrama`
  ADD PRIMARY KEY (`idSecretaria`),
  ADD KEY `idSecretaria` (`idSecretaria`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `participantegrupal`
--
ALTER TABLE `participantegrupal`
  ADD PRIMARY KEY (`idPartGrupal`),
  ADD KEY `FK_partGrupal_Equipo1` (`idEquipo1FK`),
  ADD KEY `FK_partGrupal_Equipo2` (`idEquipo2FK`),
  ADD KEY `Fk_partGrupal_eventos` (`idEventoFK`);

--
-- Indices de la tabla `participanteindividual`
--
ALTER TABLE `participanteindividual`
  ADD PRIMARY KEY (`idPartIndividual`),
  ADD KEY `FK_partiipanteIndividual_Eventos` (`idEventoFK`),
  ADD KEY `FK_partIndividual_deportistas` (`idDeportistasFK`),
  ADD KEY `FK_Partiindividual_Pais` (`idPaisFK`);

--
-- Indices de la tabla `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pregfrecareas`
--
ALTER TABLE `pregfrecareas`
  ADD PRIMARY KEY (`idareaPreFrePK`);

--
-- Indices de la tabla `preguntasfrecuentes`
--
ALTER TABLE `preguntasfrecuentes`
  ADD PRIMARY KEY (`idPreguntasFrecuentes`),
  ADD KEY `FK_preguntasfrecuentes_PregFrecAreas` (`idPregFrecAreaFK`);

--
-- Indices de la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`idRanking`),
  ADD KEY `FK_Ranking_Deportes` (`idDeporte`),
  ADD KEY `FK_Ranking_Deportistas` (`idDeportista`),
  ADD KEY `FK_Ranking_Medallas` (`idMedalla`);

--
-- Indices de la tabla `reglamento`
--
ALTER TABLE `reglamento`
  ADD PRIMARY KEY (`idReglamento`);

--
-- Indices de la tabla `reporteentrada`
--
ALTER TABLE `reporteentrada`
  ADD PRIMARY KEY (`idReporteEntrada`),
  ADD KEY `FK_ReporteEntrada_Deportes` (`idDeporte`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`IdRepresentateORG`);

--
-- Indices de la tabla `respuestapreguntafrec`
--
ALTER TABLE `respuestapreguntafrec`
  ADD PRIMARY KEY (`idrespPregFrec`),
  ADD KEY `FK_respuestapreguntafrec_PreguntasFrec` (`idPregFrecuentes`);

--
-- Indices de la tabla `resultadogrupal`
--
ALTER TABLE `resultadogrupal`
  ADD PRIMARY KEY (`idResGrupal`),
  ADD KEY `FK_resGrupal_partGrupal` (`idPartGrupalFK`);

--
-- Indices de la tabla `resultadoindividual`
--
ALTER TABLE `resultadoindividual`
  ADD PRIMARY KEY (`idResIndividual`),
  ADD KEY `ResIndividual_partIndividual_FK` (`idPartIndividualFK`);

--
-- Indices de la tabla `resutado`
--
ALTER TABLE `resutado`
  ADD PRIMARY KEY (`idresutado`),
  ADD KEY `resultado.evento_idx` (`idEvento`);

--
-- Indices de la tabla `seccionreglamento`
--
ALTER TABLE `seccionreglamento`
  ADD PRIMARY KEY (`idSecRegPK`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`idSede`),
  ADD KEY `FK_Sedes_TipoSedes` (`idTipoSede`);

--
-- Indices de la tabla `stockasientos`
--
ALTER TABLE `stockasientos`
  ADD PRIMARY KEY (`idStockAsiento`);

--
-- Indices de la tabla `subnorma`
--
ALTER TABLE `subnorma`
  ADD PRIMARY KEY (`idSubNor`),
  ADD KEY `FK_SubNorma_Norma` (`normaFK`);

--
-- Indices de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  ADD PRIMARY KEY (`diagram_id`),
  ADD UNIQUE KEY `UK_principal_name` (`principal_id`,`name`);

--
-- Indices de la tabla `thistoria`
--
ALTER TABLE `thistoria`
  ADD PRIMARY KEY (`idthistoria`),
  ADD KEY `thistoriapais_idx` (`idPais`);

--
-- Indices de la tabla `tipoauspiciadores`
--
ALTER TABLE `tipoauspiciadores`
  ADD PRIMARY KEY (`idTipoAuspiciador`);

--
-- Indices de la tabla `tipoceremonias`
--
ALTER TABLE `tipoceremonias`
  ADD PRIMARY KEY (`idTipoCeremonias`),
  ADD KEY `tipoCeremonia.ceremonias_idx` (`idCeremonias`);

--
-- Indices de la tabla `tipoinstitucional`
--
ALTER TABLE `tipoinstitucional`
  ADD PRIMARY KEY (`idTipoInstitucional`);

--
-- Indices de la tabla `tipomedalla`
--
ALTER TABLE `tipomedalla`
  ADD PRIMARY KEY (`idTipoMedalla`);

--
-- Indices de la tabla `tipomoneda`
--
ALTER TABLE `tipomoneda`
  ADD PRIMARY KEY (`idTipoMoneda`);

--
-- Indices de la tabla `tiponotificacion`
--
ALTER TABLE `tiponotificacion`
  ADD PRIMARY KEY (`idtiponotificacion`);

--
-- Indices de la tabla `tiporepresentante`
--
ALTER TABLE `tiporepresentante`
  ADD PRIMARY KEY (`idTipoRepresentante`);

--
-- Indices de la tabla `tiposedes`
--
ALTER TABLE `tiposedes`
  ADD PRIMARY KEY (`idTipoSede`),
  ADD KEY `FK_TipoSedes_Deportes` (`idDeporte`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `trabajaconnosotros`
--
ALTER TABLE `trabajaconnosotros`
  ADD PRIMARY KEY (`idtrabajaConNosotros`);

--
-- Indices de la tabla `unidadorganizacional`
--
ALTER TABLE `unidadorganizacional`
  ADD PRIMARY KEY (`idUnidadOrganizacional`),
  ADD KEY `idSecUniOrgFK` (`idSecUniOrgFK`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Usuarios_EstadoUsuario` (`activacion`),
  ADD KEY `FK_Usuarios_Galeria` (`last_session`),
  ADD KEY `FK_Usuarios_TipoUsuario` (`correo`);

--
-- Indices de la tabla `usuario_notificaciones`
--
ALTER TABLE `usuario_notificaciones`
  ADD PRIMARY KEY (`idusuario_notificaciones`),
  ADD KEY `usuario.notificacion_idx` (`idusuario`),
  ADD KEY `notificacion.usuario_idx` (`idnotificacion`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `vision`
--
ALTER TABLE `vision`
  ADD PRIMARY KEY (`idVision`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asientos`
--
ALTER TABLE `asientos`
  MODIFY `idAsiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auspiciadores`
--
ALTER TABLE `auspiciadores`
  MODIFY `idAuspiciadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `categoriaasiento`
--
ALTER TABLE `categoriaasiento`
  MODIFY `idCategoriaAsiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ceremonias`
--
ALTER TABLE `ceremonias`
  MODIFY `idCeremonias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comiteorganizador`
--
ALTER TABLE `comiteorganizador`
  MODIFY `idComite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `compra_entrada`
--
ALTER TABLE `compra_entrada`
  MODIFY `idCompraEntrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobantepago`
--
ALTER TABLE `comprobantepago`
  MODIFY `idPagosEntrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `config_sede_deporte`
--
ALTER TABLE `config_sede_deporte`
  MODIFY `idConfigSedeDeporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `conocenos`
--
ALTER TABLE `conocenos`
  MODIFY `idconocenos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `decreto`
--
ALTER TABLE `decreto`
  MODIFY `idDecreto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `deportedestacado`
--
ALTER TABLE `deportedestacado`
  MODIFY `idDeporteDestac` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `idDeporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `deportistadisciplina`
--
ALTER TABLE `deportistadisciplina`
  MODIFY `iddeportistadisciplina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  MODIFY `idDeportistas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `detalledeporte`
--
ALTER TABLE `detalledeporte`
  MODIFY `idDetalleDeporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `detalleeventos`
--
ALTER TABLE `detalleeventos`
  MODIFY `idDetalleEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `idEquipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadoasiento`
--
ALTER TABLE `estadoasiento`
  MODIFY `idEstadoA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadousuario`
--
ALTER TABLE `estadousuario`
  MODIFY `idestadoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `fechaevento`
--
ALTER TABLE `fechaevento`
  MODIFY `idFechaEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fixture`
--
ALTER TABLE `fixture`
  MODIFY `idfixture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `foto`
--
ALTER TABLE `foto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `galeria`
--
ALTER TABLE `galeria`
  MODIFY `idGaleria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `hora`
--
ALTER TABLE `hora`
  MODIFY `idHora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horarioeventos`
--
ALTER TABLE `horarioeventos`
  MODIFY `idHorarioEventos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `institucional`
--
ALTER TABLE `institucional`
  MODIFY `idInstitucional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `integrantes`
--
ALTER TABLE `integrantes`
  MODIFY `idIntegrante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medallas`
--
ALTER TABLE `medallas`
  MODIFY `idMedalla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medallero`
--
ALTER TABLE `medallero`
  MODIFY `idmedallero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `medallerohistorico`
--
ALTER TABLE `medallerohistorico`
  MODIFY `idmedHis_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `menuprincipal`
--
ALTER TABLE `menuprincipal`
  MODIFY `idMenuPrincipal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mision`
--
ALTER TABLE `mision`
  MODIFY `idmision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `idMoneda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `norma`
--
ALTER TABLE `norma`
  MODIFY `idNormaPK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `idnotificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oficinasorganigrama`
--
ALTER TABLE `oficinasorganigrama`
  MODIFY `idSecretaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `participantegrupal`
--
ALTER TABLE `participantegrupal`
  MODIFY `idPartGrupal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `participanteindividual`
--
ALTER TABLE `participanteindividual`
  MODIFY `idPartIndividual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `participantes`
--
ALTER TABLE `participantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pregfrecareas`
--
ALTER TABLE `pregfrecareas`
  MODIFY `idareaPreFrePK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `preguntasfrecuentes`
--
ALTER TABLE `preguntasfrecuentes`
  MODIFY `idPreguntasFrecuentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `ranking`
--
ALTER TABLE `ranking`
  MODIFY `idRanking` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reglamento`
--
ALTER TABLE `reglamento`
  MODIFY `idReglamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `reporteentrada`
--
ALTER TABLE `reporteentrada`
  MODIFY `idReporteEntrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `IdRepresentateORG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `respuestapreguntafrec`
--
ALTER TABLE `respuestapreguntafrec`
  MODIFY `idrespPregFrec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `resultadogrupal`
--
ALTER TABLE `resultadogrupal`
  MODIFY `idResGrupal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultadoindividual`
--
ALTER TABLE `resultadoindividual`
  MODIFY `idResIndividual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `resutado`
--
ALTER TABLE `resutado`
  MODIFY `idresutado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `seccionreglamento`
--
ALTER TABLE `seccionreglamento`
  MODIFY `idSecRegPK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `idSede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `stockasientos`
--
ALTER TABLE `stockasientos`
  MODIFY `idStockAsiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subnorma`
--
ALTER TABLE `subnorma`
  MODIFY `idSubNor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  MODIFY `diagram_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `thistoria`
--
ALTER TABLE `thistoria`
  MODIFY `idthistoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoauspiciadores`
--
ALTER TABLE `tipoauspiciadores`
  MODIFY `idTipoAuspiciador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipoceremonias`
--
ALTER TABLE `tipoceremonias`
  MODIFY `idTipoCeremonias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipoinstitucional`
--
ALTER TABLE `tipoinstitucional`
  MODIFY `idTipoInstitucional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipomedalla`
--
ALTER TABLE `tipomedalla`
  MODIFY `idTipoMedalla` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipomoneda`
--
ALTER TABLE `tipomoneda`
  MODIFY `idTipoMoneda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiponotificacion`
--
ALTER TABLE `tiponotificacion`
  MODIFY `idtiponotificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiporepresentante`
--
ALTER TABLE `tiporepresentante`
  MODIFY `idTipoRepresentante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tiposedes`
--
ALTER TABLE `tiposedes`
  MODIFY `idTipoSede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `trabajaconnosotros`
--
ALTER TABLE `trabajaconnosotros`
  MODIFY `idtrabajaConNosotros` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `unidadorganizacional`
--
ALTER TABLE `unidadorganizacional`
  MODIFY `idUnidadOrganizacional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_notificaciones`
--
ALTER TABLE `usuario_notificaciones`
  MODIFY `idusuario_notificaciones` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `vision`
--
ALTER TABLE `vision`
  MODIFY `idVision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD CONSTRAINT `FK_Asientos_CategoriaAsiento` FOREIGN KEY (`idCategAsiento`) REFERENCES `categoriaasiento` (`idCategoriaAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comiteorganizador`
--
ALTER TABLE `comiteorganizador`
  ADD CONSTRAINT `FK_ComiteOrganizador_Representantes` FOREIGN KEY (`idRepresentateORG`) REFERENCES `representantes` (`IdRepresentateORG`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ComiteOrganizador_TipoRepresentante` FOREIGN KEY (`idTipoRepresentante`) REFERENCES `tiporepresentante` (`idTipoRepresentante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra_entrada`
--
ALTER TABLE `compra_entrada`
  ADD CONSTRAINT `FK_Compra_Entrada_Asientos` FOREIGN KEY (`idAsiento`) REFERENCES `asientos` (`idAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Compra_Entrada_HorarioEventos` FOREIGN KEY (`idHorarioEvento`) REFERENCES `horarioeventos` (`idHorarioEventos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Compra_Entrada_Moneda` FOREIGN KEY (`idMoneda`) REFERENCES `moneda` (`idMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Compra_Entrada_ReporteEntrada` FOREIGN KEY (`idReporteEntrada`) REFERENCES `reporteentrada` (`idReporteEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Compra_Entrada_Sedes` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comprobantepago`
--
ALTER TABLE `comprobantepago`
  ADD CONSTRAINT `FK_ComprobantePago_Compra_Entrada` FOREIGN KEY (`idCompraEntrada`) REFERENCES `compra_entrada` (`idCompraEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `config_sede_deporte`
--
ALTER TABLE `config_sede_deporte`
  ADD CONSTRAINT `config_sede_deporte_ibfk_1` FOREIGN KEY (`idSedeFK`) REFERENCES `sedes` (`idSede`),
  ADD CONSTRAINT `config_sede_deporte_ibfk_2` FOREIGN KEY (`idDeporteFK`) REFERENCES `deportes` (`idDeporte`);

--
-- Filtros para la tabla `deportedestacado`
--
ALTER TABLE `deportedestacado`
  ADD CONSTRAINT `FK_DeporteDestacado_Pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DeporteDestacado_Ranking` FOREIGN KEY (`idRanking`) REFERENCES `ranking` (`idRanking`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD CONSTRAINT `FK_Deportes_DetalleDeporte` FOREIGN KEY (`idDetalleDeporte`) REFERENCES `detalledeporte` (`idDetalleDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Deportes_Reglamento` FOREIGN KEY (`idReglamento`) REFERENCES `reglamento` (`idReglamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `deportistadisciplina`
--
ALTER TABLE `deportistadisciplina`
  ADD CONSTRAINT `ddisciplina` FOREIGN KEY (`iddisciplina`) REFERENCES `disciplina` (`id_juego`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `deportistadd` FOREIGN KEY (`idDeportistas`) REFERENCES `deportistas` (`idDeportistas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `deportistas`
--
ALTER TABLE `deportistas`
  ADD CONSTRAINT `FK_Deportistas_Deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Deportistas_Pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleeventos`
--
ALTER TABLE `detalleeventos`
  ADD CONSTRAINT `FK_DetalleEventos_Deportistas` FOREIGN KEY (`idDeportista`) REFERENCES `deportistas` (`idDeportistas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DetalleEventos_Eventos` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `FK_equipo_pais` FOREIGN KEY (`idPaisFK`) REFERENCES `pais` (`idPais`);

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `FK_Eventos_HorarioEventos` FOREIGN KEY (`idHorarioEventos`) REFERENCES `horarioeventos` (`idHorarioEventos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Eventos_Sedes` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fechaevento`
--
ALTER TABLE `fechaevento`
  ADD CONSTRAINT `FK_FechaEvento_Hora` FOREIGN KEY (`idHora`) REFERENCES `hora` (`idHora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_deporte_fecha` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fixture`
--
ALTER TABLE `fixture`
  ADD CONSTRAINT `fixture.deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horarioeventos`
--
ALTER TABLE `horarioeventos`
  ADD CONSTRAINT `FK_HorarioEventos_FechaEvento` FOREIGN KEY (`idFechaEvento`) REFERENCES `fechaevento` (`idFechaEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `institucional`
--
ALTER TABLE `institucional`
  ADD CONSTRAINT `FK_Institucional_TipoInstitucional` FOREIGN KEY (`idTipoInstitucional`) REFERENCES `tipoinstitucional` (`idTipoInstitucional`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `integrantes`
--
ALTER TABLE `integrantes`
  ADD CONSTRAINT `FK_integrantes_equipo` FOREIGN KEY (`idEquipoFK`) REFERENCES `equipo` (`idEquipo`),
  ADD CONSTRAINT `FK_integrnates_deportistas` FOREIGN KEY (`idDeportistasFK`) REFERENCES `deportistas` (`idDeportistas`);

--
-- Filtros para la tabla `medallas`
--
ALTER TABLE `medallas`
  ADD CONSTRAINT `FK_Medallas_TipoMedalla` FOREIGN KEY (`idTipoMedalla`) REFERENCES `tipomedalla` (`idTipoMedalla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medallero`
--
ALTER TABLE `medallero`
  ADD CONSTRAINT `medallero.pais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medallerohistorico`
--
ALTER TABLE `medallerohistorico`
  ADD CONSTRAINT `FK_medHist_Pais` FOREIGN KEY (`pai_FK`) REFERENCES `pais` (`idPais`);

--
-- Filtros para la tabla `menuprincipal`
--
ALTER TABLE `menuprincipal`
  ADD CONSTRAINT `FK_MenuPrincipal_Auspiciadores` FOREIGN KEY (`idAuspiciadores`) REFERENCES `auspiciadores` (`idAuspiciadores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MenuPrincipal_Ceremonias` FOREIGN KEY (`idCeremonias`) REFERENCES `ceremonias` (`idCeremonias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MenuPrincipal_ComiteOrganizador` FOREIGN KEY (`idComite`) REFERENCES `comiteorganizador` (`idComite`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MenuPrincipal_Galeria` FOREIGN KEY (`idGaleria`) REFERENCES `galeria` (`idGaleria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MenuPrincipal_Institucional` FOREIGN KEY (`idInstitucional`) REFERENCES `institucional` (`idInstitucional`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MenuPrincipal_PreguntasFrecuentes` FOREIGN KEY (`idPreguntasFrecuentes`) REFERENCES `preguntasfrecuentes` (`idPreguntasFrecuentes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD CONSTRAINT `FK_Moneda_TipoMoneda` FOREIGN KEY (`idTipoMoneda`) REFERENCES `tipomoneda` (`idTipoMoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `norma`
--
ALTER TABLE `norma`
  ADD CONSTRAINT `FK_Norma_SeccReg` FOREIGN KEY (`SecRegFK`) REFERENCES `seccionreglamento` (`idSecRegPK`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion.evento` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notificacion.tiponotificacion` FOREIGN KEY (`idtiponotificacion`) REFERENCES `tiponotificacion` (`idtiponotificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `participantegrupal`
--
ALTER TABLE `participantegrupal`
  ADD CONSTRAINT `FK_partGrupal_Equipo1` FOREIGN KEY (`idEquipo1FK`) REFERENCES `equipo` (`idEquipo`),
  ADD CONSTRAINT `FK_partGrupal_Equipo2` FOREIGN KEY (`idEquipo2FK`) REFERENCES `equipo` (`idEquipo`),
  ADD CONSTRAINT `Fk_partGrupal_eventos` FOREIGN KEY (`idEventoFK`) REFERENCES `eventos` (`idEvento`);

--
-- Filtros para la tabla `participanteindividual`
--
ALTER TABLE `participanteindividual`
  ADD CONSTRAINT `FK_Partiindividual_Pais` FOREIGN KEY (`idPaisFK`) REFERENCES `pais` (`idPais`),
  ADD CONSTRAINT `FK_partIndividual_deportistas` FOREIGN KEY (`idDeportistasFK`) REFERENCES `deportistas` (`idDeportistas`),
  ADD CONSTRAINT `FK_partiipanteIndividual_Eventos` FOREIGN KEY (`idEventoFK`) REFERENCES `eventos` (`idEvento`);

--
-- Filtros para la tabla `preguntasfrecuentes`
--
ALTER TABLE `preguntasfrecuentes`
  ADD CONSTRAINT `FK_preguntasfrecuentes_PregFrecAreas` FOREIGN KEY (`idPregFrecAreaFK`) REFERENCES `pregfrecareas` (`idareaPreFrePK`);

--
-- Filtros para la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `FK_Ranking_Deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Ranking_Deportistas` FOREIGN KEY (`idDeportista`) REFERENCES `deportistas` (`idDeportistas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Ranking_Medallas` FOREIGN KEY (`idMedalla`) REFERENCES `medallas` (`idMedalla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reporteentrada`
--
ALTER TABLE `reporteentrada`
  ADD CONSTRAINT `FK_ReporteEntrada_Deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuestapreguntafrec`
--
ALTER TABLE `respuestapreguntafrec`
  ADD CONSTRAINT `FK_respuestapreguntafrec_PreguntasFrec` FOREIGN KEY (`idPregFrecuentes`) REFERENCES `preguntasfrecuentes` (`idPreguntasFrecuentes`);

--
-- Filtros para la tabla `resultadogrupal`
--
ALTER TABLE `resultadogrupal`
  ADD CONSTRAINT `FK_resGrupal_partGrupal` FOREIGN KEY (`idPartGrupalFK`) REFERENCES `participantegrupal` (`idPartGrupal`);

--
-- Filtros para la tabla `resultadoindividual`
--
ALTER TABLE `resultadoindividual`
  ADD CONSTRAINT `ResIndividual_partIndividual_FK` FOREIGN KEY (`idPartIndividualFK`) REFERENCES `participanteindividual` (`idPartIndividual`);

--
-- Filtros para la tabla `resutado`
--
ALTER TABLE `resutado`
  ADD CONSTRAINT `resultado.evento` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD CONSTRAINT `FK_Sedes_TipoSedes` FOREIGN KEY (`idTipoSede`) REFERENCES `tiposedes` (`idTipoSede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `subnorma`
--
ALTER TABLE `subnorma`
  ADD CONSTRAINT `FK_SubNorma_Norma` FOREIGN KEY (`normaFK`) REFERENCES `norma` (`idNormaPK`);

--
-- Filtros para la tabla `thistoria`
--
ALTER TABLE `thistoria`
  ADD CONSTRAINT `thistoriapais` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipoceremonias`
--
ALTER TABLE `tipoceremonias`
  ADD CONSTRAINT `tipoCeremonia.ceremonias` FOREIGN KEY (`idCeremonias`) REFERENCES `ceremonias` (`idCeremonias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tiposedes`
--
ALTER TABLE `tiposedes`
  ADD CONSTRAINT `FK_TipoSedes_Deportes` FOREIGN KEY (`idDeporte`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `unidadorganizacional`
--
ALTER TABLE `unidadorganizacional`
  ADD CONSTRAINT `unidadorganizacional_ibfk_1` FOREIGN KEY (`idSecUniOrgFK`) REFERENCES `oficinasorganigrama` (`idSecretaria`);

--
-- Filtros para la tabla `usuario_notificaciones`
--
ALTER TABLE `usuario_notificaciones`
  ADD CONSTRAINT `notificacion.usuario` FOREIGN KEY (`idnotificacion`) REFERENCES `notificacion` (`idnotificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario.notificacion` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

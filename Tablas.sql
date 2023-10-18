CREATE TABLE `idgenero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
);

CREATE TABLE `idcategorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
);

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
)

CREATE TABLE `titulos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_tags` int(11) DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `resumen` text DEFAULT NULL,
  `temporadas` int(11) DEFAULT NULL,
  `reparto` text DEFAULT NULL,
  `trailer` text DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL
);

CREATE TABLE `titulos_tags` (
  `id` int(11) NOT NULL,
  `idtitulo` int(11) DEFAULT NULL,
  `idTag` int(11) DEFAULT NULL
);

ALTER TABLE `titulos_tags`
  ADD CONSTRAINT `titulos_tags_ibfk_1` FOREIGN KEY (`idtitulo`) REFERENCES `titulos` (`id`),
  ADD CONSTRAINT `titulos_tags_ibfk_2` FOREIGN KEY (`idTag`) REFERENCES `tags` (`id`);

--Obtener una lista de películas por género. Realizar una consulta que devuelva todas las películas de un género específico. Por ejemplo, mostrar todas las películas de género "Acción", "Terror" o "Suspenso".

SELECT t.titulo, g.nombre AS genero
FROM titulos AS t
JOIN idgenero AS g ON t.id_genero = g.id;


SELECT t.titulo
FROM titulos AS t
JOIN idgenero AS g ON t.id_genero = g.id
WHERE g.nombre = 'Acción';

SELECT t.titulo
FROM titulos AS t
JOIN titulos_tags AS tt ON t.id = tt.idtitulo
JOIN tags AS tag ON tt.idTag = tag.id
WHERE tag.nombre IN ('terror', 'suspenso');

--Obtener una lista de películas por tags. Realizar una consulta que devuelva todas las películas con los tags "Aventura" y "Ciencia Ficción" o "Aventura" y "Fantasía".

SELECT t.titulo
FROM titulos AS t
JOIN titulos_tags AS tt ON t.id = tt.idtitulo
JOIN tags AS tag ON tt.idTag = tag.id
WHERE (tag.nombre = 'Aventura' AND tag.nombre = 'Ciencia Ficción')
   AND (tag.nombre = 'Aventura' AND tag.nombre = 'Fantasía');

--Generar un informe donde se visualicen todos los títulos y categorías que en su resumen contengan la palabra "misión".

SELECT t.titulo, c.nombre AS categoria
FROM titulos AS t
JOIN idcategorias AS c ON t.id_categoria = c.id
WHERE t.resumen LIKE '%misión%';


-- Generar un informe donde se visualicen las series con al menos 3 temporadas.
SELECT titulo, temporadas
FROM titulos
WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Series') 
AND temporadas >= 3;

--Encontrar cuántas películas/series trabajó el actor 'Chris Pratt'
SELECT COUNT(*) AS cantidad_de_trabajos
FROM titulos
WHERE reparto LIKE '%Chris Pratt%';

-- Informar actrices/actores y sus trabajos fílmicos. Mostrar el nombre completo de actrices/actores, el título de sus trabajos fílmicos, la categoría y el género.
SELECT
    DISTINCT reparto AS nombre_completo,
    titulo AS trabajo_filmico
FROM titulos
WHERE reparto LIKE '%Actor/Actriz%';

--Ver solo la categoría "películas". Mostrar el título en mayúscula, el género (en mayúscula), los tags (separados por coma en la misma columna, usando concat o group_concat), duración y el enlace al trailer.

SELECT
    UPPER(ANY_VALUE(t.titulo)) AS Titulo,
    UPPER(ANY_VALUE(g.nombre)) AS Genero,
    GROUP_CONCAT(DISTINCT ta.nombre ORDER BY ta.nombre ASC) AS Tags,
    MAX(t.duracion) AS Duracion,
    MAX(t.trailer) AS Enlace_Trailer
FROM titulos AS t
JOIN idgenero AS g ON t.id_genero = g.id
JOIN titulos_tags AS tt ON t.id = tt.idtitulo
JOIN tags AS ta ON tt.idTag = ta.id
WHERE t.id_categoria = 1
GROUP BY t.id

-- Ver solo la categoría "series". Mostrar el título en mayúscula, el género (en mayúscula), los tags (separados por coma en la misma columna, usando concat o group_concat), la cantidad de temporadas, el enlace al trailer y el resumen.
SELECT
    UPPER(ANY_VALUE(t.titulo)) AS Titulo,
    UPPER(ANY_VALUE(g.nombre)) AS Genero,
    GROUP_CONCAT(DISTINCT ta.nombre ORDER BY ta.nombre ASC) AS Tags,
    MAX(t.temporadas) AS Cantidad_Temporadas,
    ANY_VALUE(t.trailer) AS Enlace_Trailer,
    ANY_VALUE(t.resumen) AS Resumen
FROM titulos AS t
JOIN idgenero AS g ON t.id_genero = g.id
JOIN titulos_tags AS tt ON t.id = tt.idtitulo
JOIN tags AS ta ON tt.idTag = ta.id
WHERE t.id_categoria = 2
GROUP BY t.id;
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
WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Serie') 
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

--7. Ver solo la categoría "películas". Mostrar el título en mayúscula, el género (en mayúscula), los tags (separados por coma en la misma columna, usando concat o group_concat), duración y el enlace al trailer.

SELECT UCASE(T.titulo) as Película, UCASE(G.nombre) as Genero , T.resumen, T.temporadas, T.trailer, GROUP_CONCAT(D.nombre) as Tags 
FROM `titulos` T 
JOIN `idgenero` G 
ON T.id_genero = G.id 
INNER JOIN `titulos_tags` B 
ON T.id = B.idtitulo 
INNER JOIN `tags` D 
ON B.idTag = D.id 
WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Película')
GROUP BY T.titulo;

--8.Ver solo la categoría "series". Mostrar el título en mayúscula, el género (en mayúscula), los tags (separados por coma en la misma columna, usando concat o group_concat), la cantidad de temporadas, el enlace al trailer y el resumen.
SELECT UCASE(T.titulo) as Serie, UCASE(G.nombre) as Genero , T.resumen, T.temporadas, T.trailer, GROUP_CONCAT(D.nombre) as Tags 
FROM `titulos` T 
JOIN `idgenero` G 
ON T.id_genero = G.id 
INNER JOIN `titulos_tags` B 
ON T.id = B.idtitulo 
INNER JOIN `tags` D 
ON B.idTag = D.id 
WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Serie')
GROUP BY T.titulo;
--9.Identificar la película/serie con más actores y la que posee menos actores (indicar la cantidad de actores en ambos casos).


--10. Contar la cantidad total de películas registradas.
SELECT COUNT(*) FROM `titulos` 
WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Película');

--11. Contar la cantidad total de series registradas.
SELECT COUNT(*) FROM `titulos`
WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Serie');

--12. Obtener una lista de series en orden descendente basado en la cantidad de temporadas.

SELECT titulo, temporadas FROM `titulos`
WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Serie')
ORDER BY temporadas DESC;

-- 14. Buscar películas por palabra clave. Realizar una consulta que permita a los usuarios buscar películas utilizando palabras clave en el título o la descripción
 SELECT * FROM `titulos` 
 WHERE id_categoria = (SELECT id FROM idcategorias WHERE nombre = 'Película')
 AND titulo LIKE 'Ju%';


--13. Agregar el campo "Fecha de lanzamiento" a la tabla de trabajos fílmicos como tipo Date y realizar la actualización con las fechas de películas/series del género "Aventura".



--15. Sumar la tabla "Ranking" que incluye el ID de la película/serie, calificación y comentarios. Utilizar operaciones SQL como joins, unions, concat, count, group by, etc
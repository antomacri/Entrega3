SELECT * FROM trailerflix.genero;
SELECT p.titulo, g.nombre AS genero
FROM Peliculas p
INNER JOIN Pelicupelicula_generolaGenero pg ON p.id = pg.idPelicula
INNER JOIN Generos g ON pg.idGenero = g.id
WHERE g.nombre IN ('Acción', 'Terror', 'Suspenso');

//

SELECT p.titulo, t.nombre AS tag
FROM Peliculas p
INNER JOIN Pelicula_Tags pt ON p.id = pt.idPelicula
INNER JOIN Tags t ON pt.idTag = t.id
WHERE t.nombre IN ('Aventura', 'Ciencia Ficción')
GROUP BY p.titulo
HAVING COUNT(DISTINCT t.nombre) = 2;

//

SELECT p.titulo, c.nombre AS categoria
FROM Peliculas p
INNER JOIN Categorias c ON p.id_categoria = c.id
WHERE p.resumen LIKE '%misión%';

FROM Genero g, Categorias c
WHERE g.nombre = 'Aventura' AND c.nombre = 'Acción';

//
INSERT INTO Peliculas (titulo, resumen, anio_estreno,id_genero, id_categoria)
VALUES ('Mi película', 'Una descripción de la película', 2023, 120, 1, 3);

INSERT INTO Peliculas (titulo, resumen, año_estreno, duracion, id_genero, id_categoria)
SELECT
    'Película 4',
    'Descripción 4',
    2024,
    110,


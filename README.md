#  Trailerflix
[![LOGO-BACKEND-GRUPO-3.png](https://i.postimg.cc/cLk2bYzD/LOGO-BACKEND-GRUPO-3.png)](https://postimg.cc/qNn1tt4n)

## PELICULAS 
Este proyecto  representa una base de datos llamada "Trailerflix" diseñada para almacenar información sobre películas, géneros, etiquetas, categorías y más. Tambien podes encontrar Peliculas , Series , accion y mucho mas . Algo nuevo que implementamos estos ultimos dias de conocimiento amplio para sumergirnos en un momento de paz y tranquilidad  

## Tablas
- **Peliculas**: Almacena información detallada sobre las películas, incluyendo título, resumen, año de estreno, duración y más.
- **Genero**: Contiene los géneros de películas, como "Acción", "Comedia" , "Terror", etc.
- **Categorias**: Categoriza las películas en grupos como "Drama", "Ciencia Ficción", etc.
- **Tags**: Almacena etiquetas o tags que se pueden asignar a las películas.
- **Pelicula_Tags**: Une películas con sus etiquetas.
- **Pelicula_Genero**: Une películas con sus géneros.

## Consultas de Ejemplo
Puedes realizar varias consultas en esta base de datos para obtener información específica sobre películas.

1. **Obtener todas las películas de un género específico:**
   ```sql
   SELECT p.titulo
   FROM Peliculas p
   INNER JOIN Pelicula_Genero pg ON p.id = pg.idPelicula
   INNER JOIN Genero g ON pg.idGenero = g.id
   WHERE g.nombre = 'Acción';

# Diagrama de Base de Datos SQL - Trailerflix

Este README proporciona una descripción de la estructura de la base de datos SQL de Trailerflix junto con un diagrama que ilustra las relaciones entre las tablas. 


## Sobre el Diagrama

El diagrama proporciona una vista clara de cómo las tablas están conectadas en la base de datos de Trailerflix:

- Las tablas "Peliculas" y "Series" están relacionadas con las tablas "Genero" y "Categorias" a través de claves foráneas.

- Las tablas "Peliculas" y "Series" están relacionadas con las tablas "Pelicula_Genero" y "Pelicula_Tags" a través de tablas de unión.

- Esto permite una estructura de datos flexible para gestionar películas y series en conjunto con el genero que desee

## Cómo Ver el Diagrama

Para ver el diagrama de la base de datos, simplemente desplázate hacia arriba y observa la imagen del diagrama.

file:///C:/Users/Usuario/Downloads/DiagramaTrailerflix.sql

¡Explora y disfruta trabajando con la base de datos de Trailerflix!

- [@Ludmila](https://github.com/LudmilaRamella)
- [@antomacri](https://github.com/antomacri)
- [@Camila Martinez Alvarez](https://github.com/cMartinez13)

![Trailerflix Ingenias 2023]

   


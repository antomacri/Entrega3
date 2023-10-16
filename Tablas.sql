CREATE DATABASE trailerflix;
USE trailerflix;
CREATE TABLE idGenero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);
CREATE TABLE idCategorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    resumen TEXT,
    anio_estreno INT,
    duracion INT,
    id_genero INT,
    id_categoria INT,
    FOREIGN KEY (id_genero) REFERENCES Genero(id),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);

CREATE TABLE Pelicula_Tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idPelicula INT,
    idTag INT,
    FOREIGN KEY (idPelicula) REFERENCES Peliculas(id),
    FOREIGN KEY (idTag) REFERENCES Tags(id)
);

CREATE TABLE Series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    resumen TEXT,
    año_estreno INT,
    temporadas INT,
    id_genero INT,
    id_categoria INT,
    reparto TEXT,
    trailer VARCHAR(255),
    FOREIGN KEY (id_genero) REFERENCES Genero(id),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);

CREATE TABLE Temporadas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_temporada INT NOT NULL,
    id_serie INT,
    FOREIGN KEY (id_serie) REFERENCES Series(id)
);

CREATE TABLE Tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

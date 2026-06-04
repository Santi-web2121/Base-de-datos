DROP DATABASE IF EXISTS fg;
CREATE DATABASE fg;
USE fg;

CREATE TABLE Artistas(
    ID_Artista int primary key auto_increment not null,
    Nombre varchar(25) not null
);

CREATE TABLE Albumes(
    ID_Album int primary key auto_increment not null,
	ID_Artista int not null,
    Titulo varchar(25) not null,
    FOREIGN KEY (ID_Artista) REFERENCES Artistas(ID_Artista)
);

CREATE TABLE Reproducciones(
    ID_Reproduccion int primary key auto_increment not null,
    ID_Album int not null,
    Cantidad int(2) not null,
    FOREIGN KEY (ID_Album) REFERENCES Albumes(ID_Album)
);
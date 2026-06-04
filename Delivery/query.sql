DROP DATABASE IF EXISTS fg;
CREATE DATABASE fg;
USE fg;

CREATE TABLE Restaurantes(
    ID_Restaurante int primary key auto_increment not null,
    Nombre varchar(25),
    Zona varchar(30)
);

CREATE TABLE Platos(
    ID_Plato int primary key auto_increment not null,
    Nombre varchar(25),
    Precio int(6)
);

CREATE TABLE Pedidos(
    ID_Pedido int primary key auto_increment not null,
    ID_Restaurante int not null,
    ID_Plato int not null,
    Cantidad int(2),
    FOREIGN KEY (ID_Plato) REFERENCES Platos(ID_Plato),
    FOREIGN KEY (ID_Restaurante) REFERENCES Restaurantes(ID_Restaurante)
);
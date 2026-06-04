drop database if exists Artistas;

create database Artistas;

use Artistas;

create table Artistas(
ID_Artista int primary key auto_increment,
Nombre varchar(25),
Zona varchar(25)
);

create table Albumes(
ID_Album int primary key auto_increment,
Nombre varchar(25),
ID_Artista int,
foreign key (ID_Artista) references Artistas(ID_Artista)
);

create table Reproducciones(
ID_Reproduccion int primary key auto_increment,
ID_Album int,
foreign key (ID_Album)references Albumes(ID_Album),
Cantrep int(10)
);

insert into Artistas(Nombre, Zona) 
values
('Duki', 'Argentina'),
('Bizarrap', 'Argentina'),
('Bad Bunny', 'Puerto Rico'),
('Rosalia', 'España'),
('Quevedo', 'España');

insert into Albumes(Nombre, ID_Artista) values
('Desde el Fin', 1),
('Temporada Reggaeton', 1),
('Super Sangre Joven', 1),
('Ameri', 1),
('BZRP Sessions', 2);

insert into Reproducciones (ID_Album, Cantrep) values
(1, 300000),
(2, 250000),
(3, 280000),
(4, 350000),
(5, 40000);

select Artistas.Nombre, sum(Reproducciones.Cantrep) as CantidadReproducciones, count(Albumes.ID_Album) as Cantidad_Albumes from Artistas
inner join Albumes on Albumes.ID_Artista = Artistas.ID_Artista
inner join Reproducciones on Reproducciones.ID_Album = Albumes.ID_Album
group by Artistas.ID_Artista, Artistas.Nombre
having sum(Reproducciones.Cantrep) > 1000000 and count(Albumes.ID_Album) > 3;

select Albumes.Nombre as Nombre_Album, Artistas.Nombre as Nombre_Artista, avg(Reproducciones.Cantrep) as Promedio_Reproducciones from albumes
inner join Artistas on Artistas.ID_Artista = Albumes.ID_Artista
inner join Reproducciones on Reproducciones.ID_Album = Albumes.ID_Album
group by Albumes.ID_Album, Albumes.Nombre, Artistas.Nombre
having avg(Reproducciones.Cantrep) > 50000;

select sum(Reproducciones.Cantrep) as Reporducciones_Totales, Artistas.Nombre as Artista_Con_menos_Reproducciones from Albumes
inner join Artistas on Artistas.ID_Artista = Albumes.ID_Artista
inner join Reproducciones on Reproducciones.ID_Album = Albumes.ID_Album
group by Albumes.ID_Album, Albumes.Nombre, Artistas.Nombre
having count(Albumes.ID_Album) >= 1
order by sum(Reproducciones.Cantrep) desc
limit 1;
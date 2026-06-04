drop database if exists vuelos;

create database vuelos;

use vuelos;

create table Pasajeros(
ID_Pasajero int primary key auto_increment,
Nombre_Completo varchar(25),
DNI int(8)
);

create table Aviones(
ID_Avion int primary key auto_increment,
Modelo varchar(25),
Capacidad int(4)
);

create table Vuelos(
ID_Vuelo int primary key auto_increment,
Salida varchar(25),
Destino varchar(25),
Abordados int(3),
Fecha date,
ID_Avion int,
foreign key (ID_Avion) references Aviones(ID_Avion)
);

create table Tickets(
ID_Ticket int primary key auto_increment,
Precio int(8),
ID_Pasajero int,
foreign key (ID_Pasajero) references Pasajeros(ID_Pasajero),
ID_Vuelo int,
foreign key (ID_Vuelo) references Vuelos(ID_Vuelo)
);

use vuelos;

insert Pasajeros(Nombre_Completo, DNI)
values
("Adriel Latour", 32904467),
("Antonio Fuz", 32102467),
("Benicio Martinez", 32924365),
("Fernando Fernandez", 12902477),
("Hector Hermendia", 37904767),
("Pablo Lopez", 76740973);

insert Aviones(Modelo, Capacidad)
values
("Airbus A320neo", 150),
("Boeing 737 MAX", 138),
("Boeing 787 Dreamliner", 336),
("Airbus A350 XWB", 300),
("Embraer E-Jet E2", 146);

insert Vuelos(Salida, Destino, Abordados, Fecha, ID_Avion)
values
("Ezeiza", "Paris", 100, "2026-05-10", 1),
("Ezeiza", "Hong Kon", 90, "2026-05-15", 1),
("Aero Parque", "Mongolia", 200, "2026-04-20", 3),
("Aero Parque", "Bolivia", 215, "2026-05-25", 1),
("Ezeiza", "Italia", 115, "2026-02-23", 2),
("Aero Parque", "Madrid", 212, "2026-01-15", 4),
("Aero Parque", "Mexico",  120, "2026-03-10", 5);

insert Tickets(Precio, ID_Pasajero, ID_Vuelo)
values
(1000, 2, 3),
(1000, 1, 3),
(500, 3, 2),
(1000, 5, 1),
(200, 6, 5),
(400, 4, 4);

select Aviones.Modelo, sum(Tickets.Precio) as Recaudacion from Aviones
join Vuelos on Aviones.ID_Avion = Vuelos.ID_Avion
join Tickets on Vuelos.ID_Vuelo = Tickets.ID_Vuelo
group by Aviones.Modelo, Vuelos.Abordados, Tickets.Precio
having sum(Tickets.Precio) >= 2000 and Vuelos.Abordados >= 100;

select avg(Tickets.Precio) as Promedio_Tickets from Vuelos
join Tickets on Vuelos.ID_Vuelo = Tickets.ID_Vuelo
where Tickets.Precio >= 500 and Vuelos.Salida = "Ezeiza";

select Aviones.Modelo from Aviones
join Vuelos on Aviones.ID_Avion = Vuelos.ID_Avion
group by Vuelos.ID_Avion
having count(Vuelos.ID_Avion) >= 1;

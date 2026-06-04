create database gimnasio;

use gimnasio;

create table Socios(
ID_Socio int primary key auto_increment,
Nombre varchar(25),
Apellido varchar(25),
Fecha_Alta date
);

create table Planes(
ID_Plan int primary key auto_increment,
Tipo varchar(25),
Costo float(7)
);

create table Pagos(
ID_Pago int primary key auto_increment,
Fecha date,
Monto float(10),
ID_Socio int,
foreign key (ID_Socio) references Socios(ID_Socio),
ID_Plan int,
foreign key (ID_Plan) references Planes(ID_Plan)
);

use gimnasio;

insert into Socios(Nombre, Apellido, Fecha_Alta)
values
("Roberto", "Trebor", "2026-09-04"),
("Tiago", "Molina", "2026-02-07"),
("Sofia", "Harlem", "2026-10-02"),
("Hector", "Ruiz", "2026-01-04"),
("Norberto", "Martinez", "2026-05-02");

insert into Planes(Tipo, Costo)
values
("Premium", 100550),
("1 Mes", 40000),
("12 Dias", 20000),
("Prueba", 10000),
("Semana", 12000);

insert into Pagos(Fecha, Monto, ID_Socio, ID_Plan)
values
("2026-09-04", 100550, 1, 1),
("2026-02-03", 40000, 2, 2),
("2026-03-03", 20000, 2, 3),
("2026-04-03", 41500, 2, 2),
("2026-04-03", 40000, 2, 2),
("2026-10-02", 20000, 3, 3),
("2026-10-14", 20000, 3, 3),
("2026-10-14", 40000, 3, 2),
("2026-01-04", 10000, 4, 4),
("2026-05-02", 12000, 5, 5);

 select Socios.Nombre, count(Pagos.ID_Socio) as Cantidad_Pagos from Socios
 join Pagos on Socios.ID_Socio = Pagos.ID_Socio
 group by Socios.Nombre
 having sum(Pagos.Monto) > 100550;
 
 select sum(Pagos.Monto) as Total_Recaudado from Pagos
 join Planes on Pagos.ID_Plan = Planes.ID_Plan
 join Socios on Pagos.ID_Socio = Socios.ID_Socio
 group by Planes.ID_Plan
 having sum(Pagos.Monto) >= 100000 and count(Socios.ID_Socio) > 1;
 
 select Pagos.ID_Socio, Socios.Nombre, count(Pagos.ID_Socio) as Pagos_Mismo_Plan from Pagos
 join Planes on Pagos.ID_Plan = Planes.ID_Plan
 join Socios on Pagos.ID_Socio = Socios.ID_Socio
 group by Socios.ID_Socio, Planes.ID_Plan
 having count(ID_Pago) >= 3
 limit 1;
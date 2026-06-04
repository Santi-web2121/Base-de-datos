drop database if exists edificio;

create database edificio;

use edificio;

create table Edificios(
ID_Edificio int primary key auto_increment,
Nombre varchar(25),
Direccion varchar(25)
);

create table Unidades(
ID_Unidad int primary key auto_increment,
N_Piso int(2),
ID_Edificio int,
foreign key (ID_Edificio) references Edificios(ID_Edificio)
);

create table Expensas(
ID_Expensa int primary key auto_increment,
Monto float(10),
Estado enum("Pago", "Impago"),
ID_Unidad int,
foreign key (ID_Unidad) references Unidades(ID_Unidad)
);

use edificio;

insert into Edificios(Nombre, Direccion)
values
("Torre A", "Av. Rivadavia 5170"),
("Torre B", "Av. Rivadavia 5170"),
("Rio 1", "Rio de Janeiro 570"),
("Edificio de Teodoro", "Teodoro Garcia 3185"),
("Edificio Serrano", "Serrano 643");

insert into Unidades(N_Piso, ID_Edificio)
values
("4", 1),
("7", 1),
("9", 2),
("11", 2),
("10", 3),
("8", 4),
("1", 5);

insert into Expensas(Monto, Estado, ID_Unidad)
values
(50000, "Impago", 1),
(70000, "Impago", 2),
(70000, "Pago", 3),
(90000, "Pago", 4),
(10000, "Pago", 5),
(23000, "Pago", 6),
(67000, "Pago", 7);

select Edificios.Nombre, sum(Expensas.Monto) as Suma_Impagas from Edificios
join Unidades on Edificios.ID_Edificio = Unidades.ID_Edificio
join Expensas on Unidades.ID_Unidad = Expensas.ID_Unidad
where Expensas.Estado = "Impago"
group by Edificios.ID_Edificio
having sum(Expensas.Monto) > 100000 and count(Unidades.ID_Edificio) >= 2;

select Edificios.Nombre, avg(Expensas.Monto) as Promedio_Expensas from Expensas
join Unidades on Expensas.ID_Unidad = Unidades.ID_Unidad
join Edificios on Unidades.ID_Edificio = Edificios.ID_Edificio
where Expensas.Estado = "Pago"
group by Edificios.ID_Edificio
having avg(Expensas.Monto) >= 20000;

select Edificios.Nombre, sum(Expensas.Monto) from Edificios
join Unidades on Edificios.ID_Edificio = Unidades.ID_Edificio
join Expensas on Unidades.ID_Unidad = Expensas.ID_Unidad
where Expensas.Estado = "Pago"
group by Edificios.ID_Edificio
having sum(Expensas.Monto)
order by Expensas.Monto desc
limit 3;
drop database if exists restaurantes;

create database restaurantes;

use restaurantes;

create table Restaurantes(
ID_Restaurante int primary key auto_increment,
Nombre varchar(25),
Zona varchar(25)
);

create table Platos(
ID_Plato int primary key auto_increment,
Nombre varchar(25),
Precio float,
ID_Restaurante int,
foreign key (ID_Restaurante) references Restaurantes(ID_Restaurante)
);

create table Pedidos(
ID_Pedido int primary key auto_increment,
ID_Plato int,
foreign key (ID_Plato) references Platos(ID_Plato),
Cantidad int
);

use restaurantes;

insert into Restaurantes (Nombre, Zona) 
values
("Don Pepe", "Chacarita"),
("Bodegon la Paternal", "Paternal"),
("Casa de Pastas", "Villa Crespo"),
("Caballito Restaurante", "Caballito"),
("Bodegon Madero", "Puerto Madero");

insert into Platos (Nombre, Precio, ID_Restaurante) 
values
("Pizza Muzzarella", 2500, 1),
("Milanesa Napolitana", 3000, 1),
("Hamburguesa", 1800, 2),
("Fideos", 4000, 3),
("Pizza con Anana", 3500, 4);

insert into Pedidos (ID_Plato, Cantidad) 
values
(1, 120),
(2, 100),
(3, 80),
(4, 60),
(5, 150);

select Restaurantes.Nombre, sum(Pedidos.Cantidad) as Pedidos_Totales from Restaurantes
inner join Platos on Restaurantes.ID_Restaurante = Platos.ID_Restaurante
inner join Pedidos on Platos.ID_Plato = Pedidos.ID_Plato
group by Restaurantes.ID_Restaurante, Restaurantes.Nombre
having count(Platos.ID_Plato) > 1 and sum(Pedidos.Cantidad) > 200;

select Restaurantes.Nombre, avg(Pedidos.Cantidad * Platos.Precio) as Promedio_Ingresos from Restaurantes
inner join Platos on Restaurantes.ID_Restaurante = Platos.ID_Restaurante
inner join Pedidos on Platos.ID_Plato = Pedidos.ID_Plato
where Platos.Precio > 1500
group by Restaurantes.ID_Restaurante, Restaurantes.Nombre;

select Platos.Nombre as Nombre_Plato, Restaurantes.Nombre from Restaurantes
inner join Platos on Restaurantes.ID_Restaurante = Platos.ID_Restaurante
inner join Pedidos on Platos.ID_Plato = Pedidos.ID_Plato
where Platos.Nombre like "%Pizza%"
group by Platos.ID_Plato, Platos.Nombre, Restaurantes.Nombre
order by sum(Pedidos.Cantidad) desc
limit 10;
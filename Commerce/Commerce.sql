drop database if exists tienda;

create database tienda;

use tienda;

create table Categorias(
ID_Categoria int primary key auto_increment,
Nombre varchar(25)
);

create table Productos(
ID_Producto int primary key auto_increment,
Nombre varchar(25),
Precio_Unidad int(6),
ID_Categoria int,
foreign key (ID_Categoria) references Categorias(ID_Categoria)
);

create table Detalles_Ventas(
ID_Detalles_Venta int primary key auto_increment,
Cantidad int(3),
Precio_Final int(10),
ID_Producto int,
foreign key (ID_Producto) references Productos(ID_Producto)
);

use tienda;

insert into Categorias(Nombre)
values
("Perifericos"),
("Celulares"),
("Notebooks"),
("Hardware para PC"),
("Monitores");

insert into Productos(Nombre, Precio_Unidad, ID_Categoria)
values
("Mouse Logitech G PRO X Superlight 2", 70000, 1),
("Samsung A36", 430000, 2),
("ASUS TUF Gaming A15", 1200000, 3),
("Ryzen 9 7900X", 3000000, 4),
("LG UltraGear Pro", 2400000, 5);

insert into Detalles_Ventas(Cantidad, Precio_Final, ID_Producto)
values
(4, 280000, 1),
(2, 860000, 2),
(6, 7200000, 3),
(1, 3000000, 4),
(2, 4800000, 5);

use tienda;

select Categorias.Nombre, Productos.Nombre from Productos
join Categorias on Productos.ID_Producto = Categorias.ID_Categoria
join Detalles_Ventas on Productos.ID_Producto = Detalles_Ventas.ID_Detalles_Venta
where Detalles_Ventas.Cantidad > 5;

select Categorias.Nombre from Categorias
join Detalles_Ventas on Categorias.ID_Categoria = Detalles_Ventas.ID_Detalles_Venta
where Detalles_Ventas.Precio_Final > 1500 and Detalles_Ventas.Cantidad >= 3;

select Categorias.Nombre, Detalles_Ventas.Precio_Final from Detalles_Ventas
join Categorias on Detalles_Ventas.ID_Detalles_Venta = Categorias.ID_Categoria
join Productos on Detalles_Ventas.ID_Detalles_Venta = Productos.ID_Producto
where Productos.Precio_Unidad < 100000 and Precio_Final > 150000;
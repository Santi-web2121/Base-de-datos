INSERT INTO Restaurantes(Nombre, Zona)
VALUES
('La Farola', 'Torre Central'),
('La Guitarrita', 'Residencias del Sur'),
('San Juan', 'Altos del Oeste'),
('Lo de Ricardo', 'Edificio Plaza'),
('El Antojo', 'Complejo Norte');

INSERT INTO Platos(Nombre, Precio)
VALUES
("Fideos", 12446),
("Risotto", 32466),
("Carne asada", 23246),
("Pollo a la plancha", 25655),
("Pizza a la pala", 72456);

INSERT INTO Pedidos(ID_Plato, ID_Restaurante, Cantidad)
VALUES
(1, 1, 54),
(2, 2, 23),
(3, 3, 5),
(4, 4, 37),
(5, 5, 54);
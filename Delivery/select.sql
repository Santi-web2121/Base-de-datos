use fg;
SELECT r.Nombre, SUM(p.ID_Pedido) as PedidosTotales
FROM Restaurantes r 
JOIN Pedidos p ON r.ID_Restaurante = p.ID_Restaurante 
JOIN Platos l ON p.ID_Plato = l.ID_Plato 
GROUP BY r.Nombre
HAVING COUNT(l.ID_Plato) > 5 AND SUM(p.ID_Pedido) > 200;


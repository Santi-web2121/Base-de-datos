use fg;
select a.Nombre, count(r.ID_Reproduccion) as Total
from Artistas a
join Albumes l on l.ID_Artista = a.ID_Artista
join Reproducciones r on r.ID_Album = l.ID_Album
group by a.Nombre
having COUNT(l.ID_Album) > 3 and SUM(r.Cantidad) > 1000000;

select l.ID_Album, l.Titulo, a.Nombre
from Albumes l 
join Reproducciones r on r.ID_Album = l.ID_Album
join Artistas a on l.ID_Artista = a.ID_Artista
group by l.ID_Album
having AVG(r.Cantidad) > 50000;

select a.Nombre, r.Cantidad
from Artistas a 
join Albumes l on l.ID_Artista = a.ID_Artista
join Reproducciones r on r.ID_Album = l.ID_Album
group by a.ID_Artista
having min(r.Cantidad) and MAX(l.ID_Album) >= 1
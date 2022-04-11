-- regresar el numero de generos almacenados
select *
from "Genre"

select count (*) -- cuenta las tuplas 
from "Genre"

select count("Fax")
from "Customer" -- el count no toma en cuanta las tuplas nulas en los atributos

-- regresar el total de minutos de las canciones almacenadas
select sum("Milliseconds")/1000.0/60.0 as total -- suma y regresa la cantidad
from "Track"

-- regresar la cantidad de minutos de cancion minima registrada 
select min("Milliseconds")/1000.0/60.0 as total -- busca la cancion que dura menos
from "Track"

-- regresar la cantidad de minutos de cancion maxima registrada 
select max("Milliseconds")/1000.0/60.0 as total -- busca la cancion que dura mas
from "Track"

-- regresar el promedio de minutos de canciones registradas
select avg("Milliseconds")/1000.0/60.0 as total -- busca el promedio de duracion de las canciones
from "Track"

-- regresar el promedio de minutos de canciones registradas con 2 decimales
select cast(avg("Milliseconds")/1000.0/60.0 as decimal(3,2)) as total -- busca el promedio de duracion de las canciones
from "Track"

-- nombre de la cancion registrada que dura menos
select "Name"
from "Track"
where "Milliseconds" = (select min("Milliseconds")
                        from "Track")
                        
-- reportar cuantos albumes tiene cada artista
select "ArtistId",count("AlbumId") as NumAlbums
from "Album"
group by "ArtistId"

-- reportar cuantos albumes tiene el artista con nombre deep purple
select count(*)
from "Album"
where "ArtistId" = (select "ArtistId"
                    from "Artist"
                    where "Name" = 'Deep Purple')
                  

-- reportar cuantos albumes tiene cada artista con su nombre
select "Name" ,NumAlbums
from "Artist" natural join (select "ArtistId",count("AlbumId") as NumAlbums
                            from "Album"
                            group by "ArtistId") as conteo;
                            
-- reportar cuantos albumes tiene cada artista con su nombre que tienen mas de 5 albumes
select "Name" ,NumAlbums
from "Artist" natural join (select "ArtistId",count("AlbumId") as NumAlbums 
                            from "Album"
                            group by "ArtistId") as conteo
where NumAlbums >5;

--
select "ArtistId",count("AlbumId") as NumAlbums
from "Album" as aa
group by "ArtistId"
having 5 < (select count("AlbumId")
            from "Album"
            where aa."ArtistId" = "ArtistId")
            
-- consulta que regrese el nombre del artista,nombre del album y cuantas canciones tiene el album
select "Artist"."Name","Title",count("Track"."AlbumId") as Ntracks
from "Artist" natural join "Album" join "Track" using ("AlbumId")
group by "Title","Artist"."Name"
order by "Artist"."Name","Title";



--contar las playlist que tengan canciones del genero rock
select "Playlist"."Name", count("PlaylistId")as trks
from "Playlist" natural join "PlaylistTrack" join "Track" using("TrackId") join "Genre" using("GenreId")
group by "Playlist"."Name"


select "Playlist"."Name",count("PlaylistId")as PlaylistsNum
from "Playlist" natural join "PlaylistTrack" join "Track" using("TrackId") join "Genre" using("GenreId")
group by "Playlist"."Name","Genre"."Name"
having "Genre"."Name" ='Rock'

--contar las canciones de todos los generos menos jazz y latin
select "Genre"."Name",count("TrackId")as tracks
from "Track" join "Genre" using("GenreId")
group by "Genre"."Name"
having "Genre"."Name" <> 'Jazz' and "Genre"."Name"<> 'Latin'



-- mostrar el cliente que haya comprado mas caro
select "FirstName","LastName"
from "Customer"
where "CustomerId" = (select "CustomerId"
                      from "Invoice" 
                      where "Total" = (select max("Total")
                                      from "Invoice"))
                 

-- cuantas canciones tiene el artista AC/DC
select "Artist"."Name", count("TrackId")as tracks
from "Track" natural join "Album" join "Artist" using("ArtistId")
group by "Artist"."Name"
having "Artist"."Name" = 'AC/DC'



--




--proxima clase particiones

--  
select '' || address || ',' || city || '' as info
from customers


-- 



--mostrar el nombe de artista y titulo de los albumnes guardados
select "Name","Title"
from "Artist","Album"
where "Artist"."ArtistId" = "Album"."ArtistId";

--listar nombre de cancion,album y artista
select "Track"."Name","Title","Artist"."Name"
from "Artist","Album","Track"
where "Artist"."ArtistId" = "Album"."ArtistId" and "Album"."AlbumId" = "Track"."AlbumId" and ("Artist"."Name" = 'Nirvana' or "Artist"."Name"= 'AC/DC');
                                                                                       --and "Artist"."Name" IN ('Nirvana','AC/DC');

select "Track"."Name","Title","Artist"."Name"
from "Artist","Album","Track"
where "Artist"."ArtistId" = "Album"."ArtistId" and "Album"."AlbumId" = "Track"."AlbumId"  and "Artist"."Name" IN ('Nirvana','AC/DC');

select *
from "Artist" natural join "Album" join "Track" using ("AlbumId");

--listar el nombre de cancion,nombre del titlo y nombre del artista 
select "Track"."Name","Title","Artist"."Name"
from "Artist" natural join "Album", "Track"
where "Album"."AlmbumId" = "Track"."AlbumId";

select "Track"."Name","Title","Artist"."Name"
from "Artist" natural join "Album", "Track"
where "Album"."AlmbumId" = "Track"."AlbumId";

--listado de nombre,apellido del empleado y nombre y apellido al empleado que le reporta
select e."FirstName",e."LastName",b."FirstName",b."LastName"
from "Employee" as e, "Employee" as b
where e."ReportsTo" = b."EmployeeId";

select e."FirstName",e."LastName",b."FirstName",b."LastName"
from "Employee" as e join "Employee" as b on e."ReportsTo" = b."EmployeeId";

--listar nombre de playlist y canciones
select "Playlist"."Name","Track"."Name"
from "Playlist" natural join "PlaylistTrack" join "Track" using ("TrackId");
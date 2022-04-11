--listar identificador de empleado,nombre y apellido de todos los empleados que le reportan a nancy edwards
select a."EmployeeId",a."FirstName",a."LastName"
from "Employee" as a  join "Employee" as b on a."ReportsTo" = b."EmployeeId"
where b."FirstName" = 'Nancy' and b."LastName" = 'Edwards';

-- todos los nombre de las canciones que son del genero rock
select "Track"."Name" from "Track","Genre"
where "Track"."GenreId" = "Genre"."GenreId" and "Genre"."Name" = 'Rock';

select "Track"."Name"
from "Track" join "Genre" using ("GenreId")
where "Genre"."Name" = 'Rock';

select "Track"."Name"
from "Track" join "Genre" on "Genre"."GenreId" = "Track"."GenreId"
where "Genre"."Name" = 'Rock';

--id del cliente,nombre y apellido de todos aquellos que compraron canciones de nirvana
select distinct "CustomerId","FirstName","LastName" 
from "Artist" natural join "Album" join "Track" using ("AlbumId") natural join "InvoiceLine" natural join "Invoice" natural join "Customer"
where "Artist"."Name" = 'Nirvana';

--id y nombre de los playlist que tiene canciones de black sabbath
select distinct "Playlist"."PlaylistId","Playlist"."Name"
from "Playlist" natural join "PlaylistTrack" join "Track" using ("TrackId") natural join "Album" join "Artist" using ("ArtistId")
where "Artist"."Name"='Black Sabbath'

--nombre de cancion,titulo de album y nombre de artista que haya comprado el cliente daan peeters
select "Track"."Name","Title","Artist"."Name"
from "Artist" natural join "Album" join "Track" using ("AlbumId") natural join "InvoiceLine" natural join "Invoice" natural join "Customer"
where "FirstName"='Daan' and "LastName"='Peeters';
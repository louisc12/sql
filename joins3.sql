--1. -Listar nombre de lista de reproducción, nombre de canción, título de álbum y nombre de artista de todas aquellas listas de reproducción que tengan canciones de los artistas con nombre de Bruce Dickinson o Iron Maiden.

select "Playlist"."Name","Track"."Name","Title","Artist"."Name"
from "Playlist" natural join "PlaylistTrack"join "Track" using("TrackId")natural join "Album" join "Artist" using("ArtistId")
where "Artist"."Name" in('Bruce Dickinson','Iron Maiden');

select * from "Track"
--2. -Listar el nombre, apellido y compañía de los clientes y el identificador y fecha de la factura de aquellas facturas compradas en los años 2010 y 2011 con montos totales a $5.00
select "FirstName","LastName","Company","InvoiceDate","InvoiceId"
from "Customer" natural join "Invoice"
where ("InvoiceDate" between'2010-01-01' and '2011-12-31') and "Total"=5;

--3.  -Mostrar el nombre, apellido y compañía de los clientes atendidos por súbditos de la empleada con nombre ‘Nancy’ y apellido ‘Edwards’, además que hayan nacido en los 70’s.
select "Customer"."FirstName","Customer"."LastName","Company"
from "Employee" as e join "Employee" as b on (e."ReportsTo") =b."EmployeeId" join "Customer" on e."EmployeeId"="SupportRepId"
where b."FirstName"='Nancy' and b."LastName"='Edwards' and (e."BirthDate" between '1970-01-01' and '1979-12-31');

--4.  -Listar los nombres de canciones y de artistas que tengan en su nombre de canción la cadena ‘Dark’ o ‘dark’.
select distinct "Track"."Name","Artist"."Name"
from "Artist" natural join "Album" join "Track" using("AlbumId")
where "Track"."Name" like ('%dark%') or "Track"."Name"like ('%Dark%');


--5. -Listar el nombre, apellido, compañía de los clientes y el identificador de las facturas en las cuales se hayan comprado canciones con el identificador 2 y 4 en la misma factura.
select distinct "FirstName","LastName","Company","InvoiceId"
from "InvoiceLine" as l1 join "InvoiceLine" as l2 using ("InvoiceId") natural join "Invoice" natural join "Customer"
where l1."TrackId"=2 and l2."TrackId"=4;
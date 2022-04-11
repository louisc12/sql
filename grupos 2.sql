-- id de factura y el total de esa factura
select "InvoiceId",sum("Quantity"*"UnitPrice") as Total
from "InvoiceLine"
group by "InvoiceId"
order by "InvoiceId" asc;



select "InvoiceId","TrackId",sum("Quantity"*"UnitPrice") over(partition by "InvoiceId" order by "TrackId") as Total
from "InvoiceLine"
order by "InvoiceId" asc; -- estructura basica de una particion


select "InvoiceId","TrackId",rank() over(partition by "InvoiceId" order by "TrackId" desc) as orden
from "InvoiceLine"
order by "InvoiceId" asc; -- enumera cada particion por numero de tracks en cada invoice


select "InvoiceId","TrackId",percent_rank() over(partition by "InvoiceId" order by "TrackId" desc) as orden
from "InvoiceLine"
order by "InvoiceId" asc;  -- hace un porcentaje de 100 entre el numero de elemntos y los acumula


-- realizar una lista de nombre del artista,cantidad de albumes que tiene el artista,nombre del album y cantidad de canciones que tiene el album
select distinct "Artist"."Name",count("AlbumId")as albums,"Title",count("TrackId")as canciones
from "Artist" natural join "Album" join "Track" using ("AlbumId")
group by "Artist"."Name","Title"
order by "Artist"."Name" asc;

select distinct "Artist"."Name",count("AlbumId") over (partition by "AlbumId")as albums,"Title",count("TrackId") over (partition by "TrackId") as canciones
from "Artist" natural join "Album" join "Track" using ("AlbumId")
order by "Artist"."Name" asc;

select distinct "Artist"."Name",count("AlbumId")as albums
from "Artist" natural join "Album" 
group by "Artist"."Name"
order by "Artist"."Name" asc;
union
select distinct "Title",count("TrackId")as tracks
from "Artist" natural join "Album" join "Track" using ("AlbumId")
group by "Title"
order by "Title" asc;

select "Name",nAlbum,"Title",nTracks
from
(select "Name","AlbumId",count("Album"."ArtistId")over (partition by "Album"."ArtistId")as nAlbum 
from "Artist" natural join "Album")as aa
natural join
(select distinct "AlbumId","Title",count("Track"."AlbumId")over (partition by "Track"."AlbumId")as nTracks 
from "Album" natural join "Track") as at order by "Name" asc,"Title" asc;

-- nombre y apellido del empleado,nombre y apellido del cliente y cuantos clientes atiende ese empleado y cuantas compras a efectuado ese cliente
select distinct *
from
(select "EmployeeId","Employee"."FirstName","Employee"."LastName","Customer"."FirstName","Customer"."LastName","CustomerId",count("CustomerId")over (partition by "EmployeeId")as nemp
from "Employee" join "Customer" on "EmployeeId"="SupportRepId")as aa
natural join
(select "Customer"."CustomerId",count("InvoiceId")as nc
from "Customer"natural join "Invoice"
group by "Customer"."CustomerId")as ab


SELECT *
FROM
(SELECT "EmployeeId", "Employee"."FirstName" AS eFN, "Employee"."LastName" AS eLN, "Customer"."FirstName" AS cFN, "Customer"."LastName" AS cLN, "CustomerId", COUNT("CustomerId") OVER (PARTITION BY "EmployeeId") as tcus
FROM "Employee" JOIN "Customer" ON "EmployeeId" = "SupportRepId") AS s_emp
NATURAL JOIN
(SELECT "Customer"."CustomerId", COUNT("InvoiceId") AS tinv
FROM "Customer" NATURAL JOIN "Invoice"
GROUP By "Customer"."CustomerId") AS s_inv
select distinct "TrackId" 
from "Track";

select distinct "TrackId" 
from "InvoiceLine"
order by "TrackId";

select distinct "Track"."TrackId","Name"
from "Track" full outer join "InvoiceLine" using ("TrackId")
order by "TrackId";

select distinct "Track"."TrackId","Name"
from "Track" left outer join "InvoiceLine" using ("TrackId")
where "InvoiceLine" is null
order by "TrackId";

-- nombre de artista y nombre de album de los albumnes de nirvana
select "Artist"."Name","Title"
from "Artist" natural join "Album"
where "Artist"."Name" = 'Nirvana'


select "Name","Title"
from (select * from "Artist" where "Name"='Nirvana') as Nirvana natural join "Album";

select "Title"
from (select "ArtistId" from "Artist" where "Name"='Nirvana') as Nirvana natural join "Album";

--nombre de artista,titulo de album,nombre de cancion de aquellas canciones de genero rock y canciones que tengan subcadena rock
select "Artist"."Name","Title","Track"."Name"
from (select "GenreId" from "Genre" where "Name"='Rock') as R natural join (select "GenreId","Name","AlbumId" from "Track" where "Name" like '%rock%' or "Name"like'%Rock%') "Track" natural join "Album" join "Artist" using ("ArtistId")


--identificador,nombre y apellido de los empleados que no tengan subditos
select s."EmployeeId",s."FirstName",s."LastName"
from "Employee" as s join "Employee" as b on s."ReportsTo" = b."EmployeeId"
where b."ReportsTo" is not null;

select *
from "Employee" as s left outer join "Employee" as b on s."ReportsTo" = b."EmployeeId"
where b."ReportsTo" is not null;


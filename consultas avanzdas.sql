select "ArtistId"
from "Artist"
where "Name" = 'Nirvana'
union
select  "ArtistId"
from "Artist"
where "Name" = 'Deep Purple';


select *
from "Customer"
UNION corresponding by ("FirstName","LastName")
select *
from "Employee";

select "FirstName","LastName"
from "Customer"
UNION all
select "FirstName","LastName"
from "Employee";

select "TrackId","Name"
from "Track"

--listar id de cancion y de todas aquellas que no han sido compradas
select "Track"."TrackId","Name"
from "Track" left outer join (select distinct "TrackId"
                              from "InvoiceLine") as b on "Track"."TrackId" = b."TrackId"
where b."TrackId" is null;


select "Track"."TrackId","Name"
from "Track" 
where "TrackId" not in (select distinct "TrackId" from "InvoiceLine");


select "TrackId"
from "Track"
except
select distinct "TrackId"
from "InvoiceLine";


select "TrackId"
from "Track"
where "TrackId" in ( select "TrackId"
                     from "Track"
                     except
                     select distinct "TrackId"
                     from "InvoiceLine" );



-- listar el id y nombre de todas las canciones que se han comprado
select "TrackId","Name"
from "Track" natural join "InvoiceLine"

select t."TrackId",t."Name"
from "Track" as t
where exists (select *
              from "InvoiceLine"
              where t."TrackId"="TrackId");
              
select t."TrackId",t."Name"
from "Track" as t
where not exists (select *
                  from "InvoiceLine"
                  where t."TrackId"="TrackId");
                  
-- id de factura donde se compro las canciones con id 2 y 4
select distinct "InvoiceId"
from "InvoiceLine"
where "TrackId" = 2
intersect
select distinct "InvoiceId"
from "InvoiceLine"
where "TrackId" = 4;



select "TrackId","Name"
from "Track"
where "TrackId" in (select distinct "TrackId" from "InvoiceLine")

select "TrackId","Name"
from "Track"
where "TrackId" = any (select distinct "TrackId" from "InvoiceLine")


select "InvoiceId","TrackId","Quantity","UnitPrice"*"Quantity" as subtotal
from "InvoiceLine"

--nombre de cancion y duracion en minutos
select "Name","Milliseconds"/1000.0/60.0 as minutos
from "Track";
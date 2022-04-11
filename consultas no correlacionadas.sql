--titulo de album de todos los que son de nirvana o black sabbath
select "Title"
from "Album" natural join "Artist"
where "Artist"."Name"='Nirvana' or "Artist"."Name"='Black Sabbath';

select "Title"
from "Album" natural join (select "ArtistId" 
                           from "Artist" 
                           where "Name" in('Nirvana','Black Sabbath')) as NBS;

select "Title"
from "Album"
where "ArtistId" in (select "ArtistId"
                    from "Artist"
                    where "Name"in('Nirvana','Black Sabbath'));
                    
--todas las canciones del disco nevermind
select "Name"
from "Track"
where "AlbumId" = (select "AlbumId"
                    from "Album"
                    where "Title"='Nevermind');
                    
 
 select "Name"
 from "Track"
 where "AlbumId" in (select "AlbumId"
                    from "Album"
                    where "ArtistId" in (select "ArtistId"
                                        from "Artist"
                                        where "Name"='Nirvana'));                   
                    
--todos los nombres de cancion del cliente dan peeters
select "Name"
from (select "CustomerId"
      from "Customer"
      where "FirstName"='Daan' and "LastName"='Peeters') as DP natural join
      (select "CustomerId","InvoiceId" from "Invoice") as IDP natural join
      (select "InvoiceId","TrackId" from "InvoiceLine") as ILDP natural join
      (select "TrackId","Name" from "Track") as TDP;
      
      
select "Name"
from "Track"
where "TrackId" in (select "TrackId"
                    from "InvoiceLine"
                    where "InvoiceId" in (select "InvoiceId"
                                          from "Invoice"
                                          where "CustomerId" in (select "CustomerId"
                                                                from "Customer"
                                                                where "FirstName"='Daan' and "LastName"='Peeters')));
                                                                          
-- el id de la factura que tenga 2 y 4 que se hallan comprado simultaneamente en una sola factura

select "InvoiceId"
from "InvoiceLine"
where "TrackId"=4 and "InvoiceId"in (select "InvoiceId"
                                     from "InvoiceLine"
                                     where "TrackId"=2);
                                     
--nombre y apellido del cliente de todos aquellos clientes que hayan comprado en la misma factura las canciones con estos nombre: Balls to the Wall y Restless and Wild
select "FirstName","LastName"
from "Customer"
where "CustomerId" in (select "CustomerId"
                       from "Invoice"
                       where "InvoiceId" in (select "InvoiceId"
                                             from "InvoiceLine"
                                             where "TrackId" = (select "TrackId"
                                                                from "Track"
                                                                where "Name"='Balls to the Wall') and "InvoiceId" in (select "InvoiceId"
                                                                                                                      from "InvoiceLine"
                                                                                                                      where "TrackId"= (select "TrackId"
                                                                                                                                        from "Track"
                                                                                                                                        where "Name"='Restless and Wild'))));



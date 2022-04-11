-- manipulacion de cadenas de caracteres
--concatenacion
select "LastName","FirstName"
from "Employee";

select '' || "LastName" || ',' || "FirstName" || '' as FullName
from "Employee";

select '' || upper("LastName") || ',' || lower("FirstName") || '' as FullName
from "Employee";

-- mostrar toda la informacion del artista nirvana en minuscula o mayusculas
select *
from "Artist"
where lower("Name") = 'nirvana' or upper("Name") = 'NIRVANA';

--trim quita los espacio en blanco a los extremos de la cadena
select trim(' ' || upper("LastName") || ',' || lower("FirstName")|| ' ') as FullName
from "Employee";

select trim(both ' ' from '' || upper("LastName") || ',' || lower("FirstName")|| ' ') as FullName
from "Employee";

select ' * ' || upper("LastName") || ',' || lower("FirstName")|| ' * ' as FullName
from "Employee";

select trim(both' * ' from ' * ' || upper("LastName") || ',' || lower("FirstName")|| ' * ') as FullName
from "Employee";

select trim(leading' * ' from ' * ' || upper("LastName") || ',' || lower("FirstName")|| ' * ') as FullName
from "Employee";

select trim(trailing' * ' from ' * ' || upper("LastName") || ',' || lower("FirstName")|| ' * ') as FullName
from "Employee";

select substring("FirstName" from 1 for 1) || ' , ' || "LastName"
from "Employee";

-- manipulacion de fechas
select current_date;
select current_time;
select current_timestamp;

select current_date, "InvoiceDate", (current_date - "InvoiceDate") as et from "Invoice";

select current_date + 30;
select current_date + 12;
select current_date + interval '3' month;
select current_date + interval '1' year;
select current_date + interval '1' month;
select current_timestamp + interval '1' hour;
select current_time + interval '30' minute;
select current_date + current_time;
select interval '2' month + interval '1' day;
select current_timestamp + (interval '2' month + interval '1' day);
select current_time + (interval '2' hour + interval '15' minute);
select current_date - "InvoiceDate" as el from  "Invoice";
select current_time + (interval '2' hour + interval '15' minute);
select 4*(select interval '2' month + interval '1' day);

select extract(year from current_date);
select extract(day from current_date);
select extract(dow from current_date);
select extract(century from current_date);

select case
       when extract(dow from current_date + interval '1' day) = 0 then 'domingo'
       when extract(dow from current_date + interval '1' day) = 1 then 'lunes'
       when extract(dow from current_date + interval '1' day) = 2 then 'martes'
       when extract(dow from current_date + interval '1' day) = 3 then 'miercoles'
       when extract(dow from current_date + interval '1' day) = 4 then 'jueves'
       when extract(dow from current_date + interval '1' day) = 5 then 'viernes'
       else 'sabado'
       end;
       
       
select "Track"."Name","Genre"."Name","UnitPrice", case 
                                                  when "Genre"."Name" = 'Rock' then "UnitPrice" * 1.1
                                                  when "Genre"."Name" = 'Metal' then "UnitPrice" * 0.85
                                                  else "UnitPrice"
                                                  end as "Promo"
from "Track" join "Genre" using ("GenreId");

-- reportar en minutos de cada album, titulo y duracion total de minutos

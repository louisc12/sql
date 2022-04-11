-- Fecha de nacimiento de los empleados
SELECT "BirthDate" FROM "Employee";
--nombre y apellido de los empleados que nacieron despues de 1995
SELECT "FirstName","LastName","BirthDate" FROM "Employee" WHERE "BirthDate" > '1995-12-31';
--nombre y fecha de nacimiento de los empleados que nacieron en la decada de 1960
SELECT "FirstName","LastName","BirthDate"
FROM "Employee"
WHERE "BirthDate" > '1960-01-01' AND "BirthDate" < '1969-12-31';
--atributos de todos los clientes
SELECT * FROM "Customer";
--listar nombre, apellido y compañia de los clientes que no tienen registrada una compañia 
SELECT "FirstName","LastName","Company"
FROM "Customer"
WHERE "Company" is null;
--listar nombre, apellido y compañia de los clientes que tiene registrada una compañia
SELECT "FirstName","LastName","Company"
FROM "Customer"
WHERE "Company" is not null;
--listar nombre,apellido y compañia de los clientes que tengas registrada una compañia y que tenga la palabra Inc. % =solo se enfoca a lo que pide
SELECT "FirstName","LastName","Company"
FROM "Customer"
WHERE "Company" is not null and "Company" like '%Inc%';
--todos los nombres de canciones y generos de aquellas canciones que tienen identificador de genero 1,3,5 o 7
SELECT "Name","GenreId"
FROM "Track"
WHERE "GenreId" = '1' or "GenreId"='3' or "GenreId"='5' or "GenreId"='7';
--los nombre de las canciones y generos de aquellas canciones que tienen identificador de genero 1,3,5,7 CORTO con In
SELECT "Name","GenreId"
FROM "Track"
WHERE "GenreId" IN (1,3,5,7);
--mostrar nombre,apellido y fecha de nacimiento de los empleados nacidos en la decada de los 60 CORTO con modificador betwwen
SELECT "FirstName","LastName","BirthDate"
FROM "Employee"
WHERE "BirthDate" between '1960-01-01' and '1969-12-31';
--mostrar todo de la tabla InvoiceLine
SELECT * FROM "InvoiceLine";
--mostrar el atributo InvoiceId de la tabla InvoiceLine
SELECT "InvoiceId" FROM "InvoiceLine";
--mostrar todo de Invoice
SELECT * FROM "Invoice";
--mostrar todo de Artist
SELECT * FROM "Artist";
--listar pais(asc),apellido y nombre de(desc) de clientes
SELECT "Country","LastName","FirstName"
FROM "Customer"
ORDER BY "Country" asc,"LastName" desc,"FirstName" desc;
--mostrar pais,apellido y nombre de los clientes que no son de brazil
SELECT "Country","LastName","FirstName"
FROM "Customer"
WHERE "Country" <> 'Brazil';
--seleccionar el nombre de clientes que tengan AS en cualquier lugar
SELECT "FirstName","LastName"
FROM "Customer"
WHERE "FirstName" like '%as%';
--selecciona todos los nombres de los artistas
SELECT "Name"
FROM "Artist";
--seleccionar el nombre de los artistas que tengan r al final del nombre
SELECT "Name"
FROM "Artist"
WHERE "Name" like '%r';
--selecciona el nombre de la cancion de manera descendente
SELECT "Name"
FROM "Track"
ORDER BY "Name" desc;
--mostrar lista de empleados a quien no le reportan a otro
SELECT "EmployeeId", "FirstName","LastName","ReportsTo"
FROM "Employee"
WHERE "ReportsTo" is null;
USE `reproductor` ;

INSERT INTO generos (nombregenero) VALUES ("pop");
INSERT INTO generos (nombregenero) VALUES ("rock");
INSERT INTO generos (nombregenero) VALUES ("K-Pop");

INSERT INTO artistas (nombreartista,idgenero) VALUES ("codplay",1);
INSERT INTO artistas (nombreartista,idgenero) VALUES ("imagine dragons",1);
INSERT INTO artistas (nombreartista,idgenero) VALUES ("KDA",3);

INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("yellow","Parachutes",2019,1);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("Paradise","mylo xyloto",2019,1);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("Bones","Mercury",2022,2);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("Warriors","smoke + mirros",2015,2);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("Its Time","Nigth Visions",2021,2);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("Follow You","Nigth Visions",2021,2);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("Believer","Nigth Visions",2017,2);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("More","League of Legends",2021,3);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("The Baddest","League of Legends",2020,3);
INSERT INTO canciones (titulo,album,anio,idartista) VALUES ("Pop/Starts","League of Legends",2018,3);

INSERT INTO listas (nombrelista) VALUES ("Musica Para Hacer Ejercicio");
INSERT INTO listas (nombrelista) VALUES ("Musica Para Relajarse");
INSERT INTO listas (nombrelista) VALUES ("Musica Para Bailar");
INSERT INTO listas (nombrelista) VALUES ("Musica Para Hacer tarea");
INSERT INTO listas (nombrelista) VALUES ("Musica De los 80´s");
INSERT INTO listas (nombrelista) VALUES ("Rancheras");
INSERT INTO listas (nombrelista) VALUES ("Best Songs of 2022");
INSERT INTO listas (nombrelista) VALUES ("Populares De Mexico");




INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (1,3);
INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (1,4);
INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (1,7);
INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (1,8);

INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (2,1);
INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (2,2);
INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (2,5);
INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (2,3);

INSERT INTO cancionesEnListas (idlista,idcancion) VALUES (3,3);

select * from generos;
select * from artistas;
select * from canciones;
select canciones.titulo,artistas.nombreartista,canciones.album,canciones.anio,generos.nombregenero, listas.nombrelista from artistas inner join canciones on artistas.idartista = canciones.idartista inner join generos on  artistas.idgenero = generos.idgenero 
inner join cancionesEnListas on  canciones.idcancion = cancionesEnListas.idcancion 
inner join listas on listas.idlista = cancionesEnListas.idlista;



select * from listas order by idlista;
select * from cancionesEnListas;
select canciones.idcancion from canciones inner join cancionesEnListas on cancionesEnListas.idcancion = canciones.idcancion
where cancionesEnListas.idlista = 1;

select nombreartista from artistas inner join canciones on artistas.idartista = canciones.idartista where idgenero = 1;

select canciones.titulo,artistas.nombreartista,canciones.album,canciones.anio,generos.nombregenero, listas.nombrelista from artistas inner join canciones on artistas.idartista = canciones.idartista inner join generos on  artistas.idgenero = generos.idgenero inner join cancionesEnListas on  canciones.idcancion = cancionesEnListas.idcancion inner join listas on listas.idlista = cancionesEnListas.idlista where listas.nombrelista = "musica para hacer ejercicio";

select canciones.idcancion,canciones.titulo,artistas.nombreartista,canciones.album,canciones.anio,generos.nombregenero from artistas inner join canciones on artistas.idartista = canciones.idartista inner join generos on  artistas.idgenero = generos.idgenero where canciones.idcancion not in (select canciones.idcancion from canciones inner join cancionesEnListas on cancionesEnListas.idcancion = canciones.idcancion where cancionesEnListas.idlista = 2);


UPDATE generos SET nombre = 'Pop2' WHERE idgenero = 1;
UPDATE listas SET nombrelista = 'Musica Sinaloa' WHERE idlista = 7;
DELETE FROM listas WHERE idlista=1;
DELETE FROM cancionesEnListas WHERE idlista=3 and idcancion =3;


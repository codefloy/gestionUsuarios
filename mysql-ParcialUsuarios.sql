create database parcialusuarios;
use parcialusuarios;

create table usuario(
id int not null auto_increment,
nombres varchar(50) not null,
genero varchar(50) not null,
correo varchar(50) not null,
fecha date not null,
estado varchar (20) not null,
pass varchar(50) not null,
PRIMARY KEY (id)
);

insert into usuario (nombres,genero,correo,fecha,estado,pass)values ('Floy Chavez','Masculino','floychavez9@gmail.com',current_date,'Habilitado','12345');
insert into usuario (nombres,genero,correo,fecha,estado,pass)values ('Thiago Chavez','Masculino','thiago@gmail.com',current_date,'Habilitado','12345');
insert into usuario (nombres,genero,correo,fecha,estado,pass)values ('Yasmin Dayana','Femenino','jvasquez@gmail.com',current_date,'Habilitado','12345');
select * from usuario;

use usuarios;
delete from usuario where id= 2;
select * from usuario;


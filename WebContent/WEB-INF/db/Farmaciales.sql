Create Database farmaciales
go
use farmaciales

create  table remedio
(
re_id nvarchar(20) PRIMARY KEY ,
re_nome varchar(100),
re_idtipo int,
re_preco decimal(7,2),
re_resu varchar(200),
foreign key (re_idtipo) references tipo(id)
)

create table tipo
(
id int primary key ,
classe varchar(100) ,
)


CREATE  TABLE cliente
(
id int primary key,
fnome varchar(50)not null,
lnome varchar(50)not null,
cpf		varchar(11)not null,
senha varchar(20)not null,
sexo varchar(20)not null,
c_cep varchar(11) not null,
foreign key (c_cep) references enderco(cep)
)

CREATE TABLE enderco(
cep varchar(11) not null,
logradouro varchar(50)not null,
porta int not null,
complent varchar(50)not null,
Primary Key (cep)
)


create  table endereco
(
cep varchar(11),
logradouro varchar(50),
porta int,
complent varchar(50),
Constraint pk_endereco primary key (cep,porta)
)

create table compra(
id int /*identity (1,1)*/,
c_qntd int ,
val_total decimal(7,2),
PRIMARY KEY id
)
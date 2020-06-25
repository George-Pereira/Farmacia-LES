Create Database farmaciales
go
use farmaciales

CREATE TABLE endereco
(
cep varchar(11) not null,
logradouro varchar(50)not null,
porta int not null,
complent varchar(50)not null,
Primary Key (cep)
)

create table tipo
(
id int identity (1,1) primary key,
classe varchar(100) ,
)

create table compra(
id int identity (1,1),
c_qntd int ,
dtcompra datetime,
val_total decimal(7,2),
Constraint pk_compra PRIMARY KEY (id,dtcompra)
)

CREATE TABLE cliente
(
id int identity (1,1) primary key,
fnome varchar(50)not null,
lnome varchar(50)not null,
cpf		varchar(11)not null,
telfixo varchar(14),
telcelu varchar(15) not null,
email varchar(100) not null,
senha varchar(20)not null,
sexo varchar(20)not null,
c_cep varchar(11) not null,
foreign key (c_cep) references endereco(cep)
)

create table remedio
(
id int identity (1,1) primary key,
re_nome varchar(100),
re_idtipo int,
re_preco decimal(7,2),
re_resu varchar(200),
re_quant int,
foreign key (re_idtipo) references tipo(id)
)

insert into tipo values
('Pilula'),
('Xarope'),
('Acessorio')
insert into remedio values
('Cloroquina',1,'69.99','Previni covid-19',50),
('Viagra',1,'120.50','Permite ereçoes durante horas',20),
('Bengala',3,'130.00','ajuda a fazer a locomoção',30),
('Biotonico Fontora',2,'40.00','Ajuda a Criança a se alimente',50)

select * from remedio
select * from tipo
select * from cliente
select * from endereco

--função para um relatorio(nome do produto,quantidade e vendas)

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Listagem especifica*/

Create function f_listagem(@nome varchar(100))
RETURNS @tabela table(
Nome varchar(100),
Quantidade int,
Preco decimal(7,2),
Tipo varchar(20)
)
as
begin 
	Declare @idremedio nvarchar(20),
				 @qntd int
	Insert @tabela(Nome,Quantidade,Preco,Tipo) 
	select r.re_nome,r.re_quant,re_preco,t.classe from remedio r INNER JOIN tipo t on r.re_idtipo=t.id where r.re_nome LIKE Concat('%',@nome,'%')
return
end

select * from f_listagem('Cloro')
select * from f_listagem('Cloroquina')
select * from f_listagem('Biotonico Fontora')
select * from f_listagem('Viagra')
select * from f_listagem('Bengala')


/*LISTAGEM GENERICA*/
Create function f_LisSimples()
RETURNS @tabela table(
Nome varchar(100),
Quantidade int,
Preco decimal(7,2),
Tipo varchar(20)
)
as
begin 
	Declare @nome varchar(100),
				 @qntd int
	Insert @tabela(Nome,Quantidade,Preco,Tipo) 
	select r.re_nome,r.re_quant,re_preco,t.classe from remedio r INNER JOIN tipo t on r.re_idtipo=t.id
return
end

select *from f_LisSimples()

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--inserir uma cliente e endereço juntas 
Create  procedure sp_insercao
@fnome varchar(50),
@lnome varchar(50),
@cpf		varchar(11),
@telfixo varchar(14),
@telcel varchar(15),
@email varchar(100),
@senha varchar(20),
@sexo varchar(20),
@cep varchar(11) ,
@logradouro varchar(50),
@porta int ,
@complent varchar(50)
as
begin
		Insert into endereco Values(@cep,@logradouro,@porta,@complent)
		Insert into cliente Values(@fnome,@lnome,@cpf,@telfixo,@telcel,@email,@senha,@sexo,@cep)
end

exec sp_insercao 'Rafael','Borges','69420420691','(11)-321456789','(99)-999999999','rafael@hotmail.com','Aves','Masculino',111111,'Rua aguia de haia',61,'Viela'
exec sp_insercao 'Jose','Luiz','99999999',null,'(11)-321456789','JLuiz@hotmail.com','Rosas','Masculino',88888,'Rua aguia de haia',61,'Bairro'
exec sp_insercao 'George','Fernando','846454984','(11)-777777777','(88)-888888888','Fernandão@hotmail.com','Terra','Masculino',999999,'Rua aguia de haia',39,'Alemeda'

select * from cliente
select * from endereco
delete cliente
delete endereco

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--função login
Create  function f_validaLogin(@email varchar(100),@senha varchar(20))
RETURNS @tabela table(
id int ,
fnome varchar(50),
lnome varchar(50),
cpf		varchar(11),
email varchar(100),
senha varchar(20),
sexo varchar(20)
)
as
BEGIN
DECLARE	@validaEmail varchar(100),
					@validaSenha varchar(20),
					@Resultado varchar(20)
	Set @validaEmail = (select email from cliente where email = @email)
	Set @validaSenha = (select senha from cliente where senha = @senha)
	if(@email = @validaemail)
	 Begin
		if(@senha = @validaSenha)
			Begin
				Set @Resultado = 'Concetado!'
				 insert @tabela(id,fnome,lnome,cpf,email,senha,sexo) select id,fnome,lnome,cpf,email,senha,sexo from cliente where email =@email
			End
	  End
	else
		Begin 
			Set @Resultado = 'Não Concetado!'
		End
		return
end
 
select * from f_validaLogin('rafael@hotmail.com','Aves')
select * from f_validaLogin('afsdfasfasf','coringa')

Create Database farmaciales
go
use farmaciales


CREATE TABLE endereco
(
cep varchar(11) not null,
logradouro varchar(50)not null,
porta int not null,
complent varchar(50)not null,
uf char(2)not null,
cidade varchar(100)not null,
bairro varchar(100)not null,
Primary Key (cep)
)

create table tipo
(
id int identity (1,1) primary key,
classe varchar(100) ,
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
dnasci date not null,
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

create table compra(
id int ,
cli_id int,
rem_id int,
c_qntd int ,
dtcompra date,
val_total decimal(7,2),
Constraint pk_compra PRIMARY KEY (id,dtcompra),
foreign key (cli_id) references cliente(id),
foreign key (rem_id) references remedio(id)
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
select * from compra

delete  remedio
delete tipo
delete  cliente
delete endereco
delete compra

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
select * from f_listagem('Bio')
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
--procedure Venda
Create Procedure sp_venda
@codvenda int,
@codcli int,
@codrem int,
@NomeRemedio varchar(100),
@TipoRemedio varchar(100),
@d_compra date,
@Quant_compra INT,
@valor_Remedio decimal(7,2)
as
begin 
		declare @valor_compra decimal(7,2),
					@quantidade_remedio int,
					 @quantidade_removido int
		set @valor_compra =SUM(@Quant_compra*@valor_Remedio)
		INSERT INTO compra values (@codvenda,@codcli,@codrem,@Quant_compra,@d_compra,@valor_compra)
		set @quantidade_remedio =(select re_quant from remedio where id = @codrem)
		set @quantidade_removido =SUM(@quantidade_remedio-@Quant_compra)
		 update remedio set re_quant = @quantidade_removido where id = @codrem
end

exec sp_venda 1,1,1,'Cloroquina','pilula','20/05/2020',5,'69.50'
exec sp_venda 1,1,2,'Viagra','pilula','22/05/2020',2,'120.50'
exec sp_venda 2,2,2,'Viagra','pilula','22/05/2020',2,'120.50'
select * from compra
select * from remedio

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--função para um relatorio(nome do produto,quantidade e vendas)

CREATE  function f_relatorio()
RETURNS @tabela table(
cod_rem int,
nome_rem varchar(100),
qntdVend int,
valor_rem decimal(7,2),
valor_vend decimal(7,2),
dtcompra date
) 
as 
begin
		Insert  @tabela(cod_rem,nome_rem,qntdVend,valor_rem,valor_vend,dtcompra)
		select r.id,r.re_nome,c.c_qntd,r.re_preco,c.val_total,c.dtcompra  from remedio r INNER JOIN compra c on r.id = c.rem_id
		return
end

select * from f_relatorio()
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
@datnto date,
@cep varchar(11) ,
@logradouro varchar(50),
@porta int ,
@complent varchar(50),
@uf char(2),
@cidade varchar(100),
@bairro varchar(100)
as
begin
		Insert into endereco Values(@cep,@logradouro,@porta,@complent,@uf,@cidade,@bairro)
		Insert into cliente Values(@fnome,@lnome,@cpf,@telfixo,@telcel,@email,@senha,@sexo,@datnto,@cep)
end

exec sp_insercao 'Rafael','Borges','69420420691','(11)-321456789','(99)-999999999','rafael@hotmail.com','Aves','Masculino','17/06/2015',111111,'Rua aguia de haia',61,'Viela','BH','Bahia','Pelorinho'
exec sp_insercao 'Jose','Luiz','99999999',null,'(11)-321456789','JLuiz@hotmail.com','Rosas','Masculino','17/11/2015',88888,'Rua aguia de haia',61,'Bairro','RJ','Rio de Janeiro','Mesquita'
exec sp_insercao 'George','Fernando','846454984','(11)-777777777','(88)-888888888','Fernandão@hotmail.com','Terra','Masculino','20/01/2015',999999,'Rua aguia de haia',39,'Alemeda','SP','São Paulo','Augusta'

select * from cliente
select * from endereco

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--função login
Create function f_validaLogin(@email varchar(100),@senha varchar(20))
RETURNS @tabela table(
id int ,
fnome varchar(50),
lnome varchar(50),
cpf		varchar(11),
telfixo varchar(14),
telcelu varchar(15) ,
email varchar(100) ,
senha varchar(20),
sexo varchar(20),
dnasci date 
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
				 insert @tabela(id,fnome,lnome,cpf,telfixo,telcelu,email,senha,sexo,dnasci) 
				 select id,fnome,lnome,cpf,telfixo,telcelu,email,senha,sexo,dnasci from cliente where email =@email
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

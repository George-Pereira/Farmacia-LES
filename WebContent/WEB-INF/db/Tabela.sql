Create Database farmaciales
go
use farmaciales


CREATE TABLE endereco
(
cep varchar(11) not null,
logradouro varchar(50)not null,
numero int not null,
complento varchar(50),
uf char(2)not null,
cidade varchar(100)not null,
bairro varchar(100)not null,
Primary Key (cep)
)

create table tipo
(
id int identity (1,1) primary key,
categoria varchar(100) ,
)


CREATE TABLE cliente
(
id int identity (1,1) primary key,
Nome varchar(50)not null,
Sobrenome varchar(50)not null,
cpf		varchar(11)not null,
telfixo varchar(14),
celular varchar(15) not null,
email varchar(100) not null,
senha varchar(20)not null,
sexo varchar(20)not null,
dnasci date not null,
c_cep varchar(11) not null,
foreign key (c_cep) references endereco(cep)
)

create table produtos
(
id int identity (1,1) primary key,
nomeProd varchar(100),
idtipo int,
preco decimal(7,2),
descricao varchar(200),
quantidade int,
foreign key (idtipo) references tipo(id)
)

create table compra
(
id int ,
cli_id int,
prod_id int,
qntd int ,
dtcompra date,
val_total decimal(7,2),
Constraint pk_compra PRIMARY KEY (id, prod_id, cli_id, dtcompra),
foreign key (cli_id) references cliente(id),
foreign key (prod_id) references produtos(id)
)

create table adm
(
id_adm int not null PRIMARY KEY,
nome varchar(50)not null,
email varchar(100) not null,
senha varchar(20)not null
)


insert into tipo values
('Comprimido'),
('Curativo'),
('Pastilha'),
('Protetor Solar')
insert into produtos values
('Buscopan',1,'69.99','Cólicas intestinais',50),
('Band-Aid',2,'30.00','Curativos para todo tipo de lesão/corte',20),
('Pastilha Strepsils',3,'40.00','Pastilhas para irritações e dores de garganta',30),
('Protetor Solar 30FPS',4,'80.00','Protetor Solar Do Rafael',80)


select * from produtos
select * from tipo
select * from cliente
select * from endereco
select * from compra

drop table  produtos
drop table tipo
delete  cliente
delete endereco
drop table compra
use master
drop database farmaciales



/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Listagem especifica*/

Create function f_listagem(@nome varchar(100))
RETURNS @tabela table(
Id	int,
Nome varchar(100),
Quantidade int,
Preco decimal(7,2),
Tipo varchar(20)
)
as
begin 
	Declare @idremedio nvarchar(20),
				 @qntd int
	Insert @tabela(Id, Nome, Quantidade, Preco, Tipo) 
	select p.id, p.nomeProd, p.quantidade, preco, t.categoria from produtos p INNER JOIN tipo t on p.idtipo = t.id where p.nomeProd LIKE Concat(@nome,'%')
return
end

EXEC sp_configure 'default language', 1046


/*LISTAGEM GENERICA*/
Create function f_LisSimples()
RETURNS @tabela table(
id	 int,
Nome varchar(100),
Quantidade int,
Preco decimal(7,2),
Tipo varchar(20),
Descricao varchar(200)
)
as
begin 
	Declare @nome varchar(100),
				 @qntd int
	Insert @tabela(id,Nome,Quantidade,Preco,Tipo, Descricao) 
	select p.id,p.nomeProd,p.quantidade,preco,t.categoria, descricao from produtos p INNER JOIN tipo t on p.idtipo = t.id
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
		set @quantidade_remedio =(select quantidade from produtos where id = @codrem)
		set @quantidade_removido =SUM(@quantidade_remedio-@Quant_compra)
		 update produtos set quantidade = @quantidade_removido where id = @codrem
end


/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--função para um relatorio(nome do produto,quantidade e vendas)

CREATE  function f_relatorio()
RETURNS @tabela table(
cod_Prod int,
nome_Prod varchar(100),
qntdVend int,
valor_Prod decimal(7,2),
valor_vend decimal(7,2),
dtcompra date
) 
as 
begin
		Insert  @tabela(cod_Prod,nome_Prod,qntdVend,valor_Prod,valor_vend,dtcompra)
		select p.id,p.nomeProd,c.qntd,p.preco,c.val_total,c.dtcompra  from produtos p INNER JOIN compra c on p.id = c.prod_id
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


/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
--função login

Create function f_validaLogin(@email varchar(100),@senha varchar(20))
RETURNS @tabela table(
id int ,
nome varchar(50),
sobrenome varchar(50),
cpf		varchar(11),
telfixo varchar(14),
celular varchar(15) ,
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
	SET @validaEmail = (SELECT email FROM cliente WHERE email = @email AND senha = @senha) 
	SET @validaSenha = (SELECT senha FROM cliente WHERE email = @email AND senha = @senha)
	if(@email = @validaemail AND @validaSenha = @senha)
	Begin
		Set @Resultado = 'Concetado!'
	    insert @tabela(id,nome,sobrenome,cpf,telfixo,celular,email,senha,sexo,dnasci) 
		select id,nome,sobrenome,cpf,telfixo,celular,email,senha,sexo,dnasci from cliente where email = @email
	End
	return
end

SELECT * FROM compra
Create Database farmaciales
go
use farmaciales


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
insert into remedio values
(1,'cloroquina',10,'69.99','Cancer',99),
(2,'Viagra',10,'120.50','permite ereçoes durante horas',99),
(3,'Bengala',10,'130.00','ajuda a fazer a locomoção',99)
select * from remedio

create table tipo
(
id int identity (1,1) primary key,
classe varchar(100) ,
)
insert into tipo values
(10,'pilula')
select * from tipo

CREATE TABLE cliente
(
id int identity (1,1) primary key,
fnome varchar(50)not null,
lnome varchar(50)not null,
cpf		varchar(11)not null,
email varchar(100) not null,
senha varchar(20)not null,
sexo varchar(20)not null,
c_cep varchar(11) not null,
foreign key (c_cep) references endereco(cep)
)
insert into cliente values 
(1,'MIYAGI','japones','98765432101','banana','coringa','macho',111111)
select * from cliente

CREATE TABLE endereco
(
cep varchar(11) not null,
logradouro varchar(50)not null,
porta int not null,
complent varchar(50)not null,
Primary Key (cep)
)
insert into endereco values 
(111111,'japão',15,'PÃO')
select * from endereco


create table compra(
id int identity (1,1),
c_qntd int ,
dtcompra datetime,
val_total decimal(7,2),
Constraint pk_compra PRIMARY KEY (id,dtcompra)
)

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

select * from f_listagem('cloro')
select * from f_listagem('cloroquina')

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
Create procedure sp_inserção
@fnome varchar(50),
@lnome varchar(50),
@cpf		varchar(11),
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
		Insert into cliente Values(@fnome,@lnome,@cpf,@email,@senha,@sexo,@cep)
end

exec sp_inserção 'Miyagi','Japones','69420420691','Teste','teste','Feminino',111111,'japão',15,'PÃO'
exec sp_inserção 'Jose','Luiz','99999999','Pão','Pão','Masculino',888888,'Terra',55,'YUn'
exec sp_inserção 'George','Fernando','846454984','Terra','Terra','Masculino',999999,'Marte',99,'Young'

select * from cliente
select * from enderco

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
 
select * from f_validaLogin('banana','coringa')
select * from f_validaLogin('afsdfasfasf','coringa')

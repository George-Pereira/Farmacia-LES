<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Cadastro - CorongaFarma</title>
</head>
<body>
	<div align="center">
		<form action="./cadastrar" method="post">
			<div align="center">
				<label>Primeiro Nome:</label>
				<input type="text" name="fnome"/>
			</div>
			<div align="center">
				<label>Sobrenome:</label>
				<input type="text" name="lnome"/>
			</div>
			<div align="center">
				<label>CPF:</label>
				<input type="text" name="cpf"/>
			</div>
			<div align="center">
				<label>Email:</label>
				<input type="text" name="email"/>
			</div>
			<div align="center">
				<label>Confirmar Email:</label>
				<input type="text" name="emailconf"/>
			</div>
			<div align="center">
				<label>Senha:</label>
				<input type="password" name="pass">
			</div>
			<div align="center">
				<label>Confirmar Senha:</label>
				<input type="password" name="confpass">
			</div>
			<div align="center">
				<label>Telefone:</label>
				<input type="text" name="">
			</div>
			<div align="center">
				<label>Sexo:</label>
				<select id="sexo" name="sexo">
					<option>--Selecione--</option>
					<option value="masc">Masculino</option>
					<option value="femn">Feminino</option>
					<option value="other">Outro</option>
					<option value="pninfo">Prefiro Não Informar</option>
				</select>
			</div>
			<div align="center">
				<label>CEP:</label>
				<input type="text" name="cep">
			</div>
			<div align="center">
				<label>Logradouro:</label>
				<input type="text" name="lograd">
			</div>
			<div align="center">
				<label>Número:</label>
				<input type="number" name="num">
			</div>
			<div align="center">
				<label>Complemento:</label>
				<input type="text" name="complemento">
			</div>
			<div align="center">
				<button type="submit" name="btnCadastrar" value="cadastrar">Cadastre-se!</button>
			</div>
		</form>
	</div>
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
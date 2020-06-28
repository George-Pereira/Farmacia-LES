<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.fatec.farmacia.model.Carrinho"%>
<%@page import="com.fatec.farmacia.model.Cliente"%>
<%@page import="com.fatec.farmacia.model.Produto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cliente cli = new Cliente();
cli = (Cliente) session.getAttribute("CLIENTE");
if (cli == null) {
	response.sendRedirect("./login");
}
Carrinho cartCli = (Carrinho) session.getAttribute("CARRINHO");
double tot = 0;
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Carrinho - Coronga Farma</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="Resources/CSS/carrinho.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="nav_principal">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!--Desktop-->
		<div class="collapse navbar-collapse justify-content-around"
			id="navbarSupportedContent">
			<a class="navbar-brand" href="./principal.jsp" id="navImg"> <img
				src="img/Logo.png" alt="Logo Coronga Farma">
			</a>
			<form class="form-inline my-2 my-lg-0" id="search" action="./principal.jsp" method="get">
				<input class="form-control mr-sm-2" type="search"
					placeholder="O que está procurando..." aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					<img src="img/search.svg" alt="Pesquisar">
				</button>
			</form>
			<ul class="nav navbar-nav navbar-right" id="navbar_itens">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <img data-feather="user" alt="Login"
						stroke="white"> <span style="color: white;"><%=session.getAttribute("CLIENTE").toString()%></span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="./logout?logout=true">Logout</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href=""
					id="nav_carrinho"> <img data-feather="shopping-cart"
						alt="Carrinho" fill="white" stroke="white">
						<div id="qtd_animated"><%=cartCli.getCart().size()%></div>
				</a></li>
			</ul>
		</div>
	</nav>
	<main>
		<div class="container">
			<% for(Produto p : cartCli.getCart())
			{ 
				tot = tot + (p.getValUnit()* p.getQuant());
			%>
				<div class="row row-cols-1 row-cols-md-3">
				<div class="col mb-4">
					<div class="card text-center" id="card">
						<h2 class="card-title"><%=p.getNomeRemedio()%></h2>
						<img src="img/<%=p.getTipoRemedio()%>.png" class="card-img-top" id="img" alt="<%=p.getTipoRemedio()%>">
						<div class="card-body">
							<p class="card-text" id="valor"><%=NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(p.getValUnit())%></p>
							<button class="lata" onclick="Deleta('<%=p.getIdRemedio()%>')">
								<img src="img/LataLixo.svg" alt="Lata de Lixo">
							</button>
						</div>
					</div>
				</div>
			</div>
			<%}%>
		</div>
		<div class="lista">
			<div class="list">
			<%for(Produto p : cartCli.getCart())
			{%> 
				<p class="listp"><%=p.getQuant()%> X <%=p.getNomeRemedio()%> -> Unid. <%=NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(p.getValUnit())%></p>
			<%}
				%>
			</div>
			<div class="total">
				<span id="textTot">Total:</span> <span id="tot"><%=NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(tot) %></span>
			</div>
			<div class="botoes">
				<button id="cancelar" class="btn btn-light">Cancelar</button>
				<button id="comprar" class="btn btn-primary">Comprar</button>
			</div>
		</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/feather-icons"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
</body>

</html>
<%@page import="com.fatec.farmacia.persistence.IntDaoProduto"%>
<%@page import="com.fatec.farmacia.persistence.DaoProduto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fatec.farmacia.model.Cliente"%>
<%@ page import="com.fatec.farmacia.model.Produto"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.LinkedList"%>

<%
	Cliente cli = new Cliente();
cli = (Cliente) session.getAttribute("CLIENTE");
if (cli == null) {
	response.sendRedirect("./login");
}
IntDaoProduto dao = new DaoProduto();
List<Produto> prods = new LinkedList<Produto>();
prods = dao.getTodosProd();
%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Principal - Coronga Farma</title>
<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="Resources/CSS/Principal.css">

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="nav_principal">
		<!--Desktop-->
		<div class="collapse navbar-collapse justify-content-around"
			id="navbarSupportedContent">
			<a class="navbar-brand" href="" id="navImg"> <img
				src="img/Logo.png" alt="Logo Coronga Farma">
			</a>
			<form class="form-inline my-2 my-lg-0" id="search">
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
						stroke="white"> <span style="color: white;"><%=cli.toString()%></span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="./logout">Logout</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href=""
					id="nav_carrinho"> <img data-feather="shopping-cart"
						alt="Carrinho" fill="white" stroke="white">
						<div id="qtd_animated">0</div>
				</a></li>
			</ul>
		</div>
	</nav>
	<main>
		<div class="container">
			<div class="row row-cols-1 row-cols-md-3">
				<%
					for (Produto p : prods) {
				%>
				<div class="col mb-4">
					<div class="card">
						<img src="img/<%=p.getTipoRemedio()%>.png" class="card-img-top"
							alt="<%=p.getTipoRemedio()%>">
						<div class="card-body">
							<h5 class="card-title"><%=p.getNomeRemedio()%></h5>
							<p class="card-text"><%=p.getValUnit()%></p>
							<button class="btn btn-primary"
								onclick="enviaProduto(<%=p.getIdRemedio()%>)">Detalhes</button>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<nav id="paginacao">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href=""
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="">1</a></li>
					<li class="page-item"><a class="page-link"
						href="Principal2.html">2</a></li>
					<li class="page-item"><a class="page-link"
						href="Principal3.html">3</a></li>
					<li class="page-item"><a class="page-link"
						href="Principal2.html" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</main>
	<footer>
		<div class="d-flex justify-content-between" id="foot">
			<div class="text" style="color: white; text-align: center;">Copyright
				© Coronga Farma</div>
			<div>
				<a href="" style="color: white;">Privacy Policy</a> · <a href=""
					style="color: white;">Terms &amp; Conditions</a>
			</div>
		</div>
	</footer>

	<!-- JS, Popper.js, and jQuery -->
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
    <script src="Resources/JS/principal.js"></script>
</body>

</html>
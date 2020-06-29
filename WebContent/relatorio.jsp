<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.fatec.farmacia.model.Produtos_Venda"%>
<%@page import="com.fatec.farmacia.persistence.DaoCompra"%>
<%@page import="com.fatec.farmacia.persistence.IntDaoCompra"%>
<%@page import="com.fatec.farmacia.model.Administrador"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
	<%
		Administrador adm = (Administrador)session.getAttribute("ADMIN");
		if(adm == null)
		{
			response.sendRedirect("./login");
		}
		IntDaoCompra dao = new DaoCompra();
		List<Produtos_Venda> lista = new LinkedList<Produtos_Venda>();
		lista = dao.construirRelatorio();
	%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento - Coronga Farma</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="Resources/CSS/Gerenciamento.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="nav_principal">
        <!--Desktop-->
        <div class="collapse navbar-collapse justify-content-around" id="navbarSupportedContent">
            <a class="navbar-brand" href="" id="navImg">
                <img src="img/Logo.png" alt="Logo Coronga Farma">
            </a>
            <ul class="nav navbar-nav navbar-right" id="navbar_itens">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img data-feather="user" alt="Login" stroke="white">
                        <span style="color: white;">Gerente <%=adm.getNome()%></span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="">Cadastrar Produtos</a>
                        <a class="dropdown-item" href="">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <main>
        <div class="container-fluid" id="tabela">
            <table class="table table-striped">
                <thead>
                    <tr class="bg-primary">
                        <th scope="col">Código</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Quantidade</th>
                        <th scope="col">Preco (R$)</th>
                        <th scope="col">Total (R$)</th>
                    </tr>
                </thead>
                <tbody>
                <%
                double receita = 0;
                for(Produtos_Venda pv : lista)
                {%>
                    <tr>
                        <th scope="row"><%=pv.getId()%></th>
                        <td><%=pv.getNome()%></td>
                        <td><%=pv.getQtd()%></td>
                        <td><%=NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(pv.getPrecoUnit())%></td>
                        <td><%=NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(pv.getReceita())%></td>
                    </tr>
                <%
                	receita += (pv.getQtd() * pv.getPrecoUnit());
                }%>  
                	<tr class="tot">
                        <th scope="row">Total</th>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td><%=NumberFormat.getCurrencyInstance(new Locale("pt", "BR")).format(receita)%></td>
                    </tr>          
                </tbody>
            </table>
        </div>
    </main>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <script>
        feather.replace();
    </script>
</body>
</html>
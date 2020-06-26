<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

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
            <form class="form-inline my-2 my-lg-0" id="search">
                <input class="form-control mr-sm-2" type="search" placeholder="O que está procurando..."
                    aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">
                    <img src="img/search.svg" alt="Pesquisar">
                </button>
            </form>
            <ul class="nav navbar-nav navbar-right" id="navbar_itens">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img data-feather="user" alt="Login" stroke="white">
                        <span style="color: white;">Gerente</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="">Gerenciar Produtos</a>
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
                    <tr>
                        <th scope="row">1</th>
                        <td>Creme Dental Colgate Total 12</td>
                        <td>100</td>
                        <td>8,78</td>
                        <td>878,00</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Curativos Transparentes Band-Aid</td>
                        <td>250</td>
                        <td>6,79</td>
                        <td>1.697,50</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Centrum Mulher</td>
                        <td>15</td>
                        <td>233,40</td>
                        <td>3.501,00</td>
                    </tr>           
                </tbody>
            </table>
            <div class="button">
                <button id="Voltar" class="btn btn-primary" type="submit">Voltar ao Inicio</button>
            </div>
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
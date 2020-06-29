<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Produto - Coronga Farma</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="Resources/CSS/cadProd.css">
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
                        <span style="color: white;">Gerente</span>
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
        <div class="container">
            <h1 id="title">Cadastrar Produto</h1>
            <form id="form" action="" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="input_Nome">Nome</label>
                        <input type="text" class="form-control" id="input_Nome" name="Input_Nome"
                            placeholder="Insira seu Nome">
                        <div class="invalid-feedback">
                            Digite seu nome corretamente.
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="input_categoria">Categoria</label>
                        <select id="input_categoria" name="Input_Categoria" class="form-control">
                            <option selected>--</option>
                            <option>Absorvente</option>
                            <option>Colírio</option>
                            <option>Comprimido Genérico</option>
                            <option>Comprimido Tarja Amarela</option>
                            <option>Comprimido Tarja Preta</option>
                            <option>Creme Dental</option>
                            <option>Creme Facial</option>
                            <option>Curativo</option>
                            <option>Enxaguante Bucal</option>
                            <option>Pastilha</option>
                            <option>Protetor Solar</option>
                            <option>Repelente</option>
                            <option>Vitamina</option>
                            <option>Xarope</option>
                        </select>
                        <div class="invalid-feedback">
                            Selecione um Sexo.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="input_descricao">descrição</label>
                        <textarea class="form-control" name="Input_Descricao" id="input_descricao" cols="30"
                            rows="10" placeholder="Insira uma descrição do produto..."></textarea>
                        <div class="invalid-feedback">
                            Digite uma descrição corretamente.
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="input_Nome">Preco</label>
                        <input type="text" data-prefix="R$ " name="preco" id="preco" class="form-control" placeholder="R$ 0.00">
                        <div class="invalid-feedback">
                            Digite o Preço corretamente.
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="input_Estoque">Estoque</label>
                        <input type="number" class="form-control" id="input_estoque" name="Input_Estoque"
                            placeholder="Insira o Estoque">
                        <div class="invalid-feedback">
                            Digite seu Estoque corretamente.
                        </div>
                    </div>
                </div>
                <div class="button">
                    <button id="Editar" class="btn btn-primary" type="button">Editar</button>
                    <button id="Cadastrar" class="btn btn-primary" type="submit">Cadastrar</button>
                    <button id="Pesquisar" class="btn btn-primary" type="button">Pesquisar</button>
                </div>
            </form>
        </div>
    </main>
    <footer>
        <div class="d-flex justify-content-between" id="foot">
            <div class="text" style="color: white; text-align: center;">Copyright © Coronga Farma</div>
            <div>
                <a href="" style="color: white;">Privacy Policy</a>
                ·
                <a href="" style="color: white;">Terms &amp; Conditions</a>
            </div>
        </div>
    </footer>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>
    <script>
        jQuery(function () {
            jQuery('#preco').maskMoney();
        });
    </script>
    <script src="Resources/JS/cadastroProd.js"></script>
</body>

</html>
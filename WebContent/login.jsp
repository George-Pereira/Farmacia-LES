<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Coronga Farma</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="Resources/CSS/login.css">
</head>

<body>

    <div class="container">
        <form action="./logon" method="post" id="form">
            <div class="form-group">
                <label for="InputEmail">Email</label>
                <input type="email" class="form-control" name="InputEmail" id="InputEmail">
                <div class="invalid-feedback">
                    Por favor, insira um Email.
                </div>
            </div>
            <div class="form-group">
                <label for="InputSenha">Senha</label>
                <div class="senha">
                    <input type="password" class="form-control" name="InputSenha" id="InputSenha">
                    <button class="btn" id="ver" type="button">
                        <img src="./img/see.svg" id="see" alt="Ver Senha">
                        <img src="./img/noSee.svg" id="nosee" alt="Não Ver Senha">
                    </button>
                </div>
                <div id="invalid" class="invalid-feedback">
                    Por favor, insira uma senha.
                </div>
            </div>
            <div class="entre">
                <button type="submit" class="btn btn-primary">Entrar</button>
                <a href="./cadastro.jsp">
                    <p> Não tem conta? Cadastre-se</p>
                </a>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <script src="Resources/JS/login.js"></script>
</body>

</html>
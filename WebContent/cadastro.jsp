<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Coronga Farma</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="Resources/CSS/Cadastro.css">
</head>

<body>
    <div class="container">
        <h1 id="title">Cadastrar Conta</h1>
        <form id="formCad" action="" method="post">
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
                    <label for="input_SobreNome">Ultimo Nome</label>
                    <input type="text" class="form-control" id="input_SobreNome" name="Input_Sobrenome"
                        placeholder="Insira seu Ultimo Nome">
                    <div class="invalid-feedback">
                        Digite seu Ultimo Nome corretamente.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="input_CPF">CPF</label>
                    <input type="text" class="form-control" id="input_CPF" name="Input_CPF"
                        placeholder="Ex.: 000.000.000-00">
                    <div class="invalid-feedback">
                        Digite um CPF Válido.
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="input_Date">Data de Nascimento</label>
                    <input type="text" name="Input_Data" class="form-control" id="input_Date"
                        placeholder="Ex.: 01/01/2000">
                    <div class="invalid-feedback">
                        Data inválida ou menor de 16 anos.
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="input_Sexo">Sexo</label>
                    <select id="input_Sexo" name="Input_Sexo" class="form-control">
                        <option selected>--</option>
                        <option>Masculino</option>
                        <option>Feminino</option>
                        <option>Outros</option>
                    </select>
                    <div class="invalid-feedback">
                        Selecione um Sexo.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-2">
                    <label for="input_CEP">CEP</label>
                    <input type="text" class="form-control" id="input_CEP" name="Input_CEP"
                        placeholder="Ex.: 00000-000">
                    <div class="invalid-feedback">
                        Digite um CEP válido.
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label for="input_Bairro">Bairro</label>
                    <input type="text" class="form-control" id="input_Bairro" name="Input_Bairro"
                        placeholder="Preenchimento automático">
                    <div class="invalid-feedback">
                        Digite um CEP válido.
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label for="input_Cidade">Cidade</label>
                    <input type="text" class="form-control" id="input_Cidade" name="Input_Cidade"
                        placeholder="Preenchimento automático">
                    <div class="invalid-feedback">
                        Digite um CEP válido.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-1">
                    <label for="input_Estado">UF</label>
                    <input id="input_Estado" class="form-control" name="Input_Estado" placeholder="--">
                    <div class="invalid-feedback">
                        Digite um CEP válido.
                    </div>
                </div>
                <div class="form-group col-md-5">
                    <label for="input_Rua">Rua</label>
                    <input type="text" class="form-control" id="input_Rua" name="Input_Rua"
                        placeholder="Preenchimento automático">
                    <div class="invalid-feedback">
                        Digite um CEP válido.
                    </div>
                </div>
                <div class="form-group col-md-1">
                    <label for="input_Numero">Numero</label>
                    <input type="text" class="form-control" id="input_Numero" name="Input_Numero">
                    <div class="invalid-feedback">
                        Digite o Numero de sua residência.
                    </div>
                </div>
                <div class="form-group col-md-5">
                    <label for="input_Complemento">Complemento</label><span> (Opcional)</span>
                    <input type="text" class="form-control" id="input_Complemento" name="Input_Complemento">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="input_TelResidencial">Telefone Residencial</label><span> (Opcional)</span>
                    <input type="text" class="form-control" id="input_TelResidencial" name="Input_TelRes"
                        placeholder="Ex.: (11) 1234-5678">
                </div>
                <div class="form-group col-md-6">
                    <label for="input_Cel">Celular / Whatsapp</label>
                    <input type="text" class="form-control" id="input_Cel" name="Input_Cel"
                        placeholder="Ex.: (11) 12345-6789">
                    <div class="invalid-feedback">
                        Digite um Celular válido.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="input_Email">Email</label>
                    <input type="email" class="form-control" id="input_Email" name="Input_Email"
                        placeholder="Ex.: user@corongafarma.com.br">
                    <div class="invalid-feedback">
                        Digite um email válido.
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label for="input_ConfEmail">Confirme Email</label>
                    <input type="email" class="form-control" id="input_ConfEmail" name="Input_ConfirmEmail"
                        placeholder="Confirme seu email">
                    <div class="invalid-feedback">
                        Seu Email não está de acordo.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="input_Senha">Senha</label>
                    <div class="senha">
                        <input type="password" class="form-control" name="InputSenha" id="InputSenha">
                        <button class="btn" id="ver" type="button">
                            <img src="./img/see.svg" id="see" alt="Ver Senha">
                            <img src="./img/noSee.svg" id="nosee" alt="Não Ver Senha">
                        </button>
                    </div>
                    <div id="invalid" class="invalid-feedback">
                        Digite uma senha válida.
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label for="InputConfirmSenha">Confirme Senha</label>
                    <div class="senha">
                        <input type="password" class="form-control" name="InputConfirmSenha" id="InputConfirmSenha">
                        <button class="btn" id="verConf" type="button">
                            <img src="./img/see.svg" id="see2" alt="Ver Senha">
                            <img src="./img/noSee.svg" id="nosee2" alt="Não Ver Senha">
                        </button>
                    </div>
                    <div id="inval" class="invalid-feedback">
                        Sua senha não está de acordo.
                    </div>
                </div>
            </div>
            <div id="buttons">
                <button id="cancel" type="button" class="btn btn-light">Cancelar</button>
                <button id="create" type="submit" class="btn btn-primary">Cadastrar</button>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-2.2.4.js"
        integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>

    <script src="Resources/JS/Cadastro.js"></script>

    <script>
        jQuery(document).ready(function ($) {
            function limpa_formulario_cep() {
                $("#input_CEP").val("");
                $("#input_Bairro").val("");
                $("#input_Rua").val("");
                $("#input_Complemento").val("");
                $("#input_Cidade").val("");
                $("#input_Estado").val("");
            }

            $("#input_CEP").blur(function (e) {

                var cep = $(this).val().replace(/\D/g, '');

                if (cep != "") {

                    var validacep = /^[0-9]{8}$/;

                    if (validacep.test(cep)) {

                        $("#input_Bairro").val("...");
                        $("#input_Rua").val("...");
                        $("#input_Complemento").val("...");
                        $("#input_Cidade").val("...");
                        $("#input_Estado").val("...");

                        $.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                            if (!("erro" in dados)) {

                                $("#input_Bairro").val(dados.bairro);
                                $("#input_Rua").val(dados.logradouro);
                                $("#input_Complemento").val(dados.complemento);
                                $("#input_Cidade").val(dados.localidade);
                                $("#input_Estado").val(dados.uf);

                                $('#input_CEP').removeClass('is-invalid');
                                $('#input_CEP').addClass('is-valid');
                            }
                            else {
                                limpa_formulario_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    }
                    else {
                        this.classList.add('is-invalid');
                        e.preventDefault();

                    }
                }
                else {
                    limpa_formulario_cep();
                }
            });
            $('#input_CPF').mask('000.000.000-00');
            $('#input_CEP').mask('00000-000');
            $('#input_Tel').mask('(00) 0000-0000');
            $('#input_Cel').mask('(00) 00000-0000');
            $('#input_Date').mask('00/00/0000');
        });
    </script>
</body>

</html>
</body>

</html>
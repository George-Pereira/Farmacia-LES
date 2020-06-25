//ver senha e ocultar senha

var verSenha = document.getElementById('ver');

verSenha.addEventListener('click', function() {
    
    let naoVer = document.getElementById('nosee');
    let ver = document.getElementById('see');
    let senha = document.getElementById('InputSenha');

    if(senha.getAttribute('type') == 'password'){
        ver.style.display = 'none';
        naoVer.style.display = 'inherit';
        senha.setAttribute('type', 'text');
    }else{
        naoVer.style.display = 'none';
        ver.style.display = 'inherit';
        senha.setAttribute('type', 'password');
    }

});

//ver senha e ocultar senha

var verConfirmSenha = document.getElementById('verConf');

verConfirmSenha.addEventListener('click', function() {
    
    let naoVer = document.getElementById('nosee2');
    let ver = document.getElementById('see2');
    let senha = document.getElementById('InputConfirmSenha');

    if(senha.getAttribute('type') == 'password'){
        ver.style.display = 'none';
        naoVer.style.display = 'inherit';
        senha.setAttribute('type', 'text');
    }else{
        naoVer.style.display = 'none';
        ver.style.display = 'inherit';
        senha.setAttribute('type', 'password');
    }

});


//Redirecionamento

let btnCancel = document.getElementById('cancel');

btnCancel.addEventListener('click', function() {
    location = 'login.jsp';
});

//Validação de campo de formulário:

var form = document.getElementById("formCad");

form.addEventListener('submit', function (e) {

    let inputName = form.input_Nome;
    let inputSobreNome = form.input_SobreNome;
    var inputCPF = form.input_CPF;
    let inputSexo = form.input_Sexo;
    let inputDatNasc = form.input_Date;
    let inputCEP = form.input_CEP;
    let inputBairro = form.input_Bairro;
    let inputRua = form.input_Rua;
    let inputNumero = form.input_Numero;
    let inputComplemento = form.input_Complemento;
    let inputCidade = form.input_Cidade;
    let inputEstado = form.input_Estado;
    let inputTel = form.input_TelResidencial;
    let inputCel = form.input_Cel;
    let inputEmail = form.input_Email;
    let inputConfEmail = form.input_ConfEmail;
    let inputSen = form.InputSenha;
    let inputConfSenha = form.InputConfirmSenha;

    inputComplemento.classList.add('is-valid');
    inputTel.classList.add('is-valid');

    if (inputName.value === "" || inputName.value.length <= 2 || inputName.value === null) {
        inputName.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputName.classList.remove('is-invalid');
        inputName.classList.add('is-valid');
    }

    if (inputSobreNome.value === "" || inputSobreNome.value === null) {
        inputSobreNome.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputSobreNome.classList.remove('is-invalid');
        inputSobreNome.classList.add('is-valid');
    }

    if (inputCPF.value === "" || inputCPF.value === null || (!ValidaCPF(inputCPF.value))) {
        inputCPF.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputCPF.classList.remove('is-invalid');
        inputCPF.classList.add('is-valid');
    }

    if (inputDatNasc.value === "" || inputDatNasc.value === null || !(ValidaNasc(inputDatNasc.value))) {
        inputDatNasc.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputDatNasc.classList.remove('is-invalid');
        inputDatNasc.classList.add('is-valid');
    }

    if (inputSexo.value === "--" || inputSexo.value === null) {
        inputSexo.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputSexo.classList.remove('is-invalid');
        inputSexo.classList.add('is-valid');
    }

    if(inputCEP.value === "" || inputCEP.value === null){
        inputCEP.classList.add('is-invalid');
        e.preventDefault();
    }else{
        inputCEP.classList.remove('is-invalid');
        inputCEP.classList.add('is-valid');
    }

    if(inputBairro.value === "" || inputBairro.value === null){
        inputBairro.classList.add('is-invalid');
        e.preventDefault();
    }else{
        inputBairro.classList.remove('is-invalid');
        inputBairro.classList.add('is-valid');
    }

    if (inputRua.value === "" || inputRua === null || inputCEP.classList.contains('is-invalid')) {
        inputRua.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputRua.classList.remove('is-invalid');
        inputRua.classList.add('is-valid');
    }

    if (inputNumero.value === "" || inputNumero.value === null) {
        inputNumero.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputNumero.classList.remove('is-invalid');
        inputNumero.classList.add('is-valid');
    }

    if (inputCidade.value === "" || inputCidade === null || inputCEP.classList.contains('is-invalid')) {
        inputCidade.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputCidade.classList.remove('is-invalid');
        inputCidade.classList.add('is-valid');
    }

    if (inputEstado.value === "" || inputEstado === null || inputCEP.classList.contains('is-invalid')) {
        inputEstado.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputEstado.classList.remove('is-invalid');
        inputEstado.classList.add('is-valid');
    }

    if (inputCel.value === "" || inputCel.value === null || inputCel.value.length < 15) {
        inputCel.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputCel.classList.remove('is-invalid');
        inputCel.classList.add('is-valid');
    }

    if (inputEmail.value.indexOf("@") === -1 ||
        inputEmail.value.indexOf(".") === -1 ||
        inputEmail.value === "") {
        inputEmail.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputEmail.classList.remove('is-invalid');
        inputEmail.classList.add('is-valid');
    }

    if (inputConfEmail.value.indexOf("@") === -1 ||
        inputConfEmail.value.indexOf(".") === -1 ||
        inputConfEmail.value === "" ||
        inputConfEmail.value !== inputEmail.value) {
        inputConfEmail.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputConfEmail.classList.remove('is-invalid');
        inputConfEmail.classList.add('is-valid');
    }

    if (inputSen.value === "" || inputSen.value.length < 8) {
        inputSen.classList.add('is-invalid');
        document.getElementById('invalid').style.display = 'block';
        e.preventDefault();
    } else {
        inputSen.classList.remove('is-invalid');
        inputSen.classList.add('is-valid');
        document.getElementById('invalid').style.display = 'none';
    }

    if (inputConfSenha.value === "" || inputConfSenha.value !== inputSen.value) {
        inputConfSenha.classList.add('is-invalid');
        document.getElementById('inval').style.display = 'block';
        e.preventDefault();
    } else {
        inputConfSenha.classList.remove('is-invalid');
        inputConfSenha.classList.add('is-valid');
        document.getElementById('inval').style.display = 'none';
    }
});

//Validador de CPF original

function ValidaCPF(cpf) {

    //Criando os campos para armezar cada dígito do CPF
    let num1 = parseInt(cpf.substring(0, 1));
    let num2 = parseInt(cpf.substring(1, 2));
    let num3 = parseInt(cpf.substring(2, 3));
    let num4 = parseInt(cpf.substring(4, 5));
    let num5 = parseInt(cpf.substring(5, 6));
    let num6 = parseInt(cpf.substring(6, 7));
    let num7 = parseInt(cpf.substring(8, 9));
    let num8 = parseInt(cpf.substring(9, 10));
    let num9 = parseInt(cpf.substring(10, 11));
    let num10 = parseInt(cpf.substring(12, 13));
    let num11 = parseInt(cpf.substring(13, 14));

    //Verificação para CPF inválidos com valores iguais
    if (num1 === num2 && num2 === num3 && num3 === num4
        && num4 === num5 && num5 === num6 && num6 === num7
        && num7 === num8 && num8 === num9 && num9 === num10
        && num10 === num11) {
        return false;
    } else {

        //Calculo para Verificar se o 1º dígito após o '-' é igual

        let soma1 = (num1 * 10) + (num2 * 9) + (num3 * 8) + (num4 * 7) + (num5 * 6) + (num6 * 5) + (num7 * 4) + (num8 * 3) + (num9 * 2);

        let resto1 = (soma1 * 10) % 11;

        //Calculo para Verificar se o 2º dígito após o '-' é igual

        let soma2 = (num1 * 11) + (num2 * 10) + (num3 * 9) + (num4 * 8) + (num5 * 7) + (num6 * 6) + (num7 * 5) + (num8 * 4) + (num9 * 3) + (num10 * 2);

        let resto2 = (soma2 * 10) % 11;

        //Verificação dos 2 dígitos

        if (resto1 === num10 && resto2 === num11) {
            return true;
        } else {
            return false;
        }
    }
}

//Validador de Data de Nascimento

function ValidaNasc(dataNasc) {

    //Pegando os valores correspondentes e transformando eles em inteiros

    let dia = parseInt(dataNasc.substring(0, 2));
    let mes = parseInt(dataNasc.substring(3, 5));
    let ano = parseInt(dataNasc.substring(6, 10));

    //Pegando o ano atual através da data atual
    let dataAtual = new Date();
    let anoAtual = parseInt(dataAtual.getFullYear());

    //determinando dia acima de 31, mes acima de 12 e idade < 16 anos, retorna falso
    if (dia > 31 || mes > 12 || ano > (anoAtual - 18)) {
        return false;
    }

    if ((mes === 4 || mes === 6 || mes === 9 || mes === 11) && dia === 31) {
        return false;
    }
    if (mes == 2 && (dia > 29 || (dia === 29 && ano % 4 != 0))) {
        return false;
    }

    if (ano < 1900) {
        return false;
    }

    return true;
}
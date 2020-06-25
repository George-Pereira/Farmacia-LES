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

var form = document.getElementById('form');

form.addEventListener('submit', function(e) {
    let email = form.InputEmail;
    let senha = form.InputSenha;

    if (email.value.indexOf("@") === -1 ||
        email.value.indexOf(".") === -1 ||
        email.value === "") {
        email.classList.add('is-invalid');
        e.preventDefault();
    } else {
        email.classList.remove('is-invalid');
        email.classList.add('is-valid');
    }

    if (senha.value === "") {
        senha.classList.add('is-invalid');
        document.getElementById('invalid').style.display = 'block';
        e.preventDefault();
    } else {
        senha.classList.remove('is-invalid');
        senha.classList.add('is-valid');
        document.getElementById('invalid').style.display = 'none';
    }
});
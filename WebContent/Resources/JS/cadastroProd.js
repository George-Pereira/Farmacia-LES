var form = document.getElementById("form");

form.addEventListener('submit', function (e) {

    let inputName = document.getElementById('input_Nome');
    let inputCategoria = document.getElementById('input_categoria');
    let inputDescricao = document.getElementById('input_descricao');
    let inputValor = document.getElementById('preco');
    let inputEstoque = document.getElementById('input_estoque');

    if (inputName.value === "" || inputName.value === null) {
        inputName.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputName.classList.remove('is-invalid');
        inputName.classList.add('is-valid');
    }

    if (inputCategoria.value === "--" || inputCategoria.value === null) {
        inputCategoria.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputCategoria.classList.remove('is-invalid');
        inputCategoria.classList.add('is-valid');
    }

    if (inputDescricao.value === "" || inputDescricao.value === null || inputDescricao.value.length > 199) {
        inputDescricao.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputDescricao.classList.remove('is-invalid');
        inputDescricao.classList.add('is-valid');
    }

    if (inputValor.value === "" || inputValor.value === null || inputValor.value == "0.00" || inputValor.value == 0) {
        inputValor.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputValor.classList.remove('is-invalid');
        inputValor.classList.add('is-valid');
    }

    if (inputEstoque.value === "" || inputEstoque.value === null || inputEstoque.value == 0) {
        inputEstoque.classList.add('is-invalid');
        e.preventDefault();
    } else {
        inputEstoque.classList.remove('is-invalid');
        inputEstoque.classList.add('is-valid');
    }
});
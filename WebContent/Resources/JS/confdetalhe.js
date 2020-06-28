function carrinho(idProduto)
{
	let input = document.getElementById('input_qtd');
	let qtd = input.value;
	location = `./add?idprod=${idProduto}&qtd=` + qtd;
}
function carrinho(idProduto)
{
	let input = document.getElementById('input_qtd');
	let qtd = input.value;
	if(qtd > 0){
		location = `./add?idprod=${idProduto}&qtd=` + qtd;
	}else{
		alert('insira uma quantidade!');
	}
}
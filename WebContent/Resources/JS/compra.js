function efetuarCompra()
{
	location=`./comprar`;
}

var btncancel = document.getElementById('cancelar');

btncancel.addEventListener("click", ()=>{
	location = './principal.jsp';
});
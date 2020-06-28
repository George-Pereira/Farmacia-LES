package com.fatec.farmacia.model;

import java.util.List;

public class Carrinho 
{
	private long idCliente;
	private List<Produto> cart;
	private int qtdProd;
	public long getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(long idCliente) 
	{
		this.idCliente = idCliente;
	}
	public List<Produto> getCart() {
		return cart;
	}
	public void setCart(List<Produto> cart) {
		this.cart = cart;
	}
	public int getQtdProd() {
		return (qtdProd + this.cart.size());
	}
	public void setQtdProd(int qtdProd) {
		this.qtdProd = qtdProd;
	}
	public Carrinho() 
	{
		this.qtdProd = 0;
	}
}

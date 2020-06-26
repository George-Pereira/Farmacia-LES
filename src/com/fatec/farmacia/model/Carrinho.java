package com.fatec.farmacia.model;

import java.util.List;

public class Carrinho 
{
	private long idCliente;
	private List<Produto> cart;
	public long getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(long idCliente) {
		this.idCliente = idCliente;
	}
	public List<Produto> getCart() {
		return cart;
	}
	public void setCart(List<Produto> cart) {
		this.cart = cart;
	}
}

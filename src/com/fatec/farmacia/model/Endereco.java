package com.fatec.farmacia.model;

public class Endereco 
{
	private String logradouro;
	private String cep;
	private int porta;
	private String complemento;
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public int getPorta() {
		return porta;
	}
	public void setPorta(int porta) {
		this.porta = porta;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) 
	{
		this.complemento = complemento;
	}
}

package com.fatec.farmacia.model;

public class Produtos_Venda 
{
	private long id;
	private String nome;
	private double precoUnit;
	private double receitaProd;
	private double receita;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getPrecoUnit() {
		return precoUnit;
	}
	public void setPrecoUnit(double precoUnit) {
		this.precoUnit = precoUnit;
	}
	public double getReceitaProd() {
		return receitaProd;
	}
	public void setReceitaProd(double receitaProd) {
		this.receitaProd = receitaProd;
	}
	public double getReceita() {
		return receita;
	}
	public void setReceita(double receita) {
		this.receita = receita;
	}
	
	
}
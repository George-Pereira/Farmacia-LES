package com.fatec.farmacia.model;

import java.util.Date;

public class Cliente
{
	private long id;
	private String primeiroNome;
	private String sobreNome;
	private Date nascimento;
	private String telfixo;
	private String telcel;
	public String getTelfixo() {
		return telfixo;
	}
	public void setTelfixo(String telfixo) {
		this.telfixo = telfixo;
	}
	public String getTelcel() {
		return telcel;
	}
	public void setTelcel(String telcel) {
		this.telcel = telcel;
	}
	private String cpf;
	private String email;
	private String senha;
	private String sexo;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPrimeiroNome() {
		return primeiroNome;
	}
	public void setPrimeiroNome(String primeiroNome) {
		this.primeiroNome = primeiroNome;
	}
	public String getSobreNome() {
		return sobreNome;
	}
	public void setSobreNome(String sobreNome) {
		this.sobreNome = sobreNome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public Date getNascimento() {
		return nascimento;
	}
	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	}
}
